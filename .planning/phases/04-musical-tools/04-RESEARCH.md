# Phase 4: Musical Tools - Research

**Researched:** 2026-02-13
**Domain:** MAX/MSP signal processing (smoothing, mapping, thresholds), Jitter 3D visualization, quaternion orientation output
**Confidence:** HIGH

## Summary

Phase 4 transforms raw and calibrated sensor data into musically useful signals through four subsystems: smoothing (EMA via `slide` objects with a three-tier hierarchy), range mapping (MAX `scale` object with exponential curves plus `function` object for custom curves), threshold triggers (comparisons with hysteresis and direction detection), and a Jitter-based 3D orientation visualizer. A fifth subsystem outputs quaternion data from the Arduino's Madgwick filter alongside the existing Euler angles.

The smoothing and range mapping subsystems live entirely in MAX patch logic -- no changes to the Node bridge are needed for those features. Smoothing uses the built-in `slide` object which implements one-pole EMA filtering at control rate. Range mapping uses the `scale` object (with exponent parameter for exponential curves) and the `function` object (for user-drawn custom curves used as lookup tables). Threshold triggers use comparison operators (`>`, `<`) combined with `change` and hysteresis logic to detect boundary crossings with direction. The 3D visualization uses `jit.world` with `jit.gl.gridshape` for the oriented shape and reference elements, embedded in a subpatcher that can be shown/hidden via `pcontrol`. Quaternion output requires a minor Arduino firmware modification -- adding getter methods to the MadgwickAHRS library since q0-q3 are private members -- and extending the CSV format from 9 to 13 fields.

The existing `serial-bridge.js` needs minimal changes: extend the CSV parser to handle 13 fields and add a `quaternion` outlet tag. All musical tool logic (smoothing, mapping, thresholds) lives in the MAX patch, keeping the Node bridge thin. The existing calibrated outlets (cal_accel, cal_gyro, cal_orientation) provide the input data that smoothing, mapping, and threshold modules operate on.

**Primary recommendation:** Build all smoothing, mapping, and threshold logic as MAX patch modules using native MAX objects (`slide`, `scale`, `function`, comparators). Keep the Node bridge changes minimal (quaternion outlet only). Use `jit.world` with a subpatcher for the hideable 3D view.

<user_constraints>

## User Constraints (from CONTEXT.md)

### Locked Decisions

#### Smoothing controls
- Three-tier hierarchy: global -> group (accel, gyro, orientation) -> per-axis
- No smoothing by default -- raw data passes through, user dials up as needed
- Controlled via rotary dials (knobs)
- All smoothing controls live in the main patch, directly accessible

#### Range mapping & curves
- Per-axis mappers -- each sensor axis gets its own mapping controls
- Three curve types available: linear, exponential, and custom curve (user-drawn)
- Input range capture via both learn mode (move board to set min/max) and manual number entry for fine-tuning
- Per-axis clip toggle -- user chooses whether output clips to defined range or allows overflow

#### Threshold triggers
- Output: bang + crossing direction (up or down)
- Multiple thresholds per axis (e.g., 30, 45, 60 degrees for zone-based triggering)
- Adjustable hysteresis per threshold -- user-controllable dead zone width
- Available on orientation axes (pitch, roll, yaw) and accelerometer axes -- not raw gyro

#### 3D visualization
- Abstract geometric shape (cube, arrow, or similar) -- not a board model
- Reference elements: ground plane grid + colored XYZ axis lines
- Expandable view, hidden by default -- user opens it when needed
- Camera behavior: Claude's discretion

#### Quaternion output
- Available as separate output alongside Euler angles for downstream 3D work

### Claude's Discretion

- Camera behavior for 3D view (fixed vs orbitable)
- Exact abstract shape choice for 3D visualization
- Smoothing algorithm implementation (EMA, moving average, etc.)
- Custom curve editor implementation approach
- Layout organization of all controls in the main patch
- Learn mode UX (start/stop buttons, visual feedback during capture)

### Deferred Ideas (OUT OF SCOPE)

None -- discussion stayed within phase scope

</user_constraints>

## Discretion Recommendations

### 1. Camera behavior: Fixed camera with sensible defaults
**Rationale:** An orbitable camera adds complexity (mouse interaction capture, camera state management) for minimal benefit in an orientation visualizer. A fixed camera at a 3/4 angle (slightly elevated, slightly rotated) provides a clear view of all three rotation axes. The user's goal is to see orientation at a glance, not to explore a 3D scene. Use `jit.gl.camera` positioned at approximately (2, 2, 4) looking at the origin. If the user later wants to orbit, `jit.gl.handle` can be added in Phase 5.

### 2. Abstract shape: Arrow (cone + cylinder) pointing along the Z-axis
**Rationale:** An arrow is more informative than a cube for orientation visualization because it has a clear "forward" direction. A cube looks the same from many angles, making it hard to distinguish 180-degree rotations. Build the arrow from two `jit.gl.gridshape` objects: a cylinder for the shaft and a cone for the tip, grouped under a shared parent. Color the arrow to distinguish front from back (e.g., blue shaft, red tip). The arrow naturally maps to the board's "pointing direction."

