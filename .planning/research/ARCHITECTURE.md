# Architecture Research: v1.1 Gesture Recognition & Mapping

**Domain:** Gesture recognition, DTW, and position interpolation for IMU sensor pipeline
**Researched:** 2026-02-22
**Confidence:** MEDIUM-HIGH

## Existing System Summary

The v1.0 pipeline is fully shipped and stable:

```
Arduino (LSM6DS3 @ 114Hz) --> USB Serial 57600 --> serial-bridge.js (Node for Max)
                                                        |
                                          maxAPI.outlet() tagged messages
                                                        |
                                                        v
                                              imu-sensor.maxpat (abstraction)
                                              16 outlets, 1 control inlet
                                                        |
                                                        v
                                              Consumer patches
```

**Current outlet tags from serial-bridge.js:**
`accel`, `gyro`, `orientation`, `status`, `cal_accel`, `cal_gyro`, `cal_orientation`, `cal_status`, `cal_progress`, `cal_bias`, `cal_toggle`, `smooth_accel`, `smooth_gyro`, `smooth_orientation`, `norm_accel`, `norm_gyro`, `norm_orientation`, `norm_status`, `ready`

**Current imu-sensor.maxpat outlets (16 total):**
0: status | 1: raw accel | 2: raw gyro | 3: raw orient | 4: cal accel | 5: cal gyro | 6: cal orient | 7: smooth accel | 8: smooth gyro | 9: smooth orient | 10: mapped | 11: quaternion | 12: threshold triggers | 13: norm accel | 14: norm gyro | 15: norm orient

**Key constraint:** serial-bridge.js must NOT be modified. The new gesture recognition Node script is a separate `node.script` instance.

---

## v1.1 Architecture: New Components

### System Overview with Gesture Layer

```
                         EXISTING (UNCHANGED)
                    ============================
Arduino --> serial-bridge.js --> imu-sensor.maxpat (16 outlets)
                                       |
                                       | smooth_accel, smooth_gyro, smooth_orientation
                                       v
                    ============================
                         NEW COMPONENTS
                    ============================

    +-----------------------------------------------------------------+
    |                                                                   |
    v                                                                   v
[gesture-engine.js]                                    [Pure MAX/MSP Implementation]
(separate node.script)                                 (ml.dtw or native objects)
    |                                                         |
    | maxAPI.outlet()                                         |
    v                                                         v
[imu-gesture.maxpat]                                  [imu-gesture-max.maxpat]
(gesture abstraction)                                 (pure MAX version)
    |                                                         |
    +-------------------+-----------------------+             |
    |                   |                       |             |
    v                   v                       v             |
[predefined          [custom DTW             [position       |
 gesture bangs]       gesture bangs           interp 0-1]    |
                      + confidence]                          |
                                                              |
    +---------------------------------------------------------+
    |
    v
[imu-gesture-viz.maxpat]
(visualization companion)
```

### Component Inventory

| Component | Type | Status | Purpose |
|-----------|------|--------|---------|
| `serial-bridge.js` | Node for Max script | EXISTS - DO NOT MODIFY | Serial I/O, calibration, smoothing |
| `imu-sensor.maxpat` | MAX abstraction | EXISTS - minimal changes only | Main sensor abstraction (16 outlets) |
| **`gesture-engine.js`** | **Node for Max script (NEW)** | **BUILD** | Predefined gestures, DTW, position interpolation |
| **`imu-gesture.maxpat`** | **MAX abstraction (NEW)** | **BUILD** | Wraps gesture-engine.js, routes outputs |
| **`imu-gesture-max.maxpat`** | **MAX abstraction (NEW)** | **BUILD** | Pure MAX/MSP implementation (no Node) |
| **`imu-gesture-viz.maxpat`** | **MAX patch (NEW)** | **BUILD** | Motion trails, matching progress, position map |

---

## Critical Architecture Decision: Separate Script, Not Modification

**Decision:** gesture-engine.js is a NEW, INDEPENDENT `node.script` -- it does NOT modify serial-bridge.js.

### How gesture-engine.js Gets Sensor Data

