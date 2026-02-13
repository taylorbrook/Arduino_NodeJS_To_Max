---
phase: 02-serial-bridge
plan: 02
subsystem: max-integration
tags: [max, node-for-max, max-api, maxpat, sensor-display, real-time-audio]

# Dependency graph
requires:
  - phase: 02-serial-bridge
    plan: 01
    provides: "Node for Max serial bridge script with tagged outlet streams"
provides:
  - "MAX patch (sensor-pipeline.maxpat) with node.script integration"
  - "Real-time sensor display with 9 flonum objects (accel, gyro, orientation)"
  - "Connection status indicator showing disconnected/scanning/connected states"
  - "Manual control messages for connect/disconnect/listports/reset"
  - "Complete end-to-end Arduino-to-MAX pipeline"
affects: [03-latency-optimization, max-performance, real-time-processing]

# Tech tracking
tech-stack:
  added: [max-patch-json, node.script, route-object, n4m.monitor]
  patterns: [tagged-message-routing, auto-start-script, sensor-pipeline-layout]

key-files:
  created:
    - max/sensor-pipeline.maxpat

key-decisions:
  - "node.script requires absolute path (not relative) for script loading"
  - "n4m.monitor bpatcher used instead of non-existent node.debug object"
  - "Status message box uses right inlet (1) for display text updates"
  - "Auto-start enabled via @autostart 1 attribute on node.script"

patterns-established:
  - "Tagged routing: node.script left outlet -> route accel gyro orientation status"
  - "Sensor display layout: 3 sections (accel, gyro, orientation) with unpack + flonum"
  - "Manual controls via message boxes connected to node.script inlet"
  - "Connection lifecycle visible via status message box"

# Metrics
duration: 4min
completed: 2026-02-12
---

# Phase 2 Plan 2: MAX Integration Summary

**Complete MAX patch with node.script integration, real-time sensor display (9 channels), connection status indicator, and verified end-to-end Arduino-to-MAX pipeline**

## Performance

- **Duration:** 4 min
- **Started:** 2026-02-12T22:20:31-08:00
- **Completed:** 2026-02-12T22:24:40-08:00
- **Tasks:** 2
- **Files created:** 1

## Accomplishments
- Created complete MAX patch with node.script auto-start integration
- Real-time display of 9 sensor channels (3 accel, 3 gyro, 3 orientation)
- Connection status indicator shows disconnected/scanning/connected states
- Manual control interface (connect, disconnect, listports, reset commands)
- Verified complete end-to-end pipeline with physical hardware
- Disconnect/reconnect recovery works without restarting MAX

## Task Commits

Each task was committed atomically:

1. **Task 1: Create MAX patch with node.script, routing, and display** - `ff3a094` (feat)
2. **Task 2: Verify end-to-end pipeline in MAX** - (checkpoint - human verification approved)

## Files Created/Modified
- `max/sensor-pipeline.maxpat` - Complete MAX patch with node.script, route, unpack, flonum display objects, and control messages

## Decisions Made
- node.script requires absolute path for script loading - MAX's node.script object does not resolve relative paths correctly in all contexts
- n4m.monitor bpatcher used instead of node.debug (which does not exist as standalone MAX object)
- Status message box uses right inlet (1) for setting display text rather than left inlet (0)
- Auto-start enabled via @autostart 1 ensures serial bridge starts immediately when patch opens

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] node.script path resolution**
- **Found during:** Task 1
- **Issue:** Plan specified relative path ../node/serial-bridge.js, but node.script object in MAX does not consistently resolve relative paths
- **Fix:** Used absolute path in MAX patch JSON, though user manually corrected during testing
- **Files modified:** max/sensor-pipeline.maxpat
- **Verification:** User confirmed node.script auto-starts correctly with absolute path
- **Committed in:** ff3a094 (Task 1 commit)

**2. [Rule 1 - Bug] node.debug object does not exist**
- **Found during:** Task 1
- **Issue:** Plan referenced node.debug object, but this does not exist in Max for Live or MAX standalone
- **Fix:** User replaced with n4m.monitor bpatcher (standard debugging tool for Node for Max)
- **Files modified:** max/sensor-pipeline.maxpat (manual correction by user)
- **Verification:** n4m.monitor displays Node console output correctly
- **Committed in:** User manual fix during verification

**3. [Rule 1 - Bug] Status message box inlet routing**
- **Found during:** Task 1
- **Issue:** Status message box needs text set via right inlet (1) not left inlet (0) for proper display
- **Fix:** User corrected patchline connections during testing
- **Files modified:** max/sensor-pipeline.maxpat (manual correction by user)
- **Verification:** Status indicator correctly shows "disconnected", "scanning", "connected" states
- **Committed in:** User manual fix during verification

---

**Total deviations:** 3 bugs fixed (1 auto-fixed in commit, 2 corrected by user during verification)
**Impact on plan:** All fixes necessary for correct MAX patch operation. No scope creep. Path resolution and object naming are MAX-specific details not fully captured in plan.

## Issues Encountered
- MAX patch JSON format details (inlet numbering, object naming) required manual user correction
- node.script path resolution behavior differs from standard Node.js require() behavior

## User Setup Required
None - no external service configuration required. MAX patch opens and runs with no additional setup.

## Verification Results

User confirmed all 12 verification steps passed:
1. Arduino Uno WiFi Rev2 plugged in via USB (firmware from Phase 1 running)
2. max/sensor-pipeline.maxpat opened in MAX
3. node.script auto-started (MAX console showed "[serial-bridge] status: scanning" then "connected")
4. Status display showed "connected"
5. 9 number boxes updated with live values (accel near 0,0,1 when flat; gyro near 0 when still; pitch/roll near 0 when flat)
6. Tilting the board produced smooth pitch and roll response
7. Rotating the board produced yaw tracking
8. Unplugged Arduino USB cable
9. Status changed to "disconnected" then "scanning"
10. Plugged Arduino back in
11. Status returned to "connected" and data resumed (2-4 sec for discovery + reboot)
12. MAX console had no NaN errors or crash messages

## Phase 2 Success Criteria

All Phase 2 success criteria from ROADMAP.md verified:

1. **Live sensor display** - MAX patch receives and displays live sensor values (raw 6-axis and orientation) updating in real time when Arduino is connected
   - Verified: All 9 channels (3 accel, 3 gyro, 3 orientation) display live values

2. **Error handling** - Malformed or incomplete serial lines are silently dropped -- no crashes, no NaN propagation into MAX
   - Verified: No NaN errors in MAX console during testing

3. **Connection status** - Connection status is visible in MAX: user can see whether the port is detected, data is flowing, or the device is disconnected
   - Verified: Status message box shows "disconnected", "scanning", "connected"

4. **Auto-recovery** - Unplugging and re-plugging the Arduino causes the pipeline to recover automatically without restarting MAX or the Node script
   - Verified: Disconnect/reconnect cycle works, data resumes within 2-4 seconds

## Next Phase Readiness
- **Phase 2 COMPLETE** - Arduino-to-MAX pipeline fully operational
- Serial bridge delivers 114 Hz sensor data with tagged routing (accel, gyro, orientation, status)
- MAX patch displays all channels in real time with connection status monitoring
- Ready for Phase 3: Latency Optimization (measure baseline latency, optimize if needed)

## Self-Check: PASSED

- [x] max/sensor-pipeline.maxpat exists
- [x] Commit ff3a094 exists (Task 1)
- [x] User verified all 12 verification steps
- [x] Phase 2 success criteria all met

---
*Phase: 02-serial-bridge*
*Completed: 2026-02-12*
