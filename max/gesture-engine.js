// ============================================================
// Gesture Engine for Node for Max
// Self-contained script with serial I/O, calibration, smoothing,
// energy-based activity gating, circular buffer, and gesture
// handler framework. This is an either/or alternative to
// serial-bridge.js -- do NOT run both simultaneously.
//
// Gesture detector functions: shake, tap, flip (acceleration-based),
// and 4-direction tilt (orientation-based with hysteresis).
// ============================================================

var maxAPI = require("max-api");
var SerialPort = require("serialport").SerialPort;
var ReadlineParser = require("@serialport/parser-readline").ReadlineParser;
var dgram = require("dgram");
var fs = require("fs");

// ---- Configuration Constants ----
var BAUD_RATE = 57600;
var EXPECTED_FIELDS_MIN = 9;
var EXPECTED_FIELDS_MAX = 13;
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

  // Check field count (9 standard, 10-13 with quaternion)
  var parts = line.split(",");
  if (parts.length < EXPECTED_FIELDS_MIN || parts.length > EXPECTED_FIELDS_MAX) {
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
// Gesture Detectors
// Shake, tap, flip use calibrated (pre-smoothing) acceleration
// Tilts use smoothed orientation for stable angle readings
// ============================================================

// ---- Shake State (GEST-01) ----
var shakeConsecutiveCount = 0;
var SHAKE_MIN_CONSECUTIVE = 3;  // must exceed threshold for 3+ frames (~26ms at 114Hz)

function detectShake(calFrame) {
  if (!gestureEnabled.shake) return;

  var mag = Math.sqrt(
    calFrame.ax * calFrame.ax +
    calFrame.ay * calFrame.ay +
    calFrame.az * calFrame.az
  );

  // Sensitivity maps dial (0-1) to threshold range
  // 0.0 = very sensitive (1.5g), 0.5 = default (2.75g), 1.0 = insensitive (4.0g)
  var threshold = 1.5 + gestureSensitivity.shake * 2.5;

  if (mag > threshold) {
    shakeConsecutiveCount++;
    if (shakeConsecutiveCount >= SHAKE_MIN_CONSECUTIVE) {
      fireGesture("shake");
      shakeConsecutiveCount = 0;  // reset after fire
    }
  } else {
    shakeConsecutiveCount = 0;
  }
}

// ---- Tap State (GEST-02) ----
var TAP_WINDOW = 10;  // frames for running average (~88ms)

function detectTap(calFrame) {
  if (!gestureEnabled.tap) return;

  var mag = Math.sqrt(
    calFrame.ax * calFrame.ax +
    calFrame.ay * calFrame.ay +
    calFrame.az * calFrame.az
  );

  // Compute running average magnitude from the last TAP_WINDOW frames in buffer
  var avgMag = 1.0;  // default to 1g (gravity baseline) if buffer not full
  if (bufferCount >= TAP_WINDOW) {
    var sum = 0;
    for (var i = 1; i <= TAP_WINDOW; i++) {
      var f = getFrame(i);
      if (f) sum += Math.sqrt(f.ax * f.ax + f.ay * f.ay + f.az * f.az);
    }
    avgMag = sum / TAP_WINDOW;
  }

  // Spike detection: current magnitude exceeds average by threshold
  // 0.0 = very sensitive (1.5g spike), 0.5 = default (3.25g), 1.0 = insensitive (5.0g)
  var spikeThreshold = 1.5 + gestureSensitivity.tap * 3.5;
  var delta = mag - avgMag;

  if (delta > spikeThreshold) {
    fireGesture("tap");
  }
}

// ---- Flip State (GEST-03) ----
var flipState = "neutral";  // "neutral" or "confirming"
var flipConfirmCount = 0;
var FLIP_CONFIRM_FRAMES = 10;  // ~88ms sustained inverted
var lastZSign = 0;  // 1 = upright, -1 = inverted, 0 = unknown

function detectFlip(calFrame) {
  if (!gestureEnabled.flip) return;

  var currentZSign = calFrame.az > 0 ? 1 : -1;

  // Sensitivity adjusts how far from vertical counts as "flipped"
  // 0.0 = sensitive (|az| > 0.3g), 0.5 = default (|az| > 0.55g), 1.0 = insensitive (|az| > 0.8g)
  var zThreshold = 0.3 + gestureSensitivity.flip * 0.5;

  if (Math.abs(calFrame.az) < zThreshold) {
    // In dead zone (sideways) -- don't trigger
    flipState = "neutral";
    flipConfirmCount = 0;
    return;
  }

  if (lastZSign !== 0 && currentZSign !== lastZSign) {
    // Z-axis sign changed -- start confirming
    flipState = "confirming";
    flipConfirmCount = 1;
    lastZSign = currentZSign;
  } else if (flipState === "confirming") {
    flipConfirmCount++;
    if (flipConfirmCount >= FLIP_CONFIRM_FRAMES) {
      fireGesture("flip");
      flipState = "neutral";
      flipConfirmCount = 0;
    }
  } else {
    lastZSign = currentZSign;
  }
}

// ---- Tilt State (GEST-04 through GEST-07) ----
var tiltArmed = {
  "tilt-left": true, "tilt-right": true,
  "tilt-forward": true, "tilt-back": true
};

function detectTilts(smoothedOrient) {
  // Uses smoothed orientation for stable tilt detection
  // (unlike shake/tap/flip which use calibrated pre-smoothing data)
  var pitch = smoothedOrient.pitch;
  var roll = smoothedOrient.roll;

  // Sensitivity maps dial (0-1) to angle threshold in degrees
  // 0.0 = very sensitive (15 deg), 0.5 = default (37.5 deg), 1.0 = insensitive (60 deg)
  function angleThreshold(name) {
    return 15 + gestureSensitivity[name] * 45;
  }

  // Hysteresis re-arm zone: must return past 60% of threshold to re-arm
  function rearmAngle(name) {
    return angleThreshold(name) * 0.6;
  }

  // Tilt-left: negative roll exceeds threshold
  checkTilt("tilt-left", -roll, angleThreshold("tilt-left"), rearmAngle("tilt-left"));
  // Tilt-right: positive roll exceeds threshold
  checkTilt("tilt-right", roll, angleThreshold("tilt-right"), rearmAngle("tilt-right"));
  // Tilt-forward: negative pitch exceeds threshold
  checkTilt("tilt-forward", -pitch, angleThreshold("tilt-forward"), rearmAngle("tilt-forward"));
  // Tilt-back: positive pitch exceeds threshold
  checkTilt("tilt-back", pitch, angleThreshold("tilt-back"), rearmAngle("tilt-back"));
}

function checkTilt(name, angle, threshold, rearm) {
  if (!gestureEnabled[name]) return;
  if (angle > threshold && tiltArmed[name]) {
    fireGesture(name);
    tiltArmed[name] = false;  // disarm until return to neutral
  } else if (angle < rearm) {
    tiltArmed[name] = true;   // re-arm when back near neutral
  }
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

  // Quaternion outlet (13-field CSV)
  if (values.length >= 13) {
    maxAPI.outlet("quaternion", values[9], values[10], values[11], values[12]);
  }

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

    // Push calibrated frame to DTW buffer
    var calValues = [cal.ax, cal.ay, cal.az, cal.gx, cal.gy, cal.gz, orient.pitch, orient.roll, orient.yaw];
    if (values.length >= 13) {
      calValues.push(values[9], values[10], values[11], values[12]);
    }
    pushDTWFrame(calValues);

    // Record DTW frame if recording active
    if (dtwRecordState === "recording") {
      recordDTWFrame(calValues);
    }

    // Decimated DTW matching
    dtwMatchCounter++;
    if (dtwMatchCounter >= DTW_MATCH_EVERY) {
      dtwMatchCounter = 0;
      if (dtwRecordState === "idle") {
        scheduleDTWMatch();
      }
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
// DTW SUBSYSTEM
// Custom gesture recording, DTW matching, template management,
// axis auto-detection, null rejection, and save/load
// ============================================================

// ---- DTW State Variables ----
var dtwSlots = {};           // slotId -> { name, label, enabled, threshold, cooldown, activeAxes, nullRejectionCoeff, bandRadius, lastFireTime, matchMode }
var dtwTemplates = {};       // slotId -> { template, examples, trainingMu, trainingSigma, rejectionThreshold, lastConfidence }
var dtwRecording = null;     // { slotId, buffer, mode, startTime, duration }
var dtwRecordState = "idle"; // "idle" | "recording" | "captured"
var dtwMatchCounter = 0;
var DTW_MATCH_EVERY = 5;     // ~22Hz at 114Hz input
var dtwMatchMode = "best";   // "best" or "all"
var dtwContinuousStream = false;
var dtwNextSlotId = 1;
var DTW_BUFFER_SIZE = 256;   // ~2.25s at 114Hz for DTW candidate window
var dtwBuffer = [];          // separate circular buffer for DTW (longer than gesture buffer)
var dtwBufferIndex = 0;

// ---- setImmediate polyfill for Node for Max ----
var _setImmediate = (typeof setImmediate === "function") ? setImmediate : function(fn) { setTimeout(fn, 0); };

// ============================================================
// DTW Circular Buffer
// Separate from the 64-frame gesture buffer (256 frames, ~2.25s)
// ============================================================

function pushDTWFrame(frame) {
  if (dtwBuffer.length < DTW_BUFFER_SIZE) {
    dtwBuffer.push(frame);
  } else {
    dtwBuffer[dtwBufferIndex] = frame;
  }
  dtwBufferIndex = (dtwBufferIndex + 1) % DTW_BUFFER_SIZE;
}

function getDTWFrame(framesAgo) {
  if (framesAgo >= dtwBuffer.length) return null;
  var idx = (dtwBufferIndex - 1 - framesAgo + DTW_BUFFER_SIZE) % DTW_BUFFER_SIZE;
  return dtwBuffer[idx < 0 ? idx + DTW_BUFFER_SIZE : idx];
}

function getDTWWindow(length) {
  var window = [];
  var available = Math.min(length, dtwBuffer.length);
  for (var i = available - 1; i >= 0; i--) {
    var frame = getDTWFrame(i);
    if (frame) window.push(frame);
  }
  return window;
}

// ============================================================
// DTW Recording State Machine
// Supports timed window and toggle modes
// ============================================================

function startDTWRecording(slotId, mode, duration) {
  // Create slot if doesn't exist
  if (!dtwSlots[slotId]) {
    dtwSlots[slotId] = {
      name: "gesture-" + slotId,
      label: "",
      enabled: true,
      threshold: 0.6,
      cooldown: 500,
      activeAxes: ["ax", "ay", "az", "gx", "gy", "gz"],
      nullRejectionCoeff: 3.0,
      bandRadius: 0.1,
      lastFireTime: 0,
      matchMode: "best"
    };
    dtwTemplates[slotId] = { template: null, examples: [], trainingMu: 0, trainingSigma: 0, rejectionThreshold: 0, lastConfidence: 0 };
  }
  dtwRecordState = "recording";
  dtwRecording = {
    slotId: slotId,
    buffer: [],
    mode: mode || "timed",
    startTime: Date.now(),
    duration: duration || 2000
  };
  maxAPI.outlet("dtw_record_status", "recording", slotId);
  maxAPI.post("[gesture-engine] DTW recording started for slot " + slotId + " (" + (mode || "timed") + ")");
}

function stopDTWRecording() {
  if (dtwRecordState !== "recording" || !dtwRecording) return;
  dtwRecordState = "captured";
  var example = dtwRecording.buffer.slice();
  var slotId = dtwRecording.slotId;
  addExampleToSlot(slotId, example);
  maxAPI.outlet("dtw_record_status", "captured", slotId, example.length);
  maxAPI.post("[gesture-engine] DTW recorded " + example.length + " frames for slot " + slotId +
              " (example " + dtwTemplates[slotId].examples.length + ")");
  dtwRecording = null;
  // Return to idle after a short delay (let MAX process the captured message)
  setTimeout(function() { dtwRecordState = "idle"; }, 100);
}

function recordDTWFrame(frame) {
  if (dtwRecordState !== "recording" || !dtwRecording) return;
  // Store frame as object with named axes for DTW matching
  var namedFrame = {
    ax: frame[0], ay: frame[1], az: frame[2],
    gx: frame[3], gy: frame[4], gz: frame[5],
    pitch: frame[6], roll: frame[7], yaw: frame[8]
  };
  // Add quaternion if available (13-field CSV)
  if (frame.length >= 13) {
    namedFrame.q0 = frame[9];
    namedFrame.q1 = frame[10];
    namedFrame.q2 = frame[11];
    namedFrame.q3 = frame[12];
  }
  dtwRecording.buffer.push(namedFrame);
  maxAPI.outlet("dtw_record_progress", dtwRecording.buffer.length);

  // Auto-stop for timed mode
  if (dtwRecording.mode === "timed" &&
      Date.now() - dtwRecording.startTime >= dtwRecording.duration) {
    stopDTWRecording();
  }
}

// ============================================================
// Template Management
// Best-representative selection from multiple examples
// ============================================================

function addExampleToSlot(slotId, example) {
  if (!dtwTemplates[slotId]) {
    dtwTemplates[slotId] = { template: null, examples: [], trainingMu: 0, trainingSigma: 0, rejectionThreshold: 0, lastConfidence: 0 };
  }
  dtwTemplates[slotId].examples.push(example);
  // Recompute template and stats if 2+ examples
  if (dtwTemplates[slotId].examples.length >= 2) {
    computeTemplateAndStats(slotId);
  } else {
    // With just 1 example, use it directly as template (no null rejection yet)
    dtwTemplates[slotId].template = example;
    dtwTemplates[slotId].rejectionThreshold = 0; // disabled until 2+ examples
  }
  maxAPI.outlet("dtw_slot_info", slotId, dtwSlots[slotId].name, dtwTemplates[slotId].examples.length);
}

function computeTemplateAndStats(slotId) {
  var examples = dtwTemplates[slotId].examples;
  if (examples.length < 2) return;

  var slot = dtwSlots[slotId];
  var axes = slot.activeAxes;
  var bandRadius = slot.bandRadius || 0.1;

  // Auto-detect axes if this is the first computation
  if (!slot._axesManuallySet) {
    var detected = autoDetectAxes(examples);
    slot.activeAxes = detected;
    axes = detected;
    maxAPI.outlet("dtw_axes_detected", slotId, axes.join(" "));
    maxAPI.post("[gesture-engine] Auto-detected axes for slot " + slotId + ": " + axes.join(","));
  }

  // Compute pairwise DTW distances
  var distances = [];
  var avgDistances = new Array(examples.length).fill(0);
  for (var i = 0; i < examples.length; i++) {
    for (var j = i + 1; j < examples.length; j++) {
      var d = dtwDistance(examples[i], examples[j], axes, bandRadius);
      distances.push(d);
      avgDistances[i] += d;
      avgDistances[j] += d;
    }
  }

  // Select best representative (lowest average distance to all others)
  for (var i = 0; i < avgDistances.length; i++) {
    avgDistances[i] /= (examples.length - 1);
  }
  var bestIdx = 0;
  var bestDist = avgDistances[0];
  for (var i = 1; i < avgDistances.length; i++) {
    if (avgDistances[i] < bestDist) {
      bestDist = avgDistances[i];
      bestIdx = i;
    }
  }
  dtwTemplates[slotId].template = examples[bestIdx];

  // Compute training statistics for null rejection
  var mu = 0;
  for (var i = 0; i < distances.length; i++) mu += distances[i];
  mu /= distances.length;

  var variance = 0;
  for (var i = 0; i < distances.length; i++) {
    variance += (distances[i] - mu) * (distances[i] - mu);
  }
  variance /= distances.length;
  var sigma = Math.sqrt(variance);

  dtwTemplates[slotId].trainingMu = mu;
  dtwTemplates[slotId].trainingSigma = sigma;
  // With exactly 2 examples, sigma may be very small -- use wider coefficient
  var coeff = examples.length <= 2 ? 5.0 : (slot.nullRejectionCoeff || 3.0);
  dtwTemplates[slotId].rejectionThreshold = mu + coeff * sigma;

  maxAPI.post("[gesture-engine] Slot " + slotId + " template computed: mu=" +
              mu.toFixed(3) + " sigma=" + sigma.toFixed(3) +
              " threshold=" + dtwTemplates[slotId].rejectionThreshold.toFixed(3));
}

// ============================================================
// DTW Distance with Sakoe-Chiba Band
// Multi-dimensional Euclidean distance, normalized by path length
// ============================================================

function dtwDistance(seq1, seq2, activeAxes, bandRadius) {
  var n = seq1.length;
  var m = seq2.length;
  var band = Math.max(1, Math.round(bandRadius * Math.max(n, m)));

  // Initialize cost matrix with Infinity
  var cost = [];
  for (var i = 0; i <= n; i++) {
    cost[i] = new Array(m + 1).fill(Infinity);
  }
  cost[0][0] = 0;

  for (var i = 1; i <= n; i++) {
    var jCenter = Math.round(i * m / n);
    var jStart = Math.max(1, jCenter - band);
    var jEnd = Math.min(m, jCenter + band);

    for (var j = jStart; j <= jEnd; j++) {
      // Multi-dimensional Euclidean distance
      var d = 0;
      for (var k = 0; k < activeAxes.length; k++) {
        var axis = activeAxes[k];
        var v1 = seq1[i - 1][axis] || 0;
        var v2 = seq2[j - 1][axis] || 0;
        var diff = v1 - v2;
        d += diff * diff;
      }
      d = Math.sqrt(d);

      cost[i][j] = d + Math.min(
        cost[i - 1][j],
        cost[i][j - 1],
        cost[i - 1][j - 1]
      );
    }
  }

  // Normalize by path length
  return cost[n][m] / (n + m);
}

// ============================================================
// Variance-Based Axis Auto-Detection
// Selects axes with significant variance across recorded examples
// ============================================================

function autoDetectAxes(examples) {
  var allAxes = ["ax", "ay", "az", "gx", "gy", "gz", "pitch", "roll", "yaw", "q0", "q1", "q2", "q3"];
  var variances = {};

  allAxes.forEach(function(axis) {
    var values = [];
    examples.forEach(function(ex) {
      ex.forEach(function(frame) {
        if (frame[axis] !== undefined) values.push(frame[axis]);
      });
    });
    if (values.length === 0) { variances[axis] = 0; return; }

    var mean = 0;
    for (var i = 0; i < values.length; i++) mean += values[i];
    mean /= values.length;

    var v = 0;
    for (var i = 0; i < values.length; i++) {
      v += (values[i] - mean) * (values[i] - mean);
    }
    variances[axis] = v / values.length;
  });

  var maxVar = 0;
  var keys = Object.keys(variances);
  for (var i = 0; i < keys.length; i++) {
    if (variances[keys[i]] > maxVar) maxVar = variances[keys[i]];
  }
  var threshold = maxVar * 0.1;

  var selected = allAxes.filter(function(axis) {
    return variances[axis] > threshold;
  });

  // Ensure at least 3 axes
  if (selected.length < 3) {
    var sorted = allAxes.slice().sort(function(a, b) {
      return (variances[b] || 0) - (variances[a] || 0);
    });
    selected = sorted.slice(0, 3);
  }

  return selected;
}

// ============================================================
// Decimated Real-Time DTW Matching
// Processes one template per event loop tick via setImmediate
// ============================================================

var dtwPendingResults = {};

function scheduleDTWMatch() {
  var slotIds = Object.keys(dtwSlots).filter(function(id) {
    return dtwSlots[id].enabled && dtwTemplates[id] && dtwTemplates[id].template;
  });
  if (slotIds.length === 0) return;

  // Get candidate window from DTW buffer
  // Use window sized to ~1.5x the longest template
  var maxLen = 0;
  for (var i = 0; i < slotIds.length; i++) {
    var tLen = dtwTemplates[slotIds[i]].template.length;
    if (tLen > maxLen) maxLen = tLen;
  }
  var windowSize = Math.min(DTW_BUFFER_SIZE, Math.round(maxLen * 1.5));
  var candidate = getDTWWindow(windowSize);
  if (candidate.length < 20) return; // not enough data

  // Convert candidate frames to named-axis objects (DTW buffer stores calibrated arrays)
  var namedCandidate = candidate.map(function(frame) {
    var obj = {
      ax: frame[0], ay: frame[1], az: frame[2],
      gx: frame[3], gy: frame[4], gz: frame[5],
      pitch: frame[6], roll: frame[7], yaw: frame[8]
    };
    if (frame.length >= 13) {
      obj.q0 = frame[9]; obj.q1 = frame[10];
      obj.q2 = frame[11]; obj.q3 = frame[12];
    }
    return obj;
  });

  dtwPendingResults = {};
  var startTime = Date.now();
  processNextTemplate(slotIds, 0, namedCandidate, startTime);
}

function processNextTemplate(slotIds, idx, candidate, startTime) {
  if (idx >= slotIds.length) {
    emitDTWResults();
    // Performance guard
    var elapsed = Date.now() - startTime;
    if (elapsed > 20) {
      maxAPI.post("[gesture-engine] DTW cycle took " + elapsed + "ms -- consider reducing gesture count");
    }
    return;
  }

  var slotId = slotIds[idx];
  var template = dtwTemplates[slotId].template;
  var axes = dtwSlots[slotId].activeAxes;
  var bandRadius = dtwSlots[slotId].bandRadius || 0.1;

  // Check length ratio -- skip if too extreme (>3:1)
  var ratio = candidate.length / template.length;
  if (ratio > 3 || ratio < 0.33) {
    dtwPendingResults[slotId] = 0;
    _setImmediate(function() { processNextTemplate(slotIds, idx + 1, candidate, startTime); });
    return;
  }

  var distance = dtwDistance(candidate, template, axes, bandRadius);
  var threshold = dtwTemplates[slotId].rejectionThreshold;

  var confidence;
  if (threshold <= 0) {
    // No rejection threshold (single example) -- use raw distance inverse
    confidence = Math.max(0, 1.0 - distance / 2.0);
  } else {
    confidence = threshold > 0 ? Math.max(0, 1.0 - distance / threshold) : 0;
  }

  dtwPendingResults[slotId] = confidence;
  dtwTemplates[slotId].lastConfidence = confidence;

  // Yield to event loop between templates
  _setImmediate(function() {
    processNextTemplate(slotIds, idx + 1, candidate, startTime);
  });
}

function emitDTWResults() {
  var now = Date.now();
  var bestSlot = null;
  var bestConf = 0;

  var slotIds = Object.keys(dtwPendingResults);
  for (var i = 0; i < slotIds.length; i++) {
    var slotId = slotIds[i];
    var conf = dtwPendingResults[slotId];
    var slot = dtwSlots[slotId];

    // Continuous confidence stream (if enabled)
    if (dtwContinuousStream) {
      maxAPI.outlet("dtw_confidence", slotId, slot.name, conf.toFixed(3));
    }

    // Check if above user threshold and not in cooldown
    if (conf >= slot.threshold && (now - slot.lastFireTime) >= slot.cooldown) {
      if (dtwMatchMode === "all") {
        // Fire all above threshold
        maxAPI.outlet("dtw_match", slot.name, conf.toFixed(3));
        slot.lastFireTime = now;
      } else {
        // Track best
        if (conf > bestConf) {
          bestConf = conf;
          bestSlot = slotId;
        }
      }
    }
  }

  // In "best" mode, fire only the best match
  if (dtwMatchMode === "best" && bestSlot !== null) {
    var slot = dtwSlots[bestSlot];
    maxAPI.outlet("dtw_match", slot.name, bestConf.toFixed(3));
    slot.lastFireTime = now;
  }
}

// ============================================================
// DTW Save/Load Handlers
// JSON library persistence for gesture templates
// ============================================================

maxAPI.addHandler("dtw_save", function(filepath) {
  var library = {
    version: 1,
    created: new Date().toISOString(),
    description: "",
    slots: {}
  };

  Object.keys(dtwSlots).forEach(function(id) {
    library.slots[id] = {
      name: dtwSlots[id].name,
      label: dtwSlots[id].label,
      enabled: dtwSlots[id].enabled,
      threshold: dtwSlots[id].threshold,
      cooldown: dtwSlots[id].cooldown,
      activeAxes: dtwSlots[id].activeAxes,
      nullRejectionCoeff: dtwSlots[id].nullRejectionCoeff,
      bandRadius: dtwSlots[id].bandRadius,
      template: dtwTemplates[id] ? dtwTemplates[id].template : null,
      examples: dtwTemplates[id] ? dtwTemplates[id].examples : [],
      trainingMu: dtwTemplates[id] ? dtwTemplates[id].trainingMu : 0,
      trainingSigma: dtwTemplates[id] ? dtwTemplates[id].trainingSigma : 0,
      rejectionThreshold: dtwTemplates[id] ? dtwTemplates[id].rejectionThreshold : 0
    };
  });

  // Truncate template values to 3 decimal places for file size reduction
  var json = JSON.stringify(library, function(key, val) {
    return typeof val === "number" ? Math.round(val * 1000) / 1000 : val;
  }, 2);

  fs.writeFileSync(filepath, json);
  maxAPI.outlet("dtw_status", "saved", filepath);
  maxAPI.post("[gesture-engine] DTW library saved to " + filepath);
});

maxAPI.addHandler("dtw_load", function(filepath) {
  try {
    var data = JSON.parse(fs.readFileSync(filepath, "utf8"));
    if (data.version !== 1) {
      maxAPI.post("[gesture-engine] Unsupported library version: " + data.version);
      return;
    }
    dtwSlots = {};
    dtwTemplates = {};
    dtwNextSlotId = 1;
    Object.keys(data.slots).forEach(function(id) {
      var s = data.slots[id];
      dtwSlots[id] = {
        name: s.name, label: s.label || "", enabled: s.enabled,
        threshold: s.threshold, cooldown: s.cooldown,
        activeAxes: s.activeAxes,
        nullRejectionCoeff: s.nullRejectionCoeff || 3.0,
        bandRadius: s.bandRadius || 0.1,
        lastFireTime: 0, matchMode: "best",
        _axesManuallySet: true  // loaded axes are intentional
      };
      dtwTemplates[id] = {
        template: s.template, examples: s.examples || [],
        trainingMu: s.trainingMu || 0, trainingSigma: s.trainingSigma || 0,
        rejectionThreshold: s.rejectionThreshold || 0,
        lastConfidence: 0
      };
      var numId = parseInt(id);
      if (numId >= dtwNextSlotId) dtwNextSlotId = numId + 1;
    });
    maxAPI.outlet("dtw_status", "loaded", filepath);
    maxAPI.outlet("dtw_library_info", Object.keys(dtwSlots).length);
    maxAPI.post("[gesture-engine] DTW library loaded: " + Object.keys(dtwSlots).length + " gestures from " + filepath);
  } catch (e) {
    maxAPI.post("[gesture-engine] Load error: " + e.message);
    maxAPI.outlet("dtw_status", "error", e.message);
  }
});

// ============================================================
// DTW MAX Message Handlers
// Recording, slot management, configuration
// ============================================================

maxAPI.addHandler("dtw_record_start", function(slotId, mode, duration) {
  if (!slotId) slotId = dtwNextSlotId;
  startDTWRecording(slotId, mode || "timed", duration || 2000);
});

maxAPI.addHandler("dtw_record_stop", function() {
  stopDTWRecording();
});

maxAPI.addHandler("dtw_delete", function(slotId) {
  if (dtwSlots[slotId]) {
    delete dtwSlots[slotId];
    delete dtwTemplates[slotId];
    maxAPI.outlet("dtw_status", "deleted", slotId);
    maxAPI.post("[gesture-engine] Deleted DTW slot " + slotId);
  }
});

maxAPI.addHandler("dtw_enable", function(slotId, enabled) {
  if (dtwSlots[slotId]) {
    dtwSlots[slotId].enabled = enabled ? true : false;
  }
});

maxAPI.addHandler("dtw_threshold", function(slotId, value) {
  if (dtwSlots[slotId]) {
    dtwSlots[slotId].threshold = parseFloat(value) || 0.6;
  }
});

maxAPI.addHandler("dtw_cooldown", function(slotId, value) {
  if (dtwSlots[slotId]) {
    dtwSlots[slotId].cooldown = parseInt(value) || 500;
  }
});

maxAPI.addHandler("dtw_name", function(slotId, name) {
  if (dtwSlots[slotId]) {
    dtwSlots[slotId].name = name || ("gesture-" + slotId);
  }
});

maxAPI.addHandler("dtw_label", function(slotId, label) {
  if (dtwSlots[slotId]) {
    dtwSlots[slotId].label = label || "";
  }
});

maxAPI.addHandler("dtw_axes", function(slotId) {
  // Remaining args are axis names
  if (dtwSlots[slotId]) {
    var axes = Array.prototype.slice.call(arguments, 1);
    if (axes.length > 0) {
      dtwSlots[slotId].activeAxes = axes;
      dtwSlots[slotId]._axesManuallySet = true;
    }
  }
});

maxAPI.addHandler("dtw_axes_auto", function(slotId) {
  if (dtwSlots[slotId] && dtwTemplates[slotId] && dtwTemplates[slotId].examples.length > 0) {
    dtwSlots[slotId]._axesManuallySet = false;
    var detected = autoDetectAxes(dtwTemplates[slotId].examples);
    dtwSlots[slotId].activeAxes = detected;
    maxAPI.outlet("dtw_axes_detected", slotId, detected.join(" "));
  }
});

maxAPI.addHandler("dtw_match_mode", function(mode) {
  if (mode === "best" || mode === "all") {
    dtwMatchMode = mode;
    maxAPI.post("[gesture-engine] DTW match mode: " + mode);
  }
});

maxAPI.addHandler("dtw_continuous", function(enabled) {
  dtwContinuousStream = enabled ? true : false;
});

maxAPI.addHandler("dtw_record_duration", function(ms) {
  // Sets default duration for next timed recording
  if (dtwRecording && dtwRecording.mode === "timed") {
    dtwRecording.duration = parseInt(ms) || 2000;
  }
});

maxAPI.addHandler("dtw_null_rejection_coeff", function(slotId, coeff) {
  if (dtwSlots[slotId]) {
    dtwSlots[slotId].nullRejectionCoeff = parseFloat(coeff) || 3.0;
    // Recompute threshold if we have stats
    if (dtwTemplates[slotId] && dtwTemplates[slotId].examples.length >= 2) {
      computeTemplateAndStats(slotId);
    }
  }
});

maxAPI.addHandler("dtw_clear_all", function() {
  dtwSlots = {};
  dtwTemplates = {};
  dtwNextSlotId = 1;
  maxAPI.outlet("dtw_status", "cleared");
  maxAPI.post("[gesture-engine] All DTW slots cleared");
});

// ============================================================
// Auto-start
// Begin port discovery immediately when loaded by node.script
// ============================================================

maxAPI.post("[gesture-engine] WARNING: ensure imu-sensor.maxpat is not also running -- both patches cannot share the same serial port");
startScanning();
maxAPI.outlet("cal_status", "idle");
