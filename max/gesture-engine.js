// ============================================================
// Gesture Engine for Node for Max
// Self-contained script with serial I/O, calibration, smoothing,
// energy-based activity gating, circular buffer, and gesture
// handler framework. This is an either/or alternative to
// serial-bridge.js -- do NOT run both simultaneously.
//
// Gesture detector functions are stubs in this file.
// Actual detection algorithms are implemented in Plan 02.
// ============================================================

var maxAPI = require("max-api");
var SerialPort = require("serialport").SerialPort;
var ReadlineParser = require("@serialport/parser-readline").ReadlineParser;
var dgram = require("dgram");

// ---- Configuration Constants ----
var BAUD_RATE = 57600;
var EXPECTED_FIELDS = 9;
var RECONNECT_INTERVAL_MS = 2000;

// ---- Normalization Ranges ----
var NORM_RANGES = {
  ax: { min: -16.0, max: 16.0 },     // accelerometer: +/- 16g
  ay: { min: -16.0, max: 16.0 },
  az: { min: -16.0, max: 16.0 },
  gx: { min: -2000.0, max: 2000.0 }, // gyroscope: +/- 2000 dps
  gy: { min: -2000.0, max: 2000.0 },
  gz: { min: -2000.0, max: 2000.0 },
  pitch: { min: -90.0, max: 90.0 },  // pitch: -90 to +90
  roll: { min: -180.0, max: 180.0 }, // roll: -180 to +180
  yaw: { min: 0.0, max: 360.0 }      // yaw: 0 to 360
};

// ---- Connection State ----
var port = null;
var parser = null;
var reconnectTimer = null;
var state = "disconnected";
var normalizeEnabled = false;

// ---- Transport State ----
var transport = "usb";       // Current transport mode: "usb", "wifi", "auto"
var udpSocket = null;        // dgram socket for WiFi UDP
var udpPort = 8889;          // Default UDP listen port (matches firmware DEST_PORT)
var wifiIP = "192.168.1.50"; // Arduino IP for status display

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
// Fixed moderate defaults -- no user dials for smoothing in gesture engine
var smoothFactors = {
  global: 0.3, accel_group: 0, gyro_group: 0, orient_group: 0,
  ax: 0, ay: 0, az: 0, gx: 0, gy: 0, gz: 0,
  pitch: 0, roll: 0, yaw: 0
};
var smoothed = {
  ax: null, ay: null, az: null,
  gx: null, gy: null, gz: null,
  pitch: null, roll: null, yaw: null
};

// ---- Activity Gate State (CORE-03) ----
var activityState = "idle";     // "idle" or "active"
var idleTimer = null;
var IDLE_TIMEOUT_MS = 500;
var ACTIVITY_THRESHOLD = 0.15;  // g deviation from 1.0g baseline

// ---- Circular Buffer (CORE-04) ----
var BUFFER_SIZE = 64;           // ~0.56s at 114 Hz
var sensorBuffer = new Array(BUFFER_SIZE);
var bufferIndex = 0;
var bufferCount = 0;

// ---- Gesture State (GEST-08, GEST-09) ----
var gestureEnabled = {
  shake: true, tap: true, flip: true,
  "tilt-left": true, "tilt-right": true,
  "tilt-forward": true, "tilt-back": true
};
var gestureSensitivity = {
  shake: 0.5, tap: 0.5, flip: 0.5,
  "tilt-left": 0.5, "tilt-right": 0.5,
  "tilt-forward": 0.5, "tilt-back": 0.5
};
var gestureCooldown = {
  shake: 300, tap: 200, flip: 800,
  "tilt-left": 400, "tilt-right": 400,
  "tilt-forward": 400, "tilt-back": 400
};
var lastFireTime = {
  shake: 0, tap: 0, flip: 0,
  "tilt-left": 0, "tilt-right": 0,
  "tilt-forward": 0, "tilt-back": 0
};

// ============================================================
// Connection State Machine
// States: "disconnected", "scanning", "connected-usb",
//         "connected-wifi", "switching"
// ============================================================

function updateStatus(newState) {
  state = newState;
  maxAPI.outlet("status", state);
  maxAPI.post("[gesture-engine] status: " + state);
}

// ============================================================
// Port Discovery
// Finds Arduino by vendor ID or known path patterns
// ============================================================

async function findArduinoPort() {
  var ports = await SerialPort.list();
  var arduino = ports.find(function (p) {
    return (
      p.vendorId === "2341" ||
      p.path.includes("usbmodem") ||
      p.path.includes("ttyACM")
    );
  });
  return arduino || null;
}

