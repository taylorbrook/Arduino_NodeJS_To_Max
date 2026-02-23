---
phase: 07-core-engine-and-predefined-gestures
plan: 02
subsystem: gesture-detection
tags: [node-for-max, imu, gesture, shake, tap, flip, tilt, hysteresis, threshold-detection]

# Dependency graph
requires:
  - phase: 07-core-engine-and-predefined-gestures
    plan: 01
    provides: gesture-engine.js core with serial I/O, calibration, smoothing, activity gate, circular buffer, and detector stubs
provides:
  - 7 fully implemented gesture detectors (shake, tap, flip, tilt-left, tilt-right, tilt-forward, tilt-back)
  - Shake detection via consecutive acceleration magnitude threshold
  - Tap detection via spike-above-running-average using circular buffer history
  - Flip detection via Z-axis sign change with confirmation frames and dead zone
  - 4-direction tilt detection with hysteresis re-arm (state-change-only firing)
affects: [07-03 MAX patch, 08 DTW custom gestures]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Shake: acceleration magnitude > threshold for N consecutive frames"
    - "Tap: current magnitude spike above running average from circular buffer"
    - "Flip: Z-axis sign change sustained for N confirmation frames with dead zone filter"
    - "Tilt: state-change-only firing with hysteresis (trigger at threshold, re-arm at 60% of threshold)"
    - "All detectors use sensitivity dial (0-1) to scale detection threshold"

key-files:
  created: []
  modified:
    - max/gesture-engine.js

key-decisions:
  - "Shake threshold range 1.5g-4.0g mapped from sensitivity dial 0.0-1.0, with 3-frame consecutive requirement"
  - "Tap uses 10-frame running average window (~88ms) with 1.5g-5.0g spike threshold range"
  - "Flip requires 10 confirmation frames (~88ms) of sustained inverted Z-axis, with 0.3-0.8g dead zone filter"
  - "Tilt hysteresis re-arm at 60% of threshold prevents jitter at boundary; angle range 15-60 degrees"
  - "checkTilt defined as sibling function to detectTilts for readability"

patterns-established:
  - "Gesture detectors follow enable-check -> compute -> threshold -> fire pattern"
  - "Acceleration-based gestures (shake/tap/flip) use calibrated pre-smoothing data"
  - "Orientation-based gestures (tilts) use smoothed data for stability"
  - "State-change-only pattern for tilt: armed boolean prevents continuous firing"

requirements-completed: [GEST-01, GEST-02, GEST-03, GEST-04, GEST-05, GEST-06, GEST-07]

# Metrics
duration: 2min
completed: 2026-02-22
---

# Phase 7 Plan 02: Predefined Gesture Detectors Summary

**7 gesture detectors (shake, tap, flip, 4 tilts) with sensitivity-scaled thresholds, consecutive/confirmation frame logic, and hysteresis re-arm for tilt state-change-only firing**

## Performance

- **Duration:** 2 min
- **Started:** 2026-02-23T05:36:06Z
- **Completed:** 2026-02-23T05:38:03Z
- **Tasks:** 2
- **Files modified:** 1

## Accomplishments
- Implemented shake detector with 3-frame consecutive acceleration magnitude threshold (1.5g-4.0g range)
- Implemented tap detector using spike-above-running-average from 10-frame circular buffer window
- Implemented flip detector with Z-axis sign change tracking, 10-frame confirmation, and dead zone filter
- Implemented 4-direction tilt detectors with hysteresis re-arm at 60% of threshold, state-change-only firing

## Task Commits

Each task was committed atomically:

1. **Task 1: Implement shake, tap, and flip detectors** - `60c90d1` (feat)
2. **Task 2: Implement 4 tilt detectors with hysteresis** - `c16fa6e` (feat)

**Plan metadata:** [pending] (docs: complete plan)

## Files Created/Modified
- `max/gesture-engine.js` - Replaced all 4 gesture detector stubs with full implementations: detectShake (consecutive magnitude), detectTap (spike-above-average), detectFlip (Z-sign confirmation), detectTilts + checkTilt (hysteresis tilt)

## Decisions Made
- Shake threshold range 1.5g-4.0g provides good range from very sensitive to insensitive; 3-frame minimum filters noise without adding latency
- Tap uses past frames (indices 1-10) from buffer rather than current frame to avoid including the spike in the average
- Flip dead zone (|az| < threshold) prevents false triggers during sideways orientation; 10 confirmation frames (~88ms) balance responsiveness vs. false positives
- Tilt hysteresis at 60% of threshold chosen as standard engineering practice for debounced state transitions
- checkTilt as sibling function (not nested) for clarity and potential reuse

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- All 7 gesture detectors are fully implemented and ready for testing
- Plan 03 will create imu-gesture.maxpat to wrap gesture-engine.js with UI controls
- Each gesture has independent enable/sensitivity/cooldown via existing MAX handlers from Plan 01
- Default sensitivity (0.5) provides mid-range thresholds; hardware testing may require tuning

## Self-Check: PASSED

- FOUND: max/gesture-engine.js
- FOUND: commit 60c90d1
- FOUND: commit c16fa6e

---
*Phase: 07-core-engine-and-predefined-gestures*
*Completed: 2026-02-22*
