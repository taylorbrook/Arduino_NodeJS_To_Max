# Phase 8: Custom DTW Gesture Recognition - Research

**Researched:** 2026-02-24
**Domain:** Dynamic Time Warping (DTW) for real-time IMU gesture recording, matching, and persistence in Node for Max with Arduino quaternion extension
**Confidence:** MEDIUM-HIGH

## Summary

Phase 8 adds custom gesture recording and recognition to the existing gesture engine using Dynamic Time Warping (DTW). The user records 3-5 examples of a gesture, the system selects the most representative example as a template (or averages them via DTW Barycenter Averaging), and then continuously matches incoming sensor data against all templates. The core DTW algorithm is well-understood (O(N*M) with Sakoe-Chiba band reducing to O(N*B)), and the Gesture Recognition Toolkit (GRT) by Nick Gillian provides a thoroughly validated reference implementation for the training pipeline, null rejection via statistical thresholds, and confidence scoring.

This phase has three major subsystems: (1) the DTW matching engine added to gesture-engine.js with recording state machine, template management, and real-time matching at ~22Hz; (2) Arduino firmware modification to output quaternion data alongside the existing 9-value CSV; and (3) MAX patch UI additions to imu-gesture.maxpat for recording controls, per-gesture slot configuration, and save/load functionality. The DTW algorithm itself is simple enough to hand-roll (~100-150 lines) -- the existing npm libraries (`dynamic-time-warping`, `dtw`) are unmaintained (last updated 9-11 years ago), lack Sakoe-Chiba band support, and lack multi-dimensional support, making a custom implementation the correct choice.

The key engineering challenges are: (1) running DTW matching at ~22Hz without blocking the 114Hz sensor pipeline (use `setImmediate` or `setTimeout(0)` to yield between match computations); (2) computing null rejection thresholds from training statistics (mean + coefficient * sigma of intra-class distances); (3) adding quaternion output to the Arduino firmware CSV format without breaking backward compatibility; and (4) implementing variance-based auto-detection of relevant sensor axes from recorded examples.

**Primary recommendation:** Hand-roll a multi-dimensional DTW with Sakoe-Chiba band constraint directly in gesture-engine.js. Use the GRT's training pipeline pattern: select the best representative template per class, compute training statistics for null rejection, and normalize distances to 0.0-1.0 confidence scores. Add quaternion as 4 additional CSV fields (13 total), gated by a firmware flag to maintain backward compatibility.

<user_constraints>
## User Constraints (from CONTEXT.md)

### Locked Decisions
- Two recording modes: timed window (with adjustable duration) AND toggle (start/stop manually)
- After each recording, prompt "Record another example?" -- user builds up examples sequentially
- Gestures use numbered slots with optional text labels -- defaults to "gesture-1" if no name given
- Two output modes: triggered bang + confidence when above threshold, PLUS a separate outlet for continuous confidence stream
- User-adjustable confidence threshold per gesture slot (dial/number box)
- Two match reporting modes (user-selectable): "best match only" or "all above threshold"
- Adjustable cooldown period after a gesture triggers before it can fire again
- Libraries are sharable -- JSON includes metadata (gesture names, descriptions, axis config, template data)
- Dynamic/unlimited gesture slots -- user can add as many gestures as needed
- Per-gesture enable/disable toggle -- consistent with predefined gesture UI pattern from Phase 7
- All 9 existing channels (aX/aY/aZ, gX/gY/gZ, pitch/roll/yaw) plus quaternion data available for matching
- Quaternion output added to Arduino firmware and serial bridge in this phase
- Auto-detect relevant axes from recorded examples (based on variance analysis), with manual override available

### Claude's Discretion
- Recording feedback UI (countdown, sample count, visual indicators)
- Save/load UX pattern (file dialog, auto-save, default paths)
- Axis selection architecture (per-gesture vs global vs hybrid)
- Exact compression/normalization of template data
- DTW implementation details (Sakoe-Chiba band width, distance metric)

