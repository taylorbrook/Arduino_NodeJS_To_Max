# Technology Stack: v1.1 Gesture Recognition & Mapping

**Project:** Arduino-to-MAX Sensor Pipeline
**Milestone:** v1.1 -- Gesture Recognition, DTW, Position Interpolation, Rich Visualization
**Researched:** 2026-02-22
**Overall Confidence:** MEDIUM-HIGH

---

## Scope: What Is NEW vs What Already Exists

This document covers ONLY the stack additions needed for v1.1. The existing v1.0 stack is validated and stable:

### Existing Stack (DO NOT CHANGE)

| Already Have | Version | Status |
|-------------|---------|--------|
| max-api | bundled | Stable -- bidirectional Node-to-Max communication |
| serialport | 12.x | Stable -- USB serial bridge |
| @serialport/parser-readline | 12.x | Stable -- CSV line parsing |
| dgram (Node built-in) | N/A | Stable -- WiFi UDP transport |
| Arduino_LSM6DS3 | 1.0.3 | Stable -- IMU hardware access |
| Madgwick filter (Arduino-side) | N/A | Stable -- orientation fusion at 114 Hz |
| EMA smoothing (serial-bridge.js) | N/A | Stable -- three-tier smoothing |
| Jitter (jit.gl.sketch, jit.gl.render) | bundled | Stable -- existing 3D viz patch |

### What v1.1 Needs

1. **DTW algorithm** -- for custom gesture matching (Node + pure MAX)
2. **Gesture buffer/template storage** -- recording and persisting gesture data
3. **Predefined gesture detectors** -- heuristic shake/tap/flip/circle detection
4. **Position interpolation engine** -- record A/B states, output 0-1 blend
5. **Rich visualization** -- motion trails, DTW match progress, position space

---

## Recommended Stack Additions

### Node for Max: New Dependencies

| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| **None (zero new npm packages)** | -- | -- | See rationale below |

**Critical decision: Implement DTW from scratch in a NEW gesture-engine.js script (separate from serial-bridge.js).**

Rationale for zero new dependencies:

1. **dynamic-time-warping (npm)**: v1.0.0, last updated July 2016, 52 GitHub stars. Supports custom distance functions (good for multivariate), but the library is a single file of ~60 lines. Wrapping it provides negligible benefit over writing DTW directly. **Not worth the dependency.**

2. **dtw (npm)**: v0.0.3, last updated 11 years ago. No multivariate support, no window constraints (Sakoe-Chiba band), no configuration. **Abandoned.**

3. **The DTW algorithm is ~40 lines of JavaScript.** For 9-axis IMU data at 114 Hz, the core cost matrix computation with a Sakoe-Chiba window constraint is straightforward. Writing it yourself gives you: multivariate Euclidean distance over selected axes, configurable window width to bound computation, early abandonment (stop if cost exceeds threshold), and direct integration with the existing smoothed data pipeline. No serialization overhead, no API mismatch.

**Confidence: HIGH** -- DTW is a well-understood O(N*M) dynamic programming algorithm. Both npm libraries are unmaintained and lack multivariate support. Custom implementation is the standard approach in IMU gesture recognition literature.

### MAX/MSP: New Objects Needed

