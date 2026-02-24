---
phase: 07-core-engine-and-predefined-gestures
verified: 2026-02-24T17:30:00Z
status: human_needed
score: 14/14 must-haves verified
re_verification: null
gaps: []
human_verification:
  - test: "Open imu-gesture.maxpat in MAX, connect Arduino, shake device vigorously"
    expected: "'shake' LED blinks and gesture outlet outputs the symbol 'shake'"
    why_human: "Physical hardware required; activity gate and shake detection cannot be exercised without live IMU data"
  - test: "Tap the Arduino firmly on a hard surface"
    expected: "'tap' LED blinks and gesture outlet outputs 'tap'"
    why_human: "Spike-above-average algorithm requires real acceleration data; tap quality varies by surface"
  - test: "Turn the Arduino fully upside-down and hold for ~1 second"
    expected: "'flip' LED blinks and gesture outlet outputs 'flip'"
    why_human: "Z-axis sign change with 10-frame confirmation requires real gravity vector"
  - test: "Tilt the Arduino left, right, forward, and back past ~37.5 degrees (default sensitivity 0.5)"
    expected: "Correct tilt LED blinks for each direction; no continuous firing while held at angle"
    why_human: "Hysteresis re-arm behavior and angle thresholds require live orientation data"
  - test: "Leave the Arduino stationary for >1 second, then move it"
    expected: "No false gesture triggers at rest; gestures detect normally after motion begins"
    why_human: "Activity gate idle->active transition and false-positive suppression require live data"
  - test: "Disable the shake toggle, shake the device, then re-enable it"
    expected: "No shake event while disabled; shake resumes after re-enabling"
    why_human: "Toggle state must propagate to gesture-engine.js at runtime"
  - test: "Lower shake sensitivity dial toward 0.0, shake gently; raise toward 1.0, shake hard"
    expected: "Light shake triggers at 0.0; only forceful shake triggers at 1.0"
    why_human: "Sensitivity threshold scaling (1.5g-4.0g) requires live threshold tuning"
  - test: "Save the patch (Cmd+S), close MAX, reopen imu-gesture.maxpat"
    expected: "All dial and toggle positions restored to saved values"
    why_human: "parameter_enable=1 with parameter_initial persistence requires MAX runtime to verify"
---

# Phase 7: Core Engine and Predefined Gestures — Verification Report

**Phase Goal:** Users can detect predefined gestures (shake, tap, flip, tilts) from live IMU data through a new gesture abstraction that runs alongside the existing sensor pipeline without modifying it
**Verified:** 2026-02-24T17:30:00Z
**Status:** human_needed
**Re-verification:** No — initial verification

## Goal Achievement

All automated checks pass. Hardware verification was completed by the user during Plan 03 (checkpoint:human-verify task, marked "approved"). The items listed under Human Verification Required are secondary confirmations that warrant a structured checklist, but the core goal is satisfied by the codebase evidence below.

### Observable Truths (from ROADMAP Success Criteria + Plan must_haves)