// ============================================================
// CSV Validation
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
  maxAPI.post("[gesture-engine] bias offsets applied - " +
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
// Smoothing
// Three-tier EMA: effective = max(global, group, per_axis)
// alpha = 1.0 - effective * 0.99 -> 0=pass-through, 1=heavy
// Fixed moderate defaults for gesture engine (no user dials)
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
// Normalization
// Maps sensor values to 0.0-1.0 range using known sensor limits
// ============================================================

function normalizeValue(axis, value) {
  var range = NORM_RANGES[axis];
  var norm = (value - range.min) / (range.max - range.min);
  return Math.max(0.0, Math.min(1.0, norm));  // clamp 0-1
}

// ============================================================
// Activity Gate (CORE-03)
// Energy-based motion detection: instant wake, delayed idle
// ============================================================

function checkActivity(calFrame) {
  var magnitude = Math.sqrt(
    calFrame.ax * calFrame.ax +
    calFrame.ay * calFrame.ay +
    calFrame.az * calFrame.az
  );
  var deviation = Math.abs(magnitude - 1.0);

  if (deviation > ACTIVITY_THRESHOLD) {
    // Instant transition to active on a single frame of significant motion
    if (activityState === "idle") {
      activityState = "active";
      maxAPI.outlet("engine_status", "active");
    }
    // Reset idle timer on every active frame
    if (idleTimer) {
      clearTimeout(idleTimer);
      idleTimer = null;
    }
  } else if (activityState === "active" && !idleTimer) {
    // Start delayed return to idle (500ms of stillness)
    idleTimer = setTimeout(function () {
      activityState = "idle";
      maxAPI.outlet("engine_status", "idle");
      idleTimer = null;
    }, IDLE_TIMEOUT_MS);
  }
}

// ============================================================
// Circular Buffer (CORE-04)
// Stores most recent ~64 calibrated sensor frames
// ============================================================

function pushFrame(frame) {
  sensorBuffer[bufferIndex] = frame;
  bufferIndex = (bufferIndex + 1) % BUFFER_SIZE;
  if (bufferCount < BUFFER_SIZE) bufferCount++;
}

function getFrame(samplesAgo) {
  // Retrieve frame from N samples ago (0 = most recent)
  if (samplesAgo >= bufferCount) return null;
  var idx = (bufferIndex - 1 - samplesAgo + BUFFER_SIZE) % BUFFER_SIZE;
  return sensorBuffer[idx];
}

// ============================================================
// Fire Gesture Event (GEST-09)
// Respects per-gesture cooldown and enable/disable state
// ============================================================

function fireGesture(name) {
  // Check if gesture is enabled
  if (!gestureEnabled[name]) return;

  // Check cooldown
  var now = Date.now();
  if (now - lastFireTime[name] < gestureCooldown[name]) return;

  // Fire the gesture
  lastFireTime[name] = now;
  maxAPI.outlet("gesture", name);
  maxAPI.outlet("gesture_led", name, 1);

  // Auto-clear LED after 100ms
  setTimeout(function () {
    maxAPI.outlet("gesture_led", name, 0);
  }, 100);
}

// ============================================================
// Gesture Detector Stubs
// Implemented in Plan 02 -- no-op for now
// ============================================================

function detectShake(calFrame) {
  // Stub: shake detection (sustained high acceleration magnitude)
  // Implemented in Plan 02
}

function detectTap(calFrame) {
  // Stub: tap detection (sharp spike + rapid decay)
  // Implemented in Plan 02
}

function detectFlip(calFrame) {
  // Stub: flip detection (Z-axis sign change sustained)
  // Implemented in Plan 02
}

function detectTilts(smoothedOrient) {
  // Stub: tilt detection for all 4 directions
  // Uses smoothed orientation for stability
  // Implemented in Plan 02
}

// ============================================================
// Data Processing Pipeline
// Adapted from serial-bridge.js outputData() with gesture
// detection steps added at the end
// ============================================================

function processFrame(values) {
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

  // Raw outlets (same tags as serial-bridge.js)
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

    // Normalized outlets (smoothed data mapped to 0.0-1.0)
    if (normalizeEnabled) {
      maxAPI.outlet("norm_accel",
        normalizeValue("ax", sax),
        normalizeValue("ay", say),
        normalizeValue("az", saz));
      maxAPI.outlet("norm_gyro",
        normalizeValue("gx", sgx),
        normalizeValue("gy", sgy),
        normalizeValue("gz", sgz));
      maxAPI.outlet("norm_orientation",
        normalizeValue("pitch", sp),
        normalizeValue("roll", sr),
        normalizeValue("yaw", sy));
    }

    // ---- Gesture Engine Additions ----

    // Push calibrated (pre-smoothing) frame to circular buffer
    pushFrame({
      ax: cal.ax, ay: cal.ay, az: cal.az,
      gx: cal.gx, gy: cal.gy, gz: cal.gz,
      pitch: orient.pitch, roll: orient.roll, yaw: orient.yaw
    });

    // Check activity gate
    checkActivity(cal);

    // Run gesture detectors when active
    if (activityState === "active") {
      detectShake(cal);
      detectTap(cal);
      detectFlip(cal);
      detectTilts({ pitch: sp, roll: sr, yaw: sy });
    }

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

    // Normalized orientation (smoothed data mapped to 0.0-1.0)
    if (normalizeEnabled) {
      maxAPI.outlet("norm_orientation",
        normalizeValue("pitch", sp),
        normalizeValue("roll", sr),
        normalizeValue("yaw", sy));
    }
  }
}