### Deferred Ideas (OUT OF SCOPE)
None -- discussion stayed within phase scope
</user_constraints>

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| DTW-01 | User can record a custom gesture template by performing the gesture | Recording state machine in gesture-engine.js: timed window mode (configurable duration) and toggle mode (manual start/stop). Captures calibrated sensor frames into a recording buffer during the recording window. Activity gate pauses during recording to prevent premature cutoff. |
| DTW-02 | User can record multiple examples (3-5) of the same gesture for better recognition | Sequential recording workflow: after each recording, prompt via outlet message. Store all examples per gesture slot. After 2+ examples, compute template selection (best representative via minimum average pairwise DTW distance) and training statistics (mean/sigma of intra-class distances for null rejection). |
| DTW-03 | System recognizes custom gestures using DTW with Sakoe-Chiba band constraint | Hand-rolled multi-dimensional DTW function with Sakoe-Chiba band (radius = 10-20% of template length). Euclidean distance between multi-dimensional frames as the local cost function. Runs at ~22Hz (every 5th sensor frame at 114Hz) to preserve performance budget. |
| DTW-04 | DTW match outputs gesture name and confidence value (0.0-1.0) | Distance-to-confidence conversion: `confidence = 1.0 - (distance / maxDistance)` where maxDistance is the null rejection threshold. Clamped to [0.0, 1.0]. Output via `maxAPI.outlet("dtw_match", gestureName, confidence)` for triggered events and `maxAPI.outlet("dtw_confidence", gestureName, confidence)` for continuous stream. |
| DTW-05 | System rejects non-gesture motion via null rejection thresholds | Per-template null rejection threshold computed during training: `threshold = trainingMu + (nullRejectionCoeff * trainingSigma)` where trainingMu/trainingSigma are the mean/stddev of DTW distances between training examples and the selected template. Default nullRejectionCoeff = 3.0 (configurable). Distances exceeding threshold produce confidence 0.0. |
| DTW-06 | User can save gesture library to JSON file | Node.js `fs.writeFileSync` to save JSON containing: format version, gesture slots (name, label, enabled, threshold, cooldown, axis config, template data, training stats), and metadata. MAX `savedialog` object provides file path via handler message. |
| DTW-07 | User can load gesture library from JSON file | Node.js `fs.readFileSync` + `JSON.parse` to load. MAX `opendialog` object provides file path. On load: validate format version, restore all gesture slots with templates and training stats, resume recognition immediately. |
| DTW-08 | User can delete individual gesture templates | Handler `dtw_delete(slotIndex)` removes the gesture slot and all associated templates/training data. Outlets update to reflect removal. Remaining slots are not renumbered (sparse array with persistent IDs). |
| DTW-09 | User can configure which sensor axes are used for matching | Per-gesture axis configuration: array of active axis names (e.g., ["ax","ay","az","pitch","roll","yaw"]). Auto-detection via variance analysis on recorded examples (axes with variance below threshold are excluded). Manual override via handler message. Axis config is saved in the gesture library JSON. |
| DTW-10 | DTW matching runs at reduced rate (~22Hz) to preserve performance budget | Frame decimation: run DTW matching every 5th processFrame() call (~22Hz at 114Hz input). Use `setImmediate` to yield after each template comparison to avoid blocking serial data parsing. Performance guard: if a single DTW cycle takes >20ms, log a warning and increase decimation factor. |
</phase_requirements>

## Standard Stack

### Core

| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| max-api | (bundled with Node for Max) | Bidirectional communication between JS and MAX patcher | Already used by gesture-engine.js. Required for all node.script communication. |
| serialport | ^12.0.0 | USB serial port communication with Arduino | Already installed in max/node_modules/. Same version used by gesture-engine.js. |
| fs | (Node built-in) | Read/write gesture library JSON files to disk | Standard Node.js file system module. No install needed. |
| path | (Node built-in) | Cross-platform file path construction | Used alongside fs for constructing save/load paths. |
| MadgwickAHRS | (Arduino library, installed) | IMU sensor fusion including quaternion computation | Already used by firmware. Needs header modification to expose quaternion getters. |

### Supporting

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| (none) | - | - | DTW is hand-rolled; no additional npm dependencies needed |

### Alternatives Considered

| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| Hand-rolled DTW | `dynamic-time-warping` npm package | npm package is unmaintained (last updated 2017), lacks Sakoe-Chiba band support, lacks multi-dimensional support. Hand-rolling is ~100-150 lines and gives full control over band width, distance metric, and multi-dimensional handling. |
| Hand-rolled DTW | `dtw` npm package (v0.0.3) | Same issues: last published 11 years ago, no band constraint support, minimal API. |
| Per-template null rejection | Global distance threshold | Per-template thresholds (from training statistics) adapt to each gesture's natural variability. A global threshold would either miss subtle gestures or false-trigger on broad gestures. GRT reference implementation validates this approach. |
| Best-representative template selection | DTW Barycenter Averaging (DBA) | DBA produces a synthetic average template but is significantly more complex to implement. Best-representative selection (pick the example with lowest average pairwise distance) is simpler, well-validated in the GRT, and works well with 3-5 examples. Can upgrade to DBA later if needed. |
| Quaternion in firmware CSV | Quaternion computed in Node.js from pitch/roll/yaw | Computing quaternion from Euler angles loses information (gimbal lock at pitch = +/-90 degrees). The Madgwick filter already computes quaternion internally -- exposing it directly is more accurate and costs almost nothing on the Arduino side. |

**Installation:**
```bash
# No new npm packages needed for DTW matching.
# Arduino firmware needs MadgwickAHRS library modification (add public quaternion getters).
# The MadgwickAHRS library is already installed via the Arduino IDE library manager.
```

## Architecture Patterns

### Recommended Project Structure
```
firmware/
  imu_firmware/
    imu_firmware.ino       # MODIFIED: add quaternion CSV output (13 fields)
max/
  gesture-engine.js        # MODIFIED: add DTW subsystem (~300-400 lines)
  imu-gesture.maxpat       # MODIFIED: add DTW recording/matching UI section
  node_modules/            # EXISTING: serialport (no new deps)
node/
  serial-bridge.js         # MODIFIED: update EXPECTED_FIELDS to 13, parse quaternion
```

### Pattern 1: DTW Matching Engine as a Subsystem Within gesture-engine.js

**What:** The DTW recording, template management, matching, and library persistence are added as a new section within the existing gesture-engine.js file (not a separate file). This follows the established pattern of gesture-engine.js being a self-contained script.

**When to use:** This phase. The DTW subsystem needs access to the same sensor pipeline (calibrated frames, circular buffer, activity gate state) that the predefined gesture detectors use.