| Object | Source | Purpose | Why |
|--------|--------|---------|-----|
| `js` | Built-in | DTW computation for pure MAX version | The `js` object runs embedded JavaScript (ES5/SpiderMonkey). DTW is pure math -- no npm needed, no async, no Node.js features required. Runs in the Max scheduler thread for tighter timing than node.script. |
| `dict` | Built-in | Gesture template storage and persistence | JSON-native storage. `@embed 1` saves templates inside the patch. `read`/`write` for external JSON files. Supports nested structures for multi-gesture libraries. |
| `coll` | Built-in | Time-series sample buffer for recording | Index-addressed storage. Record gesture samples as `index: ax ay az gx gy gz pitch roll yaw`. Faster sequential access than dict for time-ordered data. `write`/`read` for file persistence. |
| `multislider` | Built-in | Gesture waveform display and template visualization | Displays recorded gesture as waveform overlay. Set `@size N` for sample count, `@setminmax -1. 1.` for normalized range. Multiple instances for multi-axis display. |
| `jit.gl.mesh` | Built-in (Jitter) | Motion trail rendering in 3D space | `@draw_mode line_strip` draws polylines from vertex matrix. Feed a ring buffer of XYZ positions to create fading motion trails. Already have Jitter context from imu-sensor-3dviz.maxpat. |
| `jit.matrix` | Built-in (Jitter) | Vertex data buffer for motion trails | Store ring buffer of N recent position samples as Nx3 float32 matrix. Feed to jit.gl.mesh position inlet. |
| `function` | Built-in | Position interpolation curve editor | Already used in v1.0 for smoothing curves. Reuse for custom interpolation response curves between positions A and B. |

### MAX/MSP: External Package (for Pure MAX DTW)

| Package | Source | Purpose | Why This One |
|---------|--------|---------|-------------|
| **ml-lib** | Max Package Manager | `ml.dtw` external for pure MAX DTW implementation | Provides a native DTW external based on the Gesture Recognition Toolkit (GRT). Handles multivariate time series, real-time classification without prior segmentation. Available via `File > Show Package Manager` in Max. The pure MAX implementation should use ml.dtw as the primary approach. **Fallback: custom DTW in the `js` object if ml-lib is unavailable.** |

**Confidence: MEDIUM** -- ml-lib is available in the Max Package Manager and is based on GRT, but maintenance status is uncertain. The `js` object fallback ensures the feature works regardless.

### MAX/MSP: External Package (OPTIONAL, NOT Required)

| Package | Source | Purpose | Why Optional |
|---------|--------|---------|-------------|
| MuBu | IRCAM via Max Package Manager | Professional gesture following (mubu.gf, mubu.dtw, mubu.xmm) | Extremely powerful but heavyweight. Adds IRCAM dependency, learning curve, and a large external package for what we can accomplish with custom code. **Recommendation: Do NOT use for v1.1.** If ML-based gesture recognition is needed later (v2.0+), MuBu becomes relevant. For DTW + predefined gestures, our custom implementation is simpler, more transparent, and has zero external dependencies. |

**Confidence: HIGH** -- MuBu is well-regarded in the IRCAM/Cycling74 community, but it is overkill for template-matching DTW and threshold-based predefined gestures.

---

## Architecture of New Code

### Separate Script (Required by Project Constraint)

**The gesture engine is a NEW, SEPARATE `node.script` called `gesture-engine.js`.** It does NOT modify serial-bridge.js. This is a hard constraint from the milestone specification.

```
serial-bridge.js (UNCHANGED) --> outlets --> MAX routing --> gesture-engine.js (NEW)
gesture-engine.js (~500 lines)
  + sliding window buffer
  + predefined gesture detection (state machines)
  + DTW engine (~40 lines core)
  + DTW template management
  + position interpolation
  + JSON template persistence
```

**How gesture-engine.js receives sensor data:**

The imu-gesture.maxpat abstraction receives smoothed sensor data from imu-sensor.maxpat's outlets (7, 8, 9) and forwards it to gesture-engine.js via `maxAPI.addHandler()`. The data path is:

```
imu-sensor.maxpat (outlet 7: smooth_accel, 8: smooth_gyro, 9: smooth_orient)
    |
    v  (patch cables in user's patch)
imu-gesture.maxpat (inlet 0)
    |
    v  (prepend tag, send to node.script)
gesture-engine.js (handlers: smooth_accel, smooth_gyro, smooth_orient)
    |
    v  (maxAPI.outlet with tagged results)
imu-gesture.maxpat (route -> outlets)
```

