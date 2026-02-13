// ============================================================
// Serial Bridge for Node for Max
// Receives Arduino IMU data over USB serial, validates CSV lines,
// and outputs parsed sensor streams via tagged maxAPI.outlet()
// messages with automatic connection management.
// ============================================================

const maxAPI = require("max-api");
const { SerialPort } = require("serialport");
const { ReadlineParser } = require("@serialport/parser-readline");

// ---- Configuration ----
const BAUD_RATE = 57600;
const EXPECTED_FIELDS = 9;
const RECONNECT_INTERVAL_MS = 2000;

// ---- State ----
let port = null;
let parser = null;
let reconnectTimer = null;
let state = "disconnected";

// ---- Calibration State ----
var isCalibrating = false;
var sampleCount = 0;
var sampleSums = { ax: 0, ay: 0, az: 0, gx: 0, gy: 0, gz: 0 };
var biasOffsets = null;
var orientOffset = null;
var blendFactor = 1.0;
var lastOrientation = null;
var lastSampleTime = null;

// ---- Calibration Constants ----
var TARGET_SAMPLES = 200;
var MIN_SAMPLES = 50;
var BLEND_SPEED = 10;

// ---- Smoothing State ----
var smoothFactors = {
  global: 0, accel_group: 0, gyro_group: 0, orient_group: 0,
  ax: 0, ay: 0, az: 0, gx: 0, gy: 0, gz: 0,
  pitch: 0, roll: 0, yaw: 0
};
var smoothed = { ax: null, ay: null, az: null, gx: null, gy: null, gz: null,
  pitch: null, roll: null, yaw: null };

// ============================================================
// Connection State Machine
// States: "disconnected", "scanning", "connected"
// ============================================================

function updateStatus(newState) {
  state = newState;
  maxAPI.outlet("status", state);
  maxAPI.post("[serial-bridge] status: " + state);
}

// ============================================================
// Port Discovery
// Finds Arduino by vendor ID or known path patterns
// ============================================================

async function findArduinoPort() {
  const ports = await SerialPort.list();
  const arduino = ports.find(function (p) {
    return (
      p.vendorId === "2341" ||
      p.path.includes("usbmodem") ||
      p.path.includes("ttyACM")
    );
  });
  return arduino || null;
}

// ============================================================
// CSV Validation (SERL-02)
// Drops malformed lines silently; logs STARTUP/ERROR headers
// ============================================================

function validateLine(line) {
  // Log firmware header lines to MAX console
  if (line.startsWith("STARTUP") || line.startsWith("ERROR")) {
    maxAPI.post("[arduino] " + line);
    return null;
  }

  // Check field count
  var parts = line.split(",");
  if (parts.length !== EXPECTED_FIELDS) {
    return null;
  }

  // Check for NaN values
  var values = parts.map(Number);
  if (values.some(isNaN)) {
    return null;
  }

  return values;
}

// ============================================================
// Calibration Functions
// Bias offset calibration, orientation reset, smooth transitions
// ============================================================

function startCalibration() {
  isCalibrating = true;
  sampleCount = 0;
  sampleSums = { ax: 0, ay: 0, az: 0, gx: 0, gy: 0, gz: 0 };
  maxAPI.outlet("cal_status", "collecting");
}

function collectSample(ax, ay, az, gx, gy, gz) {
  if (!isCalibrating) return;
  sampleSums.ax += ax;
  sampleSums.ay += ay;
  sampleSums.az += az;
  sampleSums.gx += gx;
  sampleSums.gy += gy;
  sampleSums.gz += gz;
  sampleCount++;
  maxAPI.outlet("cal_progress", sampleCount, TARGET_SAMPLES);
  if (sampleCount >= TARGET_SAMPLES) {
    stopCalibrationAndApply();
  }
}