```javascript
// DTW subsystem state (added to gesture-engine.js)
var dtwSlots = {};          // gesture slot ID -> { name, label, enabled, threshold, cooldown, ... }
var dtwTemplates = {};      // gesture slot ID -> { template, examples, trainingMu, trainingSigma, ... }
var dtwRecording = null;    // { slotId, buffer: [], mode: "timed"|"toggle", startTime, duration }
var dtwMatchCounter = 0;    // decimation counter for ~22Hz matching
var DTW_MATCH_EVERY = 5;    // match every Nth frame (114/5 = ~22Hz)
var dtwMatchMode = "best";  // "best" or "all"
var dtwContinuousStream = false;  // whether to output continuous confidence
```

### Pattern 2: Recording State Machine

**What:** A state machine that manages the recording workflow: idle -> recording -> captured -> (prompt for more) -> done. Handles both timed and toggle modes.

**When to use:** DTW-01 and DTW-02 implementation.

```javascript
// Recording states
var DTW_STATE_IDLE = "idle";
var DTW_STATE_RECORDING = "recording";
var DTW_STATE_CAPTURED = "captured";
var dtwRecordState = DTW_STATE_IDLE;

function startDTWRecording(slotId, mode, duration) {
  // mode: "timed" (auto-stop after duration ms) or "toggle" (manual stop)
  dtwRecordState = DTW_STATE_RECORDING;
  dtwRecording = {
    slotId: slotId,
    buffer: [],
    mode: mode,
    startTime: Date.now(),
    duration: duration || 2000  // default 2 seconds for timed mode
  };
  maxAPI.outlet("dtw_record_status", "recording", slotId);
}

function stopDTWRecording() {
  if (dtwRecordState !== DTW_STATE_RECORDING) return;
  dtwRecordState = DTW_STATE_CAPTURED;
  // Store recorded example
  var example = dtwRecording.buffer.slice();  // copy the recorded frames
  addExampleToSlot(dtwRecording.slotId, example);
  maxAPI.outlet("dtw_record_status", "captured", dtwRecording.slotId, example.length);
  dtwRecording = null;
}

// Called from processFrame when recording
function recordDTWFrame(calFrame) {
  if (dtwRecordState !== DTW_STATE_RECORDING || !dtwRecording) return;
  dtwRecording.buffer.push(calFrame);
  maxAPI.outlet("dtw_record_progress", dtwRecording.buffer.length);

  // Auto-stop for timed mode
  if (dtwRecording.mode === "timed" &&
      Date.now() - dtwRecording.startTime >= dtwRecording.duration) {
    stopDTWRecording();
  }
}
```

### Pattern 3: Multi-Dimensional DTW with Sakoe-Chiba Band

**What:** The core DTW distance computation that handles N-dimensional sensor frames (selected axes only) with a warping band constraint.

**When to use:** DTW-03 core algorithm.

```javascript
// Multi-dimensional DTW with Sakoe-Chiba band constraint
// Source: GRT DTW algorithm (Nick Gillian), adapted for JavaScript
function dtwDistance(seq1, seq2, activeAxes, bandRadius) {
  var n = seq1.length;
  var m = seq2.length;
  var band = Math.round(bandRadius * Math.max(n, m));

  // Initialize cost matrix with infinity
  var cost = [];
  for (var i = 0; i <= n; i++) {
    cost[i] = new Array(m + 1).fill(Infinity);
  }
  cost[0][0] = 0;

  for (var i = 1; i <= n; i++) {
    // Sakoe-Chiba band: restrict j range
    var jStart = Math.max(1, Math.round(i * m / n) - band);
    var jEnd = Math.min(m, Math.round(i * m / n) + band);

    for (var j = jStart; j <= jEnd; j++) {
      // Multi-dimensional Euclidean distance between frames
      var d = 0;
      for (var k = 0; k < activeAxes.length; k++) {
        var axis = activeAxes[k];
        var diff = seq1[i - 1][axis] - seq2[j - 1][axis];
        d += diff * diff;
      }
      d = Math.sqrt(d);

      // Dynamic programming step
      cost[i][j] = d + Math.min(
        cost[i - 1][j],      // insertion
        cost[i][j - 1],      // deletion
        cost[i - 1][j - 1]   // match
      );
    }
  }

  // Normalize by path length
  return cost[n][m] / (n + m);
}
```

### Pattern 4: Null Rejection via Training Statistics

**What:** Compute per-template rejection thresholds from the statistical distribution of intra-class DTW distances observed during training.

**When to use:** DTW-05 null rejection. Computed after 2+ examples are recorded.

```javascript
// After collecting examples, compute template + training stats
// Source: GRT DTW algorithm (nickgillian/grt)
function computeTemplateAndStats(slotId) {
  var examples = dtwTemplates[slotId].examples;
  if (examples.length < 2) return;  // need at least 2 for statistics

  var slot = dtwSlots[slotId];
  var axes = slot.activeAxes;
  var bandRadius = slot.bandRadius || 0.1;

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
  var bestIdx = avgDistances.indexOf(Math.min.apply(null, avgDistances));
  dtwTemplates[slotId].template = examples[bestIdx];

  // Compute training statistics for null rejection
  var mu = distances.reduce(function(a, b) { return a + b; }, 0) / distances.length;
  var variance = distances.reduce(function(a, b) {
    return a + (b - mu) * (b - mu);
  }, 0) / distances.length;
  var sigma = Math.sqrt(variance);

  dtwTemplates[slotId].trainingMu = mu;
  dtwTemplates[slotId].trainingSigma = sigma;
  // Null rejection threshold = mu + coeff * sigma
  dtwTemplates[slotId].rejectionThreshold = mu + (slot.nullRejectionCoeff || 3.0) * sigma;
}
```

