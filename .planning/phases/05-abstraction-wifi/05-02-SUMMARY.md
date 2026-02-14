---
phase: 05-abstraction-wifi
plan: 02
subsystem: abstraction
tags: [max-msp, maxpat, abstraction, patcherargs, inlet, outlet, node-script, jit-euler2quat, mapping, quaternion, 3d-visualization, jitter]

# Dependency graph
requires:
  - phase: 05-abstraction-wifi
    plan: 01
    provides: "WiFi dual-mode transport switching in serial-bridge.js (usb/wifi/auto handlers, dgram UDP)"
  - phase: 04-musical-tools
    plan: 01
    provides: "EMA smoothing in Node with three-tier smooth factor handlers"
  - phase: 04-musical-tools
    plan: 02
    provides: "Per-axis range mapping subpatchers with learn mode and 3 curve types"
  - phase: 03-calibration
    provides: "Bias calibration and orientation reset in serial-bridge.js"
provides:
  - "imu-sensor.maxpat: drop-in MAX abstraction with 1 control inlet and 13 data outlets"
  - "patcherargs-based configuration: @smooth, @transport, @ip, @udpport attributes"
  - "Message-based control API: smoothing, threshold, transport, calibrate, orient_reset, orient_restore, mapping, connect, disconnect"
  - "Transport dropdown UI inside abstraction (umenu: usb/wifi/auto)"
  - "9 mapping subpatchers replicated from sensor-pipeline.maxpat with instance-isolated send/receive"
  - "Quaternion output from both raw and smoothed orientation via jit.euler2quat"
  - "imu-sensor-3dviz.maxpat: standalone companion 3D visualization with Euler and quaternion inlets"
affects: [05-abstraction-wifi/05-03]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "MAX abstraction with patcherargs for @attribute parsing and #1 positional argument substitution"
    - "#0 prefix on all internal send/receive for instance-unique routing"
    - "deferlow chain for safe node.script initialization in abstraction context"
    - "route dispatcher for message-based control inlet API"
    - "Companion patch pattern: separate visualization from data pipeline"

key-files:
  created:
    - "max/imu-sensor.maxpat"
    - "max/imu-sensor-3dviz.maxpat"
  modified: []

key-decisions:
  - "#0 prefix on all internal send/receive pairs for instance isolation -- prevents conflicts with multiple abstraction instances"
  - "patcherargs right outlet routes @attributes through deferlow chain to node.script handlers"
  - "Euler-based 3D rotation in companion patch (rotatexyz X=pitch Y=yaw Z=roll) matching established convention"
  - "Triggers outlet (12) is placeholder -- wired but no internal routing yet, ready for threshold module"
  - "Mapping subpatchers use #0_mapped_<axis> send names for instance isolation"

patterns-established:
  - "Abstraction inlet message API: 'command arg1 arg2' format routed via route object"
  - "13-outlet sensor abstraction API: status(0), raw(1-3), calibrated(4-6), smoothed(7-9), mapped(10), quaternion(11), triggers(12)"
  - "Companion visualization patch: separate .maxpat with Euler and quaternion inlets"

# Metrics
duration: 5min
completed: 2026-02-14
---

# Phase 5 Plan 2: MAX Abstraction Summary

**Drop-in [imu-sensor] MAX abstraction with 13-outlet sensor API, patcherargs configuration, message-based control, and companion 3D visualization patch**

## Performance

- **Duration:** 5 min
- **Started:** 2026-02-14T02:32:29Z
- **Completed:** 2026-02-14T02:37:53Z
- **Tasks:** 2
- **Files created:** 2

## Accomplishments
- imu-sensor.maxpat abstraction encapsulates entire sensor pipeline: users instantiate [imu-sensor @smooth 0.3 @transport usb] in any MAX patch
- 13 outlets deliver correctly ordered sensor data: status, raw accel/gyro/orientation, calibrated accel/gyro/orientation, smoothed accel/gyro/orientation, mapped values, quaternion, triggers
- Control inlet accepts all configuration messages (smoothing, threshold, transport, calibrate, orient_reset, orient_restore, mapping, connect, disconnect) without opening the abstraction
- 9 mapping subpatchers replicated with full learn mode, 3 curve types, clip toggle, instance-isolated via #0 prefix
- imu-sensor-3dviz.maxpat companion patch for real-time 3D board orientation visualization

## Task Commits

Each task was committed atomically:

1. **Task 1: Create imu-sensor.maxpat abstraction with full inlet/outlet API and message routing** - `995f215` (feat)
2. **Task 2: Create imu-sensor-3dviz.maxpat companion visualization patch** - `e73dcca` (feat)

**Plan metadata:** (pending final commit)

## Files Created/Modified
- `max/imu-sensor.maxpat` - Drop-in MAX abstraction: 1 inlet, 13 outlets, patcherargs, node.script, transport UI, quaternion module, 9 mapping subpatchers
- `max/imu-sensor-3dviz.maxpat` - Companion 3D visualization: 2 inlets (Euler + quaternion), jit.gl.gridshape cube, rotatexyz orientation, metro render loop

## Decisions Made
- Used #0 prefix on ALL internal send/receive pairs to enable multiple abstraction instances without name conflicts
- patcherargs right outlet dispatches @attributes through deferlow chain to prevent node.script "not ready" race conditions
- Euler-based rotation in 3D viz (matching existing convention) with quaternion inlet reserved for future quaternion-native rotation
- Triggers outlet (index 12) exists as placeholder -- outlet is wired but no internal threshold module yet (ready for Plan 03 or future work)
- Mapping subpatchers use instance-isolated sends (#0_mapped_<axis>) instead of global sends
- sensor-pipeline.maxpat intentionally left unchanged as standalone reference/development patch

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required. Both patches are self-contained MAX files that work when the max/ directory is in MAX's search path.

## Next Phase Readiness
- Abstraction is ready for help patch documentation in Plan 03
- All 13 outlets are wired and functional
- Message-based control API is complete and ready for help patch examples
- Companion 3D viz patch demonstrates the orientation outlet usage pattern
- sensor-pipeline.maxpat remains as standalone reference for development

## Self-Check: PASSED

All files verified present. All commits verified in git log.

---
*Phase: 05-abstraction-wifi*
*Completed: 2026-02-14*