function stopCalibrationAndApply() {
  if (!isCalibrating) return;
  isCalibrating = false;
  if (sampleCount < MIN_SAMPLES) {
    maxAPI.outlet("cal_status", "too_few_samples");
    return;
  }
  biasOffsets = {
    ax: sampleSums.ax / sampleCount,
    ay: sampleSums.ay / sampleCount,
    az: (sampleSums.az / sampleCount) - 1.0,
    gx: sampleSums.gx / sampleCount,
    gy: sampleSums.gy / sampleCount,
    gz: sampleSums.gz / sampleCount
  };
  maxAPI.outlet("cal_status", "applied");
  maxAPI.outlet("cal_toggle", 0);
  maxAPI.outlet("cal_bias",
    biasOffsets.ax, biasOffsets.ay, biasOffsets.az,
    biasOffsets.gx, biasOffsets.gy, biasOffsets.gz);
  maxAPI.post("[calibration] bias offsets applied - " +
    "aX:" + biasOffsets.ax.toFixed(3) +
    " aY:" + biasOffsets.ay.toFixed(3) +
    " aZ:" + biasOffsets.az.toFixed(3) +
    " gX:" + biasOffsets.gx.toFixed(3) +
    " gY:" + biasOffsets.gy.toFixed(3) +
    " gZ:" + biasOffsets.gz.toFixed(3));
}

function applyCal(ax, ay, az, gx, gy, gz) {
  if (!biasOffsets) return { ax: ax, ay: ay, az: az, gx: gx, gy: gy, gz: gz };
  return {
    ax: ax - biasOffsets.ax,
    ay: ay - biasOffsets.ay,
    az: az - biasOffsets.az,
    gx: gx - biasOffsets.gx,
    gy: gy - biasOffsets.gy,
    gz: gz - biasOffsets.gz
  };
}

function getTimeDelta() {
  var now = Date.now();
  if (lastSampleTime === null) {
    lastSampleTime = now;
    return 1.0 / 114.0;
  }
  var dt = (now - lastSampleTime) / 1000.0;
  lastSampleTime = now;
  return dt;
}

function resetOrientation(pitch, roll, yaw) {
  orientOffset = { pitch: pitch, roll: roll, yaw: yaw };
  blendFactor = 0.0;
  maxAPI.outlet("cal_status", "orient_reset");
}

function restoreOrientation() {
  orientOffset = null;
  blendFactor = 0.0;
  maxAPI.outlet("cal_status", "orient_restored");
}

function applyOrientReset(pitch, roll, yaw, dt) {
  if (blendFactor < 0.999) {
    blendFactor += (1.0 - blendFactor) * (1.0 - Math.exp(-BLEND_SPEED * dt));
  } else {
    blendFactor = 1.0;
  }

  if (!orientOffset) return { pitch: pitch, roll: roll, yaw: yaw };

  var offsetPitch = orientOffset.pitch * blendFactor;
  var offsetRoll = orientOffset.roll * blendFactor;
  var offsetYaw = orientOffset.yaw * blendFactor;

  return {
    pitch: pitch - offsetPitch,
    roll: roll - offsetRoll,
    yaw: ((yaw - offsetYaw) % 360 + 360) % 360
  };
}

// ============================================================
// Smoothing (MAXI-01)
// Three-tier EMA: effective = max(global, group, per_axis)
// alpha = 1.0 - effective * 0.99 → 0=pass-through, 1=heavy
// ============================================================

function computeAlpha(axis) {
  var group;
  if (axis === "ax" || axis === "ay" || axis === "az") group = "accel_group";
  else if (axis === "gx" || axis === "gy" || axis === "gz") group = "gyro_group";
  else group = "orient_group";
  var effective = Math.max(smoothFactors.global, smoothFactors[group], smoothFactors[axis]);
  return 1.0 - effective * 0.99;
}

function applySmoothing(axis, value) {
  var alpha = computeAlpha(axis);
  if (smoothed[axis] === null) {
    smoothed[axis] = value;
    return value;
  }
  smoothed[axis] = smoothed[axis] + alpha * (value - smoothed[axis]);
  return smoothed[axis];
}

// ============================================================
// Data Output (SERL-03)
// 3 tagged outlet calls per valid sample, plus calibrated outlets
// ============================================================