### Pattern 5: Decimated Real-Time Matching with Yield

**What:** Run DTW matching at ~22Hz (every 5th frame) and yield between template comparisons to avoid blocking the serial data pipeline.

**When to use:** DTW-10 performance management.

```javascript
// In processFrame(), after gesture detectors:
dtwMatchCounter++;
if (dtwMatchCounter >= DTW_MATCH_EVERY) {
  dtwMatchCounter = 0;
  scheduleDTWMatch();
}

function scheduleDTWMatch() {
  // Use setImmediate to yield to the event loop between template comparisons
  // This allows serial data parsing to continue unblocked
  var slotIds = Object.keys(dtwSlots).filter(function(id) {
    return dtwSlots[id].enabled && dtwTemplates[id] && dtwTemplates[id].template;
  });

  if (slotIds.length === 0) return;

  // Get the current sliding window as the candidate sequence
  var windowSize = 128;  // ~1.1s at 114Hz -- typical gesture length
  var candidate = [];
  for (var i = windowSize - 1; i >= 0; i--) {
    var f = getFrame(i);
    if (f) candidate.push(f);
  }
  if (candidate.length < 20) return;  // not enough data

  // Process each template with yield
  processNextTemplate(slotIds, 0, candidate);
}

function processNextTemplate(slotIds, idx, candidate) {
  if (idx >= slotIds.length) {
    // All templates processed -- output best match
    emitDTWResults();
    return;
  }

  var slotId = slotIds[idx];
  var template = dtwTemplates[slotId].template;
  var axes = dtwSlots[slotId].activeAxes;
  var bandRadius = dtwSlots[slotId].bandRadius || 0.1;

  var distance = dtwDistance(candidate, template, axes, bandRadius);
  var threshold = dtwTemplates[slotId].rejectionThreshold;
  var confidence = threshold > 0 ? Math.max(0, 1.0 - distance / threshold) : 0;

  // Store result for this slot
  dtwTemplates[slotId].lastConfidence = confidence;

  // Yield then process next template
  setImmediate(function() {
    processNextTemplate(slotIds, idx + 1, candidate);
  });
}
```

### Pattern 6: File Save/Load with MAX Dialog Integration

**What:** Use MAX `savedialog` and `opendialog` objects to get file paths, pass them to gesture-engine.js handlers, and use Node.js `fs` module for actual file I/O.

**When to use:** DTW-06 and DTW-07.

```javascript
// In MAX patch:
// [savedialog JSON] -> [prepend dtw_save] -> [node.script]
// [opendialog JSON] -> [prepend dtw_load] -> [node.script]

// In gesture-engine.js:
var fs = require("fs");

maxAPI.addHandler("dtw_save", function(filepath) {
  var library = {
    version: 1,
    created: new Date().toISOString(),
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

  fs.writeFileSync(filepath, JSON.stringify(library, null, 2));
  maxAPI.outlet("dtw_status", "saved", filepath);
  maxAPI.post("[gesture-engine] DTW library saved to " + filepath);
});

maxAPI.addHandler("dtw_load", function(filepath) {
  try {
    var data = JSON.parse(fs.readFileSync(filepath, "utf8"));
    if (data.version !== 1) {
      maxAPI.post("[gesture-engine] unsupported library version: " + data.version);
      return;
    }
    // Restore all slots and templates
    dtwSlots = {};
    dtwTemplates = {};
    Object.keys(data.slots).forEach(function(id) {
      var s = data.slots[id];
      dtwSlots[id] = {
        name: s.name, label: s.label, enabled: s.enabled,
        threshold: s.threshold, cooldown: s.cooldown,
        activeAxes: s.activeAxes,
        nullRejectionCoeff: s.nullRejectionCoeff,
        bandRadius: s.bandRadius
      };
      dtwTemplates[id] = {
        template: s.template, examples: s.examples,
        trainingMu: s.trainingMu, trainingSigma: s.trainingSigma,
        rejectionThreshold: s.rejectionThreshold
      };
    });
    maxAPI.outlet("dtw_status", "loaded", filepath);
    maxAPI.outlet("dtw_library_info", Object.keys(dtwSlots).length);
    maxAPI.post("[gesture-engine] DTW library loaded: " + Object.keys(dtwSlots).length + " gestures");
  } catch (e) {
    maxAPI.post("[gesture-engine] load error: " + e.message);
  }
});
```

### Pattern 7: Variance-Based Axis Auto-Detection

**What:** After recording examples, analyze per-axis variance to automatically determine which axes carry the most gesture information.

**When to use:** DTW-09 axis selection.