**Why separate scripts, not single script:**

The milestone constraint requires this, but it is also architecturally sound:
- **Stability:** serial-bridge.js is the foundation. A bug in gesture code cannot crash the serial pipeline.
- **Independence:** Gesture recognition can be added/removed without affecting core data flow.
- **Multiple instances:** Multiple imu-gesture instances can run on the same imu-sensor data.
- **Latency impact:** The extra IPC hop (Node -> MAX -> Node) adds ~1-2ms. At 114 Hz (8.7ms budget) this is 12-23% overhead. Acceptable because gesture recognition is event-based, not requiring the lowest possible latency for every sample.

### Pure MAX Implementation

A parallel implementation using only built-in MAX objects (plus ml-lib for DTW):

```
imu-sensor.maxpat outlets
  --> [gesture-detect] subpatcher (predefined gestures via threshold logic)
  --> [gesture-dtw] subpatcher (DTW via ml.dtw or js object)
  --> [position-interp] subpatcher (A/B recording + blend)
  --> [gesture-viz] subpatcher (Jitter trails + multislider displays)
```

The pure MAX version gives users a choice: use the Node version (gesture-engine.js) for the full pipeline, or use the pure MAX version if they do not want Node for Max dependency.

---

## DTW Implementation Specification

### Core Algorithm (Both Node and MAX js)

```javascript
// DTW with Sakoe-Chiba band constraint
// template: Array of N-dimensional frames (e.g. [ax,ay,az,gx,gy,gz,pitch,roll,yaw])
// candidate: Array of N-dimensional frames
// window: max frames of warping allowed (e.g., 20)
// Returns: normalized cost (lower = better match)

function dtw(template, candidate, window) {
  var n = template.length;
  var m = candidate.length;
  var w = Math.max(window, Math.abs(n - m));
  // Cost matrix initialized to Infinity
  var cost = [];
  for (var i = 0; i <= n; i++) {
    cost[i] = [];
    for (var j = 0; j <= m; j++) {
      cost[i][j] = Infinity;
    }
  }
  cost[0][0] = 0;

  for (var i = 1; i <= n; i++) {
    for (var j = Math.max(1, i - w); j <= Math.min(m, i + w); j++) {
      var d = euclideanDist(template[i-1], candidate[j-1]);
      cost[i][j] = d + Math.min(cost[i-1][j], cost[i][j-1], cost[i-1][j-1]);
    }
  }
  // Normalize by path length
  return cost[n][m] / (n + m);
}

function euclideanDist(a, b) {
  var sum = 0;
  for (var k = 0; k < a.length; k++) {
    var diff = a[k] - b[k];
    sum += diff * diff;
  }
  return Math.sqrt(sum);
}
```

**Key parameters:**
- **Template length:** 50-200 frames (0.4-1.8 seconds at 114 Hz)
- **Sakoe-Chiba window:** 15-30 frames (~130-260ms of warping tolerance)
- **Match threshold:** Normalized cost < 0.3 for same gesture, > 0.7 for different
- **Axes used:** Configurable -- default all 9 axes; can narrow to accel-only or orient-only

**Confidence: HIGH** -- This is textbook DTW. The Sakoe-Chiba band reduces O(N*M) to O(N*W) which at 200 frames and W=30 is 6000 operations -- trivial for any modern CPU.

---

## Predefined Gesture Detection (Heuristic)

These do NOT use DTW. They use threshold-based heuristics for speed and reliability.

| Gesture | Detection Method | Key Parameters |
|---------|-----------------|----------------|
| **Shake** | Acceleration magnitude RMS exceeds threshold over sustained window | Threshold: 2.5g RMS, window: 200ms, min reversals: 3 |
| **Tap** | Sharp acceleration spike followed by rapid decay | Threshold: 3.0g spike, decay to baseline within 100ms |
| **Double-tap** | Two tap events within timing window | Tap gap: 100-400ms |
| **Flip** | Gravity vector (aZ) inverts sign with sufficient magnitude | aZ crosses from >0.8g to <-0.8g, debounce: 500ms |
| **Circle** | Gyro Z integration exceeds 300 degrees within window | Min rotation: 300 deg, max time: 2s |
| **Tilt (4 directions)** | Pitch or roll crosses threshold | Threshold: +/-30 deg, hysteresis: 5 deg |