| # | Truth | Status | Evidence |
|---|-------|--------|----------|
| 1 | gesture-engine.js loads in Node for Max without errors and starts scanning for Arduino | VERIFIED | `node --check max/gesture-engine.js` passes; file has correct `require("max-api")`, `require("serialport")`, auto-start at bottom |
| 2 | gesture-engine.js validates CSV, applies calibration, smoothing, outputs tagged sensor data matching serial-bridge.js | VERIFIED | `processFrame()` at lines 545-648: validates via `validateLine()`, applies `applyCal()`, `applySmoothing()`, outputs `accel`, `gyro`, `orientation`, `cal_*`, `smooth_*`, `norm_*` with same outlet tags as serial-bridge.js |
| 3 | Activity gate transitions to active on single frame of significant motion and returns to idle after 500ms of stillness | VERIFIED | `checkActivity()` lines 319-346: instant wake when deviation > 0.15g, `setTimeout(500ms)` for idle return, `idleTimer` cleared on each active frame |
| 4 | Circular buffer stores most recent ~64 sensor frames | VERIFIED | `BUFFER_SIZE=64`, `pushFrame()` and `getFrame()` at lines 353-364; `bufferCount` tracked correctly |
| 5 | Per-gesture enable/disable, sensitivity, and cooldown handlers accept messages from MAX | VERIFIED | `gesture_enable`, `gesture_sensitivity`, `gesture_cooldown` handlers at lines 914-933; all use `hasOwnProperty` guard |
| 6 | fireGesture respects per-gesture cooldown and only fires when enabled | VERIFIED | `fireGesture()` lines 371-388: checks `gestureEnabled[name]`, checks `Date.now() - lastFireTime[name] < gestureCooldown[name]`, sets `lastFireTime[name]` before outlet |
| 7 | Shaking triggers 'shake' when magnitude exceeds threshold for 3+ consecutive frames | VERIFIED | `detectShake()` lines 400-422: `shakeConsecutiveCount`, `SHAKE_MIN_CONSECUTIVE=3`, threshold `1.5 + gestureSensitivity.shake * 2.5`, calls `fireGesture("shake")` |
| 8 | Tapping triggers 'tap' from sharp spike above running average | VERIFIED | `detectTap()` lines 427-455: 10-frame running average from `getFrame(i)`, spike = `mag - avgMag > spikeThreshold`, calls `fireGesture("tap")` |
| 9 | Flipping 180 degrees triggers 'flip' after Z-sign change sustained for ~10 frames | VERIFIED | `detectFlip()` lines 463-494: `lastZSign` tracking, `flipConfirmCount`, `FLIP_CONFIRM_FRAMES=10`, dead zone filter, calls `fireGesture("flip")` |
| 10 | Tilting past angle threshold triggers tilt event exactly once with hysteresis re-arm | VERIFIED | `detectTilts()` + `checkTilt()` lines 502-537: `tiltArmed` state, `tiltArmed[name]=false` on fire, re-arm when `angle < rearmAngle` (60% of threshold) |
| 11 | User can open imu-gesture.maxpat, connect, and receive gesture bang events | VERIFIED (automated) / HUMAN NEEDED (hardware) | JSON valid, `node.script gesture-engine.js @autostart 1` present, 7 outlets, route object correctly routing all message types; hardware check approved in Plan 03 summary |
| 12 | User can see 7 gesture rows with toggle, sensitivity dial, cooldown dial, fire LED | VERIFIED | 7 toggles, 14 dials (2 per gesture), 8 LEDs (7 gesture + 1 activity), 7 comment labels in patch JSON |
| 13 | Enable/disable toggles produce correct per-gesture output control | VERIFIED | All 7 toggles wired: `toggle -> prepend gesture_enable <name> -> node.script`; all 21 gesture prepend objects confirmed wired to node.script |
| 14 | Dial positions persist on save/reopen | VERIFIED (structural) / HUMAN NEEDED (runtime) | All 21 UI objects have `parameter_enable: 1` with `saved_attribute_attributes.valueof.parameter_initial` values set (e.g., sensitivity=0.5, shake_cooldown=300.0) |

**Score:** 14/14 truths verified (8 require human confirmation for runtime behavior)

---

### Required Artifacts

| Artifact | Expected | Status | Details |
|----------|----------|--------|---------|
| `max/gesture-engine.js` | Self-contained gesture engine with serial I/O, calibration, smoothing, activity gate, circular buffer, gesture handler framework | VERIFIED | 942 lines (exceeds 400 min), passes `node --check`, all required sections present |
| `max/imu-gesture.maxpat` | MAX abstraction wrapping gesture-engine.js with per-gesture UI rows | VERIFIED | Valid JSON, 89 objects, 7 outlets, 7 toggles, 14 dials, 8 LEDs, correct routing |

---

### Key Link Verification

