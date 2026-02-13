---
phase: 04-musical-tools
plan: 02
subsystem: mapping
tags: [max-msp, maxpat, scale, function, gate, clip, range-mapping, learn-mode, subpatcher, sensor-processing]

# Dependency graph
requires:
  - phase: 04-musical-tools
    plan: 01
    provides: "9 smoothed sensor value broadcasts via send objects (smooth_ax/ay/az, smooth_gx/gy/gz, smooth_pitch/roll/yaw)"
  - phase: 03-calibration
    provides: "Calibrated data outlets feeding into smoothing module"
provides:
  - "9 per-axis range mapping subpatchers with linear/exponential/custom curve types"
  - "Learn mode for input range capture with maximum/minimum tracking and clear-on-restart"
  - "Per-axis clip toggle for constrained or overflow output"
  - "9 send objects broadcasting mapped data (mapped_pitch/roll/yaw, mapped_ax/ay/az, mapped_gx/gy/gz)"
  - "User-drawn custom transfer curves via function objects with dynamic domain/range"
affects: [04-musical-tools-plan-03, 05-abstraction]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Subpatcher pattern (p map_<axis>) for per-axis mapping to keep main patch manageable"
    - "gate 3 for curve type routing: outlet 1=linear, outlet 2=exponential, outlet 3=custom"
    - "umenu + (+ 1) to convert 0-indexed menu to 1-indexed gate selector"
    - "maximum/minimum with clear message for learn mode range capture"
    - "pak setdomain/setrange for dynamic function object domain/range updates"
    - "Dual gate pattern (gate-clip-on + gate-clip-off with ! 1 inverter) for clip bypass"
    - "f object as merge point for multi-path curve output convergence"

key-files:
  created: []
  modified:
    - "max/sensor-pipeline.maxpat"

key-decisions:
  - "Subpatchers (p map_<axis>) used instead of inline objects -- 9 axes with 45 objects each would be 400+ objects in main patch"
  - "Scale objects use float arguments (e.g., scale 0. 90. 0. 1.) to avoid integer truncation (Pitfall 2)"
  - "Function objects initialized with setdomain/setrange via loadbang + updated dynamically via pak when user changes ranges (Pitfall 3)"
  - "Learn mode sends clear to maximum/minimum on start to prevent stale values from previous sessions (Pitfall 8)"
  - "Accelerometer defaults: -2..2 g; Gyroscope defaults: -250..250 dps; Orientation defaults: 0..90 deg; All output 0..1 normalized"

patterns-established:
  - "Subpatcher per-axis mapping module: reusable template for any sensor axis"
  - "Dual-gate clip bypass: avoids complex routing by using ! 1 inverter for mutually exclusive paths"
  - "Learn mode with clear-on-start: prevents accumulation bugs across multiple learn sessions"

# Metrics
duration: 5min
completed: 2026-02-13
---

# Phase 4 Plan 2: Range Mapping Summary

**Per-axis range mapping with 3 curve types (linear/exponential/custom), learn mode, and clip toggle across all 9 sensor axes via subpatchers**

## Performance

- **Duration:** 5 min
- **Started:** 2026-02-13T16:25:32Z
- **Completed:** 2026-02-13T16:30:26Z
- **Tasks:** 2
- **Files modified:** 1

## Accomplishments
- 9 mapping subpatchers (one per sensor axis) with identical internal structure: learn mode, 3 curve types, clip toggle, mapped output
- Orientation axes (pitch/roll/yaw) with 0-90 degree input range defaults
- Accelerometer axes (aX/aY/aZ) with -2..2 g input range defaults
- Gyroscope axes (gX/gY/gZ) with -250..250 dps input range defaults
- All mapped outputs broadcast via send objects for downstream consumption
- Custom curve editing via visible function objects with dynamic domain/range updates

## Task Commits

Each task was committed atomically:

1. **Task 1: Build per-axis range mapping for orientation axes (pitch, roll, yaw)** - `29d377b` (feat)
2. **Task 2: Replicate mapping for accelerometer (aX/aY/aZ) and gyro (gX/gY/gZ) axes** - `d498e8b` (feat)

## Files Created/Modified
- `max/sensor-pipeline.maxpat` - Extended with 9 mapping subpatchers (p map_pitch through p map_gz), each containing learn mode, curve selector, scale/function objects, clip toggle, and mapped output send

## Decisions Made
- Used subpatchers (p map_<axis>) to keep main patch manageable -- 9 axes x 45 objects each would add 400+ objects inline
- Scale objects use float arguments to prevent integer truncation (Pitfall 2 from research)
- Function objects initialized with setdomain/setrange matching input ranges via loadbang, and dynamically updated via pak objects when user changes ranges (Pitfall 3)
- Learn mode clears maximum/minimum on start to prevent stale values from previous sessions (Pitfall 8)
- Clip bypass uses dual gate pattern with ! 1 inverter for mutually exclusive clip-on/clip-off paths

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- All 9 mapped outputs broadcasting via send objects ready for downstream use
- MAXI-02 (range mapping) fully implemented
- Ready for Plan 03 (threshold triggers + 3D visualization)
- Mapped values available as: mapped_pitch, mapped_roll, mapped_yaw, mapped_ax, mapped_ay, mapped_az, mapped_gx, mapped_gy, mapped_gz

## Self-Check: PASSED

- FOUND: max/sensor-pipeline.maxpat
- FOUND: 04-02-SUMMARY.md
- FOUND: 29d377b (Task 1 commit)
- FOUND: d498e8b (Task 2 commit)

---
*Phase: 04-musical-tools*
*Completed: 2026-02-13*
