---
phase: quick
plan: 1
subsystem: musical-tools
tags: [normalization, max-msp, node-for-max, sensor-data, 0-1-mapping]

# Dependency graph
requires:
  - phase: 04-musical-tools
    provides: smoothing pipeline and EMA output
provides:
  - Normalization toggle for all 9 sensor axes to 0.0-1.0 range
  - norm_accel, norm_gyro, norm_orientation outlets in Node bridge
  - Normalized output display in sensor-pipeline.maxpat
  - Normalized outlet forwarding in imu-sensor.maxpat abstraction
affects: [musical-mapping, downstream-tools]

# Tech tracking
tech-stack:
  added: []
  patterns: [min-max-normalization-with-clamping, non-destructive-outlet-tags]

key-files:
  created: []
  modified:
    - node/serial-bridge.js
    - max/sensor-pipeline.maxpat
    - max/imu-sensor.maxpat

key-decisions:
  - "Normalization applies to smoothed (final-stage) data for most useful musical mapping output"
  - "Uses separate norm_* outlet tags instead of replacing smooth_* -- non-destructive, existing patches keep working"
  - "Uses known sensor hardware limits for range mapping (16g accel, 2000dps gyro, 90/180/360 orientation)"

patterns-established:
  - "Normalization pattern: min-max mapping with 0-1 clamping via normalizeValue() helper"

requirements-completed: [NORM-01]

# Metrics
duration: 4min
completed: 2026-02-22
---

# Quick Task 1: Add Normalization Toggle Summary

**Min-max normalization toggle mapping all 9 sensor axes to 0.0-1.0 range via separate norm_* outlets, controllable from MAX patch**

## Performance

- **Duration:** 4 min
- **Started:** 2026-02-22T19:02:52Z
- **Completed:** 2026-02-22T19:07:12Z
- **Tasks:** 2
- **Files modified:** 3

## Accomplishments
- Normalization logic with NORM_RANGES constants for all 9 axes (accel +/-16g, gyro +/-2000dps, pitch +/-90, roll +/-180, yaw 0-360)
- Non-destructive norm_accel, norm_gyro, norm_orientation outlets that only emit when toggle enabled
- Normalize toggle UI in sensor-pipeline.maxpat with flonum display section for all 9 normalized values
- 3 new outlets in imu-sensor.maxpat abstraction for downstream normalized data routing

## Task Commits

Each task was committed atomically:

1. **Task 1: Add normalization logic and toggle handler to serial-bridge.js** - `78d752d` (feat)
2. **Task 2: Add normalization toggle and routing to MAX patches** - `a335d85` (feat)

## Files Created/Modified
- `node/serial-bridge.js` - Added NORM_RANGES, normalizeValue(), normalize handler, norm_* outlets in outputData
- `max/sensor-pipeline.maxpat` - Updated route to 19 tags, added toggle/message/comment, unpack/flonum display section, patchlines
- `max/imu-sensor.maxpat` - Updated route to 20 tags, added 3 norm outlet objects, updated ready tag index, added patchlines

## Decisions Made
- Normalization applies to smoothed (final-stage) data -- most useful for musical mapping since it's already calibrated and filtered
- Separate norm_* outlet tags rather than replacing smooth_* -- non-destructive approach keeps existing patches working
- Values clamped to 0.0-1.0 to handle any overshoot from calibration offsets
- Used known sensor hardware limits for deterministic range mapping (not adaptive/learned ranges)

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered

None.

## User Setup Required

None - no external service configuration required.

## Next Steps
- Open sensor-pipeline.maxpat in MAX and verify normalize toggle works with live Arduino data
- All normalized values should stay within 0.0-1.0 range even at sensor extremes

## Self-Check: PASSED

All files verified present, all commits verified in git log.

---
*Quick Task: 1*
*Completed: 2026-02-22*