function outputData(values) {
  var ax = values[0];
  var ay = values[1];
  var az = values[2];
  var gx = values[3];
  var gy = values[4];
  var gz = values[5];
  var pitch = values[6];
  var roll = values[7];
  var yaw = values[8];

  // Store latest orientation for orient_reset capture
  lastOrientation = { pitch: pitch, roll: roll, yaw: yaw };

  // Raw outlets (unchanged from Phase 2)
  maxAPI.outlet("accel", ax, ay, az);
  maxAPI.outlet("gyro", gx, gy, gz);
  maxAPI.outlet("orientation", pitch, roll, yaw);

  // Collect calibration sample if calibrating
  if (isCalibrating) {
    collectSample(ax, ay, az, gx, gy, gz);
  }

  // Calibrated outlets (only when bias offsets exist)
  if (biasOffsets !== null) {
    var cal = applyCal(ax, ay, az, gx, gy, gz);
    maxAPI.outlet("cal_accel", cal.ax, cal.ay, cal.az);
    maxAPI.outlet("cal_gyro", cal.gx, cal.gy, cal.gz);
    var dt = getTimeDelta();
    var orient = applyOrientReset(pitch, roll, yaw, dt);
    maxAPI.outlet("cal_orientation", orient.pitch, orient.roll, orient.yaw);

    // Smoothed outlets (EMA applied to calibrated data)
    var sax = applySmoothing("ax", cal.ax);
    var say = applySmoothing("ay", cal.ay);
    var saz = applySmoothing("az", cal.az);
    var sgx = applySmoothing("gx", cal.gx);
    var sgy = applySmoothing("gy", cal.gy);
    var sgz = applySmoothing("gz", cal.gz);
    var sp = applySmoothing("pitch", orient.pitch);
    var sr = applySmoothing("roll", orient.roll);
    var sy = applySmoothing("yaw", orient.yaw);
    maxAPI.outlet("smooth_accel", sax, say, saz);
    maxAPI.outlet("smooth_gyro", sgx, sgy, sgz);
    maxAPI.outlet("smooth_orientation", sp, sr, sy);
  } else if (orientOffset !== null) {
    // Orientation reset is independent of bias calibration
    var dt = getTimeDelta();
    var orient = applyOrientReset(pitch, roll, yaw, dt);
    maxAPI.outlet("cal_orientation", orient.pitch, orient.roll, orient.yaw);

    // Smoothed orientation (orient reset without bias cal)
    var sp = applySmoothing("pitch", orient.pitch);
    var sr = applySmoothing("roll", orient.roll);
    var sy = applySmoothing("yaw", orient.yaw);
    maxAPI.outlet("smooth_orientation", sp, sr, sy);
  }
}

// ============================================================
// Connection (SERL-01)
// Opens serial port, attaches event handlers, pipes to parser
// ============================================================

function connectToPort(portPath) {
  port = new SerialPort({
    path: portPath,
    baudRate: BAUD_RATE,
    autoOpen: false,
  });

  parser = port.pipe(new ReadlineParser({ delimiter: "\n" }));

  port.on("open", function () {
    updateStatus("connected");
  });

  port.on("error", function (err) {
    maxAPI.post("[serial-bridge] error: " + err.message);
  });

  port.on("close", function () {
    cleanup();
    updateStatus("disconnected");
    startScanning();
  });

  parser.on("data", function (line) {
    var trimmed = line.trim();
    var values = validateLine(trimmed);
    if (values) {
      outputData(values);
    }
  });

  port.open(function (err) {
    if (err) {
      maxAPI.post("[serial-bridge] open failed: " + err.message);
      cleanup();
      startScanning();
    }
  });
}

// ============================================================
// Cleanup
// Destroys old port instance completely to prevent memory leaks
// ============================================================

function cleanup() {
  if (parser) {
    parser.removeAllListeners();
    parser = null;
  }
  if (port) {
    port.removeAllListeners();
    if (port.isOpen) {
      port.close();
    }
    port = null;
  }
}