### 3. Smoothing algorithm: EMA via MAX `slide` object
**Rationale:** The `slide` object is MAX's built-in one-pole EMA filter for control-rate data. The formula is `y(n) = y(n-1) + (1/slide_factor) * (x(n) - y(n-1))`. A slide factor of 1 means no smoothing (pass-through), larger values mean more smoothing. This is the standard MAX pattern for smoothing sensor data at control rate. It runs at the data arrival rate (~114 Hz), has zero setup complexity, and is mathematically equivalent to EMA with alpha = 1/slide_factor. The user's dial controls the slide_factor directly.

### 4. Custom curve editor: Use the `function` object in curve mode
**Rationale:** The MAX `function` object natively supports user-drawn breakpoint curves. In curve mode (mode 1), breakpoints connect with adjustable curves via `setcurve`. When you send an X value (float) to the `function` object, it outputs the interpolated Y value from the drawn curve. This makes it a visual lookup table: the user draws the transfer curve, and the function object maps input values to output values in real time. No external libraries or complex JavaScript needed. The `function` object is the standard MAX approach for custom transfer curves.

### 5. Layout organization: Vertical sections (top to bottom)
**Rationale:** The existing patch flows top to bottom: connection controls -> node.script -> route -> data displays -> calibration. Phase 4 extends this pattern. The smoothing section sits between calibrated data outputs and the mapping section. Mapping sits before threshold triggers. The 3D viz subpatcher button sits alongside the calibration controls. Suggested vertical order in the extended patch area:
1. Smoothing controls (global knob, group knobs, per-axis knobs)
2. Range mapping controls (per-axis: input range, curve type, output range, clip toggle)
3. Threshold triggers (per-axis: threshold values, hysteresis knobs, output bangs)
4. Mapped/smoothed output displays
5. 3D viz toggle button

### 6. Learn mode UX: Start/Stop textbutton with min/max display
**Rationale:** Reuse the same UX pattern as calibration (Phase 3): a `textbutton` in toggle mode labeled "Learn" / "Stop Learning". While learning, track the min and max values seen on that axis. Display the captured min/max in `flonum` boxes beside the manual entry fields. When stopped, the captured values populate the input range fields. A brief status message "Range captured: [min] to [max]" confirms completion. This is familiar to the user from the calibration workflow.

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| max-api | (built-in) | MAX<->Node communication | Provided by MAX runtime |
| serialport | 12.0.0 | Serial port communication | Already installed from Phase 2 |
| MadgwickAHRS | 1.2.3 (Arduino lib) | Orientation fusion | Already used; needs quaternion getter patch |

### MAX Objects Used (no installation needed)
| Object | Purpose | Why This Object |
|--------|---------|-----------------|
| `slide` | EMA smoothing at control rate | Built-in one-pole filter; standard for sensor smoothing in MAX |
| `scale` | Linear/exponential range mapping | Built-in with exponent parameter; formula: `((x-in_low)/(in_high-in_low))^exp` |
| `function` | User-drawn custom transfer curves | Visual breakpoint editor; sends interpolated Y for any X input |
| `clip` | Clamp output to defined range | Built-in min/max constrainer |
| `dial` | Rotary knob UI control | Supports float output, setminmax, visual size configuration |
| `past` | Upward threshold crossing detection | Fires bang when value rises past threshold; auto-resets on drop |
| `change` | Detect value transitions | Filters repeated values; used with comparators for direction detection |
| `split` | Range-based number routing | Routes numbers in/out of range; useful for hysteresis band |
| `jit.world` | 3D rendering context | All-in-one GL setup; auto-enables rendering |
| `jit.gl.gridshape` | 3D geometric shapes | Supports rotatexyz, quaternion rotation, multiple shape types |
| `jit.euler2quat` | Euler-to-quaternion conversion | Converts pitch/roll/yaw to quaternion for 3D rotation |
| `jit.gl.camera` | Camera positioning | Fixed camera for 3D view |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| No new npm packages needed | - | - | - |

### Installation
No new npm installation required. All Phase 4 work uses existing Node dependencies plus native MAX objects. The only code-level change to a dependency is patching the MadgwickAHRS Arduino library to expose quaternion values.

## Architecture Patterns

### Current Architecture (End of Phase 3)

```
[Arduino] --serial 57600--> [serial-bridge.js] --outlet()--> [sensor-pipeline.maxpat]
                              |                                |
  9-value CSV:                | Tags:                          | route -> unpack -> flonum
  ax,ay,az,gx,gy,gz,         | accel, gyro, orientation       |
  pitch,roll,yaw              | cal_accel, cal_gyro,           |
                              | cal_orientation, cal_status,   |
                              | cal_progress, cal_bias,        |
                              | cal_toggle                     |
```

### Phase 4 Architecture Extension

```
Phase 4 adds:

1. FIRMWARE: 13-value CSV (add q0,q1,q2,q3)
   ax,ay,az,gx,gy,gz,pitch,roll,yaw,q0,q1,q2,q3

2. NODE BRIDGE: Extended parser + quaternion outlet
   - validateLine: EXPECTED_FIELDS = 13
   - outputData: + maxAPI.outlet("quaternion", q0, q1, q2, q3)
   - route adds: quaternion

3. MAX PATCH: Musical tool modules (all in main patch)

   [cal_orientation] --> [SMOOTHING MODULE] --> [MAPPING MODULE] --> [THRESHOLD MODULE]
                              |                      |                    |
                          3-tier EMA             per-axis              per-axis
                         via slide obj          scale/function      comparison + hysteresis
                              |                      |                    |
                         smoothed values        mapped values         bang + direction
                              |                      |
                         [3D VIZ SUBPATCHER]    [output to downstream]
                         (orientation only)

   [quaternion] --> [3D VIZ] (direct quaternion rotation of shape)
```

