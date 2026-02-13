# Phase 3: Calibration - Research

**Researched:** 2026-02-12
**Domain:** IMU bias calibration, orientation reset, Node for Max control messaging, MAX UI
**Confidence:** HIGH

## Summary

Phase 3 adds interactive calibration to the existing serial bridge pipeline. The core work lives in `serial-bridge.js` (Node layer) with UI controls added to `sensor-pipeline.maxpat`. There are three distinct subsystems to build: (1) gyro + accelerometer bias offset calibration via stationary sample averaging, (2) full orientation reset (pitch/roll/yaw to zero) with smooth transition, and (3) MAX UI for controlling all of it with visual feedback.

The calibration algorithm is well-established: collect N samples while the board is stationary, compute the mean of each axis, and subtract those means as bias offsets from all subsequent readings. For the accelerometer, the Z-axis bias must account for gravity (expected value is 1g, not 0). The orientation reset uses a "save and subtract" pattern: capture the current pitch/roll/yaw as offsets and subtract them from subsequent orientation values, with an exponential decay function to smooth the transition rather than snapping instantly. All state is session-only -- no persistence needed.

The MAX UI uses `textbutton` objects in toggle mode for calibration start/stop, `slider` configured horizontally for the progress bar, and `message` boxes for bias offset display and status text. The existing `route` object expands to handle new calibrated data tags. New calibrated outlets are added alongside the existing raw outlets, keeping raw data untouched.

**Primary recommendation:** Implement all calibration logic in `serial-bridge.js` using `maxAPI.addHandler()` for control messages and new `maxAPI.outlet()` tags for calibrated data, progress, and bias display. Use simple arithmetic averaging for bias calculation (no Kalman filter, no complex estimation). Use exponential decay smoothing in Node for the orientation reset transition.

<user_constraints>

## User Constraints (from CONTEXT.md)

### Locked Decisions

#### Calibration workflow
- Toggle button: click once to start collecting samples, click again to stop and apply
- Explicit reset button clears all bias offsets and returns to raw uncorrected values (distinct from re-calibrating)
- Calibration state is session-only -- starts fresh each time the patch opens (gyro drift changes between sessions anyway)
- Calibrates both gyro AND accelerometer (zero-offset correction so flat = exactly 0,0,1g)

#### Yaw reset behavior
- Full orientation reset: zeroing all three axes (pitch, roll, yaw), not yaw-only
- All axes smoothly transition to zero (not instant snap) -- avoids jarring jumps when mapped to audio parameters
- Restorable: reset captures an offset, a second button restores the original gravity-referenced frame