**Implementation:** Each detector is a state machine that runs on every sample. Output is a gesture name as a symbol via `maxAPI.outlet("gesture", name)`.

**Confidence: HIGH for shake/tap/flip** -- well-documented threshold algorithms from accelerometer datasheets (ST, NXP). **MEDIUM for circle** -- requires empirical tuning.

---

## Position Interpolation Specification

### Implementation

```javascript
// posA, posB: arrays of sensor values at recorded positions
// current: array of current sensor values
// Returns: 0.0 (at A) to 1.0 (at B), clamped

function interpolatePosition(posA, posB, current) {
  var ab = [];
  var ac = [];
  for (var i = 0; i < posA.length; i++) {
    ab.push(posB[i] - posA[i]);
    ac.push(current[i] - posA[i]);
  }
  var dot = 0, lenSq = 0;
  for (var i = 0; i < ab.length; i++) {
    dot += ab[i] * ac[i];
    lenSq += ab[i] * ab[i];
  }
  if (lenSq < 0.001) return 0.0;
  return Math.max(0.0, Math.min(1.0, dot / lenSq));
}
```

**Axes:** Default uses orientation (pitch, roll, yaw) -- 3 dimensions. Configurable to use all 9 axes.

**Confidence: HIGH** -- Linear projection (dot product) onto A-B vector is standard for 1D interpolation in multi-dimensional space.

---

## Visualization Stack

### Motion Trail (3D)

Builds on existing `imu-sensor-3dviz.maxpat` Jitter context.

| Component | Object | Role |
|-----------|--------|------|
| Ring buffer | `jit.matrix 3 float32 256 1` | Store last 256 position samples as XYZ vertices |
| Trail renderer | `jit.gl.mesh @draw_mode line_strip` | Render ring buffer as polyline |
| Color fade | `jit.matrix 4 float32 256 1` | RGBA per-vertex; fade alpha from newest to oldest |
| Update driver | `metro 33` (30 fps) | Trigger trail update at render rate, not sensor rate |

### DTW Match Progress (2D)

| Component | Object | Role |
|-----------|--------|------|
| Template waveform | `multislider @size N` | Blue waveform showing stored gesture template |
| Live waveform | `multislider @size N` | Red waveform showing incoming gesture candidate |
| Match score | `dial` or `number~` | Display current DTW distance score |
| Match indicator | `panel` with color change | Green on match, red on no-match |

### Position Space Map (2D)

| Component | Object | Role |
|-----------|--------|------|
| 2D position display | `lcd` or `jit.pwindow` | Show A, B dots and current position cursor |
| Interpolation bar | `slider @floatoutput 1` | Horizontal 0-1 bar showing blend position |
| Response curve | `function` | User-editable non-linear interpolation response |

**Confidence: HIGH** -- All built-in MAX/MSP and Jitter objects. No external dependencies.

---

## Gesture Template Storage Format

### JSON Structure

```json
{
  "version": "1.1",
  "gestures": {
    "custom_wave": {
      "name": "Wave",
      "axes": [0, 1, 2, 3, 4, 5, 6, 7, 8],
      "sampleRate": 114,
      "frames": [
        [0.12, -0.03, 0.98, 1.2, -0.5, 0.3, 5.2, -2.1, 180.0],
        [0.15, -0.01, 0.95, 2.1, -0.8, 0.6, 7.1, -3.0, 182.5]
      ],
      "threshold": 0.35,
      "created": "2026-02-22T10:30:00Z"
    }
  },
  "positions": {
    "A": [0.0, 0.0, 0.0],
    "B": [45.0, 0.0, 0.0]
  }
}
```