### Pattern 1: Three-Tier Smoothing with `slide`
**What:** Global smoothing dial controls a master slide factor. Group dials (accel/gyro/orientation) multiply with global. Per-axis dials multiply with group. The effective slide factor for any axis = global * group * per-axis. A dial value of 1 everywhere means no smoothing (pass-through).
**When to use:** Always -- this is the locked decision.
**Example (MAX pseudo-patch):**
```
[cal_orientation] -> [unpack f f f]
                       |     |     |
                     pitch  roll  yaw
                       |     |     |
                    [slide $1]  [slide $1]  [slide $1]  <-- per-axis slide factor
                       ^         ^         ^
                       |         |         |
                    [* ]      [* ]      [* ]   <-- group_factor * per_axis_factor
                     ^ ^       ^ ^       ^ ^
                     | |       | |       | |
              [dial] [dial]    ...        ...
           orient-group  per-pitch

Global dial --> [* ] with each group factor
                 |
           effective_factor = global * group * per_axis
```

**Slide factor semantics:**
- slide_factor = 1: no smoothing (output = input)
- slide_factor = 5: moderate smoothing
- slide_factor = 20: heavy smoothing
- All dials default to 1 (no smoothing per user requirement)
- Multiplication means: global=2 * group=3 = effective 6

### Pattern 2: Per-Axis Range Mapping with Curve Selection
**What:** Each axis gets: input range (min/max), curve type selector (linear/exp/custom), output range (min/max), clip toggle. Uses `scale` for linear/exp and `function` for custom.
**When to use:** For MAXI-02 range mapping.
**Example (MAX pseudo-patch):**
```
[smoothed_pitch] --> [gate 3]  <-- curve type selector (1=linear, 2=exp, 3=custom)
                       | | |
         [scale in_lo in_hi out_lo out_hi]     <-- linear (exp=1.0)
           [scale in_lo in_hi out_lo out_hi exp]  <-- exponential
             [function]                             <-- custom lookup
                       |  |  |
                    [gate 1] <-- merge back to single output
                       |
                    [clip out_lo out_hi]  <-- optional, controlled by clip toggle
                       |
                    mapped_output

Learn mode:
[smoothed_pitch] --> [maximum] --> [flonum in_max]  <-- tracks running max
[smoothed_pitch] --> [minimum] --> [flonum in_min]  <-- tracks running min
  (reset both with "clear" message when learn starts)
```

### Pattern 3: Threshold with Hysteresis and Direction
**What:** For each threshold on an axis: compare current value against (threshold + hysteresis/2) for upward crossing and (threshold - hysteresis/2) for downward crossing. Output bang + direction symbol ("up" or "down").
**When to use:** For MAXI-03 threshold triggers.
**Example (MAX pseudo-patch for one threshold on pitch):**
```
[smoothed_pitch]
  |
  |---> [> threshold+hyst/2] --> [change] --> [select 1] --> [bang] + [message "up"]
  |                                                            |
  |---> [< threshold-hyst/2] --> [change] --> [select 1] --> [bang] + [message "down"]
  |
  (hysteresis creates dead zone: value must cross threshold+hyst/2 going up
   or threshold-hyst/2 going down to trigger, preventing oscillation)
```

**Multiple thresholds per axis:** Duplicate the above pattern for each threshold value. Use subpatchers or abstractions to keep it manageable. Each threshold instance has its own threshold value and hysteresis dial.

### Pattern 4: Hideable 3D Visualization Subpatcher
**What:** The 3D viz lives in a subpatcher opened/closed via `pcontrol`. Contains `jit.world`, `jit.gl.gridshape` objects, camera, and reference elements.
**When to use:** For MAXI-06 3D visualization.
**Example (MAX pseudo-patch):**
```
Main patch:
[textbutton "Show 3D" / "Hide 3D" mode:1]
  |
[select 1 0]
  |        |
[message "open"]  [message "close"]
  |                |
  +----------------+
  |
[pcontrol]
  |
[p 3d_viz]  <-- subpatcher containing all Jitter objects

Inside subpatcher [p 3d_viz]:
[r pitch_smooth] [r roll_smooth] [r yaw_smooth]
  |                |               |
  [pack f f f]
  |
  [jit.gl.gridshape myworld @shape cone @rotatexyz $1 $2 $3 @scale 0.3 0.3 1.0 @color 0.2 0.5 1.0]

  [jit.gl.gridshape myworld @shape plane @position 0 -1 0 @rotatexyz 90 0 0 @scale 3 3 1 @color 0.3 0.3 0.3 @poly_mode 1 1]
    ^-- ground grid

  [jit.gl.camera myworld @position 2 2 4 @lookat 0 0 0]

  [jit.world myworld @enable 1 @fps 30 @size 400 400 @floating 1]
```

### Pattern 5: Quaternion Passthrough from Firmware
**What:** Arduino firmware sends quaternion alongside Euler angles. Node parses and outlets. MAX routes to both display and 3D viz.
**When to use:** For MAXI-07 quaternion output.
**Data flow:**
```
[Arduino] --> 13-field CSV --> [serial-bridge.js] --> outlet("quaternion", q0, q1, q2, q3)
                                                         |
[sensor-pipeline.maxpat] --> [route ... quaternion] --> [unpack f f f f]
                                                         |   |   |   |
                                                        q0  q1  q2  q3
                                                         |
                                              [pack f f f f] --> [jit.gl.gridshape @quat $1 $2 $3 $4]
```