```javascript
function autoDetectAxes(examples) {
  // Compute variance for each axis across all frames of all examples
  var allAxes = ["ax","ay","az","gx","gy","gz","pitch","roll","yaw",
                 "q0","q1","q2","q3"];
  var variances = {};

  allAxes.forEach(function(axis) {
    var values = [];
    examples.forEach(function(ex) {
      ex.forEach(function(frame) {
        if (frame[axis] !== undefined) values.push(frame[axis]);
      });
    });
    if (values.length === 0) { variances[axis] = 0; return; }

    var mean = values.reduce(function(a, b) { return a + b; }, 0) / values.length;
    var variance = values.reduce(function(a, b) {
      return a + (b - mean) * (b - mean);
    }, 0) / values.length;
    variances[axis] = variance;
  });

  // Select axes with variance above 10% of max variance
  var maxVar = Math.max.apply(null, Object.values(variances));
  var threshold = maxVar * 0.1;
  var selected = allAxes.filter(function(axis) {
    return variances[axis] > threshold;
  });

  // Ensure at least 3 axes selected
  if (selected.length < 3) {
    var sorted = allAxes.slice().sort(function(a, b) {
      return variances[b] - variances[a];
    });
    selected = sorted.slice(0, 3);
  }

  return selected;
}
```

### Anti-Patterns to Avoid

- **Running DTW at full 114Hz:** DTW is O(N*M) per template. At 114Hz with 5 templates of ~100 frames each, this would consume the entire CPU budget and block serial parsing. Use decimation (~22Hz) and async yielding.
- **Using a single global rejection threshold:** Different gestures have different natural variability. A tight threshold for a precise gesture would reject a loose gesture; a loose threshold for a broad gesture would false-trigger on noise. Per-template thresholds from training statistics are essential.
- **Averaging template frames directly (not using DTW alignment):** Simply averaging frame-by-frame across examples ignores temporal warping. Either use DTW Barycenter Averaging (complex) or select the best representative example (simple, recommended).
- **Recording during heavy smoothing:** DTW templates should capture the natural dynamics of the gesture. Record from calibrated (pre-smoothing) data, same as predefined gesture detectors.
- **Storing raw Float64 template data in JSON:** Each gesture template of ~100 frames x 13 axes x 8 bytes = ~10KB per example. With 5 examples, that's 50KB per gesture. Truncate to 3-4 decimal places in JSON to reduce file size by ~40%.
- **Blocking the event loop during save/load:** Use synchronous file I/O for simplicity (gesture libraries are small, <1MB), but do NOT process DTW matching during save/load operations.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Quaternion computation from Euler angles | Custom quaternion math in Node.js | Expose Madgwick library's internal quaternion from Arduino firmware | The Madgwick filter already computes quaternions internally. Deriving them from Euler angles is lossy (gimbal lock at pitch +/-90). Exposing the internal values is 4 lines of C++ code. |
| JSON file I/O | Custom binary format | Node.js built-in `fs` + `JSON.stringify/parse` | JSON is human-readable, debuggable, and sharable. File sizes are small (<1MB for large libraries). No need for binary optimization. |
| File dialog UI | Custom text input for paths | MAX `savedialog` and `opendialog` objects | Standard MAX pattern. Platform-native file dialogs with proper type filtering. Zero custom code needed in the patch. |
| Sliding window management | Separate DTW buffer | Existing circular buffer from CORE-04 | The 64-frame circular buffer already exists. Extend it to 128-256 frames for DTW's longer window needs, or add a second DTW-specific buffer. |

**Key insight:** The DTW algorithm itself IS the thing to hand-roll. It's ~100-150 lines of well-understood dynamic programming. The npm alternatives are abandoned and lack the features needed (Sakoe-Chiba band, multi-dimensional, distance normalization). Everything around DTW (file I/O, dialog UI, quaternion math, buffer management) should use existing solutions.

## Common Pitfalls

### Pitfall 1: DTW Matching Blocks Serial Data Parsing
**What goes wrong:** DTW computation for multiple templates takes >8ms per cycle (one serial frame period), causing serial buffer overflow, dropped frames, or audible glitches in downstream audio.
**Why it happens:** DTW is O(N*B) per template where N is the candidate length (~100-200 frames) and B is the band width (~20-40). With 5+ templates, serial computation takes too long.
**How to avoid:** (1) Decimate to ~22Hz (every 5th frame). (2) Use `setImmediate` between template comparisons to yield to the event loop. (3) Monitor computation time and log warnings if >20ms. (4) Use Sakoe-Chiba band to reduce from O(N*M) to O(N*B).
**Warning signs:** Gaps in sensor data, "buffer full" warnings, stuttering visualization, increased latency.

### Pitfall 2: Null Rejection Fails with Too Few Training Examples
**What goes wrong:** With only 1-2 examples, the training statistics (mean, sigma) are unreliable. Sigma may be near-zero, making the rejection threshold essentially equal to the mean, causing everything to be rejected.
**Why it happens:** Statistical measures need sufficient sample size.
**How to avoid:** Require minimum 2 examples before enabling DTW matching for a slot. With exactly 2, use a wider null rejection coefficient (e.g., 5.0 instead of 3.0). Warn the user that more examples improve accuracy. With 1 example, allow recording but don't enable matching until more are added.
**Warning signs:** Gesture matches with very low confidence even for correct gestures. Extremely narrow rejection window.