#### Feedback during calibration
- Progress bar in MAX while collecting samples (finite vs infinite bar is Claude's discretion)
- After calibration applied: status text changes AND computed bias offsets are displayed (e.g. gX: -0.42, gY: 0.18)
- Orientation reset shows a brief "Orientation reset" status message alongside the smooth value transition

#### Output architecture
- Separate outlets for raw vs calibrated data -- raw accel/gyro outlets stay untouched, new calibrated outlets added
- Orientation reset output routing is Claude's discretion (separate outlets or in-place modification -- pick the most practical MAX wiring)
- All calibration controls added to the existing sensor-pipeline.maxpat (not a separate patch)

### Claude's Discretion

- Minimum sample count threshold before calibration can be applied (or trust the user)
- Progress bar style: finite with target sample count vs infinite activity indicator
- Orientation reset outlet routing pattern
- Smooth transition duration for orientation reset

### Deferred Ideas (OUT OF SCOPE)

None -- discussion stayed within phase scope

</user_constraints>

## Discretion Recommendations

Based on research, here are my recommendations for the areas marked as Claude's discretion:

### 1. Minimum Sample Count: Use a target of 200 samples (~1.75 seconds at 114 Hz)
**Rationale:** The gyro zero-rate offset for MEMS sensors like the LSM6DS3 family is typically 10-30 dps. Averaging over 200 samples provides sufficient statistical averaging to get a stable bias estimate. Too few samples (< 50) risk capturing transient noise as bias. Too many (> 500) make calibration tediously long for a live performance tool. 200 samples is ~1.75 seconds -- quick enough for live use, long enough for stable averaging. The user can always stop early (minimum enforced at 50 samples to prevent garbage calibration).

### 2. Progress Bar Style: Finite with target of 200 samples
**Rationale:** A finite progress bar with a known target (200 samples) gives the user clear feedback about how long to hold still. It reaches 100% at the target count, after which the user can stop (or continue for more accuracy). This is more informative than an infinite spinner during a live performance where the user wants to minimize downtime.

### 3. Orientation Reset Outlet Routing: In-place modification on existing calibrated outlets
**Rationale:** Adding separate orientation reset outlets would create too many outlets to wire. The calibrated orientation outlets should output the reset-adjusted values. When orientation is reset, the calibrated orientation values smoothly transition to zero and then track from the new reference. This is the most practical MAX wiring pattern because downstream patches just connect to the calibrated orientation outlet once and get correct values regardless of whether orientation has been reset.

### 4. Smooth Transition Duration: 500ms exponential decay
**Rationale:** The exponential decay formula `value += (target - value) * (1 - exp(-speed * dt))` with `speed = 10` converges to within 1% of target in ~500ms. This is fast enough to feel responsive but slow enough to avoid jarring jumps when mapped to audio parameters. At 114 Hz sample rate, this produces ~57 intermediate steps -- very smooth.

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| max-api | (built-in) | MAX<->Node communication | Provided by MAX runtime; handles all messaging |
| serialport | 12.0.0 | Serial port communication | Already installed from Phase 2 |

### Supporting
No new npm dependencies required. All calibration logic is pure arithmetic (averaging, subtraction, exponential decay). No external math libraries needed.

### Installation
No new installation required. Phase 3 extends existing `serial-bridge.js` and `sensor-pipeline.maxpat`.

## Architecture Patterns

### Current Architecture (from Phase 2)

```
[Arduino] --serial--> [serial-bridge.js] --outlet()--> [sensor-pipeline.maxpat]
                       |                                |
                       | Raw data flow:                 | route accel gyro orientation status
                       | validateLine() -> outputData() | -> unpack -> flonum displays
```

### Phase 3 Architecture Extension

```
[sensor-pipeline.maxpat]
  |
  | Control messages (MAX -> Node):
  | "calibrate_start"   -- begin collecting samples
  | "calibrate_stop"    -- stop collecting and apply bias offsets
  | "calibrate_reset"   -- clear all bias offsets, return to raw
  | "orient_reset"      -- capture current orientation as zero offset
  | "orient_restore"    -- remove orientation offset, restore gravity frame
  |
  v
[serial-bridge.js]
  |
  | Calibration state (all session-only):
  | - isCalibrating: boolean
  | - sampleCount: number
  | - sampleSums: {ax,ay,az,gx,gy,gz} running sums
  | - biasOffsets: {ax,ay,az,gx,gy,gz} computed means (null until calibrated)
  | - orientOffset: {pitch,roll,yaw} captured orientation offset (null until reset)
  | - orientBlendFactor: 0.0-1.0 for smooth transition
  |
  | Data flow (with calibration applied):
  | validateLine() -> outputRawData() -> applyCalibration() -> outputCalibratedData()
  |
  | New outlet tags:
  | "cal_accel"      -- calibrated accelerometer (bias-corrected)
  | "cal_gyro"       -- calibrated gyroscope (bias-corrected)
  | "cal_orientation"-- calibrated orientation (bias-corrected + orient reset)
  | "cal_status"     -- calibration state: "idle" | "collecting" | "applied"
  | "cal_progress"   -- sample count / target count (for progress bar)
  | "cal_bias"       -- computed bias offsets after calibration applied
  |
  v
[sensor-pipeline.maxpat]
  |
  | route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias
```

### Pattern 1: Stationary Sample Averaging for Bias Calibration
**What:** While calibrating, accumulate the sum of each sensor axis across N samples. When calibration stops, divide by N to get the mean. This mean IS the bias offset. Subtract it from all subsequent readings.
**When to use:** Always -- this is THE standard technique for MEMS IMU zero-offset calibration.
**Example:**
```javascript
// Source: Standard IMU calibration technique (VectorNav, ST application notes)
// State variables
let isCalibrating = false;
let sampleCount = 0;
let sampleSums = { ax: 0, ay: 0, az: 0, gx: 0, gy: 0, gz: 0 };
let biasOffsets = null; // null = uncalibrated

const TARGET_SAMPLES = 200; // ~1.75 seconds at 114 Hz
const MIN_SAMPLES = 50;     // minimum before allowing apply

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
  // Report progress: current / target
  maxAPI.outlet("cal_progress", sampleCount, TARGET_SAMPLES);
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
    az: sampleSums.az / sampleCount - 1.0, // Z-axis expects 1g, not 0
    gx: sampleSums.gx / sampleCount,
    gy: sampleSums.gy / sampleCount,
    gz: sampleSums.gz / sampleCount
  };
  maxAPI.outlet("cal_status", "applied");
  maxAPI.outlet("cal_bias",
    biasOffsets.ax, biasOffsets.ay, biasOffsets.az,
    biasOffsets.gx, biasOffsets.gy, biasOffsets.gz);
}

function applyCal(ax, ay, az, gx, gy, gz) {
  if (!biasOffsets) return { ax, ay, az, gx, gy, gz };
  return {
    ax: ax - biasOffsets.ax,
    ay: ay - biasOffsets.ay,
    az: az - biasOffsets.az,
    gx: gx - biasOffsets.gx,
    gy: gy - biasOffsets.gy,
    gz: gz - biasOffsets.gz
  };
}
```

### Pattern 2: Save-and-Subtract Orientation Reset with Exponential Decay
**What:** Capture the current pitch/roll/yaw as an offset. Subtract the offset from subsequent orientation values. Use exponential decay to smoothly blend from the pre-reset values to the post-reset values over ~500ms.
**When to use:** For the orientation reset feature (CALB-05 expanded to all axes per user decision).
**Example:**
```javascript
// Source: navX-MXP "Save & Subtract" pattern + exponential smoothing
let orientOffset = null;    // {pitch, roll, yaw} - null means no offset
let blendFactor = 1.0;     // 1.0 = fully applied, ramps from 0 to 1
const BLEND_SPEED = 10;    // converges ~99% in 500ms

function resetOrientation(currentPitch, currentRoll, currentYaw) {
  orientOffset = {
    pitch: currentPitch,
    roll: currentRoll,
    yaw: currentYaw
  };
  blendFactor = 0.0; // start smooth transition
  maxAPI.outlet("cal_status", "orient_reset");
}

function restoreOrientation() {
  // Smooth transition back: set offset to zero with blend
  orientOffset = null;
  blendFactor = 0.0; // smooth transition back
  maxAPI.outlet("cal_status", "orient_restored");
}

function applyOrientReset(pitch, roll, yaw, dt) {
  // Advance blend factor toward 1.0 with exponential decay
  if (blendFactor < 0.999) {
    blendFactor += (1.0 - blendFactor) * (1.0 - Math.exp(-BLEND_SPEED * dt));
  } else {
    blendFactor = 1.0;
  }

  if (!orientOffset) return { pitch, roll, yaw };

  // Interpolate between original and reset values
  var offsetPitch = orientOffset.pitch * blendFactor;
  var offsetRoll = orientOffset.roll * blendFactor;
  var offsetYaw = orientOffset.yaw * blendFactor;

  return {
    pitch: pitch - offsetPitch,
    roll: roll - offsetRoll,
    yaw: yaw - offsetYaw
  };
}
```

### Pattern 3: Extended Route Object for Calibrated Data
**What:** Expand the existing `route` object to include new tags for calibrated data streams. Raw outlets remain untouched. New calibrated outlets are added.
**When to use:** Always -- this keeps the existing patch wiring functional while adding calibration.
**Example (MAX patch structure):**
```
[node.script serial-bridge.js @autostart 1]
  |
[route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias]
  |     |     |        |       |         |        |            |          |           |
 raw   raw   raw     conn    cal-aXYZ  cal-gXYZ  cal-orient  cal-state  progress   bias-vals
```

### Pattern 4: textbutton Toggle for Calibration Control
**What:** Use MAX `textbutton` objects in toggle mode (mode 1) for calibration start/stop and orientation reset/restore. The button text changes to reflect current state.
**When to use:** For all toggle-style calibration controls.
**Example (MAX object configuration):**
```
textbutton:
  mode: 1 (toggle)
  text: "Calibrate"       (off state)
  texton: "Stop & Apply"  (on state)
  -> output 0/1 -> message "calibrate_start" or "calibrate_stop"

textbutton:
  mode: 0 (button/bang)
  text: "Reset Calibration"
  -> bang -> message "calibrate_reset"

textbutton:
  mode: 1 (toggle)
  text: "Reset Orientation"
  texton: "Restore Frame"
  -> output 0/1 -> message "orient_reset" or "orient_restore"
```

### Anti-Patterns to Avoid

- **Calibrating while moving:** The calibration algorithm assumes the board is stationary. Moving during calibration produces garbage offsets. The UI should clearly instruct "Hold board still" during calibration. No motion detection is needed -- trust the user per the live performance context.

- **Applying bias correction to orientation values directly:** Bias offsets apply to RAW accelerometer and gyroscope readings, NOT to the computed orientation angles. The Arduino firmware runs Madgwick on raw values. If we want calibrated orientation, the Arduino would need to receive bias offsets -- but per the architecture, calibration runs in Node. Since the Madgwick filter runs on the Arduino, we calibrate the raw accel/gyro values in Node and output them as `cal_accel` and `cal_gyro`. The orientation values from the Arduino already have the Madgwick filter applied to uncalibrated raws. The orientation reset (save-and-subtract) is the appropriate tool for zeroing orientation.

- **Persisting calibration across sessions:** Gyro bias drifts with temperature and time. Saved offsets from a previous session would likely be wrong. Fresh calibration each session is correct.

- **Using line~ or signal-rate smoothing for orientation reset:** The data rate is 114 Hz (control rate), not audio rate. Use Node-side exponential decay, not MAX signal objects.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Bias estimation | Kalman filter, recursive least squares | Simple arithmetic mean | Stationary calibration is a solved problem; mean is optimal for zero-mean noise |
| Smooth transitions | Custom easing curves, bezier interpolation | Exponential decay `x += (target - x) * (1 - exp(-speed * dt))` | Frame-rate independent, single parameter to tune, well-understood behavior |
| Progress bar | Custom jsui drawing | MAX `slider` object with `orientation 1` (horizontal) and `setminmax 0 200` | Built-in MAX object, no code needed |
| Toggle button with state labels | `toggle` + `message` box chains | MAX `textbutton` in mode 1 | Single object handles both display states and output |
| Status text display | Custom text rendering | MAX `message` box with right inlet for setting display text | Already used for connection status in Phase 2 |

**Key insight:** This phase is almost entirely "plumbing" -- connecting simple arithmetic (mean, subtract) to UI controls. Every component exists as a standard pattern. The complexity is in getting the data flow right, not in any individual algorithm.

## Common Pitfalls

### Pitfall 1: Forgetting the 1g Gravity Offset on Accelerometer Z-Axis
**What goes wrong:** After calibration, the Z-axis reads ~0g instead of ~1g when the board is flat.
**Why it happens:** The calibration computes the mean of Z-axis samples. When flat, Z reads ~1g (gravity). If you subtract the mean (1g), you get 0g -- which is wrong. The board IS experiencing 1g of gravity when flat.
**How to avoid:** For the Z-axis accelerometer bias, subtract `(mean - 1.0)` instead of `mean`. This way, flat reads exactly 1.0g after calibration. Equivalently: `biasZ = meanZ - 1.0`, then corrected `az = raw_az - biasZ`.
**Warning signs:** Calibrated Z-axis shows ~0 when flat instead of ~1.

### Pitfall 2: Orientation Reset Not Accounting for Yaw Wrapping
**What goes wrong:** Orientation reset produces jumps or discontinuities when yaw is near 0/360 boundary.
**Why it happens:** Yaw is output as 0-360 degrees from the Arduino. If current yaw is 350 and offset is 350, subtracting gives 0 -- correct. But if yaw later crosses to 5, subtracting 350 gives -345 -- wrong (should be 15).
**How to avoid:** After subtracting the yaw offset, normalize the result to 0-360 range: `yaw = ((yaw - offset) % 360 + 360) % 360`. This handles both positive and negative wraparound.
**Warning signs:** Yaw jumps by ~360 degrees when crossing the 0/360 boundary after orientation reset.

### Pitfall 3: Calibration Outlet Calls Adding Excessive IPC Overhead
**What goes wrong:** Adding 3+ new outlet calls per sample (cal_accel, cal_gyro, cal_orientation) on top of the existing 3 calls = 6+ outlet calls per sample at 114 Hz = 684+ calls/sec, causing MAX UI sluggishness.
**Why it happens:** Each `maxAPI.outlet()` call crosses the Node-to-MAX process boundary.
**How to avoid:** Only output calibrated data when calibration is actually applied (`biasOffsets !== null`). When uncalibrated, the raw outlets carry the same data -- no need to duplicate. Output progress and bias info sparingly (progress once per sample during calibration only, bias once when calibration completes). Total steady-state calls should stay at 4-5 per sample maximum.
**Warning signs:** MAX UI becomes sluggish, visible latency between physical movement and display update.

### Pitfall 4: Blend Factor Never Reaching Exactly 1.0 with Exponential Decay
**What goes wrong:** Exponential decay asymptotically approaches the target but never reaches it. `blendFactor` gets to 0.9999 but never 1.0, causing tiny floating-point errors in orientation values forever.
**Why it happens:** Mathematical property of exponential decay -- it converges but never arrives.
**How to avoid:** Snap to 1.0 when close enough: `if (blendFactor > 0.999) blendFactor = 1.0`. This prevents permanent floating-point noise.
**Warning signs:** Calibrated orientation values have tiny persistent offsets (~0.001 degrees) that never fully resolve.

### Pitfall 5: Calibration State Surviving Node Script Restart but Not Being Useful
**What goes wrong:** If node.script is stopped and restarted (but MAX patch stays open), the JavaScript module reloads and calibration state is lost. The user thinks calibration is still active because the UI toggle is still "on."
**Why it happens:** Node variables are destroyed on script restart. MAX UI state persists independently.
**How to avoid:** On script startup, always send `maxAPI.outlet("cal_status", "idle")` to reset the UI to the uncalibrated state. This syncs Node state with MAX display.
**Warning signs:** After script restart, UI shows "calibrated" but values are uncalibrated.

### Pitfall 6: Calibration vs Orientation Reset Interaction
**What goes wrong:** User calibrates (bias offsets applied), then resets orientation. The orientation offset captures values that already have bias correction. Later, if calibration is reset, the orientation offset becomes invalid because it was computed from calibrated values.
**Why it happens:** The orientation offset and bias offsets are independent systems but operate on the same data pipeline.
**How to avoid:** When calibration is reset (`calibrate_reset`), also clear the orientation offset. Document this in the UI: "Resetting calibration also clears orientation reset." Alternatively, store whether orientation was reset with or without calibration and adjust accordingly -- but this adds complexity. Clearing both is simpler and safer.
**Warning signs:** After resetting calibration, the orientation values jump to unexpected positions.

## Code Examples

Verified patterns from the existing codebase and official sources:

### Complete Data Flow with Calibration (Node.js)
```javascript
// Source: Extends existing serial-bridge.js pattern
// This shows the modified outputData() function with calibration

function outputData(values) {
  var ax = values[0], ay = values[1], az = values[2];
  var gx = values[3], gy = values[4], gz = values[5];
  var pitch = values[6], roll = values[7], yaw = values[8];

  // Always output raw (unchanged from Phase 2)
  maxAPI.outlet("accel", ax, ay, az);
  maxAPI.outlet("gyro", gx, gy, gz);
  maxAPI.outlet("orientation", pitch, roll, yaw);

  // Collect calibration sample if calibrating
  if (isCalibrating) {
    collectSample(ax, ay, az, gx, gy, gz);
  }

  // Output calibrated data if bias offsets exist
  if (biasOffsets) {
    var cal = applyCal(ax, ay, az, gx, gy, gz);
    maxAPI.outlet("cal_accel", cal.ax, cal.ay, cal.az);
    maxAPI.outlet("cal_gyro", cal.gx, cal.gy, cal.gz);

    // Apply orientation reset to orientation values
    var orient = applyOrientReset(pitch, roll, yaw);
    maxAPI.outlet("cal_orientation", orient.pitch, orient.roll, orient.yaw);
  }
}
```

### MAX Handler Registration (Node.js)
```javascript
// Source: Extends existing maxAPI.addHandler() pattern from Phase 2

maxAPI.addHandler("calibrate_start", function () {
  startCalibration();
});

maxAPI.addHandler("calibrate_stop", function () {
  stopCalibrationAndApply();
});

maxAPI.addHandler("calibrate_reset", function () {
  biasOffsets = null;
  orientOffset = null;  // Also clear orientation reset
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
```

### MAX Patch: textbutton Toggle to Message (MAX pseudo-patch)
```
[textbutton mode:1 text:"Calibrate" texton:"Stop & Apply"]
  |
[select 1 0]
  |        |
[message "calibrate_start"]  [message "calibrate_stop"]
  |                           |
  +---------------------------+
  |
  v
[node.script serial-bridge.js]
```

### MAX Patch: Progress Bar via slider
```
[route ... cal_progress ...]
  |
[unpack i i]           -- sampleCount, targetCount
  |        |
  |    [/ 200]         -- normalize: targetCount for display if needed
  |        |
[slider @orientation 1 @size 200 0]  -- horizontal slider, range 0-200
```

### MAX Patch: Bias Offset Display
```
[route ... cal_bias ...]
  |
[unpack f f f f f f]   -- ax, ay, az, gx, gy, gz
  |  |  |  |  |  |
[sprintf "aX:%.2f aY:%.2f aZ:%.2f gX:%.2f gY:%.2f gZ:%.2f"]
  |
[message]              -- displays formatted bias string
```

### Timing for Exponential Decay (Node.js)
```javascript
// Source: Frame-rate independent exponential smoothing
// Track time between samples for dt calculation
let lastSampleTime = null;

function getTimeDelta() {
  var now = Date.now();
  if (lastSampleTime === null) {
    lastSampleTime = now;
    return 1.0 / 114.0; // assume ~114 Hz on first sample
  }
  var dt = (now - lastSampleTime) / 1000.0; // seconds
  lastSampleTime = now;
  return dt;
}
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| 6-position static calibration (flip board to all orientations) | Simple stationary averaging (hold flat once) | Always been valid for zero-offset correction | Single-position is sufficient for bias; 6-position adds scale factor and cross-axis correction which is overkill for this use case |
| Instant snap for orientation reset | Exponential decay smooth transition | Common in game dev / audio since ~2015 | Prevents jarring parameter jumps when mapped to audio |
| Persist calibration to file | Session-only calibration | Specific to MEMS gyros with thermal drift | Eliminates stale calibration data that would cause worse performance than no calibration |

**Deprecated/outdated:**
- Complex multi-position calibration with least-squares fitting: Overkill for this use case. Simple mean subtraction handles zero-offset bias. Scale factor and cross-axis errors are negligible for musical applications.

## Important Architecture Note: Calibration vs. Madgwick Filter Location

The Arduino runs the Madgwick filter on raw (uncalibrated) sensor data. The calibration runs in Node.js. This creates a subtlety:

- **Calibrated accel/gyro outlets:** These are raw values with bias subtracted in Node. Useful for downstream processing that needs clean raw sensor values.
- **Calibrated orientation outlets:** The Arduino's orientation output (pitch/roll/yaw) was computed from UNcalibrated raw data. Applying bias correction to the raw values in Node does NOT retroactively fix the orientation. The orientation reset (save-and-subtract) is the correct mechanism for zeroing orientation angles.
- **Why this is acceptable:** The Madgwick filter internally compensates for gyro bias through its own convergence. The filter's orientation output is already reasonably correct. The orientation reset handles the remaining offset. For Phase 4+ where more precise orientation is needed, the calibrated raw values could be fed to a second Madgwick instance in Node -- but this is out of scope for Phase 3.

This means the calibration system has two independent correction paths:
1. **Bias offsets** for raw sensor values (cal_accel, cal_gyro)
2. **Orientation reset** for angular values (cal_orientation)

They are complementary, not redundant.

## Open Questions

1. **Outlet call count at 114 Hz with calibration**
   - What we know: Phase 2 uses 3 outlet calls per sample (accel, gyro, orientation) = 342 calls/sec. Adding calibrated outlets adds up to 3 more = 684 calls/sec max.
   - What's unclear: Whether 684 outlet calls/sec causes IPC performance issues. Phase 2 research flagged this as LOW confidence.
   - Recommendation: Start with full outlet calls. If sluggish, consolidate calibrated data into fewer calls (e.g., single `cal_data` with all 9 values). Can also skip calibrated outlets when biasOffsets is null.

2. **Accelerometer Z-axis gravity direction**
   - What we know: When flat, the LSM6DS3 Z-axis should read +1g. The firmware outputs raw Z values. The SparkFun library reads acceleration in g units.
   - What's unclear: Whether the Z-axis reads +1.0 or -1.0 when flat, depending on board orientation and library sign convention.
   - Recommendation: During implementation, read the actual Z value when flat. If it reads positive, bias = mean - 1.0. If negative, bias = mean + 1.0. The sign will be obvious from the raw data during testing.

3. **Yaw wrapping range**
   - What we know: The Madgwick filter on the Arduino outputs yaw via `filter.getYaw()`. The EMA wrapping code in the firmware normalizes to 0-360.
   - What's unclear: Whether the output is strictly 0-360 or could be -180 to +180 depending on the library version.
   - Recommendation: Check the actual yaw range during testing. Adjust the wrapping normalization in the orientation reset accordingly.

## Sources

### Primary (HIGH confidence)
- [VectorNav IMU Calibration Guide](https://www.vectornav.com/resources/inertial-navigation-primer/specifications--and--error-budgets/specs-imucal) -- Standard stationary averaging technique for IMU bias calibration
- [Cycling '74 Node for Max API](https://docs.cycling74.com/nodeformax/api/module-max-api.html) -- addHandler(), outlet() method signatures
- [Max line object reference](https://docs.cycling74.com/max8/refpages/line) -- Ramp generation for smooth transitions (decided against in favor of Node-side exponential decay)
- [Max textbutton object reference](https://docs.cycling74.com/max7/refpages/textbutton) -- Toggle mode with state-dependent text labels
- [Max multislider / slider references](https://docs.cycling74.com/legacy/max8/refpages/multislider) -- Progress bar configuration options
- Existing codebase: `serial-bridge.js`, `sensor-pipeline.maxpat`, `imu_firmware.ino` -- verified current outlet tags, handler patterns, data format

### Secondary (MEDIUM confidence)
- [Adafruit Gyroscope Datasheet Comparison](https://learn.adafruit.com/comparing-gyroscope-datasheets/overview) -- LSM6DS-family zero-rate offset typically 10-30 dps
- [navX-MXP Yaw Drift Guidance](https://pdocs.kauailabs.com/navx-mxp/guidance/yaw-drift/) -- "Save & Subtract" pattern for orientation reset
- [Exponential Smoothing Blog](https://lisyarus.github.io/blog/posts/exponential-smoothing.html) -- Frame-rate independent exponential decay formula: `x += (target - x) * (1 - exp(-speed * dt))`
- [All About Circuits: Accelerometer Zero-g Bias](https://www.allaboutcircuits.com/technical-articles/capacitive-mems-accelerometer-offset-error-accelerometer-calibration-zero-g-offset/) -- Accelerometer zero-g offset correction technique
- [Frame-Rate Independent Damping](https://www.rorydriscoll.com/2016/03/07/frame-rate-independent-damping-using-lerp/) -- Mathematical derivation of exponential decay smoothing
- [Cycling '74 Forum: GUI Progress Bar](https://cycling74.com/forums/gui-progress-bar) -- Community patterns for progress bar in MAX

### Tertiary (LOW confidence)
- LSM6DS3 specific zero-rate offset value -- could not access full datasheet; using comparable device specs (10-30 dps typical for this sensor family)
- maxAPI.outlet() throughput at 684 calls/sec -- no official documentation; recommendation based on Phase 2 experience at 342 calls/sec

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH -- no new dependencies, extends existing Phase 2 code
- Calibration algorithm: HIGH -- stationary mean averaging is the textbook approach, verified against multiple authoritative IMU calibration guides
- Orientation reset: HIGH -- save-and-subtract is the standard pattern, used by navX-MXP and other production IMU systems
- Smooth transition: HIGH -- exponential decay is mathematically well-founded, frame-rate independent formula verified against multiple sources
- MAX UI patterns: MEDIUM -- textbutton and slider objects are documented; exact configuration for progress bar is standard but not verified end-to-end
- IPC performance at higher call rate: LOW -- no official throughput documentation for maxAPI.outlet()

**Research date:** 2026-02-12
**Valid until:** 2026-03-14 (30 days -- stable domain, calibration algorithms and MAX UI are mature)