**IMPORTANT:** Jitter quaternion format is XYZW while Madgwick internal format is q0=W, q1=X, q2=Y, q3=Z. The reordering must happen: send as `outlet("quaternion", q1, q2, q3, q0)` from Node, or reorder in MAX with `[unpack f f f f]` -> swap -> `[pack f f f f]`.

### Anti-Patterns to Avoid

- **Smoothing in Node.js:** Do NOT implement the smoothing hierarchy in serial-bridge.js. The existing Phase 3 EMA for orientation reset is a one-time transition effect, not ongoing smoothing. Phase 4 smoothing is user-controllable in real time via knobs, which maps naturally to MAX patch objects (`slide`). Putting smoothing in Node would require constant message passing for parameter updates and adds latency.

- **Using signal-rate objects (`slide~`, `scale~`) for control-rate data:** The sensor data arrives at 114 Hz (control rate), not audio rate. Use the control-rate versions: `slide` (not `slide~`), `scale` (not `scale~`).

- **Building custom JavaScript for range mapping:** The `scale` object handles linear and exponential mapping natively. The `function` object handles custom curves. There is no reason to duplicate this in JavaScript.

- **Using `past` alone for bidirectional thresholds:** The `past` object only detects upward crossings. For the user's requirement of bang + direction (up or down), you need separate up-crossing and down-crossing detection chains.

- **Putting the jit.world in the main patch:** The 3D view should be in a subpatcher to keep it hideable and to avoid rendering overhead when not visible. Use `pcontrol` to open/close the subpatcher window.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| EMA smoothing | Custom JavaScript EMA function | MAX `slide` object | Built-in, runs at control rate, single parameter, no IPC overhead |
| Exponential range mapping | Custom pow() function in JS | MAX `scale` object with exponent arg | Native object, handles edge cases, proven formula |
| Custom transfer curves | JavaScript lookup table | MAX `function` object in curve mode | Visual editor, interpolation built-in, sends Y for any X |
| Value clamping | Custom min/max logic | MAX `clip` object | Single object, handles float, mode attribute for zero-on-exceed |
| Threshold crossing | Custom state machine | Comparators + `change` + `select` | Standard MAX pattern, no state management needed |
| 3D rendering setup | Manual jit.gl.render + jit.window | `jit.world` | All-in-one: window, render, node management, auto-enable |
| Quaternion-to-Euler | Custom math | `jit.quat2euler` | Jitter built-in, handles gimbal lock edge cases |
| Euler-to-Quaternion | Custom math | `jit.euler2quat` | Jitter built-in, correct rotation order handling |

**Key insight:** This phase is almost entirely MAX patch logic using native objects. The only code changes are: (1) patching the Arduino library to expose quaternions, (2) extending the CSV format to 13 fields, and (3) adding a quaternion outlet in serial-bridge.js. Everything else is patching with standard MAX objects.

## Common Pitfalls

### Pitfall 1: Slide Factor Multiplication Producing Unwanted Behavior at Default Values
**What goes wrong:** If all dials default to 0 instead of 1, multiplying factors produces 0 (infinite smoothing = frozen output). Or if dials default to high values, the initial smoothing is too heavy.
**Why it happens:** The `dial` object defaults to 0 output. The smoothing design requires default = 1 (no smoothing).
**How to avoid:** Configure each smoothing dial with `setminmax 1 50` so the minimum value is 1 (no smoothing) and maximum is 50 (very heavy smoothing). Set `floatoutput 1` for fine control. Initialize all dials to their minimum (1) via loadbang.
**Warning signs:** Smoothed output shows no movement when board is tilted, or output is extremely sluggish before user touches any controls.

### Pitfall 2: Scale Object Integer Truncation
**What goes wrong:** `scale` outputs integers instead of floats, causing stairstepping in mapped output.
**Why it happens:** If all four range arguments to `scale` are integers (e.g., `scale 0 90 200 2000`), the output is truncated to integer.
**How to avoid:** Always use at least one float argument: `scale 0. 90. 200. 2000.` (note the decimal points). This forces float output throughout.
**Warning signs:** Mapped output jumps in integer steps instead of smooth continuous values.

### Pitfall 3: Function Object X-Range Mismatch
**What goes wrong:** Custom curve lookup returns 0 for all inputs because the input values fall outside the function's X domain.
**Why it happens:** The `function` object defaults to an X range of 0-1000ms (designed for envelopes). Sensor values may be in degrees (0-360) or g-forces (0-2).
**How to avoid:** Set the function's domain to match the sensor's input range using `setdomain` message. For pitch: `setdomain 0. 90.` For the output range, use `setrange` message: `setrange 200. 2000.`
**Warning signs:** Custom curve mode produces all-zero output while linear and exponential modes work correctly.