### Pitfall 3: Quaternion CSV Field Count Breaks Existing Patches
**What goes wrong:** Adding 4 quaternion fields changes the CSV from 9 to 13 values. Existing patches using serial-bridge.js or imu-sensor.maxpat break because `EXPECTED_FIELDS = 9` validation fails.
**Why it happens:** Backward-incompatible firmware change.
**How to avoid:** Two options: (1) Use a firmware flag/command to toggle quaternion output (9-field mode by default, 13-field mode on request); (2) Always output 13 fields but update both serial-bridge.js and gesture-engine.js to accept both 9 and 13 fields. Option 2 is simpler -- just update `EXPECTED_FIELDS` to accept `>= 9` and optionally parse fields 9-12 as quaternion if present.
**Warning signs:** "Invalid CSV" warnings flooding the console. No sensor data getting through.

### Pitfall 4: Variable-Length Gesture Templates Cause Bad DTW Alignment
**What goes wrong:** A user records a 0.5-second gesture and a 3-second gesture. DTW warps the short one to match the long one, producing meaningless distance values and false positives.
**Why it happens:** DTW can handle moderate time distortion but not extreme length ratios (>3:1).
**How to avoid:** Enforce maximum length ratio between candidate and template (e.g., 3:1). If the candidate window is much longer than the template, use a sliding window approach where the candidate window is segmented into overlapping chunks of similar length to the template. Sakoe-Chiba band also helps constrain extreme warping.
**Warning signs:** Very high confidence scores for unrelated motions. Templates of very different lengths matching each other.

### Pitfall 5: Z-Normalization Removes Gesture Amplitude Information
**What goes wrong:** Z-normalizing sensor data (zero mean, unit variance) removes the distinction between a gentle wave and a vigorous wave, causing them to match as identical.
**Why it happens:** Over-aggressive preprocessing.
**How to avoid:** Do NOT z-normalize the raw sensor data for DTW matching. The amplitude of acceleration/rotation IS part of the gesture signature. Only use z-normalization if explicitly matching gesture shape regardless of intensity. For this project, use raw calibrated values (after bias removal, before smoothing).
**Warning signs:** Gentle and vigorous versions of the same gesture have identical DTW distances. False matches between gestures that differ only in intensity.

### Pitfall 6: Continuous Confidence Stream Overwhelms MAX
**What goes wrong:** Outputting confidence values for every gesture slot at 22Hz creates dozens of messages per frame, overwhelming the MAX scheduler and causing UI lag.
**Why it happens:** Too many outlet calls per cycle.
**How to avoid:** Gate the continuous stream behind a toggle. When enabled, batch all confidence values into a single outlet call: `maxAPI.outlet("dtw_confidence", slot1conf, slot2conf, slot3conf, ...)`. Or output only for the best-matching gesture. Let the user choose.
**Warning signs:** MAX console flooded with messages. UI becomes sluggish. Number boxes flickering.

### Pitfall 7: MadgwickAHRS Library Update Breaks Quaternion Access
**What goes wrong:** The Arduino MadgwickAHRS library is updated via the library manager and the custom quaternion getter methods are overwritten.
**Why it happens:** The modification to expose quaternion is made to the installed library files, which are replaced on update.
**How to avoid:** Two approaches: (1) Fork the MadgwickAHRS library locally into the project's `libraries/` directory so it's version-locked. (2) Create a thin wrapper header that inherits from Madgwick and adds the getters. Option 1 is simpler and more reliable.
**Warning signs:** Compilation errors after Arduino IDE library update. Missing quaternion values in CSV output.

## Code Examples

### Arduino Firmware: Quaternion Output Extension

```cpp
// Approach: Add public getter method to MadgwickAHRS.h
// Add to the public section of class Madgwick:
//   void getQuaternion(float *w, float *x, float *y, float *z) {
//     *w = q0; *x = q1; *y = q2; *z = q3;
//   }

// In imu_firmware.ino loop(), after getting pitch/roll/yaw:
float qw, qx, qy, qz;
filter.getQuaternion(&qw, &qx, &qy, &qz);

// Output 13-value CSV: ax,ay,az,gx,gy,gz,pitch,roll,yaw,qw,qx,qy,qz
Serial.print(ax, 2); Serial.print(',');
Serial.print(ay, 2); Serial.print(',');
Serial.print(az, 2); Serial.print(',');
Serial.print(gx, 2); Serial.print(',');
Serial.print(gy, 2); Serial.print(',');
Serial.print(gz, 2); Serial.print(',');
Serial.print(smoothPitch, 2); Serial.print(',');
Serial.print(smoothRoll, 2); Serial.print(',');
Serial.print(smoothYaw, 2); Serial.print(',');
Serial.print(qw, 4); Serial.print(',');
Serial.print(qx, 4); Serial.print(',');
Serial.print(qy, 4); Serial.print(',');
Serial.println(qz, 4);
```

### gesture-engine.js: CSV Field Handling Update

```javascript
// Update to handle both 9-field (legacy) and 13-field (quaternion) CSV
var EXPECTED_FIELDS_MIN = 9;
var EXPECTED_FIELDS_MAX = 13;

function validateLine(line) {
  if (line.startsWith("STARTUP") || line.startsWith("ERROR")) {
    maxAPI.post("[arduino] " + line);
    return null;
  }
  var parts = line.split(",");
  if (parts.length < EXPECTED_FIELDS_MIN || parts.length > EXPECTED_FIELDS_MAX) {
    return null;
  }
  var values = parts.map(Number);
  if (values.some(isNaN)) {
    return null;
  }
  return values;
}

// In processFrame, extract quaternion if present:
var qw = values.length >= 13 ? values[9] : null;
var qx = values.length >= 13 ? values[10] : null;
var qy = values.length >= 13 ? values[11] : null;
var qz = values.length >= 13 ? values[12] : null;

// Output quaternion data
if (qw !== null) {
  maxAPI.outlet("quaternion", qw, qx, qy, qz);
}
```