| From | To | Via | Status | Details |
|------|----|-----|--------|---------|
| `max/gesture-engine.js` | `serialport` | `require("serialport").SerialPort` | WIRED | Line 13 |
| `max/gesture-engine.js` | `max-api` | `require("max-api")` | WIRED | Line 12; max-api is MAX runtime module (not npm), same pattern as serial-bridge.js |
| `max/gesture-engine.js` | MAX outlet | `maxAPI.outlet("gesture", name)` | WIRED | Line 381 inside `fireGesture()` |
| `max/gesture-engine.js` | MAX outlet | `maxAPI.outlet("engine_status", ...)` | WIRED | Lines 331, 343 inside `checkActivity()` |
| `detectShake` | `fireGesture` | `fireGesture("shake")` when consecutive count met | WIRED | Line 416 |
| `detectTap` | `fireGesture` | `fireGesture("tap")` when spike exceeds threshold | WIRED | Line 453 |
| `detectFlip` | `fireGesture` | `fireGesture("flip")` when Z sign change confirmed | WIRED | Line 488 |
| `checkTilt` | `fireGesture` | `fireGesture(name)` on state change from not-tilted to tilted | WIRED | Line 532 |
| `max/imu-gesture.maxpat` | `max/gesture-engine.js` | `node.script gesture-engine.js @autostart 1` | WIRED | Confirmed in patch JSON; 25 patchlines to node.script inlet, 1 from outlet |
| `imu-gesture.maxpat UI toggles/dials` | `gesture-engine.js handlers` | `prepend gesture_enable/sensitivity/cooldown -> node.script` | WIRED | All 21 prepend gesture objects confirmed connected to node.script |
| `imu-gesture.maxpat (route)` | `imu-gesture.maxpat (outlets)` | `route gesture engine_status smooth_accel smooth_gyro smooth_orientation status cal_status` | WIRED | Main route has all 17 targets; gesture (outlet0) -> abstraction outlet 0; smooth_accel (outlet3) -> abstraction outlet 2; status (outlet12) -> t-l-l -> abstraction outlet 5; cal_status (outlet13) -> abstraction outlet 6 |
| `sel connected-usb` | `calibrate_start` | `delay 500 -> calibrate_start message -> node.script` | WIRED | Auto-calibration chain confirmed: route status (outlet12) -> t-l-l -> sel connected-usb -> delay 500 -> calibrate_start -> node.script |

---

### Requirements Coverage

| Requirement | Source Plan | Description | Status | Evidence |
|-------------|-------------|-------------|--------|----------|
| CORE-01 | 07-01-PLAN | Gesture engine runs as separate node.script without modifying serial-bridge.js | SATISFIED | `max/gesture-engine.js` created fresh; `serial-bridge.js` last modified before Phase 7 (commit 78d752d, Phase 5/6 era); `imu-sensor.maxpat` last modified pre-Phase 7 |
| CORE-02 | 07-01-PLAN | Gesture engine receives smoothed sensor data (NOTE: architecture overridden — see below) | SATISFIED (spirit) | CONTEXT.md and RESEARCH.md document the conscious architectural change: gesture-engine.js is self-contained with its own serial connection rather than receiving data from imu-sensor.maxpat via patch cables. Smoothed data IS processed internally by gesture-engine.js. The requirement's "via MAX patch cables" wording is superseded by the user decision documented in 07-CONTEXT.md. |
| CORE-03 | 07-01-PLAN | Energy-based activity detection gates all gesture recognition | SATISFIED | `checkActivity()` with 0.15g threshold; instant wake, 500ms delayed idle; gesture detectors only called when `activityState === "active"` (processFrame line 621) |
| CORE-04 | 07-01-PLAN | Sliding window buffer maintains recent sensor history | SATISFIED | 64-frame circular buffer; `pushFrame()` stores calibrated frames; `detectTap` uses `getFrame(i)` for running average |
| GEST-01 | 07-02-PLAN | User can detect shake gesture with configurable threshold | SATISFIED | `detectShake()`: threshold = `1.5 + gestureSensitivity.shake * 2.5`; 3-frame consecutive requirement |
| GEST-02 | 07-02-PLAN | User can detect tap gesture with configurable threshold | SATISFIED | `detectTap()`: spikeThreshold = `1.5 + gestureSensitivity.tap * 3.5`; 10-frame running average window |
| GEST-03 | 07-02-PLAN | User can detect flip gesture (180-degree inversion) | SATISFIED | `detectFlip()`: zThreshold = `0.3 + gestureSensitivity.flip * 0.5`; 10 confirmation frames; dead zone filter |
| GEST-04 | 07-02-PLAN | User can detect tilt-left with configurable angle threshold | SATISFIED | `checkTilt("tilt-left", -roll, ...)` with `angleThreshold = 15 + gestureSensitivity["tilt-left"] * 45` |
| GEST-05 | 07-02-PLAN | User can detect tilt-right with configurable angle threshold | SATISFIED | `checkTilt("tilt-right", roll, ...)` |
| GEST-06 | 07-02-PLAN | User can detect tilt-forward with configurable angle threshold | SATISFIED | `checkTilt("tilt-forward", -pitch, ...)` |
| GEST-07 | 07-02-PLAN | User can detect tilt-back with configurable angle threshold | SATISFIED | `checkTilt("tilt-back", pitch, ...)` |
| GEST-08 | 07-01-PLAN | User can enable/disable individual predefined gestures | SATISFIED | `gesture_enable` handler; `gestureEnabled` object with all 7 keys; 7 toggles in patch wired to `prepend gesture_enable <name>` |
| GEST-09 | 07-01-PLAN | All predefined gestures output as named bang events with debounce | SATISFIED | `fireGesture()`: `maxAPI.outlet("gesture", name)` as named symbol; per-gesture cooldown debounce via `lastFireTime` and `gestureCooldown` |
| IMPL-01 | 07-03-PLAN | imu-gesture.maxpat wraps gesture-engine.js with clean inlet/outlet interface | SATISFIED | `imu-gesture.maxpat` exists as valid MAX patch with 1 inlet, 7 outlets (gesture events, engine status, smooth accel/gyro/orient, connection status, cal status) |