### Pitfall 4: Quaternion Component Ordering Between Madgwick and Jitter
**What goes wrong:** 3D shape rotates incorrectly or inverts when driven by quaternion data.
**Why it happens:** The Madgwick filter stores quaternions as (q0=W, q1=X, q2=Y, q3=Z) but Jitter's `quat` attribute expects (X, Y, Z, W) ordering.
**How to avoid:** Reorder quaternion components either in Node (`outlet("quaternion", q1, q2, q3, q0)`) or in MAX patch (`unpack f f f f` -> swap outlets -> `pack f f f f`). Reordering in Node is simpler and avoids patch complexity.
**Warning signs:** 3D shape flips or rotates in wrong axis; pitch rotation appears as roll, etc.

### Pitfall 5: Threshold Oscillation Without Hysteresis
**What goes wrong:** Threshold fires rapidly (buzzing) when the sensor value hovers near the threshold boundary.
**Why it happens:** Sensor noise causes the value to cross back and forth across the threshold many times per second.
**How to avoid:** Implement hysteresis: the upward threshold fires at (threshold + hysteresis/2) and the state resets only when the value drops below (threshold - hysteresis/2). The `change` object prevents repeated bangs for the same state, but the actual dead zone requires the dual-threshold comparator pattern.
**Warning signs:** Multiple rapid bangs from a single threshold crossing; downstream effects (notes, sounds) stuttering.

### Pitfall 6: 3D Visualization Consuming CPU When Hidden
**What goes wrong:** MAX patch becomes sluggish even when the 3D view is closed.
**Why it happens:** `jit.world` with `@enable 1` continues rendering frames even when the subpatcher window is closed.
**How to avoid:** Use `pcontrol` to actually close the subpatcher (not just hide the window). When the subpatcher closes, send `enable 0` to jit.world via a `closebang` object inside the subpatcher. When opened, send `enable 1` via `loadbang` or `thispatcher`.
**Warning signs:** CPU usage stays elevated after closing the 3D view window.

### Pitfall 7: Extending CSV Format Breaks Backward Compatibility
**What goes wrong:** Old firmware (9-field CSV) stops working with the new Node bridge (expecting 13 fields).
**Why it happens:** The validator rejects lines where `parts.length !== EXPECTED_FIELDS`.
**How to avoid:** Accept BOTH 9-field and 13-field CSV: `if (parts.length !== 9 && parts.length !== 13) return null;`. When 9 fields are received, skip the quaternion outlet. This preserves backward compatibility during the firmware update transition.
**Warning signs:** After updating only the Node bridge (before uploading new firmware), all data stops flowing.

### Pitfall 8: Learn Mode Not Clearing Previous Min/Max
**What goes wrong:** Learn mode shows incorrect range because it includes min/max from a previous learn session.
**Why it happens:** The `maximum` and `minimum` objects retain their previous peak values until explicitly reset.
**How to avoid:** Send a `clear` message to both `maximum` and `minimum` objects when the learn button is pressed (start of learn mode). This resets the tracked range to the current value.
**Warning signs:** Input range shows impossibly wide range after second learn attempt.

## Code Examples

Verified patterns from official sources and the existing codebase:

### Extending Arduino Firmware for Quaternion Output

The MadgwickAHRS library (v1.2.3) stores quaternions as private members q0-q3. To expose them, add getter methods to the library header.

```cpp
// File: ~/Documents/Arduino/libraries/Madgwick/src/MadgwickAHRS.h
// Add to public section of the Madgwick class:

  float getQ0() { return q0; }  // W component
  float getQ1() { return q1; }  // X component
  float getQ2() { return q2; }  // Y component
  float getQ3() { return q3; }  // Z component

// File: firmware/imu_firmware/imu_firmware.ino
// Modify the CSV output section in loop():

  // Output 13-field CSV: raw accel, raw gyro, smoothed orientation, quaternion
  Serial.print(ax, 2); Serial.print(',');
  Serial.print(ay, 2); Serial.print(',');
  Serial.print(az, 2); Serial.print(',');
  Serial.print(gx, 2); Serial.print(',');
  Serial.print(gy, 2); Serial.print(',');
  Serial.print(gz, 2); Serial.print(',');
  Serial.print(smoothPitch, 2); Serial.print(',');
  Serial.print(smoothRoll, 2); Serial.print(',');
  Serial.print(smoothYaw, 2); Serial.print(',');
  Serial.print(filter.getQ0(), 4); Serial.print(',');  // W - 4 decimal places for precision
  Serial.print(filter.getQ1(), 4); Serial.print(',');  // X
  Serial.print(filter.getQ2(), 4); Serial.print(',');  // Y
  Serial.println(filter.getQ3(), 4);                    // Z
```

**Bandwidth note:** At 4 decimal places, adding 4 quaternion fields adds ~32 bytes per line. Total line goes from ~63 bytes to ~95 bytes. At 114 Hz and 57600 baud (~5760 bytes/sec): 95 * 114 = 10,830 bytes/sec. This exceeds the 5,760 byte/sec limit. **Solution:** Use 2 decimal places for quaternion values too (saves ~8 bytes), bringing total to ~87 bytes. That is still 9,918 bytes/sec -- still over limit. **Alternative:** Send quaternion values at reduced precision (2 decimal places) and verify actual throughput. At 57600 baud with 10 bits per character, actual throughput is ~5,760 chars/sec. A 87-char line at 114 Hz = 9,918 chars/sec -- this will NOT fit.

**CRITICAL FINDING:** The 57600 baud rate cannot carry 13 fields at 114 Hz. Options:
1. Send quaternion on a separate (slower) schedule -- e.g., every 4th sample
2. Reduce all field precision to 1 decimal place (saves ~18 bytes)
3. Compute quaternion in Node from Euler angles (lossy but avoids firmware change)
4. Increase baud rate (risky -- 57600 is the validated ceiling on this hardware)

