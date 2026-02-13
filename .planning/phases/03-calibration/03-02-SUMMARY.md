---
phase: 03-calibration
plan: 02
subsystem: calibration
tags: [max-msp, maxpat, calibration-ui, textbutton, slider, flonum, node-for-max]

# Dependency graph
requires:
  - phase: 03-calibration-plan-01
    provides: "5 maxAPI handlers, 6 outlet tags for calibrated data"
  - phase: 02-serial-bridge
    provides: "sensor-pipeline.maxpat base patch with raw data display"
provides:
  - "Calibrate toggle button with auto-stop and button state reset"
  - "Reset Orient and Restore Orient buttons"
  - "Calibration progress bar"
  - "Cal status display"
  - "Bias offset value display"
  - "9 calibrated data flonums (accel, gyro, orientation)"
affects: [04-musical-tools]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "textbutton toggle with Node-driven state reset via cal_toggle outlet"
    - "route outlet expansion for new data tags"
    - "set $1 pattern for external button state control"

key-files:
  created: []
  modified:
    - "max/sensor-pipeline.maxpat"
    - "node/serial-bridge.js"

key-decisions:
  - "Auto-stop calibration at TARGET_SAMPLES (200) instead of requiring manual stop"
  - "cal_toggle outlet resets Calibrate button state when auto-stop fires"
  - "Orient reset/restore as two separate bang buttons instead of single toggle"
  - "Removed Reset Cal button — recalibrating overwrites old biases, raw data always visible"

patterns-established:
  - "Node-to-MAX button state sync via dedicated outlet + set $1 message"
  - "Bang buttons preferred over toggles for independent actions"

# Metrics
duration: 5min
completed: 2026-02-12
---

# Phase 3 Plan 2: MAX Calibration UI Summary

**Calibration controls (Calibrate toggle, Reset/Restore Orient buttons), progress bar, bias display, and 9 calibrated data flonums in MAX patch with auto-stop and button state sync**

## Performance

- **Duration:** 5 min
- **Started:** 2026-02-13T07:22:00Z
- **Completed:** 2026-02-13T07:27:00Z
- **Tasks:** 2 (1 auto + 1 human verification)
- **Files modified:** 2

## Accomplishments
- MAX patch extended with complete calibration UI: Calibrate toggle, Reset Orient, Restore Orient buttons
- Progress bar (slider) shows sample collection advancing to 200
- Cal status text shows idle/collecting/applied/orient_reset/orient_restored
- Bias offset display formatted as aX/aY/aZ/gX/gY/gZ
- 9 new flonums for calibrated accel, gyro, and orientation data
- Auto-stop calibration at 200 samples with Node-driven button state reset
- All verified end-to-end with physical Arduino hardware

## Task Commits

Each task was committed atomically:

1. **Task 1: Extend MAX patch with calibration UI** - `562c8b5` (feat)
2. **Fix: Reset calibrate toggle on auto-stop** - `b842e27` (fix)
3. **Fix: Split orient toggle into two buttons** - `9d7bfc3` (fix)
4. **Fix: Remove redundant Reset Cal button** - `7c63960` (fix)
5. **Task 2: Hardware verification** - approved by user

## Files Created/Modified
- `max/sensor-pipeline.maxpat` - Calibration UI controls, progress bar, status display, bias display, 9 calibrated data flonums, route expanded to 12 outlets
- `node/serial-bridge.js` - Added cal_toggle outlet for button state sync, auto-stop at TARGET_SAMPLES

## Decisions Made
- Auto-stop is better UX than requiring manual stop — progress bar fills and calibration applies automatically
- cal_toggle outlet + set $1 message pattern lets Node reset MAX button state cleanly
- Two separate buttons for orient reset/restore is clearer than a toggle since they're independent actions
- Reset Cal button removed as redundant — recalibrating overwrites, raw data always visible

## Deviations from Plan

### Auto-fixed Issues

**1. Auto-stop calibration at TARGET_SAMPLES**
- **Found during:** Task 2 (hardware verification)
- **Issue:** User expected calibration to auto-complete when progress bar filled
- **Fix:** Added stopCalibrationAndApply() call when sampleCount >= TARGET_SAMPLES in collectSample()
- **Files modified:** node/serial-bridge.js
- **Verification:** Calibration auto-stops at 200 samples
- **Committed in:** 18db869

**2. Toggle button state not resetting on auto-stop**
- **Found during:** Task 2 (hardware verification)
- **Issue:** textbutton stayed in "Stop & Apply" state after auto-stop
- **Fix:** Added cal_toggle outlet from Node, routed through set $1 to textbutton
- **Files modified:** node/serial-bridge.js, max/sensor-pipeline.maxpat
- **Verification:** Button resets to "Calibrate" on auto-stop
- **Committed in:** b842e27

**3. Orient toggle replaced with two buttons**
- **Found during:** Task 2 (hardware verification)
- **Issue:** User questioned why orient reset/restore was a toggle
- **Fix:** Split into two independent bang buttons
- **Files modified:** max/sensor-pipeline.maxpat
- **Committed in:** 9d7bfc3

**4. Reset Cal button removed**
- **Found during:** Task 2 (hardware verification)
- **Issue:** User questioned purpose — recalibrating overwrites, raw data always visible
- **Fix:** Removed button, message object, and all wiring
- **Files modified:** max/sensor-pipeline.maxpat
- **Committed in:** 7c63960

---

**Total deviations:** 4 (all user-requested improvements during verification)
**Impact on plan:** Better UX. No scope creep — all changes simplify the interface.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- Complete calibration system operational: bias calibration + orientation reset
- All Phase 3 success criteria verified with physical hardware
- Ready for Phase 4: Musical Tools (smoothing, scaling, thresholds, visualization)

## Self-Check: PASSED

- FOUND: max/sensor-pipeline.maxpat
- FOUND: node/serial-bridge.js
- FOUND: 562c8b5, b842e27, 9d7bfc3, 7c63960 (commits)

---
*Phase: 03-calibration*
*Completed: 2026-02-12*