### Storage Implementation

| Context | Storage | Persistence |
|---------|---------|-------------|
| Node for Max | JSON file via `fs.writeFileSync` / `fs.readFileSync` | File in project directory (e.g., `node/gestures/library.json`) |
| Pure MAX | `dict @embed 1` | Embedded in patch file (auto-save). Also `dict.write` for external JSON |
| Gesture recording buffer | Array (Node) / `coll` (MAX) | Transient during recording; committed on save |

**Confidence: HIGH** -- dict JSON support is well-documented. fs module is Node.js built-in.

---

## What NOT to Add

| Technology | Why NOT | What to Use Instead |
|------------|---------|---------------------|
| **MuBu (IRCAM)** | Heavyweight package, steep learning curve. Overkill for template-matching DTW. | Custom DTW + threshold heuristics |
| **dynamic-time-warping (npm)** | Unmaintained since 2016. Saves ~30 lines at the cost of a stale dependency. | Custom DTW (~40 lines) |
| **dtw (npm)** | Unmaintained since 2013. No multivariate support. | Custom DTW |
| **TensorFlow.js / ml5.js** | ML-based recognition is out of scope for v1.1. 50MB+ dependency. | DTW for custom gestures; heuristics for predefined |
| **ahrs (npm)** | Already running Madgwick on Arduino. Orientation arrives pre-computed. | Use orientation from Arduino CSV directly |
| **New Arduino firmware changes** | Arduino already outputs all 9 values needed. Gesture recognition belongs in Node/MAX. | Process gestures on the host |

---

## Dual Implementation Strategy

### Node for Max Version (gesture-engine.js)

| Feature | Implementation | Stack |
|---------|---------------|-------|
| Predefined gestures | State machines in gesture-engine.js | Pure JS, no dependencies |
| Custom DTW | DTW function in gesture-engine.js | Pure JS, ~40 lines |
| Template storage | JSON file via fs module | Node built-in |
| Position interpolation | Dot product projection in gesture-engine.js | Pure JS, ~20 lines |
| Visualization data | Outlet messages to MAX patch | maxAPI.outlet() |

### Pure MAX/MSP Version (imu-gesture-max.maxpat)

| Feature | Implementation | Stack |
|---------|---------------|-------|
| Predefined gestures | Threshold subpatchers using `>`, `<`, `counter`, `timer` | Built-in MAX objects |
| Custom DTW | `ml.dtw` from ml-lib (primary) or `js` object (fallback) | ml-lib external or built-in MAX js |
| Template storage | `dict @embed 1` with JSON read/write | Built-in MAX object |
| Gesture recording | `coll` for sample buffering during capture | Built-in MAX object |
| Position interpolation | `vexpr` for vector math, `scale` for mapping | Built-in MAX objects |
| Motion trails | `jit.gl.mesh @draw_mode line_strip` + `jit.matrix` | Built-in Jitter objects |
| DTW progress | `multislider` waveform overlays | Built-in MAX object |
| Position space map | `lcd` or `jit.pwindow` with `jit.gl.sketch` | Built-in MAX/Jitter objects |

---

## Installation

### For v1.1: Minimal New Installations

```bash
# Node for Max: NO new npm packages needed
# All gesture/DTW/interpolation code is custom JavaScript

# MAX/MSP: One optional package (for pure MAX DTW)
# Install ml-lib via File > Show Package Manager > search "ml-lib"
# If ml-lib unavailable, DTW runs in the built-in js object instead

# Arduino: NO firmware changes needed
# Existing 9-value CSV output is sufficient
```

---

## Performance Budget

At 114 Hz, each sample has an **8.77ms budget** before the next arrives. However, gesture-engine.js receives data via an extra IPC hop, so its budget is slightly tighter.