**Recommended approach:** Compute quaternion from Euler angles in Node.js using `jit.euler2quat` in MAX, or implement the conversion in serial-bridge.js. This avoids firmware changes and bandwidth issues entirely. The Euler-to-quaternion conversion is deterministic and lossless for visualization purposes. The Jitter `jit.euler2quat` object does this natively in MAX.

### Extended Node Bridge (serial-bridge.js changes)

```javascript
// Minimal change: add quaternion computation from Euler angles
// No CSV format change needed -- compute in Node or MAX

// Option A: Compute in Node and outlet (avoids Jitter dependency for non-viz uses)
function eulerToQuat(pitch, roll, yaw) {
  // Convert degrees to radians
  var p = pitch * Math.PI / 180.0 / 2.0;
  var r = roll * Math.PI / 180.0 / 2.0;
  var y = yaw * Math.PI / 180.0 / 2.0;

  var cp = Math.cos(p), sp = Math.sin(p);
  var cr = Math.cos(r), sr = Math.sin(r);
  var cy = Math.cos(y), sy = Math.sin(y);

  // ZYX convention (matches Madgwick output order)
  return {
    w: cp * cr * cy + sp * sr * sy,
    x: sp * cr * cy - cp * sr * sy,
    y: cp * sr * cy + sp * cr * sy,
    z: cp * cr * sy - sp * sr * cy
  };
}

// In outputData(), after orientation outlets:
var q = eulerToQuat(pitch, roll, yaw);
// Jitter quat format is XYZW
maxAPI.outlet("quaternion", q.x, q.y, q.z, q.w);
```

```javascript
// Option B: Don't compute in Node -- let MAX handle it
// Just add the route tag and use jit.euler2quat in MAX
// This is simpler and avoids adding another outlet call per sample
// The orientation values are already being sent -- MAX can convert them
```

**Recommendation:** Option B is better. Use `jit.euler2quat` in the MAX patch. This adds zero Node overhead and keeps quaternion conversion in the domain where it is used (Jitter visualization). The quaternion outlet from Node is only needed if downstream non-MAX consumers need it. Since Phase 5 will handle the abstraction, defer the Node-side quaternion outlet to then.

### Slide Object for Three-Tier Smoothing

```
// Source: Cycling '74 slide object documentation
// slide factor: 1 = no smoothing, higher = more smoothing
// Formula: y(n) = y(n-1) + (1/factor) * (x(n) - y(n-1))

// Per-axis smoothing with three-tier hierarchy:
// effective_factor = max(1, global_factor * group_factor * per_axis_factor)

[dial @setminmax 1. 50. @floatoutput 1]   <-- global smoothing
  |
  [t f f f]  <-- trigger: send to all 3 group multipliers
  |  |  |
  |  |  [* ]  <-- * group_orient_factor
  |  |    |
  |  |    [t f f f]
  |  |    |  |  |
  |  |    |  |  [* per_yaw_factor]   --> [slide $1]  <-- yaw smoothing
  |  |    |  [* per_roll_factor]     --> [slide $1]  <-- roll smoothing
  |  |    [* per_pitch_factor]       --> [slide $1]  <-- pitch smoothing
```

### Scale Object for Exponential Mapping

```
// Source: Cycling '74 scale object documentation
// Arguments: scale input_low input_high output_low output_high [exponent]
// Modern mode (classic 0): output = out_low + (out_high - out_low) * ((x - in_low) / (in_high - in_low))^exp

// Example: pitch 0-90 degrees -> frequency 200-2000 Hz with exponential curve
[scale 0. 90. 200. 2000. 3.0]
// exponent 3.0 = strong exponential curve (lower values change slowly, upper values change fast)

// Example: linear mapping (exponent = 1.0 or omitted)
[scale 0. 90. 0. 127.]

// Example: logarithmic curve (exponent < 1.0, modern mode only)
[scale 0. 90. 200. 2000. 0.3]
// exponent 0.3 = logarithmic feel (lower values change fast, upper values change slowly)
```

### Function Object for Custom Curve Lookup

```
// Source: Cycling '74 function object documentation
// The function object in mode 1 (curve mode) can act as a visual lookup table

[function @mode 1 @domain 0. 90. @range 200. 2000.]
  |
  | (user draws curve by clicking/dragging breakpoints)
  | (setcurve message adjusts curve shape between points)
  |
  | Send float input:
  [float] --> [function]  --> [float output]
  |
  | The function interpolates Y value from the drawn curve at position X
```

### Threshold with Hysteresis (per-threshold module)

```
// Pattern for one threshold with hysteresis and direction output
// threshold_value and hysteresis_width are set by user controls

// Compute upper and lower bounds
[+ hysteresis/2]  --> upper_bound    // trigger point going up
[- hysteresis/2]  --> lower_bound    // reset point going down

[input_value]
  |
  +--> [> upper_bound] --> [change] --> [select 1] --> [bang] (crossed up)
  |                                                       |
  |                                        [message "up"] --> [outlet]
  |
  +--> [< lower_bound] --> [change] --> [select 1] --> [bang] (crossed down)
                                                          |
                                           [message "down"] --> [outlet]
```

### 3D Visualization Subpatcher

