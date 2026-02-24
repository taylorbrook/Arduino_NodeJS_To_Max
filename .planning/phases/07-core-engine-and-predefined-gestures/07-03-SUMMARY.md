---
phase: 07-core-engine-and-predefined-gestures
plan: 03
subsystem: gesture-detection
tags: [max-patch, node-for-max, imu, gesture, ui, abstraction, persistence]

# Dependency graph
requires:
  - phase: 07-core-engine-and-predefined-gestures
    plan: 02
    provides: gesture-engine.js with 7 fully implemented gesture detectors and per-gesture configuration handlers
provides:
  - imu-gesture.maxpat MAX abstraction wrapping gesture-engine.js with per-gesture UI rows
  - 7 gesture configuration rows (enable toggle, sensitivity dial, cooldown dial, fire LED)
  - Multi-outlet interface (gestures, engine status, smooth accel/gyro/orientation, connection status, cal status)
  - Auto-calibration on Arduino connect with deferlow safety
  - Parameter persistence on all UI controls via parameter_enable
affects: [08 DTW custom gestures, 10 visualization, 11 pure MAX implementation]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "MAX abstraction wrapping node.script with multi-outlet interface for downstream routing"
    - "Per-gesture UI rows: toggle + sensitivity dial + cooldown dial + fire LED in repeating vertical layout"
    - "parameter_enable: 1 on all dials and toggles for save/restore persistence"
    - "deferlow after loadbang for safe node.script initialization"
    - "route-based outlet splitting: gesture, engine_status, smooth_accel, smooth_gyro, smooth_orientation, status, cal_status"

key-files:
  created:
    - max/imu-gesture.maxpat
  modified: []

key-decisions:
  - "7 outlets: gesture events, engine status, smooth accel, smooth gyro, smooth orientation, connection status, calibration status"
  - "Per-gesture rows with toggle, sensitivity dial (0.0-1.0), cooldown dial (gesture-specific ms range), and fire LED"
  - "Hardware-verified: all 7 gestures detect correctly with physical Arduino device"

patterns-established:
  - "imu-gesture.maxpat as the user-facing gesture abstraction -- drop in, connect, receive named gesture events"
  - "route gesture -> downstream route shake tap flip tilt-left tilt-right tilt-forward tilt-back for per-gesture splitting"

requirements-completed: [IMPL-01]

# Metrics
duration: 3min
completed: 2026-02-24
---

# Phase 7 Plan 03: imu-gesture.maxpat Abstraction Summary

**imu-gesture.maxpat MAX abstraction with node.script integration, 7 per-gesture UI rows (toggle/sensitivity/cooldown/LED), 7-outlet interface, and hardware-verified gesture detection**

## Performance

- **Duration:** 3 min
- **Started:** 2026-02-24T16:26:17Z
- **Completed:** 2026-02-24T16:29:00Z
- **Tasks:** 2
- **Files modified:** 1

## Accomplishments
- Created imu-gesture.maxpat as complete MAX abstraction wrapping gesture-engine.js with @autostart 1
- Built 7 gesture configuration rows each with enable toggle, sensitivity dial (0.0-1.0), cooldown dial (gesture-specific ms range), and fire LED indicator
- Implemented 7-outlet interface: gesture events, engine status, smooth accel/gyro/orientation, connection status, calibration status
- Hardware-verified all 7 predefined gestures (shake, tap, flip, tilt-left, tilt-right, tilt-forward, tilt-back) detect correctly with physical Arduino
- All UI state persists across save/reopen via parameter_enable on every dial and toggle

## Task Commits

Each task was committed atomically:

1. **Task 1: Create imu-gesture.maxpat with node.script, routing, UI, and outlets** - `ffe7bb9` (feat)
2. **Task 2: Verify gesture detection with physical hardware** - checkpoint:human-verify (approved by user)

**Plan metadata:** [pending] (docs: complete plan)

## Files Created/Modified
- `max/imu-gesture.maxpat` - Self-contained MAX abstraction with node.script loading gesture-engine.js, minimal sensor controls (port selector, connect/disconnect, status, activity LED), 7 gesture rows with per-gesture enable/sensitivity/cooldown/LED, auto-calibration on connect, and 7 abstraction outlets

## Decisions Made
- 7-outlet layout matches sensor data superset: gesture events first (outlet 0) for primary use case, then engine status, smooth sensor data, and status outlets
- Per-gesture cooldown dials have gesture-specific ranges (shake=1000ms, tap=500ms, flip=2000ms, tilts=1000ms) matching the detector behavior ranges
- Hardware verification confirmed all gestures detect correctly with sensible defaults at sensitivity=0.5

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- Phase 7 is complete: gesture-engine.js core (Plan 01), 7 gesture detectors (Plan 02), and imu-gesture.maxpat abstraction (Plan 03)
- Phase 8 (Custom DTW Gesture Recognition) can begin -- gesture engine infrastructure is operational
- Phase 9 (Position Interpolation) can also begin in parallel -- depends only on Phase 7 core engine
- imu-gesture.maxpat outlet interface will be extended in Phase 8 to include DTW match outputs

## Self-Check: PASSED

- FOUND: max/imu-gesture.maxpat
- FOUND: commit ffe7bb9

---
*Phase: 07-core-engine-and-predefined-gestures*
*Completed: 2026-02-24*