The gesture engine does not read from the serial port. It receives sensor data forwarded from MAX via `maxAPI.addHandler()`. The imu-gesture.maxpat abstraction receives data from imu-sensor.maxpat's outlets and forwards it into gesture-engine.js.

```
imu-sensor.maxpat outlet (smooth_accel, smooth_gyro, smooth_orientation)
    |
    v
[prepend sensor_data]  (in imu-gesture.maxpat)
    |
    v
[node.script gesture-engine.js]
    |
    v
maxAPI.outlet("gesture", gesture_name)
maxAPI.outlet("dtw_match", gesture_name, confidence)
maxAPI.outlet("position", blend_value)
```

**Why this approach:**
- serial-bridge.js is battle-tested and stable -- touching it risks v1.0 regressions
- Each `node.script` runs in its own OS process -- no shared state corruption
- MAX objects (`send`/`receive` or patch cables) can bridge the two scripts naturally
- The gesture engine can be added/removed without affecting the core sensor pipeline
- Multiple gesture engines can run simultaneously (one per imu-gesture instance)

**Data bridging pattern:**

```
[imu-sensor]                       [imu-gesture]
     |                                  |
     | outlet 7: smooth_accel          | inlet
     | outlet 8: smooth_gyro           |
     | outlet 9: smooth_orient         |
     |                                  |
     +--- patch cable or send/receive --+
```

The user connects imu-sensor's smoothed outlets to imu-gesture's inlet. Inside imu-gesture, the data is forwarded to gesture-engine.js via `maxAPI.addHandler("sensor_data", ...)`.

### Confidence: HIGH
- Multiple `node.script` instances in one patch is supported -- each is an independent process (verified from Cycling74 docs)
- Data forwarding via MAX patch cables is the standard MAX pattern
- This mirrors how v1.0's imu-sensor-3dviz.maxpat already receives data from imu-sensor.maxpat

---

## Data Flow: Detailed

### Flow 1: Predefined Gesture Detection

```
Smoothed sensor data (9 values at 114Hz)
    |
    v
[gesture-engine.js: predefined detector]
    |
    |  1. Compute acceleration magnitude: sqrt(ax^2 + ay^2 + az^2)
    |  2. Maintain sliding window buffer (last ~200ms = ~23 samples)
    |  3. Check predefined patterns:
    |     - SHAKE: magnitude RMS > threshold for sustained period
    |     - FLIP:  az crosses from >0.8g to <-0.8g (or reverse)
    |     - TAP:   magnitude spike > threshold, then returns to baseline
    |     - CIRCLE: gyro yaw integral completes ~360 degrees within window
    |     - TILT_LEFT/RIGHT: roll crosses threshold
    |     - TILT_FORWARD/BACK: pitch crosses threshold
    |  4. Debounce: enforce minimum 300ms between triggers of same gesture
    |
    v
maxAPI.outlet("gesture", "shake")      // predefined gesture name as bang
maxAPI.outlet("gesture", "flip")
maxAPI.outlet("gesture", "tap")
maxAPI.outlet("gesture", "circle")
```

**Algorithm details for each predefined gesture:**

| Gesture | Primary Sensor | Detection Method | Parameters |
|---------|---------------|------------------|------------|
| shake | accel magnitude | RMS of magnitude > threshold over 200ms window | threshold: 2.5g, min_duration: 200ms |
| flip | az (accel Z) | Sign change with magnitude > 0.8g on both sides | hysteresis: 0.2g, debounce: 500ms |
| tap | accel magnitude | Spike > threshold followed by return to baseline within 100ms | threshold: 3.0g, decay_time: 100ms |
| double_tap | accel magnitude | Two taps within 400ms | tap_gap: 100-400ms |
| circle | gz (gyro Z) | Cumulative rotation > 300 degrees within 2s window | min_rotation: 300deg, max_time: 2s |
| tilt_left | roll | Roll crosses -30 degrees | threshold: -30deg, hysteresis: 5deg |
| tilt_right | roll | Roll crosses +30 degrees | threshold: +30deg, hysteresis: 5deg |
| tilt_forward | pitch | Pitch crosses +30 degrees | threshold: +30deg, hysteresis: 5deg |
| tilt_back | pitch | Pitch crosses -30 degrees | threshold: -30deg, hysteresis: 5deg |