```
// Inside subpatcher [p 3d_viz]:

// Receive orientation data via send/receive
[r smooth_pitch] [r smooth_roll] [r smooth_yaw]
  |                 |               |
  [pack f f f]
  |
  [jit.gl.gridshape myworld @shape cone @lighting_enable 1
    @scale 0.3 0.3 1.0 @color 0.3 0.6 1.0 @rotatexyz 0 0 0]
    ^-- arrow tip (cone pointing up)

  [jit.gl.gridshape myworld @shape cylinder @lighting_enable 1
    @scale 0.15 0.15 0.5 @position 0 -0.5 0 @color 0.2 0.4 0.8]
    ^-- arrow shaft

// Ground plane grid
  [jit.gl.gridshape myworld @shape plane @lighting_enable 1
    @position 0 -1.2 0 @rotatexyz 90 0 0 @scale 3 3 1
    @color 0.3 0.3 0.3 @poly_mode 1 1 @dim 10 10]
    ^-- wireframe grid on ground

// Colored axis lines (use jit.gl.sketch for lines)
  [jit.gl.sketch myworld @lighting_enable 0]
    "reset, glcolor 1 0 0 1, moveto 0 0 0, lineto 2 0 0"   // X = red
    "glcolor 0 1 0 1, moveto 0 0 0, lineto 0 2 0"           // Y = green
    "glcolor 0 0 1 1, moveto 0 0 0, lineto 0 0 2"           // Z = blue

// Camera
  [jit.gl.camera myworld @position 3 2.5 3 @lookat 0 0 0]

// World (auto-renders)
  [jit.world myworld @enable 1 @fps 30 @size 400 400
    @erase_color 0.15 0.15 0.15 1.0 @floating 1]

// Enable/disable on open/close
  [loadbang] --> [1] --> [message "enable $1"] --> [jit.world]
  [closebang] --> [0] --> [message "enable $1"] --> [jit.world]
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Manual jit.gl.render + jit.window + qmetro | `jit.world` with `@enable 1` | MAX 7+ | Simplifies 3D setup from 4 objects to 1 |
| `expr` for custom scaling formulas | `scale` with exponent parameter (modern mode) | MAX 7+ | Native support for exp < 1.0 (logarithmic) |
| Custom JavaScript smoothing | `slide` object at control rate | Always available | No IPC overhead, built-in to MAX |
| `line` for value smoothing | `slide` for parameter smoothing | Conceptual | `slide` tracks input continuously; `line` ramps to target |
| Separate jit.window + jit.gl.render + named context | `jit.world` all-in-one | MAX 7 | Fewer objects, automatic context management |

**Deprecated/outdated:**
- Manual render loop with `qmetro` -> `t b erase` -> `jit.gl.render`: Replaced by `jit.world @enable 1` which handles the render loop internally.
- `scale` classic mode (classic 1): Legacy IRCAM "linedrive" compatibility. Modern mode (classic 0 or 2) is preferred for new work. Exponent > 0 works correctly in modern mode.
- Computing quaternion from Euler angles via custom matrix math: Use `jit.euler2quat` in Jitter, which handles rotation order correctly.

## Important Architecture Note: Node vs MAX for Musical Tools

Phase 3 placed calibration logic in Node because calibration modifies the data before it reaches MAX (bias subtraction happens on every sample). Phase 4 is different: smoothing, mapping, and thresholds are **consumer-side** processing -- they take clean calibrated data and transform it for the user's specific musical application.

**Why MAX-side is correct for Phase 4:**
1. **Real-time parameter adjustment:** User turns a knob and the effect changes instantly. With MAX objects, this is direct wiring. With Node, every knob change requires an IPC message.
2. **Visual feedback:** MAX objects can be connected to UI elements (number boxes, sliders) directly. Node requires outlet calls for every visual update.
3. **No additional IPC overhead:** Smoothing in MAX adds zero outlet calls. Smoothing in Node would require new outlet calls for smoothed data.
4. **Standard practice:** MAX/MSP users expect signal processing to happen in the patch, not hidden in JavaScript.

**What stays in Node:** The quaternion computation (Euler-to-quat) *could* live in Node, but since the only consumer is the Jitter 3D viz (a MAX-side feature), it is better to use `jit.euler2quat` directly in the MAX patch. This keeps the Node bridge changes to zero for Phase 4.

## Open Questions

1. **Bandwidth for quaternion from firmware**
   - What we know: 57600 baud at 114 Hz can carry ~50 bytes per line reliably. Current 9-field CSV is ~63 bytes. Adding 4 quaternion fields would push to ~87-95 bytes, exceeding throughput capacity.
   - What's unclear: Exact overhead of serial framing and whether the Arduino could adaptively throttle when the buffer fills.
   - Recommendation: Do NOT modify the Arduino CSV format. Compute quaternion from Euler angles in MAX using `jit.euler2quat`. This gives identical results for visualization purposes and avoids any firmware changes or bandwidth risks. If true quaternion passthrough is needed later (for avoiding gimbal lock in extreme orientations), address it in Phase 5 with a binary protocol or reduced sample rate.

2. **IPC overhead with smoothed data outlet**
   - What we know: Phase 3 established ~4-6 outlet calls per sample at 114 Hz works. Phase 4 adds zero new outlet calls if smoothing/mapping/thresholds all live in MAX.
   - What's unclear: Whether the 3D viz subpatcher receiving orientation data via send/receive adds meaningful overhead vs direct wiring.
   - Recommendation: Use `send`/`receive` pairs for passing smoothed orientation to the 3D viz subpatcher. This is the standard MAX pattern for cross-patcher data routing and has negligible overhead at control rate.

3. **Number of dials in the main patch**
   - What we know: Three-tier smoothing across 9 axes (3 accel + 3 gyro + 3 orientation) requires: 1 global + 3 group + 9 per-axis = 13 smoothing dials. Plus mapping controls per axis (input range x2, output range x2, curve selector, clip toggle = 6 controls x 9 axes = 54 controls). Plus threshold controls.
   - What's unclear: Whether this many controls fit readably in the main patch without becoming overwhelming.
   - Recommendation: Group controls visually with comments and colored panels. Consider using subpatchers for per-axis mapping and threshold controls, with only the most-used controls (global smoothing, orientation mapping) directly visible. Thresholds are only on orientation (3) + accelerometer (3) = 6 axes, not all 9.

## Sources

### Primary (HIGH confidence)
- [Cycling '74 scale object reference](https://docs.cycling74.com/reference/scale/) -- Exponent parameter, modern vs classic mode, formula documentation
- [Cycling '74 jit.gl.gridshape reference](https://docs.cycling74.com/reference/jit.gl.gridshape) -- Shape types, rotatexyz, quat attribute, axes display
- [Cycling '74 function object reference (Max 7)](https://docs.cycling74.com/max7/refpages/function) -- Mode attribute, setcurve, float input for lookup, setdomain/setrange
- [Cycling '74 past object reference (Max 7)](https://docs.cycling74.com/max7/refpages/past) -- Upward-only crossing detection, multiple thresholds, clear/set messages
- [Cycling '74 jit.world reference (Max 7)](https://docs.cycling74.com/max7/refpages/jit.world) -- Enable attribute, fps, embedded vs floating, auto-render
- [Cycling '74 clip object reference (Max 7)](https://docs.cycling74.com/max7/refpages/clip) -- Min/max clamping, float handling, mode attribute
- [Cycling '74 dial object reference (Max 7/8)](https://docs.cycling74.com/max7/refpages/dial) -- setminmax, floatoutput, size attribute
- [Cycling '74 slide tutorial](https://cycling74.com/tutorials/advanced-max-an-inquiry-into-maxs-slide-objects) -- EMA formula, slide-up/slide-down, relationship to one-pole filter
- [Cycling '74 jit.euler2quat reference](https://docs.cycling74.com/max7/refpages/jit.euler2quat) -- Euler to quaternion conversion in Jitter
- [Cycling '74 jit.quat2euler reference](https://docs.cycling74.com/max7/refpages/jit.quat2euler) -- Quaternion to Euler conversion, XYZW ordering note
- [MadgwickAHRS header (GitHub)](https://github.com/arduino-libraries/MadgwickAHRS/blob/master/src/MadgwickAHRS.h) -- q0-q3 are PRIVATE, no getQuaternion() method exists
- [MadgwickAHRS getQuaternion PR #21](https://github.com/arduino-libraries/MadgwickAHRS/pull/21) -- PR never merged, library unmaintained since 2016
- Existing codebase: `serial-bridge.js`, `sensor-pipeline.maxpat`, `imu_firmware.ino` -- verified current outlet tags, data format, baud rate constraints

### Secondary (MEDIUM confidence)
- [Cycling '74 Forum: threshold bang](https://cycling74.com/forums/threshold-bang) -- Hysteresis pattern with dual thresholds and change object
- [Cycling '74 Forum: smoothing accelerometer data](https://cycling74.com/forums/using-and-smoothing-accelerometer-data-in-maxmsp) -- slide object recommended for sensor smoothing
- [Cycling '74 Forum: curve mapping](https://cycling74.com/forums/re-mapping-a-range-of-numbers-add-your-tricks-here) -- Community patterns for range mapping with scale and function
- [Cycling '74 Forum: rotating 3D objects](https://cycling74.com/forums/how-to-rotate-a-3d-object) -- rotatexyz vs quaternion rotation in Jitter

### Tertiary (LOW confidence)
- Exact CPU overhead of jit.world at 30fps in a subpatcher -- no official benchmarks found
- Whether `send`/`receive` at 114 Hz causes timing jitter vs direct patch cords -- no official documentation on send/receive overhead

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH -- all native MAX objects with official documentation verified
- Architecture (smoothing): HIGH -- `slide` is THE standard MAX smoothing object; three-tier hierarchy is straightforward multiplication
- Architecture (mapping): HIGH -- `scale` and `function` are documented official objects with verified behavior
- Architecture (thresholds): HIGH -- comparator + change + select pattern is standard MAX; hysteresis pattern verified on forums
- Architecture (3D viz): MEDIUM -- `jit.world` setup is documented but exact subpatcher enable/disable pattern with closebang needs validation
- Architecture (quaternion): HIGH -- `jit.euler2quat` is a documented Jitter object; avoids firmware modification entirely
- Pitfalls: HIGH -- based on verified object behavior (integer truncation, function domain, quaternion ordering)
- Bandwidth calculation: HIGH -- arithmetic from known baud rate (57600) and measured sample rate (114 Hz)

**Research date:** 2026-02-13
**Valid until:** 2026-03-15 (30 days -- stable domain, MAX objects and patterns are mature)