### Gesture Library JSON Format

```json
{
  "version": 1,
  "created": "2026-02-24T12:00:00.000Z",
  "description": "My gesture library",
  "slots": {
    "1": {
      "name": "gesture-1",
      "label": "Circle Wave",
      "enabled": true,
      "threshold": 0.6,
      "cooldown": 500,
      "activeAxes": ["gx", "gy", "gz", "pitch", "roll"],
      "nullRejectionCoeff": 3.0,
      "bandRadius": 0.1,
      "template": [
        {"ax": 0.02, "ay": -0.15, "az": 0.98, "gx": 12.5, "gy": -8.3, ...},
        {"ax": 0.05, "ay": -0.22, "az": 0.97, "gx": 18.7, "gy": -12.1, ...}
      ],
      "examples": [...],
      "trainingMu": 0.42,
      "trainingSigma": 0.08,
      "rejectionThreshold": 0.66
    }
  }
}
```

### MAX Patch: DTW UI Section (Conceptual)

```
// Recording controls (in imu-gesture.maxpat):
[button "Record"]  --> [prepend dtw_record_start] --> [node.script]
[toggle "Mode"]    --> [sel 0 1] --> [message timed] / [message toggle]
[number "Duration"] --> [prepend dtw_record_duration]

// Per-gesture slot (dynamically added or fixed rows):
[toggle enabled] --> [prepend dtw_enable <slotId>] --> [node.script]
[dial threshold]  --> [prepend dtw_threshold <slotId>] --> [node.script]
[dial cooldown]   --> [prepend dtw_cooldown <slotId>] --> [node.script]
[message delete]  --> [prepend dtw_delete <slotId>] --> [node.script]

// Save/Load:
[savedialog JSON] --> [prepend dtw_save] --> [node.script]
[opendialog JSON] --> [prepend dtw_load] --> [node.script]

// Match output routing:
[route dtw_match dtw_confidence dtw_record_status dtw_status]
  |            |               |                   |
  v            v               v                   v
[outlet]   [outlet]        [status display]    [status display]
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| npm DTW libraries (`dtw`, `dynamic-time-warping`) | Hand-rolled DTW implementation | 2017+ (libraries abandoned) | Must implement DTW directly; gives full control over band width, multi-dimensional support, distance normalization |
| GRT C++ implementation as reference | Same principles, JavaScript adaptation | Ongoing (GRT last updated 2023) | GRT provides validated template selection, null rejection formula, and training pipeline that translates directly to JS |
| 9-field CSV from Arduino | 13-field CSV with quaternion | This phase | Requires firmware modification and backward-compatible CSV parsing |
| Predefined gestures only | Predefined + custom DTW gestures | This phase | gesture-engine.js grows from ~940 lines to ~1300-1400 lines with DTW subsystem |

**Deprecated/outdated:**
- **`dtw` npm package (v0.0.3):** Last published 11 years ago. No maintenance, no Sakoe-Chiba band, no multi-dimensional support.
- **`dynamic-time-warping` npm package (v1.0.0):** Last published 9 years ago. Similar limitations.
- **FastDTW:** The 2005 FastDTW paper proposed an O(N) approximation, but subsequent research (2017, Wu & Keogh) showed it's less accurate than constrained DTW for the same speed. Sakoe-Chiba band DTW at ~22Hz with short templates is fast enough.
- **Arduino firmware "out of scope" note in REQUIREMENTS.md:** The original requirements said "Arduino firmware changes" are out of scope. The Phase 8 CONTEXT.md user decision explicitly overrides this -- quaternion output is required. REQUIREMENTS.md should be updated to reflect this.

## Open Questions

1. **Sliding window length for DTW candidate matching**
   - What we know: Typical gestures last 0.5-3 seconds. At 114Hz, that's 57-342 frames. The current circular buffer is 64 frames (~0.56s), which is too short.
   - What's unclear: Should we increase the existing buffer size (breaking BUFFER_SIZE = 64), add a second DTW-specific buffer, or use a dynamic window that matches template length?
   - Recommendation: Add a separate DTW candidate buffer of 256 frames (~2.25s). This is independent of the 64-frame buffer used by predefined gesture detectors. Each DTW comparison uses a window sized to 1.5x-2x the template length, centered on the most recent frames.

2. **Gesture segmentation approach: sliding window vs activity-gated**
   - What we know: The activity gate already detects motion vs stillness. Predefined gestures fire during "active" state only.
   - What's unclear: Should DTW matching use a fixed sliding window (continuously compare last N frames), or should it be gated by activity (only match when transitioning from active to idle, indicating gesture completion)?
   - Recommendation: Use activity-gated matching as the primary mode: when activity state transitions from active to idle, take the buffered active-period frames as the candidate and run DTW against all templates. This naturally segments gestures without overlap issues. Also support continuous sliding window mode for the "continuous confidence stream" feature.

3. **MAX patch UI for dynamic gesture slots**
   - What we know: User wants "unlimited" gesture slots. MAX patches are static JSON -- you can't dynamically create UI objects at runtime without JavaScript scripting.
   - What's unclear: How to provide dynamic slot management in a static MAX patch.
   - Recommendation: Provide a fixed number of slot rows in the patch (e.g., 8-12 rows) with show/hide capability, plus a text interface for slot management via `message` boxes. The node.script handles unlimited slots internally; the patch provides visual controls for the first N. Additional slots are managed via text commands. This is a pragmatic compromise between unlimited internal capacity and static MAX UI.

4. **`setImmediate` availability in Node for Max**
   - What we know: Node for Max runs Node.js in a separate process. `setImmediate` is a standard Node.js API. However, STATE.md flags this as a concern: "Async DTW pattern in node.script needs validation (setImmediate behavior in Node for Max)."
   - What's unclear: Whether `setImmediate` behaves normally in the Node for Max runtime or has restrictions.
   - Recommendation: Test `setImmediate` in gesture-engine.js during implementation. If it doesn't work, fall back to `setTimeout(fn, 0)` which provides similar yielding behavior. Both should allow the serial data parser to process between DTW computations.

5. **MadgwickAHRS library modification approach**
   - What we know: The library stores quaternion internally as private members q0-q3. The official library does NOT expose getQuaternion() in the current release. PR #21 adds it but was never merged.
   - What's unclear: Whether to modify the installed library in-place, fork it into the project, or use a different approach.
   - Recommendation: Copy the MadgwickAHRS library files (MadgwickAHRS.h, MadgwickAHRS.cpp) into the project's firmware directory (e.g., `firmware/imu_firmware/MadgwickLocal.h`) and add the getQuaternion method. This avoids modifying the global Arduino library installation and is immune to library updates overwriting the change. The firmware `#include` changes from `<MadgwickAHRS.h>` to `"MadgwickLocal.h"`.