All thresholds should be configurable from MAX via handler messages.

### Flow 2: Custom DTW Gesture Recognition

```
[MAX UI: "record_gesture mygesture"]
    |
    v
[gesture-engine.js: DTW recorder]
    |
    |  1. Start recording sensor frames into buffer
    |  2. On "stop_record": save buffer as template named "mygesture"
    |     - Template = array of [ax,ay,az,gx,gy,gz,pitch,roll,yaw] frames
    |     - Optionally trim leading/trailing stillness
    |  3. Store in gesture library (in-memory + JSON file for persistence)
    |
    v
[gesture-engine.js: DTW matcher (continuous)]
    |
    |  1. Maintain sliding window of recent frames (window = 2x longest template)
    |  2. Every N frames (e.g., every 5 = ~22Hz matching rate):
    |     a. For each registered template:
    |        - Compute DTW distance between window tail and template
    |        - Distance function: Euclidean across selected axes
    |        - Use Sakoe-Chiba band constraint (width = 20% of template length)
    |     b. If distance < recognition threshold for any template:
    |        - Fire match event
    |        - confidence = 1.0 - (distance / rejection_threshold)
    |        - Enter cooldown for that gesture (prevent re-triggering)
    |  3. Output match results
    |
    v
maxAPI.outlet("dtw_match", "mygesture", 0.87)   // name + confidence 0-1
maxAPI.outlet("dtw_status", "matching")          // status feedback
```

**DTW Implementation Strategy:**

Use the `dynamic-time-warping` npm package because:
- Custom distance function support allows multivariate Euclidean distance
- Simple API: `new DynamicTimeWarping(series1, series2, distFunc)`
- No native bindings (pure JS) -- compatible with Node for Max
- The `dtw` npm package is functionally similar but less flexible on distance functions

**Custom distance function for 9-axis IMU data:**

```javascript
function euclideanDistance(a, b) {
  // a and b are [ax,ay,az,gx,gy,gz,pitch,roll,yaw]
  // Weight accel/gyro differently from orientation
  var sum = 0;
  for (var i = 0; i < a.length; i++) {
    var diff = a[i] - b[i];
    sum += diff * diff;
  }
  return Math.sqrt(sum);
}
```

**Performance consideration:** At 114Hz with a sliding window, DTW computation must complete faster than the sample interval (~8.7ms). For a template of 100 frames vs a window of 200 frames, the O(n*m) DTW matrix is 20,000 cells -- trivial for modern JS on a desktop CPU. Running matching every 5 frames (22Hz) gives 45ms per match cycle -- extremely comfortable.

### Flow 3: Position Interpolation

```
[MAX UI: "record_position A"]
    |
    v
[gesture-engine.js: position recorder]
    |
    |  1. Average next N frames (e.g., 20 frames = ~175ms) into position A
    |     - Position A = mean of [pitch, roll, yaw] (or full 9-axis)
    |  2. Store as reference point A
    |
    v
[MAX UI: "record_position B"]
    |
    v
    |  3. Same process, store as position B
    |
    v
[gesture-engine.js: position interpolator (continuous)]
    |
    |  4. On each frame:
    |     a. Project current orientation onto A-B line
    |     b. Compute: t = dot(current - A, B - A) / dot(B - A, B - A)
    |     c. Clamp t to [0.0, 1.0]
    |     d. Output t as blend value
    |
    v
maxAPI.outlet("position", 0.65)    // continuous 0.0 to 1.0
maxAPI.outlet("position_raw", 0.72) // before smoothing
```

**Position interpolation math:**

The interpolation computes where the current sensor state falls on the line segment between position A and position B in N-dimensional sensor space. This is a simple vector projection:

```
t = dot(P - A, B - A) / |B - A|^2
```

Where P is the current sensor state, A is position A, B is position B. The result `t` is 0.0 when at position A, 1.0 when at position B, and smoothly varies between. Values outside [0, 1] are clamped.

**Which axes to use for interpolation:**
- Default: orientation only (pitch, roll, yaw) -- 3D space is intuitive
- Advanced: full 9-axis -- captures more nuance but harder to conceptualize
- User-selectable via configuration

---

## Component Boundaries

