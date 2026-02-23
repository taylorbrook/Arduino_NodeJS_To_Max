# Phase 7: Core Engine and Predefined Gestures - Research

**Researched:** 2026-02-22
**Domain:** IMU gesture detection (shake, tap, flip, tilt) with energy-based activity gating, implemented as a self-contained Node for Max script with MAX patch wrapper
**Confidence:** HIGH

## Summary

Phase 7 builds a fully self-contained gesture detection patch (`imu-gesture.maxpat`) that owns its own serial/wifi connection, calibration, and smoothing -- then adds gesture detection on top. This is a fundamental architectural change from the original v1.1 research (which assumed imu-gesture sits downstream of imu-sensor via patch cables). Instead, imu-gesture is an either/or alternative: users pick `imu-sensor.maxpat` for raw data OR `imu-gesture.maxpat` for data + gestures.

The gesture detection domain is well-understood for the 7 predefined gestures (shake, tap, flip, 4 tilts). Each uses threshold-based heuristics on the 9-value sensor stream -- no machine learning or DTW needed. The primary engineering challenges are: (1) creating a unified Node script that handles serial I/O + calibration + smoothing + gesture detection without becoming a tangled monolith, (2) designing energy-based activity gating that responds instantly to motion but doesn't false-trigger during device placement, and (3) tuning per-gesture sensitivity defaults and cooldown ranges for a good out-of-box experience.

**Primary recommendation:** Create a single `gesture-engine.js` that embeds the serial/calibration/smoothing functionality from serial-bridge.js (copy and adapt, do not import) plus gesture detection logic. Use the established `maxAPI.outlet()` + `route` pattern from serial-bridge.js for all output. Build the MAX patch with minimal sensor UI (port selector + connect button only) and one visual row per gesture type (toggle + sensitivity dial + cooldown dial + fire LED).

<user_constraints>
## User Constraints (from CONTEXT.md)

