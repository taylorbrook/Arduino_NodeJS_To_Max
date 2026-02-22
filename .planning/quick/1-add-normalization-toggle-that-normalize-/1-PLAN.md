---
phase: quick
plan: 1
type: execute
wave: 1
depends_on: []
files_modified:
  - node/serial-bridge.js
  - max/sensor-pipeline.maxpat
  - max/imu-sensor.maxpat
autonomous: true
requirements: [NORM-01]
must_haves:
  truths:
    - "User can toggle normalization on/off from MAX patch"
    - "When normalization is on, all smooth_accel/smooth_gyro/smooth_orientation outlets emit values in 0.0-1.0 range"
    - "When normalization is off, outlets emit raw calibrated values (existing behavior)"
    - "Normalization state survives reconnection (persists until toggled off)"
  artifacts:
    - path: "node/serial-bridge.js"
      provides: "Normalization logic and toggle handler"
      contains: "normalize"
    - path: "max/sensor-pipeline.maxpat"
      provides: "Normalization toggle UI and message routing"
    - path: "max/imu-sensor.maxpat"
      provides: "Normalization toggle forwarding in abstraction"
  key_links:
    - from: "max/sensor-pipeline.maxpat"
      to: "node/serial-bridge.js"
      via: "message 'normalize 0/1' to node.script"
      pattern: "normalize"
    - from: "node/serial-bridge.js"
      to: "maxAPI.outlet"
      via: "norm_accel/norm_gyro/norm_orientation tagged outlets"
      pattern: "norm_accel|norm_gyro|norm_orientation"
---

<objective>
Add a normalization toggle to the IMU sensor pipeline that maps all sensor outputs to the 0.0-1.0 range when enabled.

Purpose: Normalized outputs (0.0-1.0) are essential for musical mapping -- most MAX/MSP tools (scale~, line~, function) and external tools expect unipolar or bipolar normalized signals. Currently the user must manually scale each axis.

Output: A toggle in the MAX patch that sends a `normalize` message to Node, which then outputs additional `norm_accel`, `norm_gyro`, `norm_orientation` tagged outlets with values mapped to 0.0-1.0.
</objective>

<execution_context>
@/Users/taylorbrook/.claude/get-shit-done/workflows/execute-plan.md
@/Users/taylorbrook/.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@node/serial-bridge.js
@max/sensor-pipeline.maxpat
@max/imu-sensor.maxpat
</context>

<tasks>

<task type="auto">
  <name>Task 1: Add normalization logic and toggle handler to serial-bridge.js</name>
  <files>node/serial-bridge.js</files>
  <action>
Add normalization state and logic to the Node serial bridge. This follows the same pattern as smoothing (state variable + handler + processing in outputData).

1. Add normalization state near the top with other state variables:
   ```
   var normalizeEnabled = false;
   ```

2. Add normalization ranges as constants (near BAUD_RATE etc):
   ```
   var NORM_RANGES = {
     ax: { min: -16.0, max: 16.0 },   // accelerometer: +/- 16g
     ay: { min: -16.0, max: 16.0 },
     az: { min: -16.0, max: 16.0 },
     gx: { min: -2000.0, max: 2000.0 }, // gyroscope: +/- 2000 dps
     gy: { min: -2000.0, max: 2000.0 },
     gz: { min: -2000.0, max: 2000.0 },
     pitch: { min: -90.0, max: 90.0 },  // pitch: -90 to +90
     roll: { min: -180.0, max: 180.0 }, // roll: -180 to +180
     yaw: { min: 0.0, max: 360.0 }      // yaw: 0 to 360
   };
   ```

3. Add a normalize helper function (after applySmoothing):
   ```
   function normalizeValue(axis, value) {
     var range = NORM_RANGES[axis];
     var norm = (value - range.min) / (range.max - range.min);
     return Math.max(0.0, Math.min(1.0, norm));  // clamp 0-1
   }
   ```

4. In the `outputData` function, add normalized outlets AFTER the existing smooth outlets. Inside the `if (biasOffsets !== null)` block, after the `smooth_orientation` outlet (around line 297), add:
   ```
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
   ```
   Also add a similar block inside the `else if (orientOffset !== null)` branch (after smooth_orientation outlet around line 307), but only for orientation since that branch has no accel/gyro smoothing:
   ```
   if (normalizeEnabled) {
     maxAPI.outlet("norm_orientation",
       normalizeValue("pitch", sp),
       normalizeValue("roll", sr),
       normalizeValue("yaw", sy));
   }
   ```

5. Add MAX message handler (near the smoothing handlers section):
   ```
   maxAPI.addHandler("normalize", function (val) {
     normalizeEnabled = (val === 1 || val === true);
     maxAPI.outlet("norm_status", normalizeEnabled ? 1 : 0);
     maxAPI.post("[normalize] " + (normalizeEnabled ? "enabled" : "disabled"));
   });
   ```

Key design decisions:
- Normalization applies to smoothed (final-stage) data, not raw -- this is the most useful output for musical mapping
- Uses separate `norm_*` outlet tags rather than replacing `smooth_*` -- non-destructive, existing patches keep working
- Clamps output to 0.0-1.0 to handle any overshoot from calibration offsets
  </action>
  <verify>
