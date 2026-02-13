---
phase: 04-musical-tools
plan: 01
subsystem: smoothing
tags: [max-msp, maxpat, slide, dial, ema-smoothing, quaternion, jit-euler2quat, sensor-processing]

# Dependency graph
requires:
  - phase: 03-calibration
    provides: "Calibrated data outlets (cal_accel, cal_gyro, cal_orientation) with bias-corrected sensor values"
  - phase: 02-serial-bridge
    provides: "sensor-pipeline.maxpat base patch, node.script bridge, route object"
provides:
  - "Three-tier EMA smoothing module with 13 dials (1 global + 3 group + 9 per-axis)"
  - "9 slide objects for per-axis EMA smoothing on all calibrated sensor axes"
  - "9 send objects broadcasting smoothed data (smooth_ax/ay/az, smooth_gx/gy/gz, smooth_pitch/roll/yaw)"
  - "Quaternion output from raw orientation via jit.euler2quat with 4 flonum display (qX/qY/qZ/qW)"
  - "Smoothed quaternion broadcast via s quat_smooth for 3D visualization"
affects: [04-musical-tools-plan-02, 04-musical-tools-plan-03]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Three-tier multiplication chain: global * group * per_axis -> slide factor"
    - "loadbang -> int 1 -> dial initialization for default pass-through"
    - "maximum 1 object to enforce minimum slide factor of 1"
    - "send/receive pattern for cross-section data routing (smoothed values)"
    - "jit.euler2quat for Euler-to-quaternion conversion in MAX (avoids firmware changes)"

key-files:
  created: []
  modified:
    - "max/sensor-pipeline.maxpat"

key-decisions:
  - "Quaternion computed in MAX via jit.euler2quat, not in firmware -- avoids 57600 baud bandwidth limit"
  - "Dial objects with setminmax 1 50 and floatoutput 1 -- minimum 1 ensures pass-through default"
  - "maximum 1 objects enforce floor on effective slide factor after multiplication"
  - "Raw quaternion from raw orientation for accuracy; smoothed quaternion from smoothed orientation for 3D viz"
  - "slide objects use both slide-up and slide-down (inlets 1 and 2) set to same value for symmetric smoothing"

patterns-established:
  - "Three-tier dial hierarchy for parameter control across grouped sensor axes"
  - "send/receive broadcast pattern for downstream module consumption"
  - "Dual quaternion paths: raw for display, smoothed for visualization"

# Metrics
duration: 7min
completed: 2026-02-13
---

# Phase 4 Plan 1: Smoothing + Quaternion Summary

**Three-tier EMA smoothing via 13 dials controlling 9 slide objects on all calibrated sensor axes, plus quaternion output from jit.euler2quat with 4 flonum display values**

## Performance

- **Duration:** 7 min
- **Started:** 2026-02-13T16:16:22Z
- **Completed:** 2026-02-13T16:22:53Z
- **Tasks:** 2
- **Files modified:** 1

## Accomplishments
- 13 smoothing dials (1 global, 3 group, 9 per-axis) with three-tier multiplication hierarchy controlling 9 slide objects
- All dials default to 1 (pass-through) via loadbang initialization; dial range 1-50
- 9 smoothed output flonums + 9 send objects broadcasting smoothed data for downstream Plans 02/03
- Quaternion display with 4 flonum values (qX, qY, qZ, qW) computed from raw orientation via jit.euler2quat
- Smoothed quaternion path for 3D visualization via send quat_smooth

## Task Commits

Each task was committed atomically:

1. **Task 1: Add three-tier smoothing module with 13 dials and slide objects** - `609d306` (feat)
2. **Task 2: Add quaternion output via jit.euler2quat** - `8f74838` (feat)

## Files Created/Modified
- `max/sensor-pipeline.maxpat` - Extended with smoothing module (13 dials, 9 slides, 9 sends) and quaternion section (2 jit.euler2quat objects, 4 flonums, quat_smooth send)

## Decisions Made
- Quaternion computed in MAX (not firmware) using jit.euler2quat -- 57600 baud cannot carry additional CSV fields at 114 Hz
- Both slide-up and slide-down inlets set to the same factor for symmetric smoothing behavior
- Raw orientation feeds quaternion display (accuracy), smoothed orientation feeds quat_smooth (visualization smoothness)
- Dial minimum of 1 via setminmax ensures pass-through at default; maximum 1 object adds safety floor after multiplication

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- Smoothed data broadcasting via send objects ready for Plan 02 (range mapping and thresholds)
- Smoothed quaternion broadcasting via quat_smooth ready for Plan 03 (3D visualization)
- All 9 calibrated axes flow through smoothing -> display -> send chain
- Quaternion display operational for orientation monitoring

## Self-Check: PASSED

- FOUND: max/sensor-pipeline.maxpat
- FOUND: 609d306 (Task 1 commit)
- FOUND: 8f74838 (Task 2 commit)

---
*Phase: 04-musical-tools*
*Completed: 2026-02-13*
