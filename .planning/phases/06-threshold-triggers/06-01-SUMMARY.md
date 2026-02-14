---
phase: 06-threshold-triggers
plan: 01
subsystem: max-abstraction
tags: [max-msp, threshold, hysteresis, triggers, subpatcher]

# Dependency graph
requires:
  - phase: 05-abstraction-wifi
    provides: "imu-sensor.maxpat abstraction with 13-outlet API, #0 prefix isolation, smoothed data routing"
provides:
  - "6 threshold subpatchers (p thresh_pitch, roll, yaw, ax, ay, az) with hysteresis"
  - "Threshold configuration via control inlet messages: threshold <axis> <value> [hysteresis]"
  - "Triggers outlet (index 13) outputting '<axis> up' and '<axis> down' messages"
  - "Dead prepend threshold -> node.script wiring removed"
affects: [06-02, help-patch]

# Tech tracking
tech-stack:
  added: []
  patterns: ["dual-comparator hysteresis (> upper / < lower + change + select 1)", "t l l l third outlet for threshold data tap"]

key-files:
  created: []
  modified: ["max/imu-sensor.maxpat"]

key-decisions:
  - "Single configurable threshold per axis (not 2 fixed as in sensor-pipeline) -- simpler, user configures what they need"
  - "Thresholds implemented in MAX, not Node -- consumer-side feature matches mapping pattern"
  - "Direct wiring via t l l l third outlet instead of send/receive -- avoids #0 prefix complexity"
  - "Removed dead prepend threshold -> node.script wiring -- threshold messages handled entirely in MAX"

patterns-established:
  - "Threshold subpatcher pattern: inlet data + inlet config, dual comparators with hysteresis, change + select 1, up/down messages on single outlet"
  - "Third t l l l outlet for tapping smoothed data into threshold chain without disrupting existing routing"

# Metrics
duration: 3min
completed: 2026-02-13
---

# Phase 6 Plan 1: Threshold Triggers Summary

**6 threshold subpatchers with dual-comparator hysteresis wired to smoothed sensor data and triggers outlet, configurable via control inlet messages**

## Performance

- **Duration:** 3 min
- **Started:** 2026-02-14T04:29:35Z
- **Completed:** 2026-02-14T04:33:04Z
- **Tasks:** 1
- **Files modified:** 1

## Accomplishments
- Built 6 threshold subpatchers (p thresh_pitch, roll, yaw, ax, ay, az) with full hysteresis logic adapted from sensor-pipeline.maxpat proven pattern
- Connected threshold configuration chain: control inlet -> route threshold -> route pitch roll yaw ax ay az -> per-axis subpatcher config inlets
- Tapped smoothed data into thresholds via t l l l third outlets on smooth_accel and smooth_orientation routes
- Wired all 6 threshold outputs through prepend axis tagging to triggers outlet (JSON index 13, MAX display index 12)
- Removed dead prepend threshold -> node.script wiring that sent threshold messages to Node where nothing handled them

## Task Commits

Each task was committed atomically:

1. **Task 1: Build threshold subpatchers and wire data flow** - `ca14a74` (feat)

## Files Created/Modified
- `max/imu-sensor.maxpat` - Added 6 threshold subpatchers with hysteresis, threshold config routing, smoothed data tapping via third trigger outlets, triggers outlet wiring, removed dead Node threshold wiring

## Decisions Made
- Single configurable threshold per axis (not 2 fixed as in sensor-pipeline.maxpat) -- matches help patch documented API and is simpler for users
- Thresholds implemented entirely in MAX (not Node) -- matches architectural pattern where consumer-side features (mapping, thresholds) live in MAX while data processing (calibration, smoothing) lives in Node
- Used direct wiring via t l l l third outlet for data flow into thresholds instead of send/receive -- avoids needing additional #0-prefixed sends, simpler and more maintainable
- Default thresholds: 45 degrees with 5 hysteresis for orientation axes, 1.0 g with 0.2 hysteresis for accelerometer axes
- Removed obj-prepend-threshold box entirely (dead code) rather than just disconnecting

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered

None.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness
- Threshold triggers fully functional in abstraction
- Plan 06-02 (help patch update, ROADMAP cleanup) can proceed immediately
- Help patch Recipe 2 should now work with actual implementation

## Self-Check: PASSED

- FOUND: max/imu-sensor.maxpat
- FOUND: .planning/phases/06-threshold-triggers/06-01-SUMMARY.md
- FOUND COMMIT: ca14a74 feat(06-01): add threshold triggers with hysteresis to imu-sensor abstraction

---
*Phase: 06-threshold-triggers*
*Completed: 2026-02-13*