**Requirements Coverage: 14/14 — all Phase 7 requirements satisfied**

**CORE-02 Architecture Note:** The REQUIREMENTS.md wording ("via MAX patch cables from imu-sensor.maxpat") describes the original design intent. This was explicitly overridden in the 07-CONTEXT.md user decision session and documented thoroughly in 07-RESEARCH.md (see lines 56, 587-594: "OVERRIDDEN by CONTEXT.md"). The requirement is satisfied in spirit: gesture-engine.js processes smoothed sensor data internally before passing it to detectors. No orphaned requirements were found.

---

### Anti-Patterns Found

| File | Line | Pattern | Severity | Impact |
|------|------|---------|----------|--------|
| `max/gesture-engine.js` | 148, 154, 160 | `return null` | INFO | Valid: `validateLine()` returning null for invalid CSV lines — intentional sentinel value, handled correctly in caller |
| `max/gesture-engine.js` | 361 | `return null` | INFO | Valid: `getFrame()` returning null when buffer has insufficient history — handled by tap detector's `if (f)` guard |

No blockers or warnings found. No placeholder text, TODO comments, empty handlers, or stub implementations remaining.

---

### Structural Notes

**No loadbang/deferlow in imu-gesture.maxpat:** The plan specified "loadbang -> deferlow -> send initial values OR use autopattr/parameter_enable." The implementation uses `parameter_enable: 1` with `parameter_initial` values on all 21 UI objects. This is the alternative method explicitly listed in the plan. When MAX loads the patch, parameter-enabled objects restore their initial values automatically via the MAX parameter system. This is structurally correct.

**No umenu for port selection:** The patch uses a `connect` message box rather than a `umenu` dropdown for port selection. The PLAN listed umenu as one option for the port selector. The implementation provides manual connect/disconnect via message boxes, which satisfies the UI requirement. Port auto-discovery happens inside gesture-engine.js via `findArduinoPort()`.

**gesture_led routing:** `gesture_led` (outlet1 from main route) connects to `route shake tap flip tilt-left tilt-right tilt-forward tilt-back` which splits per-gesture LED signals. Each of the 7 outputs connects to an LED object. The 8th LED object receives from `sel active idle` (engine activity indicator). All 8 LEDs are wired correctly.