### gesture-engine.js (New Node for Max Script)

| Responsibility | Details |
|----------------|---------|
| Receive sensor data | Via `maxAPI.addHandler("sensor_data", ax, ay, az, gx, gy, gz, pitch, roll, yaw)` |
| Predefined gesture detection | Threshold/pattern analysis on incoming stream |
| DTW template management | Record, store, load, delete gesture templates |
| DTW continuous matching | Sliding window comparison against all templates |
| Position A/B recording | Capture averaged position snapshots |
| Position interpolation | Continuous projection onto A-B line |
| Persistence | Save/load gesture templates as JSON files |
| Output results | `maxAPI.outlet()` with tagged messages |

**Handler messages (MAX to gesture-engine.js):**

```
sensor_data ax ay az gx gy gz pitch roll yaw  -- forwarded sensor data (114Hz)
gesture_enable <name> <0|1>                   -- enable/disable predefined gesture
gesture_threshold <name> <value>              -- adjust predefined gesture threshold
record_gesture <name>                         -- start recording DTW template
stop_record                                   -- stop recording, save template
delete_gesture <name>                         -- remove DTW template
record_position <A|B>                         -- record interpolation position
clear_positions                               -- clear A and B positions
interp_axes <orient|accel|all>                -- which axes for interpolation
sensitivity <value>                           -- DTW recognition sensitivity
save_library <path>                           -- save gesture library to JSON
load_library <path>                           -- load gesture library from JSON
```

**Outlet messages (gesture-engine.js to MAX):**

```
gesture <name>                      -- predefined gesture detected (bang-like)
dtw_match <name> <confidence>       -- DTW template matched, 0.0-1.0 confidence
dtw_status <status>                 -- recording, matching, idle
dtw_progress <normalized_distance>  -- real-time match progress for visualization
position <blend_value>              -- 0.0 to 1.0 interpolation result
position_status <status>            -- ready, need_A, need_B, active
```

### imu-gesture.maxpat (New MAX Abstraction)

| Responsibility | Details |
|----------------|---------|
| Wrap gesture-engine.js | Contains `node.script` pointing to gesture-engine.js |
| Receive sensor data inlet | Accepts smoothed sensor data from imu-sensor |
| Forward to Node | Prepends `sensor_data` tag before forwarding |
| Route gesture outputs | Routes Node outlet messages to appropriate abstraction outlets |
| Control inlet | Passes through gesture commands to Node |

**Inlet/Outlet design:**

```
Inlets:
  0: sensor data (smoothed accel + gyro + orientation, 9 values)
  1: control messages (record, threshold, enable, etc.)

Outlets:
  0: predefined gestures (gesture name as symbol)
  1: DTW matches (gesture_name confidence as list)
  2: position interpolation (float 0.0-1.0)
  3: status messages (recording, matching, idle, etc.)
  4: DTW progress (float 0.0-1.0 for visualization)
```

### imu-gesture-max.maxpat (Pure MAX/MSP Implementation)

The pure MAX version provides the same functionality using only MAX objects, no Node.js. This is important for:
- Users who want to understand the algorithms visually
- Situations where Node for Max is unavailable
- Educational/workshop contexts

**Implementation approach using MAX objects:**

| Feature | MAX Objects | Notes |
|---------|-------------|-------|
| Predefined gestures | `thresh~`, `edge~`, `change`, `counter`, `timer` | Threshold crossing with debounce |
| DTW matching | `ml.dtw` from ml-lib package | Install via Max Package Manager |
| Position interpolation | `vexpr`, `zl.sum`, `/ $f1` | Vector math on lists |
| Sliding window | `zl.queue`, `zl.slice` | Fixed-size circular buffer |
| Template storage | `coll` or `dict` | Named collections of gesture data |

**ml.dtw from ml-lib** is the recommended external for pure MAX DTW because:
- Available in Max Package Manager (easy install)
- Designed specifically for gesture recognition in Max/PureData
- Supports multi-dimensional time series
- Real-time classification (does not require prior segmentation)
- Based on the Gesture Recognition Toolkit (GRT) by Nick Gillian

### imu-gesture-viz.maxpat (Visualization Companion)