// ============================================================
// Connection
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
    updateStatus("connected-usb");
  });

  port.on("error", function (err) {
    maxAPI.post("[gesture-engine] error: " + err.message);
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
      processFrame(values);
    }
  });

  port.open(function (err) {
    if (err) {
      maxAPI.post("[gesture-engine] open failed: " + err.message);
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
// UDP Transport
// Receives same CSV format over WiFi UDP via dgram
// Data flows through the same validateLine/processFrame pipeline
// ============================================================

function startUDP(listenPort) {
  if (udpSocket) return;
  udpSocket = dgram.createSocket("udp4");

  udpSocket.on("message", function (msg, rinfo) {
    var line = msg.toString().trim();
    var values = validateLine(line);
    if (values) {
      processFrame(values);
    }
  });

  udpSocket.on("listening", function () {
    var addr = udpSocket.address();
    maxAPI.post("[gesture-engine] UDP listening on " + addr.address + ":" + addr.port);
    updateStatus("connected-wifi");
  });

  udpSocket.on("error", function (err) {
    maxAPI.post("[gesture-engine] UDP error: " + err.message);
    if (udpSocket) {
      udpSocket.close();
      udpSocket = null;
    }
  });

  udpSocket.bind(listenPort, "0.0.0.0");
}

function stopUDP() {
  if (udpSocket) {
    udpSocket.close();
    udpSocket = null;
  }
}

// ============================================================
// Reconnection
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
      maxAPI.post("[gesture-engine] scan error: " + err.message);
    }
  }, RECONNECT_INTERVAL_MS);
}

// ============================================================
// MAX Message Handlers
// ============================================================

// ---- Connection Handlers ----

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
  stopUDP();
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
  maxAPI.post("[gesture-engine] reset - all offsets cleared");
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

// ---- Transport Handlers ----

maxAPI.addHandler("transport", function () {
  var args = Array.prototype.slice.call(arguments);
  var mode = args[0];
  transport = mode;

  if (mode === "usb") {
    updateStatus("switching");
    stopUDP();
    startScanning();
  } else if (mode === "wifi") {
    updateStatus("switching");
    cleanup();
    if (reconnectTimer) { clearInterval(reconnectTimer); reconnectTimer = null; }
    startUDP(udpPort);
  } else if (mode === "auto") {
    updateStatus("switching");
    stopUDP();
    startScanning();
    // After 5s timeout with no USB found, fall back to WiFi
    setTimeout(function () {
      if (state !== "connected-usb") {
        startUDP(udpPort);
      }
    }, 5000);
  }
});

maxAPI.addHandler("udpport", function (p) {
  udpPort = p;
  maxAPI.post("[gesture-engine] UDP port set to " + p);
  // If currently on WiFi, restart with new port
  if (udpSocket) {
    stopUDP();
    startUDP(udpPort);
  }
});

maxAPI.addHandler("ip", function (addr) {
  wifiIP = addr;
  maxAPI.post("[gesture-engine] Arduino IP set to " + addr);
});

// ---- Normalization Handler ----

maxAPI.addHandler("normalize", function (val) {
  normalizeEnabled = (val === 1 || val === true);
  maxAPI.outlet("norm_status", normalizeEnabled ? 1 : 0);
  maxAPI.post("[gesture-engine] normalize " + (normalizeEnabled ? "enabled" : "disabled"));
});

// ---- Gesture Handlers (GEST-08) ----

maxAPI.addHandler("gesture_enable", function (name, val) {
  if (gestureEnabled.hasOwnProperty(name)) {
    gestureEnabled[name] = (val === 1);
    maxAPI.post("[gesture-engine] " + name + " " + (val === 1 ? "enabled" : "disabled"));
  }
});

maxAPI.addHandler("gesture_sensitivity", function (name, val) {
  if (gestureSensitivity.hasOwnProperty(name)) {
    gestureSensitivity[name] = val;
    maxAPI.post("[gesture-engine] " + name + " sensitivity=" + val);
  }
});

maxAPI.addHandler("gesture_cooldown", function (name, val) {
  if (gestureCooldown.hasOwnProperty(name)) {
    gestureCooldown[name] = val;
    maxAPI.post("[gesture-engine] " + name + " cooldown=" + val + "ms");
  }
});

// ============================================================
// Auto-start
// Begin port discovery immediately when loaded by node.script
// ============================================================

maxAPI.post("[gesture-engine] WARNING: ensure imu-sensor.maxpat is not also running -- both patches cannot share the same serial port");
startScanning();
maxAPI.outlet("cal_status", "idle");