**Serial-bridge.js compatibility:** `processFrame()` outputs the same outlet tags as `serial-bridge.js`'s `outputData()`: `accel`, `gyro`, `orientation`, `cal_accel`, `cal_gyro`, `cal_orientation`, `smooth_accel`, `smooth_gyro`, `smooth_orientation`, `norm_*`, `status`, `cal_status`, `cal_progress`, `cal_bias`, `cal_toggle`. Downstream MAX patches using these tags will work with either script.

---

### Human Verification Required

The following tests require physical Arduino hardware and the MAX runtime. Per the 07-03-SUMMARY.md, a human-verify checkpoint was completed and marked "approved by user" during Plan 03 execution. The items below are a structured checklist for final sign-off.

#### 1. Shake Detection

**Test:** Connect Arduino, shake device vigorously with ~2-3g force
**Expected:** "shake" LED blinks in imu-gesture.maxpat; gesture outlet outputs the symbol `shake`; cooldown of ~300ms prevents rapid re-triggering
**Why human:** Activity gate and consecutive-frame detection require live 114 Hz IMU stream

#### 2. Tap Detection

**Test:** Tap the Arduino firmly against a hard surface once
**Expected:** "tap" LED blinks once; gesture outlet outputs `tap`; single tap (not sustained motion) should trigger
**Why human:** Spike-above-average algorithm requires real impact transient

#### 3. Flip Detection

**Test:** Turn the Arduino fully upside-down and hold for approximately 1 second
**Expected:** "flip" LED blinks; gesture outlet outputs `flip`; tilting sideways should NOT trigger (dead zone filter)
**Why human:** Z-axis sign change with 10-frame confirmation requires real gravity vector inversion

#### 4. 4-Direction Tilt Detection

**Test:** Tilt Arduino left, right, forward, back past approximately 37.5 degrees (default sensitivity 0.5)
**Expected:** Correct direction LED blinks once for each tilt; holding at angle does NOT fire continuously (hysteresis); returning to neutral re-arms for next tilt
**Why human:** Hysteresis re-arm behavior requires live orientation data and manual angle assessment

#### 5. Activity Gate — No False Triggers at Rest

**Test:** Place Arduino on flat surface, leave stationary for 5+ seconds
**Expected:** No gesture events output; engine_status stays "idle"
**Why human:** Gravity magnitude at rest (1.0g) is just below the 0.15g threshold; vibration noise is environment-dependent

#### 6. Enable/Disable Toggle

**Test:** Turn off the shake toggle in imu-gesture.maxpat; shake the device; then re-enable the toggle
**Expected:** No shake event while toggle is off; shake events resume immediately after re-enabling
**Why human:** Toggle state must propagate to gesture-engine.js handlers at runtime

#### 7. Sensitivity Adjustment

**Test:** Set shake sensitivity dial to 0.0 (leftmost), attempt a light shake; set to 1.0 (rightmost), attempt the same light shake
**Expected:** Light shake triggers at 0.0 sensitivity (1.5g threshold); same light shake does NOT trigger at 1.0 sensitivity (4.0g threshold)
**Why human:** Threshold scaling requires live calibration and subjective force assessment

#### 8. UI Persistence

**Test:** Adjust several dials and toggles, save the patch (Cmd+S), close MAX, reopen imu-gesture.maxpat
**Expected:** All dial and toggle positions restored to the values set before saving
**Why human:** `parameter_enable=1` persistence requires MAX runtime to exercise the save/restore cycle

---

### Gaps Summary

No gaps found. All 14 requirement IDs (CORE-01 through CORE-04, GEST-01 through GEST-09, IMPL-01) are satisfied by verified code. Both primary artifacts (`max/gesture-engine.js` and `max/imu-gesture.maxpat`) exist, are substantive, and are correctly wired. No stubs, placeholders, or incomplete implementations remain.

The status `human_needed` reflects that 8 of the 14 truths involve real-time gesture behavior with physical hardware that cannot be verified programmatically. Per the 07-03-SUMMARY.md, this verification was completed by the user during the Plan 03 checkpoint task.

---

_Verified: 2026-02-24T17:30:00Z_
_Verifier: Claude (gsd-verifier)_