| Responsibility | Details |
|----------------|---------|
| Motion trail | Show recent sensor path in 3D space using jit.gl.mesh |
| DTW matching progress | Real-time bar/waveform showing match confidence |
| Position space map | 2D display showing A, B, and current position |
| Gesture history | Recent gesture triggers with timestamps |

**Visualization objects:**

| Visualization | MAX Objects | Data Source |
|---------------|-------------|-------------|
| Motion trail (3D) | `jit.gl.mesh`, `jit.matrix`, `jit.gl.render` | Accumulated pitch/roll/yaw |
| Matching progress | `multislider` or `function` | dtw_progress outlet |
| Position map (2D) | `lcd` or `jit.gl.sketch` | position outlet + A/B references |
| Gesture log | `textedit` or `umenu` | gesture/dtw_match outlets |

---

## Patterns to Follow

### Pattern 1: Consumer Abstraction (Downstream of imu-sensor)

**What:** imu-gesture.maxpat sits downstream of imu-sensor.maxpat, receiving data through patch cables. It does NOT embed or duplicate imu-sensor functionality.

**Why:** This follows the existing architecture pattern. The 3D viz (imu-sensor-3dviz.maxpat) already works this way -- it receives data from imu-sensor outlets. Gesture recognition is another consumer, not a replacement.

```
[imu-sensor]
     |              |              |
     | outlet 7     | outlet 8     | outlet 9
     | smooth_accel | smooth_gyro  | smooth_orient
     v              v              v
[pack 0. 0. 0. 0. 0. 0. 0. 0. 0.]   (combine 9 values)
     |
     v
[imu-gesture]  inlet 0
```

### Pattern 2: Configurable Axis Selection

**What:** All algorithms (predefined detection, DTW matching, position interpolation) should accept configuration for which sensor axes to use.

**Why:** Different use cases need different axes. A wrist-mounted sensor might only care about accel+gyro for gesture detection, while a baton-mounted sensor might focus on orientation. Hardcoding all 9 axes wastes computation and reduces recognition accuracy when irrelevant axes add noise.

```javascript
// In gesture-engine.js
var activeAxes = [0, 1, 2, 3, 4, 5, 6, 7, 8]; // all 9 by default
// Can be narrowed: [6, 7, 8] for orientation-only

maxAPI.addHandler("active_axes", function() {
  activeAxes = Array.prototype.slice.call(arguments);
});
```

### Pattern 3: Sliding Window Buffer

**What:** Maintain a fixed-size circular buffer of recent sensor frames for both predefined gesture detection and DTW matching.

**Why:** Gesture recognition is inherently temporal -- you need history. A sliding window avoids unbounded memory growth while providing the last N frames for pattern matching.

```javascript
var WINDOW_SIZE = 228; // ~2 seconds at 114Hz
var frameBuffer = [];

function addFrame(frame) {
  frameBuffer.push(frame);
  if (frameBuffer.length > WINDOW_SIZE) {
    frameBuffer.shift();
  }
}
```

### Pattern 4: Separate Matching Rate from Sensor Rate

**What:** Run DTW matching at a lower rate than the incoming sensor data (e.g., 22Hz instead of 114Hz).

**Why:** DTW is O(n*m) per comparison. At 114Hz with multiple templates, computing DTW on every frame is wasteful. Running every 5th frame still provides responsive recognition (<50ms latency) while using 5x less CPU.

```javascript
var matchInterval = 5; // match every 5th frame
var frameCount = 0;

function onSensorData(frame) {
  addFrame(frame);
  frameCount++;
  if (frameCount % matchInterval === 0) {
    runDTWMatching();
  }
}
```

---

## Anti-Patterns to Avoid

### Anti-Pattern 1: Modifying serial-bridge.js

**What goes wrong:** Adding gesture detection code to serial-bridge.js creates coupling between the transport layer and the analysis layer.
**Why bad:** serial-bridge.js is the foundation -- it handles serial connection, reconnection, calibration, smoothing. Adding gesture detection there means a bug in gesture code could crash the entire sensor pipeline. It also prevents running gesture recognition independently of the transport.
**Instead:** Use a separate node.script. Forward data via MAX patch cables.

### Anti-Pattern 2: DTW on Raw (Uncalibrated) Data