Review serial-bridge.js for:
- `normalizeEnabled` state variable exists
- `NORM_RANGES` constant with correct ranges for all 9 axes
- `normalizeValue()` function with min-max normalization and clamping
- `norm_accel`, `norm_gyro`, `norm_orientation` outlets in both branches of outputData
- `normalize` message handler that accepts 0/1
- No syntax errors: `node -c node/serial-bridge.js` returns OK
  </verify>
  <done>
Node serial bridge accepts `normalize 0/1` message from MAX, and when enabled outputs three additional tagged streams (`norm_accel`, `norm_gyro`, `norm_orientation`) with all values in 0.0-1.0 range. When disabled, no norm outlets are emitted. Existing outlets (raw, cal, smooth) are completely unchanged.
  </done>
</task>

<task type="auto">
  <name>Task 2: Add normalization toggle and routing to MAX patches</name>
  <files>max/sensor-pipeline.maxpat, max/imu-sensor.maxpat</files>
  <action>
Add UI toggle and message routing for normalization in both the main patch and the abstraction.

**sensor-pipeline.maxpat changes:**

1. Update the `route` object (id: `obj-route`) to add `norm_accel`, `norm_gyro`, `norm_orientation`, and `norm_status` tags. The current text is:
   ```
   route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias cal_toggle smooth_accel smooth_gyro smooth_orientation
   ```
   Change to:
   ```
   route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias cal_toggle smooth_accel smooth_gyro smooth_orientation norm_accel norm_gyro norm_orientation norm_status
   ```
   Update `numinlets` and `numoutlets` from 15 to 19 (adding 4 new tags). Update `outlettype` array to have 19 entries.

2. Add a `toggle` object for normalization near the existing calibration/smoothing controls area. Place it around y=59 area near the other control messages. Give it id `obj-norm-toggle`. Connect it to a `message` box with text `normalize $1` (id `obj-msg-normalize`), which connects to `obj-nodescript` inlet 0.

3. Add a label `comment` next to the toggle: "Normalize (0-1)".

4. Add `unpack f f f` objects and `flonum` display objects for the normalized outputs, following the same visual pattern as the existing smooth_accel/smooth_gyro/smooth_orientation display section. Place them below the smooth section. Add section header comments: "Normalized Accel (0-1)", "Normalized Gyro (0-1)", "Normalized Orient (0-1)".

5. Wire the new route outlets (indices 15, 16, 17 for norm_accel, norm_gyro, norm_orientation) to the new unpack objects.

6. Wire `norm_status` route outlet (index 18) back to the toggle to sync state.

**imu-sensor.maxpat changes:**

1. Update the `route` object in the abstraction to also include `norm_accel norm_gyro norm_orientation norm_status` tags. Update inlet/outlet counts accordingly.

2. Wire the new route outlets to corresponding abstraction outlets so normalized data is available downstream.

Positioning guidelines:
- Place the normalize toggle near x=430, y=59 (after the "reset" button)
- Place normalized display section below the smoothed section, offset by ~200px in y
- Follow existing spacing patterns (60px between columns for axis displays)
  </action>
  <verify>
Open sensor-pipeline.maxpat in MAX:
- Normalize toggle is visible near the control buttons
- Toggle sends `normalize 1` / `normalize 0` to node.script
- When Arduino connected and normalize enabled, norm_accel/norm_gyro/norm_orientation flonum displays show values between 0.0 and 1.0
- When normalize disabled, norm displays stop updating
- Existing smooth/cal/raw displays continue working unchanged
- No MAX console warnings on patch load
  </verify>
  <done>
MAX patch has a visible normalization toggle that controls the Node bridge. Normalized outputs (0.0-1.0) are displayed and routable. The abstraction (imu-sensor.maxpat) also forwards normalized data. All existing functionality unchanged.
  </done>
</task>

</tasks>

<verification>
1. `node -c node/serial-bridge.js` -- no syntax errors
2. Open sensor-pipeline.maxpat in MAX -- no console warnings
3. Connect Arduino, enable calibration, wait for bias offsets
4. Toggle normalize ON -- norm_accel/norm_gyro/norm_orientation displays show values in 0.0-1.0
5. Move sensor to extremes -- values approach 0.0 and 1.0 but never exceed
6. Toggle normalize OFF -- norm displays stop updating, smooth displays unchanged
7. Verify raw/cal/smooth outlets all unchanged by normalization feature
</verification>

<success_criteria>
- Normalization toggle exists in MAX patch and sends normalize 0/1 to Node
- When enabled, three new outlet streams (norm_accel, norm_gyro, norm_orientation) emit 0.0-1.0 values
- All 9 sensor axes correctly mapped: accel +/-16g, gyro +/-2000dps, pitch +/-90, roll +/-180, yaw 0-360
- Values clamped to 0.0-1.0 (no overshoot)
- Existing raw/cal/smooth outlets completely unaffected
- No MAX console warnings
</success_criteria>

<output>
After completion, create `.planning/quick/1-add-normalization-toggle-that-normalize-/1-SUMMARY.md`
</output>