### Locked Decisions
- imu-gesture.maxpat is fully self-contained -- owns its serial/wifi connection, calibration, smoothing, and gesture detection
- Either/or usage model: user runs imu-sensor.maxpat (raw data) OR imu-gesture.maxpat (data + gestures), not both
- imu-gesture outputs everything imu-sensor does (smoothed accel/gyro/orientation) PLUS gesture events -- it's a superset
- Minimal sensor UI in imu-gesture: just port selector and connect button -- focus is on gesture controls, sensor config uses sensible defaults
- One row per gesture type (7 rows: shake, tap, flip, tilt-left, tilt-right, tilt-forward, tilt-back)
- Each row has: enable/disable toggle + sensitivity dial + fire LED indicator + cooldown dial
- No master enable/disable toggle -- per-gesture toggles only
- Sensitivity and cooldown dial positions persist when patch is saved and reopened (stored in patcher)
- Single outlet for gesture events with named messages (e.g., "shake", "tap", "tilt-left") -- downstream uses `route` to split
- Separate status outlet for engine state (active/idle) and diagnostics -- outlet 1 = gestures, outlet 2 = status
- Sensor data outlets also present (superset of imu-sensor outlets)
- All matching gestures fire independently -- no priority system, no mutual exclusion
- Per-gesture-type cooldown ranges (shake/tap may need shorter ranges than flip/tilt)
- Occasional false trigger when setting device down is acceptable -- prioritize responsiveness over zero false positives
- Sensitivity is user-controllable per gesture via dials -- defaults are Claude's discretion
- Instant wake -- first frame of significant motion enables detection immediately
- ~500ms idle timeout before returning to idle state (natural pauses don't reset detection)
- Activity threshold fixed internally -- not user-adjustable

### Claude's Discretion
- Node architecture: single unified script vs reusing serial-bridge.js internals
- Gesture name convention for route messages
- Whether gesture messages include intensity metadata or are bang-only
- Activity gate visibility (LED in patch or internal-only)
- Default sensitivity and cooldown values per gesture type
- Exact cooldown dial ranges per gesture type

### Deferred Ideas (OUT OF SCOPE)
None -- discussion stayed within phase scope
</user_constraints>

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| CORE-01 | Gesture engine runs as separate node.script (gesture-engine.js) without modifying serial-bridge.js | Confirmed: gesture-engine.js is a fully self-contained script that handles its own serial I/O, calibration, smoothing, AND gesture detection. It does not modify serial-bridge.js -- it replaces it for users who want gestures. The serial/calibration/smoothing code is copied and adapted, not imported. |
| CORE-02 | Gesture engine receives smoothed sensor data from imu-sensor.maxpat outlets via MAX patch cables | **OVERRIDDEN by CONTEXT.md**: User decided imu-gesture is self-contained with its own serial connection. gesture-engine.js reads directly from serial port / UDP, not from imu-sensor outlets. The "receives smoothed data" part is satisfied internally -- gesture-engine.js performs its own smoothing and feeds its own detectors. |
| CORE-03 | Energy-based activity detection gates all gesture recognition (idle vs motion states) | Research finding: acceleration magnitude threshold (`sqrt(ax^2+ay^2+az^2)`) compared against gravity baseline (1.0g) detects motion vs stationary. Instant wake on first significant frame, ~500ms idle timeout with hysteresis. |
| CORE-04 | Sliding window buffer maintains recent sensor history for pattern matching | Research finding: circular buffer of calibrated (pre-smoothing) sensor frames, ~0.5-1.0 seconds of history (57-114 frames at 114 Hz). Used by shake detector (needs sustained magnitude) and tap detector (needs spike + decay pattern). |
| GEST-01 | User can detect shake gesture with configurable threshold | Research finding: acceleration magnitude exceeding threshold (default ~2.0g) for minimum sustained duration (~3 consecutive samples). Sensitivity dial scales the threshold. Cooldown default ~300ms. |
| GEST-02 | User can detect tap gesture with configurable threshold | Research finding: high-pass filtered acceleration spike detection -- sharp magnitude spike exceeding threshold followed by rapid decay. Sensitivity dial scales spike threshold. Cooldown default ~200ms. |
| GEST-03 | User can detect flip gesture (180-degree inversion) | Research finding: Z-axis accelerometer sign change from positive to negative (or vice versa) sustained for ~10 samples. Detects when device rotates 180 degrees around X or Y axis. Sensitivity dial adjusts the angle threshold away from pure 180. Cooldown default ~800ms. |
| GEST-04 | User can detect tilt-left with configurable angle threshold | Research finding: roll angle exceeding negative threshold (default -30 degrees). Orientation data from Madgwick filter provides pre-computed roll. Sensitivity dial scales the angle threshold. Cooldown default ~400ms. |
| GEST-05 | User can detect tilt-right with configurable angle threshold | Research finding: roll angle exceeding positive threshold (default +30 degrees). Mirror of GEST-04. |
| GEST-06 | User can detect tilt-forward with configurable angle threshold | Research finding: pitch angle exceeding negative threshold (default -30 degrees). Uses pitch from orientation data. Cooldown default ~400ms. |
| GEST-07 | User can detect tilt-back with configurable angle threshold | Research finding: pitch angle exceeding positive threshold (default +30 degrees). Mirror of GEST-06. |
| GEST-08 | User can enable/disable individual predefined gestures | Research finding: per-gesture boolean flag checked before detector runs. Toggled via MAX `toggle` object, stored as patcher attribute for persistence. |
| GEST-09 | All predefined gestures output as named bang events with debounce | Research finding: `maxAPI.outlet("gesture", "shake")` pattern. Per-gesture cooldown timer prevents re-triggering. Named messages enable downstream `route shake tap flip tilt-left tilt-right tilt-forward tilt-back`. |
| IMPL-01 | imu-gesture.maxpat wraps gesture-engine.js with clean inlet/outlet interface | Research finding: MAX abstraction containing `node.script gesture-engine.js @autostart 1`, route object splitting outlet tags, per-gesture UI rows, and outlet objects for gesture events + status + sensor data. |
</phase_requirements>

## Standard Stack

### Core

| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| max-api | (bundled with Node for Max) | Bidirectional communication between JS and MAX patcher | Required for node.script. Already used by serial-bridge.js. |
| serialport | ^12.0.0 | USB serial port communication with Arduino | Already installed in node/. Same version as serial-bridge.js. |
| @serialport/parser-readline | (included with serialport) | Line-delimited serial data parsing | Already used by serial-bridge.js. |
| dgram | (Node built-in) | UDP socket for WiFi transport | Already used by serial-bridge.js. No install needed. |

### Supporting

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| fs | (Node built-in) | File I/O for future gesture template persistence | Phase 8 (DTW), not needed in Phase 7 |

### Alternatives Considered

| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| Copying serial-bridge.js code | Importing serial-bridge.js as module | Import would create coupling. Copy-and-adapt keeps gesture-engine.js fully independent. serial-bridge.js was never designed as a library -- it auto-starts scanning on load. Importing it would launch a second serial connection. |
| Single unified gesture-engine.js | Separate gesture-detector.js + shared serial module | Over-engineering for Phase 7. A single file with clear sections is simpler. Can refactor later if needed. |
| Per-gesture cooldown in Node | Per-gesture cooldown in MAX (using `delay` objects) | Node-side cooldown is simpler -- one timer per gesture type, no MAX object overhead. Keeps gesture logic centralized in JS. |

**Installation:**
```bash
# No new npm packages needed. gesture-engine.js uses the same dependencies
# already installed in node/node_modules/ (serialport, max-api).
# gesture-engine.js should be placed in max/ directory alongside imu-gesture.maxpat.
# It will reference node_modules from the node/ directory via Node's module resolution
# OR the max/ directory needs its own package.json with serialport dependency.
```

**Important note on file placement:** The existing project has `serial-bridge.js` in both `node/` (canonical, with normalization) and `max/` (older copy). The `max/imu-sensor.maxpat` references `serial-bridge.js` via `node.script serial-bridge.js @autostart 1` which resolves relative to the patcher file location. For `gesture-engine.js`, the simplest approach is:
- Place `gesture-engine.js` in `max/` alongside `imu-gesture.maxpat`
- Copy `node_modules/` and `package.json` to `max/` (or ensure Node for Max resolves the `node/` directory). The existing `max/serial-bridge.js` already works with the serialport module, so the module resolution is already functional from the `max/` directory.

## Architecture Patterns

### Recommended Project Structure
```
max/
  imu-sensor.maxpat       # EXISTING - unchanged
  imu-gesture.maxpat      # NEW - self-contained gesture abstraction
  serial-bridge.js        # EXISTING - used by imu-sensor.maxpat
  gesture-engine.js       # NEW - serial I/O + calibration + smoothing + gesture detection
node/
  serial-bridge.js        # EXISTING (canonical copy) - unchanged
  package.json            # EXISTING - serialport dependency
  node_modules/           # EXISTING - serialport installed here
```

### Pattern 1: Self-Contained Node Script with Embedded Serial I/O
**What:** gesture-engine.js includes serial port management, CSV validation, calibration, smoothing, AND gesture detection as a single cohesive script. The serial/calibration/smoothing code is adapted from serial-bridge.js (not imported).
**When to use:** When the script must be fully independent and cannot depend on another node.script's output.

```javascript
// gesture-engine.js structure (conceptual)
const maxAPI = require("max-api");
const { SerialPort } = require("serialport");
const { ReadlineParser } = require("@serialport/parser-readline");
var dgram = require("dgram");

// ---- Configuration ----
const BAUD_RATE = 57600;
const EXPECTED_FIELDS = 9;

// ---- Serial/WiFi State (adapted from serial-bridge.js) ----
// ... port, parser, reconnectTimer, udpSocket ...

// ---- Calibration State (adapted from serial-bridge.js) ----
// ... biasOffsets, orientOffset, blendFactor ...
// NOTE: auto-calibrate with sensible defaults -- no user UI for cal settings

// ---- Smoothing State (adapted from serial-bridge.js) ----
// ... smoothFactors with fixed sensible defaults ...
// NOTE: no per-axis smoothing dials -- use moderate defaults

// ---- Gesture Detection State ----
var activityState = "idle";  // "idle" or "active"
var idleTimer = null;
var IDLE_TIMEOUT_MS = 500;
var ACTIVITY_THRESHOLD = 0.15;  // g above/below 1.0g baseline

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
var lastFireTime = {}; // per-gesture last fire timestamp

// ---- Sliding Window Buffer (CORE-04) ----
var BUFFER_SIZE = 64;  // ~0.56s at 114 Hz
var sensorBuffer = [];  // circular buffer of {ax,ay,az,gx,gy,gz,pitch,roll,yaw}

// ---- Data Processing Pipeline ----
function processFrame(values) {
  // 1. Apply calibration (bias offsets + orient reset)
  // 2. Apply smoothing (EMA with fixed defaults)
  // 3. Output smoothed sensor data (superset of imu-sensor)
  // 4. Push calibrated (pre-smoothing) frame to sliding window buffer
  // 5. Check activity gate
  // 6. If active, run all enabled gesture detectors
}

// ---- Activity Gate (CORE-03) ----
function checkActivity(calFrame) {
  var magnitude = Math.sqrt(
    calFrame.ax * calFrame.ax +
    calFrame.ay * calFrame.ay +
    calFrame.az * calFrame.az
  );
  var deviation = Math.abs(magnitude - 1.0);  // deviation from 1g

  if (deviation > ACTIVITY_THRESHOLD) {
    if (activityState === "idle") {
      activityState = "active";
      maxAPI.outlet("engine_status", "active");
    }
    // Reset idle timer on every active frame
    if (idleTimer) { clearTimeout(idleTimer); idleTimer = null; }
  } else if (activityState === "active" && !idleTimer) {
    idleTimer = setTimeout(function() {
      activityState = "idle";
      maxAPI.outlet("engine_status", "idle");
      idleTimer = null;
    }, IDLE_TIMEOUT_MS);
  }
}

// ---- Gesture Detectors ----
function detectShake(buffer) { /* magnitude sustained above threshold */ }
function detectTap(buffer) { /* spike + rapid decay in accel magnitude */ }
function detectFlip(calFrame) { /* Z-axis sign change sustained */ }
function detectTiltLeft(calFrame) { /* roll < -threshold */ }
// ... etc.

// ---- Fire Gesture Event ----
function fireGesture(name) {
  var now = Date.now();
  if (!gestureEnabled[name]) return;
  if (lastFireTime[name] && (now - lastFireTime[name]) < gestureCooldown[name]) return;
  lastFireTime[name] = now;
  maxAPI.outlet("gesture", name);
}
```

### Pattern 2: Tagged Outlet Routing (Established Pattern)
**What:** All output from node.script goes through a single left outlet with tagged messages. MAX `route` object splits them to different destinations.
**When to use:** Always -- this is how Node for Max works. node.script has exactly one data outlet (left) and one lifecycle outlet (right).

```javascript
// In gesture-engine.js:
maxAPI.outlet("gesture", "shake");              // -> route gesture -> outlet 0
maxAPI.outlet("engine_status", "active");       // -> route engine_status -> outlet 1
maxAPI.outlet("smooth_accel", sax, say, saz);   // -> route smooth_accel -> outlet 2+
maxAPI.outlet("status", "connected-usb");       // -> route status -> outlet N
```

```
// In imu-gesture.maxpat:
[node.script gesture-engine.js @autostart 1]
    |
    v
[route gesture engine_status smooth_accel smooth_gyro smooth_orientation status ...]
    |           |              |              |              |              |
    v           v              v              v              v              v
[outlet 0]  [outlet 1]    [outlet 2]     [outlet 3]     [outlet 4]    [outlet 5]
 gestures    status      smooth accel   smooth gyro   smooth orient   conn status
```

### Pattern 3: Per-Gesture Enable/Sensitivity/Cooldown via MAX Handlers
**What:** Each gesture has three MAX message handlers that the patch UI controls. Values persist in the patch because the UI objects (toggle, dial) store their state.
**When to use:** For all 7 gesture types.

```javascript
// In gesture-engine.js -- handler pattern (repeat for each gesture type):
maxAPI.addHandler("gesture_enable", function(name, val) {
  gestureEnabled[name] = (val === 1);
});

maxAPI.addHandler("gesture_sensitivity", function(name, val) {
  gestureSensitivity[name] = val;  // 0.0 to 1.0 from dial
});

maxAPI.addHandler("gesture_cooldown", function(name, val) {
  gestureCooldown[name] = val;  // milliseconds from dial
});
```

```
// In imu-gesture.maxpat -- per-gesture row:
[toggle]  -->  [prepend gesture_enable shake]  -->  [node.script]
[dial 0-1] --> [prepend gesture_sensitivity shake] --> [node.script]
[dial ms]  --> [prepend gesture_cooldown shake] --> [node.script]
```

### Pattern 4: Circular Buffer for Sensor History
**What:** Fixed-size array used as a ring buffer for recent sensor frames. Detectors that need temporal context (shake duration, tap spike pattern) read from this buffer.
**When to use:** CORE-04 requirement. Shake needs 3+ consecutive high-magnitude samples. Tap needs spike detection with decay window.

```javascript
var BUFFER_SIZE = 64;
var buffer = new Array(BUFFER_SIZE);
var bufferIndex = 0;
var bufferCount = 0;

function pushFrame(frame) {
  buffer[bufferIndex] = frame;
  bufferIndex = (bufferIndex + 1) % BUFFER_SIZE;
  if (bufferCount < BUFFER_SIZE) bufferCount++;
}

function getFrame(samplesAgo) {
  // Get frame from N samples ago (0 = most recent)
  if (samplesAgo >= bufferCount) return null;
  var idx = (bufferIndex - 1 - samplesAgo + BUFFER_SIZE) % BUFFER_SIZE;
  return buffer[idx];
}
```

### Anti-Patterns to Avoid
- **Importing serial-bridge.js:** It auto-starts scanning on `require()`. Would open a second serial connection competing with the existing one. Copy the relevant code instead.
- **Running two node.script instances for the same serial port:** Each `node.script` is a separate OS process. Only one can own the serial port. Since imu-gesture is either/or with imu-sensor, this is handled by the usage model -- but it must be documented clearly.
- **Using global `send`/`receive` for data flow:** Creates hidden coupling between patches. Use explicit patch cable connections and outlets only.
- **Smoothing gesture input data with high EMA:** Gesture detectors need sharp transients (taps, shakes). Heavy smoothing kills the signal. Use calibrated (pre-smoothing) data for gesture detection, smoothed data for output outlets.
- **Single global cooldown:** Different gestures need different cooldown periods. A tap cooldown of 200ms would prevent detecting rapid shakes; a shake cooldown of 800ms would miss consecutive taps.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Serial port management | Custom serial handling | Copy serial-bridge.js patterns (SerialPort + ReadlineParser) | Battle-tested at 57600 baud / 114 Hz for months. Known edge cases handled (reconnect, cleanup). |
| CSV validation | New parser | Copy `validateLine()` from serial-bridge.js | Handles STARTUP/ERROR headers, field count, NaN checks. Proven stable. |
| Calibration math | Novel calibration approach | Copy `startCalibration/collectSample/stopCalibrationAndApply/applyCal` from serial-bridge.js | Bias offset math is physics -- same algorithm applies. Auto-trigger on connect with sensible defaults. |
| EMA smoothing | Different smoothing algorithm | Copy `computeAlpha/applySmoothing` from serial-bridge.js | Three-tier EMA is proven. For gesture-engine, use fixed moderate defaults (no user dials). |
| Orientation reset | Custom orient math | Copy `resetOrientation/applyOrientReset` from serial-bridge.js | Blend transition math handles edge cases. |

**Key insight:** The serial I/O, validation, calibration, and smoothing code in serial-bridge.js has been debugged and refined across 6 phases. Copying it into gesture-engine.js (and simplifying where the gesture-engine doesn't need full configurability) is far safer than rewriting from scratch.

## Common Pitfalls

### Pitfall 1: Serial Port Contention Between imu-sensor and imu-gesture
**What goes wrong:** User accidentally opens both imu-sensor.maxpat and imu-gesture.maxpat. Both patches try to open the same serial port. One fails silently or both get corrupted data.
**Why it happens:** Both patches auto-start their node.script which auto-scans for Arduino. Only one process can own a serial port.
**How to avoid:** Document the either/or usage model prominently. Consider adding a warning in gesture-engine.js that posts to the MAX console: "[gesture-engine] WARNING: ensure imu-sensor.maxpat is not also running." Could also check if port is already in use and display a clear error.
**Warning signs:** "Port access denied" errors, data arriving in wrong patch, garbled data.

### Pitfall 2: Gesture Detection on Smoothed Data Kills Transients
**What goes wrong:** Feeding heavily-smoothed sensor data to gesture detectors causes missed taps and delayed shake detection. EMA smoothing flattens the sharp acceleration spikes that define tap and shake gestures.
**Why it happens:** Developer routes the same smoothed output to both downstream outlets and gesture detectors.
**How to avoid:** Feed gesture detectors with calibrated (post-bias-offset, pre-smoothing) data. Feed sensor output outlets with smoothed data. This is a deliberate split in the data pipeline. The prior v1.1 research explicitly noted: "Predefined gesture detectors receive cal (pre-smoothing) data."
**Warning signs:** Tap detection requires very hard impacts. Shake detection has noticeable delay. Reducing smoothing "fixes" gesture detection but makes sensor output noisy.

### Pitfall 3: Tilt Gesture Fires on Every Frame While Tilted
**What goes wrong:** Tilt detection fires continuously as long as the angle exceeds threshold, sending hundreds of gesture events per second.
**Why it happens:** Tilt detection checks "is angle > threshold" on every frame without state tracking. Unlike shake/tap (which are events), tilt is a continuous state.
**How to avoid:** Implement tilt as a state-change detector: fire on transition from "not tilted" to "tilted", then enter cooldown. Require return to neutral before re-arming. A hysteresis zone (e.g., trigger at 30 degrees, re-arm at 20 degrees) prevents jitter at the threshold boundary.
**Warning signs:** MAX console flooding with tilt events. Downstream `route` object overwhelmed. CPU spike from processing hundreds of bangs per second.

### Pitfall 4: Auto-Calibration Timing Race
**What goes wrong:** gesture-engine.js starts calibration before Arduino data is flowing, collecting zero samples and applying null offsets.
**Why it happens:** Auto-calibration starts immediately on connection, but serial port "open" event fires before first data arrives.
**How to avoid:** Wait for first valid CSV line before starting calibration. Use the established pattern from imu-sensor.maxpat: 500ms `deferlow` delay after status=connected before sending calibrate_start. In gesture-engine.js, this can be a simple `setTimeout` after the first valid data frame.
**Warning signs:** Calibration reports "too_few_samples". Bias offsets are all zeros. Orientation never resets.

### Pitfall 5: Dial Persistence Requires `@save 1` in MAX
**What goes wrong:** User adjusts sensitivity and cooldown dials, saves the patch, reopens it -- dials reset to defaults.
**Why it happens:** MAX `dial` objects don't save their value by default. You must set `@save 1` or use `pattr` system.
**How to avoid:** Use `@save 1` on all dials and toggles in the gesture rows. Alternative: use `autopattr` to capture all named UI objects. The `@save 1` approach is simpler and was used successfully in the imu-sensor.maxpat smoothing dials.
**Warning signs:** Users report "my settings don't stick" after reopening the patch.

### Pitfall 6: Activity Gate Blocks First Gesture Frame
**What goes wrong:** Activity detection requires N frames above threshold before transitioning to "active" state. The first frame of a tap gesture IS the only high-magnitude frame -- by the time activity gate opens, the tap is already over.
**Why it happens:** Designing activity gate as a debounced state machine with minimum duration requirement.
**How to avoid:** Per the user decision: "instant wake -- first frame of significant motion enables detection immediately." The activity gate must transition on a SINGLE frame exceeding threshold. The ~500ms timeout only applies to the return to idle. This means the gate is asymmetric: instant on, delayed off.
**Warning signs:** First gesture after stillness is always missed. Users must "pre-shake" the device before performing gestures.

## Code Examples

Verified patterns from the existing codebase and gesture detection literature:

### Shake Detection Algorithm
```javascript
// Source: NXP AN4071, adapted for Node for Max + project sensor ranges
// Shake = sustained high acceleration magnitude over multiple consecutive samples

var shakeConsecutiveCount = 0;
var SHAKE_MIN_CONSECUTIVE = 3;  // must exceed threshold for 3+ frames (~26ms)

function detectShake(calFrame) {
  if (!gestureEnabled.shake) return;

  var mag = Math.sqrt(
    calFrame.ax * calFrame.ax +
    calFrame.ay * calFrame.ay +
    calFrame.az * calFrame.az
  );

  // Sensitivity maps dial (0-1) to threshold range
  // 0.0 = very sensitive (1.5g), 1.0 = very insensitive (4.0g)
  // Default 0.5 = 2.0g threshold
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
```

### Tap Detection Algorithm
```javascript
// Source: NXP AN3919 tap detection, adapted for software implementation
// Tap = sharp spike in acceleration followed by rapid decay
// Uses high-pass-like approach: compare current magnitude to recent average

var recentMagSum = 0;
var recentMagCount = 0;
var TAP_WINDOW = 10;  // frames for running average (~88ms)

function detectTap(calFrame, buffer, bufferCount) {
  if (!gestureEnabled.tap) return;

  var mag = Math.sqrt(
    calFrame.ax * calFrame.ax +
    calFrame.ay * calFrame.ay +
    calFrame.az * calFrame.az
  );

  // Compute running average magnitude from buffer
  var avgMag = 1.0;  // default to 1g if buffer not full
  if (bufferCount >= TAP_WINDOW) {
    var sum = 0;
    for (var i = 1; i <= TAP_WINDOW; i++) {
      var f = getFrame(i);
      if (f) sum += Math.sqrt(f.ax*f.ax + f.ay*f.ay + f.az*f.az);
    }
    avgMag = sum / TAP_WINDOW;
  }

  // Spike detection: current magnitude exceeds average by threshold
  // Sensitivity maps dial (0-1) to spike threshold range
  // 0.0 = very sensitive (1.5g spike), 1.0 = very insensitive (5.0g spike)
  // Default 0.5 = 2.5g above average
  var spikeThreshold = 1.5 + gestureSensitivity.tap * 3.5;
  var delta = mag - avgMag;

  if (delta > spikeThreshold) {
    fireGesture("tap");
  }
}
```

### Flip Detection Algorithm
```javascript
// Source: Analog Devices AN-1057 (accelerometer inclination sensing)
// Flip = Z-axis accelerometer transitions from positive to negative (or vice versa)
// sustained for enough frames to confirm it's not just a fast rotation

var flipState = "neutral";  // "neutral", "confirming"
var flipConfirmCount = 0;
var FLIP_CONFIRM_FRAMES = 10;  // ~88ms sustained inverted
var lastZSign = 0;  // 1 = upright, -1 = inverted, 0 = unknown

function detectFlip(calFrame) {
  if (!gestureEnabled.flip) return;

  var currentZSign = calFrame.az > 0 ? 1 : -1;

  // Sensitivity adjusts how far from vertical counts as "flipped"
  // 0.0 = sensitive (|az| > 0.3g counts), 1.0 = insensitive (|az| > 0.8g)
  // Default 0.5 = |az| > 0.5g
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
```

### Tilt Detection Algorithm (4 directions)
```javascript
// Source: NXP AN3461 (tilt sensing using three-axis accelerometer)
// Tilt = orientation angle exceeds threshold, fire on state CHANGE only
// Uses Madgwick-computed pitch/roll from Arduino (already in sensor data)

var tiltArmed = {
  "tilt-left": true, "tilt-right": true,
  "tilt-forward": true, "tilt-back": true
};

function detectTilts(smoothedOrient) {
  // Uses smoothed orientation for stable tilt detection
  // (unlike shake/tap which use calibrated pre-smoothing data)
  var pitch = smoothedOrient.pitch;
  var roll = smoothedOrient.roll;

  // Sensitivity maps dial (0-1) to angle threshold
  // 0.0 = very sensitive (15 degrees), 1.0 = very insensitive (60 degrees)
  // Default 0.5 = 30 degrees
  function angleThreshold(name) {
    return 15 + gestureSensitivity[name] * 45;
  }
  // Hysteresis re-arm zone = threshold * 0.6
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
```

### Fire Gesture with Cooldown
```javascript
// Debounced gesture output -- prevents rapid re-triggering
function fireGesture(name) {
  var now = Date.now();
  if (lastFireTime[name] && (now - lastFireTime[name]) < gestureCooldown[name]) {
    return;  // still in cooldown
  }
  lastFireTime[name] = now;
  maxAPI.outlet("gesture", name);
  maxAPI.outlet("gesture_led", name, 1);  // light up LED in patch
  // Auto-clear LED after 100ms
  setTimeout(function() {
    maxAPI.outlet("gesture_led", name, 0);
  }, 100);
}
```

### Outlet Design for imu-gesture.maxpat
```javascript
// gesture-engine.js outlet tags (downstream route object splits these):

// Gesture events (outlet 0 in maxpat)
maxAPI.outlet("gesture", "shake");           // named gesture event
maxAPI.outlet("gesture", "tap");
maxAPI.outlet("gesture", "tilt-left");       // etc.

// Gesture LED feedback (internal to patch, drives LED indicators)
maxAPI.outlet("gesture_led", "shake", 1);    // 1=on, 0=off

// Engine status (outlet 1 in maxpat)
maxAPI.outlet("engine_status", "active");    // activity gate state
maxAPI.outlet("engine_status", "idle");

// Sensor data (outlets 2-7+ in maxpat, superset of imu-sensor)
maxAPI.outlet("status", "connected-usb");
maxAPI.outlet("smooth_accel", sax, say, saz);
maxAPI.outlet("smooth_gyro", sgx, sgy, sgz);
maxAPI.outlet("smooth_orientation", sp, sr, sy);
maxAPI.outlet("cal_accel", cal.ax, cal.ay, cal.az);
maxAPI.outlet("cal_gyro", cal.gx, cal.gy, cal.gz);
maxAPI.outlet("cal_orientation", orient.pitch, orient.roll, orient.yaw);

// Calibration status (same tags as serial-bridge.js for compatibility)
maxAPI.outlet("cal_status", "applied");
```

## State of the Art

| Old Approach (v1.1 Research) | Current Approach (Phase 7 CONTEXT.md) | When Changed | Impact |
|------------------------------|---------------------------------------|--------------|--------|
| imu-gesture sits downstream of imu-sensor, receives data via patch cables | imu-gesture is fully self-contained, owns its own serial connection | 2026-02-22 (CONTEXT.md) | gesture-engine.js must include serial I/O, calibration, and smoothing code. No dependency on imu-sensor.maxpat. |
| gesture-engine.js is pure gesture detection (~500 lines) | gesture-engine.js is serial I/O + calibration + smoothing + gesture detection (~800-1000 lines) | 2026-02-22 (CONTEXT.md) | Larger script, but fully independent. Code reuse from serial-bridge.js via copy-and-adapt. |
| CORE-02: receives data from imu-sensor outlets | CORE-02 satisfied internally: gesture-engine.js smooths its own data | 2026-02-22 (CONTEXT.md) | No inter-patch data routing needed. Simpler user experience (drop one patch, connect Arduino, done). |
| Predefined gestures use cal (pre-smoothing) data | Still true -- gesture detectors receive calibrated pre-smoothing data internally | Unchanged | Internal data routing within gesture-engine.js splits the pipeline after calibration. |

**Deprecated/outdated from prior research:**
- **Downstream patch cable architecture:** The original v1.1 ARCHITECTURE.md assumed imu-gesture receives data from imu-sensor's outlets 7-9. This is superseded by the user's CONTEXT.md decision. imu-gesture is now standalone.
- **CORE-02 as originally written:** "Gesture engine receives smoothed sensor data from imu-sensor.maxpat outlets via MAX patch cables" -- this specific data flow is overridden. The requirement is still met in spirit (gesture engine processes smoothed data) but the mechanism is internal, not external.

## Open Questions

1. **Node module resolution from max/ directory**
   - What we know: `max/serial-bridge.js` already works with `require("serialport")`, meaning `node_modules/` is resolvable from the `max/` directory. The existing `max/serial-bridge.js` is an older copy that functions correctly.
   - What's unclear: Whether gesture-engine.js in `max/` will resolve `node_modules/` from `node/` via Node's upward resolution, or whether we need `node_modules/` (or a symlink) in `max/` as well. The existing `max/serial-bridge.js` file suggests this already works.
   - Recommendation: Test during implementation. If module resolution fails, add `package.json` to `max/` or symlink `node_modules/`.

2. **Gesture name convention for route messages**
   - What we know: Names need to be valid MAX symbols for `route`. Hyphenated names (`tilt-left`) work as MAX symbols. Alternative: underscore (`tilt_left`) or camelCase (`tiltLeft`).
   - Recommendation: Use hyphenated lowercase (`shake`, `tap`, `flip`, `tilt-left`, `tilt-right`, `tilt-forward`, `tilt-back`). This is human-readable and consistent with existing outlet tags like `cal_accel`. Hyphens are valid MAX route arguments.

3. **Gesture messages: bang-only vs. intensity metadata**
   - What we know: User wants "bang events" per GEST-09. Including intensity (e.g., shake strength) adds information but complicates downstream routing.
   - Recommendation: Bang-only for Phase 7 (send gesture name as symbol, downstream uses `route` + `bang`). If intensity is desired later, add a separate outlet tag like `gesture_intensity`. Keep it simple for v1.1.

4. **Activity gate LED visibility in patch**
   - What we know: User left this to Claude's discretion. An activity LED provides useful feedback during setup but takes patch space.
   - Recommendation: Include a small activity LED in the patch header (near the connect button). Driven by `engine_status` outlet. Low visual footprint, high diagnostic value.

5. **Default sensitivity and cooldown values**
   - What we know: Must be "good enough" out of the box. Can only be validated with physical hardware.
   - Recommendation: Start with moderate defaults (sensitivity 0.5 = middle of range for all gestures). Cooldowns: shake 300ms, tap 200ms, flip 800ms, tilts 400ms. These can be tuned during implementation testing.
   - Confidence: LOW -- defaults will need hardware validation and likely adjustment.

6. **Smoothing defaults for gesture-engine.js**
   - What we know: imu-sensor has 13 configurable smoothing dials. gesture-engine uses fixed defaults (minimal sensor UI).
   - Recommendation: Global smooth factor 0.3 (light smoothing). This provides clean output data while preserving transients for gesture detection. The gesture detectors read from the pre-smoothing pipeline, so smoothing level doesn't affect detection sensitivity.

## Sources

### Primary (HIGH confidence)
- serial-bridge.js (existing codebase) -- serial I/O, calibration, smoothing, maxAPI.outlet patterns
- imu-sensor.maxpat (existing codebase) -- patch structure, outlet layout, route pattern, node.script configuration
- imu_firmware.ino (existing codebase) -- 9-value CSV format, sensor ranges (16g accel, 2000 dps gyro), 114 Hz sample rate
- [Node for Max API](https://docs.cycling74.com/max8/vignettes/07_n4m_maxapi) -- outlet/handler API, single outlet routing
- [Node for Max Anatomy](https://docs.cycling74.com/max8/vignettes/01_n4m_anatomy) -- node.script architecture, route pattern for output handling
- [node.script Reference](https://docs.cycling74.com/max8/refpages/node.script) -- @autostart, @defer, @watch attributes

### Secondary (MEDIUM confidence)
- [NXP AN4071](https://www.nxp.com/docs/en/application-note/AN4071.pdf) -- High-pass filtered transient detection for tap/shock events, threshold parameters, debounce timing
- [NXP AN3919](https://www.nxp.com/docs/en/application-note/AN3919.pdf) -- Single/double tap detection parameters: pulse threshold, time window, latency, directional detection
- [NXP AN3461](https://www.nxp.com/docs/en/application-note/AN3461.pdf) -- Tilt sensing using three-axis accelerometer, pitch/roll angle computation, four-direction detection
- [Analog Devices AN-1057](https://www.analog.com/en/resources/app-notes/an-1057.html) -- Accelerometer inclination sensing, Z-axis sign change for flip detection
- [Shake Detection Tutorial](https://slicker.me/javascript/shake/shake.htm) -- Acceleration magnitude formula, threshold 15m/s2 (~1.5g), 1000ms debounce
- [Detection of (In)activity Periods in Human Body Motion](https://pmc.ncbi.nlm.nih.gov/articles/PMC3386712/) -- Variance-based motion/stationary classification, acceleration magnitude deviation thresholds

### Tertiary (LOW confidence)
- Default sensitivity and cooldown values -- based on literature ranges but require hardware validation
- Performance estimates for gesture-engine.js processing budget -- extrapolated from serial-bridge.js experience at 114 Hz

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH -- same dependencies as serial-bridge.js, no new npm packages needed
- Architecture: HIGH -- self-contained pattern is well-understood, copy-and-adapt from proven code
- Gesture algorithms: MEDIUM-HIGH -- threshold-based detection is well-documented in NXP/ADI app notes and literature, but specific parameter values need hardware tuning
- Pitfalls: HIGH -- informed by 6 phases of project experience + prior v1.1 research

**Research date:** 2026-02-22
**Valid until:** 2026-03-22 (stable domain, no rapidly changing dependencies)

---
*Phase: 07-core-engine-and-predefined-gestures*
*Research completed: 2026-02-22*