**What goes wrong:** Running DTW on raw sensor data that has not been calibrated or smoothed.
**Why bad:** Raw data includes sensor bias, noise, and drift. Templates recorded at one time will not match raw data recorded at another time because the bias offsets change. Smoothed, calibrated data provides consistent baselines for template matching.
**Instead:** Feed gesture-engine.js with data from imu-sensor's smoothed outlets (outlets 7-9).

### Anti-Pattern 3: DTW on Full 114Hz Without Downsampling

**What goes wrong:** Comparing templates at full 114Hz resolution for every incoming frame.
**Why bad:** Templates recorded at 114Hz for a 1-second gesture contain 114 frames. The DTW matrix is 114x114 = 12,996 cells per template. With 10 templates, that is 129,960 cells every 8.7ms. While feasible on desktop JS, it is unnecessary computation. Gestures performed faster or slower will be handled by DTW's warping naturally.
**Instead:** Run matching every 5 frames. Consider recording templates at reduced resolution (every 2nd frame = 57Hz) to shrink the matrix by 4x without meaningful accuracy loss.

### Anti-Pattern 4: Global Send/Receive for Sensor Data Between Scripts

**What goes wrong:** Using MAX's global `send`/`receive` to pass sensor data from imu-sensor to imu-gesture.
**Why bad:** Global send/receive does not support instance isolation. If a user has two imu-sensor instances (e.g., for two Arduinos in the future), global send/receive would mix the data streams. The existing architecture uses `#0`-prefixed names for instance isolation.
**Instead:** Use direct patch cables between abstraction outlets and inlets. If send/receive is needed for convenience, use `#0`-prefixed names: `[send #0-smooth-data]`.

---

## File Structure (New Files)

```
project/
├── node/
│   ├── serial-bridge.js           # EXISTING - DO NOT MODIFY
│   ├── gesture-engine.js          # NEW: gesture recognition engine
│   └── gestures/                  # NEW: saved gesture template files
│       └── default-library.json   # NEW: default gesture templates
├── max/
│   ├── imu-sensor.maxpat          # EXISTING - minimal changes (maybe add gesture outlet)
│   ├── imu-gesture.maxpat         # NEW: gesture abstraction (wraps gesture-engine.js)
│   ├── imu-gesture-max.maxpat     # NEW: pure MAX gesture implementation
│   ├── imu-gesture-viz.maxpat     # NEW: visualization companion
│   ├── imu-gesture.maxhelp        # NEW: help patch for gesture abstraction
│   └── serial-bridge.js           # EXISTING - DO NOT MODIFY (copy for max search path)
└── ...
```

---

## Integration Points

### Existing to New

| Source (Existing) | Destination (New) | Data | Method |
|-------------------|-------------------|------|--------|
| imu-sensor outlet 7 (smooth_accel) | imu-gesture inlet 0 | aX aY aZ floats | Patch cable |
| imu-sensor outlet 8 (smooth_gyro) | imu-gesture inlet 0 | gX gY gZ floats | Patch cable |
| imu-sensor outlet 9 (smooth_orient) | imu-gesture inlet 0 | pitch roll yaw floats | Patch cable |
| imu-sensor outlet 0 (status) | imu-gesture (optional) | connection status | Patch cable |

### New to Downstream

| Source (New) | Destination | Data | Method |
|--------------|-------------|------|--------|
| imu-gesture outlet 0 | User patch | Predefined gesture name (symbol) | Patch cable |
| imu-gesture outlet 1 | User patch | DTW match name + confidence (list) | Patch cable |
| imu-gesture outlet 2 | User patch | Position blend value (float 0-1) | Patch cable |
| imu-gesture outlet 3 | User patch | Status messages | Patch cable |
| imu-gesture outlet 4 | imu-gesture-viz | DTW progress (float) | Patch cable |

### Internal (Within imu-gesture.maxpat)

```
[inlet 0: sensor data]
    |
[pak 0. 0. 0. 0. 0. 0. 0. 0. 0.]    (accumulate 9 values from 3 outlets)
    |
[prepend sensor_data]
    |
    v
[node.script gesture-engine.js]
    |
[route gesture dtw_match position dtw_status dtw_progress position_status]
    |        |          |          |             |              |
    v        v          v          v             v              v
[outlet 0] [outlet 1] [outlet 2] [outlet 3]   [outlet 4]    [outlet 3]
```