// ============================================================
// Reconnection (SERL-05)
// Polls for Arduino reappearance after disconnect
// ============================================================

async function startScanning() {
  if (reconnectTimer) {
    return; // Already scanning
  }

  updateStatus("scanning");

  reconnectTimer = setInterval(async function () {
    try {
      var found = await findArduinoPort();
      if (found) {
        clearInterval(reconnectTimer);
        reconnectTimer = null;
        connectToPort(found.path);
      }
    } catch (err) {
      maxAPI.post("[serial-bridge] scan error: " + err.message);
    }
  }, RECONNECT_INTERVAL_MS);
}

// ============================================================
// MAX Message Handlers
// ============================================================

maxAPI.addHandler("connect", function (portPath) {
  if (port && port.isOpen) {
    cleanup();
  }
  if (reconnectTimer) {
    clearInterval(reconnectTimer);
    reconnectTimer = null;
  }
  if (portPath) {
    connectToPort(portPath);
  } else {
    startScanning();
  }
});

maxAPI.addHandler("disconnect", function () {
  if (reconnectTimer) {
    clearInterval(reconnectTimer);
    reconnectTimer = null;
  }
  cleanup();
  updateStatus("disconnected");
});

maxAPI.addHandler("listports", async function () {
  var ports = await SerialPort.list();
  ports.forEach(function (p) {
    maxAPI.post(
      "[ports] " + p.path + " (" + (p.manufacturer || "unknown") + ")"
    );
  });
});

maxAPI.addHandler("reset", function () {
  if (port && port.isOpen) {
    port.write("R");
  }
});

// ---- Calibration Handlers ----

maxAPI.addHandler("calibrate_start", function () {
  startCalibration();
});

maxAPI.addHandler("calibrate_stop", function () {
  stopCalibrationAndApply();
});

maxAPI.addHandler("calibrate_reset", function () {
  biasOffsets = null;
  orientOffset = null;
  blendFactor = 1.0;
  maxAPI.outlet("cal_status", "idle");
  maxAPI.post("[calibration] reset - all offsets cleared");
});

maxAPI.addHandler("orient_reset", function () {
  if (lastOrientation) {
    resetOrientation(
      lastOrientation.pitch,
      lastOrientation.roll,
      lastOrientation.yaw
    );
  }
});

maxAPI.addHandler("orient_restore", function () {
  restoreOrientation();
});

// ---- Smoothing Handlers ----

maxAPI.addHandler("smooth_global", function (val) {
  smoothFactors.global = val;
  maxAPI.post("[smoothing] global=" + val + " effective: ax=" + Math.max(val, smoothFactors.accel_group, smoothFactors.ax).toFixed(2) + " alpha=" + computeAlpha("ax").toFixed(3));
});
maxAPI.addHandler("smooth_accel_group", function (val) {
  smoothFactors.accel_group = val;
});
maxAPI.addHandler("smooth_gyro_group", function (val) {
  smoothFactors.gyro_group = val;
});
maxAPI.addHandler("smooth_orient_group", function (val) {
  smoothFactors.orient_group = val;
});
maxAPI.addHandler("smooth_ax", function (val) { smoothFactors.ax = val; });
maxAPI.addHandler("smooth_ay", function (val) { smoothFactors.ay = val; });
maxAPI.addHandler("smooth_az", function (val) { smoothFactors.az = val; });
maxAPI.addHandler("smooth_gx", function (val) { smoothFactors.gx = val; });
maxAPI.addHandler("smooth_gy", function (val) { smoothFactors.gy = val; });
maxAPI.addHandler("smooth_gz", function (val) { smoothFactors.gz = val; });
maxAPI.addHandler("smooth_pitch", function (val) { smoothFactors.pitch = val; });
maxAPI.addHandler("smooth_roll", function (val) { smoothFactors.roll = val; });
maxAPI.addHandler("smooth_yaw", function (val) { smoothFactors.yaw = val; });

// ============================================================
// Auto-start
// Begin port discovery immediately when loaded by node.script
// ============================================================

startScanning();
maxAPI.outlet("cal_status", "idle");