## Sources

### Primary (HIGH confidence)
- [GRT DTW Implementation (DTW.h)](https://github.com/nickgillian/grt/blob/master/GRT/ClassificationModules/DTW/DTW.h) - Template structure, null rejection threshold formula, training pipeline, distance methods
- [GRT DTW Implementation (DTW.cpp)](https://github.com/nickgillian/grt/blob/master/GRT/ClassificationModules/DTW/DTW.cpp) - Complete training/prediction pipeline, best-representative template selection, Sakoe-Chiba band implementation, confidence scoring
- [GRT DTW Wiki](https://github.com/nickgillian/grt/wiki/dtw) - Algorithm overview, null rejection capability, configuration parameters
- [MadgwickAHRS Library (GitHub)](https://github.com/arduino-libraries/MadgwickAHRS) - Class definition with private quaternion members, PR #21 for getQuaternion
- [MadgwickAHRS.h](https://github.com/arduino-libraries/MadgwickAHRS/blob/master/src/MadgwickAHRS.h) - Confirmed: getQuaternion() NOT in current release; q0/q1/q2/q3 are private
- Existing codebase: `max/gesture-engine.js` (942 lines), `firmware/imu_firmware/imu_firmware.ino`, `node/serial-bridge.js`

### Secondary (MEDIUM confidence)
- [Dynamic Time Warping - Wikipedia](https://en.wikipedia.org/wiki/Dynamic_time_warping) - Algorithm description, complexity analysis
- [Sakoe-Chiba Band explanation (rtavenar)](https://rtavenar.github.io/hdr/parts/01/dtw.html) - Band parametrization: radius r, constraint visualization
- [IMU Sensor-Based Hand Gesture Recognition (MDPI)](https://www.mdpi.com/1424-8220/19/18/3827) - DTW superiority for time-dependent IMU data, 98.6% accuracy result
- [Head Gesture Recognition with Activity Detection + DTW (PMC)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11122069/) - Activity detection combined with DTW for gesture segmentation
- [Node for Max API Documentation](https://docs.cycling74.com/max8/vignettes/07_n4m_maxapi) - outlet, addHandler, getDict, setDict, post methods
- [MAX savedialog Reference](https://docs.cycling74.com/max5/refpages/max-ref/savedialog.html) - File save dialog with type filtering

### Tertiary (LOW confidence)
- `setImmediate` behavior in Node for Max runtime -- needs validation during implementation (flagged in STATE.md)
- Default DTW parameters (band radius 0.1, null rejection coefficient 3.0) -- from GRT defaults, need hardware validation
- Performance estimates for DTW at 22Hz with 5-10 templates -- extrapolated from algorithm complexity, needs benchmarking

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH -- no new dependencies needed; DTW is hand-rolled, quaternion access is a 4-line C++ addition
- Architecture: MEDIUM-HIGH -- DTW subsystem pattern is well-validated via GRT reference; Node for Max integration is proven by existing gesture-engine.js; `setImmediate` needs validation
- Pitfalls: HIGH -- informed by GRT documentation, DTW literature, and 7 phases of project experience
- Firmware modification: MEDIUM -- quaternion access is straightforward but requires local library fork to avoid update fragility
- DTW algorithm: HIGH -- well-understood dynamic programming; GRT provides complete reference implementation

**Research date:** 2026-02-24
**Valid until:** 2026-03-24 (stable domain, no rapidly changing dependencies)

---
*Phase: 08-custom-dtw-gesture-recognition*
*Research completed: 2026-02-24*
