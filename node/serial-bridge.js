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
  } else if (orientOffset !== null) {
    // Orientation reset is independent of bias calibration
    var dt = getTimeDelta();
    var orient = applyOrientReset(pitch, roll, yaw, dt);
    maxAPI.outlet("cal_orientation", orient.pitch, orient.roll, orient.yaw);
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

// ============================================================
// Auto-start
// Begin port discovery immediately when loaded by node.script
// ============================================================

startScanning();
maxAPI.outlet("cal_status", "idle");