| Operation | Estimated Time | Notes |
|-----------|---------------|-------|
| IPC: MAX to gesture-engine.js | ~1.0ms | maxAPI message forwarding |
| Predefined gesture check (9 detectors) | ~0.03ms | Simple threshold comparisons |
| DTW match (every 5th frame, 200 frames, window 30) | ~0.5ms | Only runs every ~44ms |
| Position interpolation | ~0.01ms | 3 multiplies + 1 divide |
| maxAPI.outlet() calls (gesture results) | ~0.3ms | IPC back to MAX (only on events) |
| **Total per frame** | **~1.3ms** | **15% of 8.77ms budget** |

**Conclusion:** Ample headroom. DTW only runs every 5th frame (~22Hz), and gesture/position outlets only fire on events -- not every frame. Real-world CPU usage will be well under 15%.

**Confidence: MEDIUM** -- Estimates based on similar JavaScript benchmarks and Node for Max IPC measurements. Actual performance should be validated during implementation.

---

## Sources

- [dynamic-time-warping npm](https://www.npmjs.com/package/dynamic-time-warping) -- v1.0.0, July 2016, custom distance function support [HIGH confidence]
- [dtw npm](https://www.npmjs.com/package/dtw) -- v0.0.3, 11 years old, minimal API [HIGH confidence]
- [GordonLesti/dynamic-time-warping GitHub](https://github.com/GordonLesti/dynamic-time-warping) -- 52 stars, custom distance support [HIGH confidence]
- [langholz/dtw GitHub](https://github.com/langholz/dtw) -- 34 stars, simple API [HIGH confidence]
- [DTW Wikipedia](https://en.wikipedia.org/wiki/Dynamic_time_warping) -- Algorithm reference, O(NM) complexity [HIGH confidence]
- [ml-lib for Max/PureData GitHub](https://github.com/irllabs/ml-lib) -- ml.dtw external, GRT-based [MEDIUM confidence]
- [Real-time DTW for MAX/MSP (Bettens & Todoroff)](https://www.researchgate.net/publication/228987911_Real-time_DTW-based_gesture_recognition_external_object_for_MAXMSP_and_puredata) -- Research paper on DTW in Max [HIGH confidence]
- [MuBu for Max (IRCAM)](https://ismm.ircam.fr/mubu/) -- Gesture follower, XMM, DTW/HMM [HIGH confidence]
- [Node for Max API](https://docs.cycling74.com/nodeformax/api/) -- outlet, handlers, process model [HIGH confidence]
- [MAX js Object Reference](https://docs.cycling74.com/max7/refpages/js) -- ES5 SpiderMonkey [HIGH confidence]
- [MAX dict Reference](https://docs.cycling74.com/legacy/max8/refpages/dict) -- JSON read/write, @embed [HIGH confidence]
- [MAX coll Reference](https://docs.cycling74.com/max7/refpages/coll) -- Indexed storage [HIGH confidence]
- [jit.gl.mesh Reference](https://docs.cycling74.com/legacy/max8/refpages/jit.gl.mesh) -- draw_mode line_strip [HIGH confidence]
- [Shake Detection (JavaScript)](https://slicker.me/javascript/shake/shake.htm) -- Magnitude + debounce algorithm [HIGH confidence]
- [IMU Gesture Recognition (Kim et al.)](https://www.mdpi.com/1424-8220/19/18/3827) -- DTW accuracy 98.6%, 0.4ms recognition [MEDIUM confidence]
- [uWave: Accelerometer Gesture Recognition](https://www.yecl.org/publications/liu09percom.pdf) -- Single-template DTW [HIGH confidence]
- [node.script Reference](https://docs.cycling74.com/max8/refpages/node.script) -- Multiple instances supported [HIGH confidence]

---
*Stack research for: v1.1 Gesture Recognition & Mapping milestone*
*Researched: 2026-02-22*