**Important design note on accumulating sensor data:** imu-sensor outputs smooth_accel, smooth_gyro, and smooth_orientation as separate 3-value lists on separate outlets. These arrive at the same logical time but as separate MAX messages. Inside imu-gesture.maxpat, use `pak` (not `pack`) to accumulate all 9 values, with smooth_orientation triggering the output (rightmost inlet triggers first in MAX's right-to-left evaluation, but `pak` outputs on any inlet change). Alternatively, use three separate `prepend` objects: `prepend smooth_accel`, `prepend smooth_gyro`, `prepend smooth_orient` and handle them as separate handler calls in gesture-engine.js. The second approach is simpler and avoids timing issues.

**Revised internal flow (simpler, recommended):**

```
[inlet 0]
    |
[route smooth_accel smooth_gyro smooth_orientation]
    |            |              |
[prepend       [prepend       [prepend
 smooth_accel]  smooth_gyro]   smooth_orient]
    |            |              |
    +------+-----+------+------+
           |
    [node.script gesture-engine.js]
```

In gesture-engine.js:
```javascript
var latestAccel = [0, 0, 0];
var latestGyro = [0, 0, 0];
var latestOrient = [0, 0, 0];

maxAPI.addHandler("smooth_accel", function(ax, ay, az) {
  latestAccel = [ax, ay, az];
});

maxAPI.addHandler("smooth_gyro", function(gx, gy, gz) {
  latestGyro = [gx, gy, gz];
});

maxAPI.addHandler("smooth_orient", function(pitch, roll, yaw) {
  latestOrient = [pitch, roll, yaw];
  // Orientation arrives last (convention from serial-bridge.js)
  // Use this as the "tick" to process a complete frame
  processFrame(latestAccel.concat(latestGyro, latestOrient));
});
```

---

## Build Order (Dependency Chain)

```
Phase 1: gesture-engine.js Core + Predefined Gestures
    |     - Set up node.script with maxAPI handlers
    |     - Sliding window buffer
    |     - Predefined gesture detectors (shake, flip, tap)
    |     - Test with imu-sensor data manually forwarded
    |
    v
Phase 2: imu-gesture.maxpat Abstraction
    |     - Wrap gesture-engine.js in MAX abstraction
    |     - Wire sensor data forwarding from imu-sensor outlets
    |     - Route gesture outputs to abstraction outlets
    |     - Test end-to-end: Arduino --> imu-sensor --> imu-gesture --> bangs
    |
    v
Phase 3: DTW Recording & Matching
    |     - Add DTW template recording to gesture-engine.js
    |     - Add continuous DTW matching with sliding window
    |     - Template persistence (JSON file save/load)
    |     - Configurable sensitivity and axis selection
    |     Depends on: Phase 1 (buffer infrastructure), Phase 2 (data flow)
    |
    v
Phase 4: Position Interpolation
    |     - Add A/B position recording
    |     - Add continuous interpolation output
    |     - Configurable axis selection for interpolation
    |     Depends on: Phase 2 (data flow from imu-sensor)
    |
    v
Phase 5: Pure MAX/MSP Implementation (imu-gesture-max.maxpat)
    |     - Predefined gestures using native MAX objects
    |     - DTW using ml.dtw from ml-lib
    |     - Position interpolation using vexpr
    |     - Same outlet interface as imu-gesture.maxpat
    |     Depends on: Phase 2 (outlet interface defined)
    |
    v
Phase 6: Visualization (imu-gesture-viz.maxpat)
    |     - Motion trails in 3D (Jitter)
    |     - DTW matching progress display
    |     - Position space 2D map
    |     Depends on: Phase 3 (DTW progress data), Phase 4 (position data)
    |
    v
Phase 7: Help Patch & Polish
          - imu-gesture.maxhelp with recipes
          - Documentation
          - Default gesture library (pre-recorded templates)
          Depends on: All previous phases
```

**Why this order:**
- Phase 1 is the core engine -- independently testable by sending test data via MAX messages
- Phase 2 proves the integration pattern before investing in complex algorithms
- Phase 3 (DTW) builds on Phase 1's buffer infrastructure and Phase 2's data pipeline
- Phase 4 (interpolation) is independent of DTW but needs the same data pipeline from Phase 2
- Phase 5 (pure MAX) can reference the Node implementation's behavior as a specification
- Phase 6 (visualization) needs output data from Phases 3-4 to display
- Phase 7 packages everything -- the interface must be stable first

**Parallelization opportunities:**
- Phases 3 and 4 are independent -- they could be built in parallel after Phase 2
- Phase 5 could start after Phase 2 (once the outlet interface is defined), running in parallel with Phases 3-4
- Phase 6 needs Phases 3-4 but not Phase 5

---

## Scalability Considerations

| Concern | At 1 template | At 10 templates | At 50 templates |
|---------|--------------|-----------------|-----------------|
| DTW computation per match cycle | <1ms | ~5ms | ~25ms |
| Memory (frame buffers) | ~50KB | ~50KB (shared buffer) | ~50KB + 500KB templates |
| MAX outlet rate | 114Hz + gesture events | Same | Same |
| Matching latency | <50ms | <50ms | ~100ms (may need to reduce match rate) |

At 50+ templates, consider:
- Coarse pre-filtering (reject templates whose duration differs by >2x from window content)
- k-means clustering of templates for faster rejection
- Reducing match rate to every 10 frames instead of every 5

For this project's scope (creative music performance), 10-20 custom templates is the realistic maximum. Performance will not be an issue.

---

## Sources

- [dynamic-time-warping npm (GitHub)](https://github.com/GordonLesti/dynamic-time-warping) -- Pure JS, custom distance function support, suitable for Node for Max (MEDIUM confidence -- package is stable but not recently updated)
- [dtw npm (GitHub)](https://github.com/langholz/dtw) -- Alternative JS DTW, simpler API but less flexible distance functions (MEDIUM confidence)
- [ml-lib for Max/PureData (GitHub)](https://github.com/irllabs/ml-lib) -- Machine learning externals including ml.dtw, based on GRT, available via Max Package Manager (MEDIUM confidence -- last update needs verification)
- [Real-time DTW Gesture Recognition for Max/MSP (ResearchGate)](https://www.researchgate.net/publication/228987911_Real-time_DTW-based_gesture_recognition_external_object_for_MAXMSP_and_puredata) -- Multi-grid DTW algorithm without prior segmentation (MEDIUM confidence)
- [MuBu for Max (IRCAM)](https://ismm.ircam.fr/mubu/) -- Alternative: multimodal analysis toolbox with gesture follower and XMM (MEDIUM confidence)
- [Shake Detection Algorithm (JavaScript)](https://slicker.me/javascript/shake/shake.htm) -- Magnitude threshold + debounce pattern for shake detection (HIGH confidence -- well-documented pattern)
- [IMU Gesture Recognition Survey (MDPI Sensors)](https://www.mdpi.com/1424-8220/19/18/3827) -- DTW with IMU achieves 98.6% accuracy, 0.426ms recognition time (MEDIUM confidence)
- [Accelerometer Gesture Recognition via DTW (IEEE)](https://ieeexplore.ieee.org/abstract/document/5495895/) -- DTW + accelerometer gesture recognition methodology (MEDIUM confidence)
- [Node for Max - node.script Reference](https://docs.cycling74.com/max8/refpages/node.script) -- Multiple node.script instances supported, each in separate process (HIGH confidence)
- [Max Gesture Capture Tutorial](https://docs.cycling74.com/max5/tutorials/max-tut/datachapter03.html) -- MAX native gesture recording patterns (MEDIUM confidence)
- [jit.gl.mesh Reference](https://docs.cycling74.com/max7/refpages/jit.gl.mesh) -- Jitter mesh for 3D motion trail visualization (HIGH confidence)
- [Cycling74 ml-lib Forum Discussion](https://cycling74.com/forums/machine-learning-in-max-hallelujah) -- ml.dtw real-time classification performance notes (MEDIUM confidence)

---
*Architecture research for: v1.1 Gesture Recognition & Mapping*
*Researched: 2026-02-22*
