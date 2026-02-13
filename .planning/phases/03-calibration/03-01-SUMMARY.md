---
phase: 03-calibration
plan: 01
subsystem: calibration
tags: [imu, calibration, bias-offset, orientation-reset, exponential-decay, node-for-max]

# Dependency graph
requires:
  - phase: 02-serial-bridge
    provides: "serial-bridge.js with raw data pipeline, maxAPI outlets, addHandler pattern"
provides:
  - "Bias offset calibration via stationary sample averaging"
  - "Orientation reset with smooth exponential decay transition"
  - "5 new maxAPI handlers (calibrate_start/stop/reset, orient_reset/restore)"
  - "6 new outlet tags (cal_accel, cal_gyro, cal_orientation, cal_status, cal_progress, cal_bias)"
affects: [03-calibration-plan-02, 04-smoothing]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Stationary sample averaging for IMU bias calibration"
    - "Save-and-subtract orientation reset with exponential decay blend"
    - "Conditional outlet calls (calibrated outlets only fire when biasOffsets exist)"

key-files:
  created: []
  modified:
    - "node/serial-bridge.js"

key-decisions:
  - "TARGET_SAMPLES=200 (~1.75s at 114Hz) with MIN_SAMPLES=50 safety threshold"
  - "Accelerometer Z-axis gravity correction: bias = (mean - 1.0) so flat reads exactly 1.0g"
  - "BLEND_SPEED=10 for ~500ms exponential decay convergence on orientation reset"
  - "calibrate_reset clears both biasOffsets and orientOffset to avoid stale orientation offsets"
  - "Calibrated outlets only fire when biasOffsets exist -- avoids duplicate IPC overhead when uncalibrated"
  - "Orientation reset independent of bias calibration -- cal_orientation fires if orientOffset set even without biasOffsets"

patterns-established:
  - "Calibration handler pattern: addHandler(calibrate_*) -> function call"
  - "Conditional outlet pattern: only emit calibrated data when calibration active"
  - "Startup sync pattern: cal_status idle on load to reset MAX UI state"

# Metrics
duration: 1min
completed: 2026-02-12
---

# Phase 3 Plan 1: Calibration Node Logic Summary

**Bias offset calibration with gravity-corrected accelerometer Z-axis, orientation reset with 500ms exponential decay smooth transition, and 5 maxAPI handlers for MAX control**

## Performance

- **Duration:** 1 min
- **Started:** 2026-02-13T07:20:11Z
- **Completed:** 2026-02-13T07:21:23Z
- **Tasks:** 1
- **Files modified:** 1

## Accomplishments
- Complete calibration logic added to serial-bridge.js (~180 new lines)
- Sample collection with running sums, bias computation with gravity correction on accelerometer Z-axis
- Smooth orientation reset using exponential decay (blendFactor 0->1 with snap at 0.999)
- Yaw wrapping normalization for 0/360 boundary handling
- 5 new maxAPI handlers for full calibration control from MAX
- 6 new outlet tags for calibrated data, status, progress, and bias display
- Startup cal_status "idle" sync to prevent stale UI state after script restart

## Task Commits

Each task was committed atomically:

1. **Task 1: Add calibration state, sample collection, and bias computation** - `391b055` (feat)

**Plan metadata:** TBD (docs: complete plan)

## Files Created/Modified
- `node/serial-bridge.js` - Extended with calibration state variables, 8 calibration functions (startCalibration, collectSample, stopCalibrationAndApply, applyCal, getTimeDelta, resetOrientation, restoreOrientation, applyOrientReset), modified outputData with calibrated outlet logic, 5 new addHandler registrations, startup cal_status sync

## Decisions Made
- TARGET_SAMPLES=200 provides stable bias averaging in ~1.75s -- fast enough for live performance
- MIN_SAMPLES=50 prevents garbage calibration from too-short collection periods
- Accelerometer Z-axis bias uses (mean - 1.0) so flat board reads exactly 1.0g after calibration
- BLEND_SPEED=10 gives ~99% convergence in 500ms -- responsive but avoids jarring audio parameter jumps
- blendFactor snaps to 1.0 at 0.999 to prevent perpetual floating-point noise
- calibrate_reset clears both biasOffsets and orientOffset simultaneously (orientation offset captured from calibrated values would be invalid after bias reset)
- Orientation reset operates independently of bias calibration -- users can reset orientation without calibrating first

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- Calibration logic complete in serial-bridge.js, ready for Plan 02 (MAX patch UI)
- All 5 handlers ready to receive messages from MAX textbutton controls
- All 6 outlet tags ready for routing in sensor-pipeline.maxpat
- No blockers for Plan 02

## Self-Check: PASSED

- FOUND: node/serial-bridge.js
- FOUND: .planning/phases/03-calibration/03-01-SUMMARY.md
- FOUND: 391b055 (Task 1 commit)

---
*Phase: 03-calibration*
*Completed: 2026-02-12*
