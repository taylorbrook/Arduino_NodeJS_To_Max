---
phase: 02-serial-bridge
plan: 01
subsystem: serial-bridge
tags: [serialport, node-for-max, max-api, serial, csv-parsing, usb]

# Dependency graph
requires:
  - phase: 01-arduino-firmware
    provides: "Arduino firmware sending 9-value CSV at 57600 baud over USB serial"
provides:
  - "Node for Max serial bridge script (serial-bridge.js)"
  - "CSV validation and parsing for 9-field IMU data"
  - "Tagged maxAPI.outlet() streams: accel, gyro, orientation, status"
  - "Auto-discovery and reconnection for Arduino USB port"
  - "npm project with serialport v12 dependency"
affects: [02-02, max-patch, serial-communication]

# Tech tracking
tech-stack:
  added: [serialport@12, "@serialport/parser-readline"]
  patterns: [tagged-outlet-messages, connection-state-machine, polling-reconnection, csv-validation]

key-files:
  created:
    - node/serial-bridge.js
    - node/package.json
    - node/package-lock.json
    - node/.gitignore

key-decisions:
  - "serialport v12 for broad Max 8/9 compatibility (v13 requires Node >= 20)"
  - "3 outlet calls per sample (accel, gyro, orientation) for clear routing in MAX"
  - "Polling reconnection via setInterval + SerialPort.list() every 2s"
  - "max-api not installed via npm (provided by MAX runtime)"

patterns-established:
  - "Tagged outlet: maxAPI.outlet(tag, ...values) with route object in MAX"
  - "Connection state machine: disconnected -> scanning -> connected"
  - "Silent drop for malformed CSV; only log STARTUP/ERROR headers"
  - "Cleanup via removeAllListeners + port.close + null assignment"

# Metrics
duration: 2min
completed: 2026-02-13
---

# Phase 2 Plan 1: Serial Bridge Summary

**Node for Max serial bridge with CSV validation, tagged outlet routing (accel/gyro/orientation/status), auto-discovery via vendor ID, and polling reconnection on USB disconnect**

## Performance

- **Duration:** 2 min
- **Started:** 2026-02-13T06:19:02Z
- **Completed:** 2026-02-13T06:20:52Z
- **Tasks:** 2
- **Files modified:** 4

## Accomplishments
- Created Node project with serialport v12 dependency for serial communication
- Implemented complete serial bridge script (237 lines) with full connection lifecycle
- CSV validation silently drops malformed lines (wrong field count, NaN, header lines)
- Tagged outlet messages route cleanly into MAX via route object pattern
- Auto-discovery finds Arduino by vendor ID 2341 or path patterns (usbmodem/ttyACM)
- Polling reconnection recovers from USB disconnect without restarting MAX

## Task Commits

Each task was committed atomically:

1. **Task 1: Create Node project and install serialport** - `028efd4` (chore)
2. **Task 2: Write complete serial bridge script** - `96fc69c` (feat)

## Files Created/Modified
- `node/package.json` - npm manifest with serialport ^12.0.0 dependency
- `node/package-lock.json` - Lockfile for reproducible installs
- `node/.gitignore` - Excludes node_modules from version control
- `node/serial-bridge.js` - Complete serial bridge: parse, validate, route, reconnect

## Decisions Made
- Used serialport v12 (not v13) for compatibility with both Max 8 (Node v20.6.1) and Max 9 (Node v22.18)
- 3 outlet calls per sample at 114 Hz = 342 calls/sec -- well within safe IPC throughput
- Polling reconnection at 2s interval rather than USB event detection (simpler, no native dep)
- max-api intentionally not installed via npm -- provided by MAX runtime at script load

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 2 - Missing Critical] Added .gitignore for node_modules**
- **Found during:** Task 1
- **Issue:** No .gitignore existed in the project; node_modules would be committed to git
- **Fix:** Created node/.gitignore with node_modules/ exclusion
- **Files modified:** node/.gitignore
- **Verification:** git status shows node_modules not tracked
- **Committed in:** 028efd4 (Task 1 commit)

**2. [Rule 2 - Missing Critical] Clear reconnect timer in connect handler**
- **Found during:** Task 2
- **Issue:** Plan's connect handler spec didn't explicitly clear existing reconnect timer before connecting, which could cause duplicate scanning after manual connect
- **Fix:** Added clearInterval(reconnectTimer) and null assignment in the connect handler before calling connectToPort or startScanning
- **Files modified:** node/serial-bridge.js
- **Verification:** Connect handler at lines 193-206 properly cleans up timer state
- **Committed in:** 96fc69c (Task 2 commit)

---

**Total deviations:** 2 auto-fixed (2 missing critical)
**Impact on plan:** Both auto-fixes necessary for correctness. No scope creep.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required. serialport native binaries ship via prebuildify (N-API). If MAX's bundled Node version differs from system Node, user may need to reinstall via `script npm install serialport@12` sent to node.script in MAX.

## Next Phase Readiness
- Serial bridge script is complete and ready for integration with MAX patch (Plan 02)
- Tagged outlet messages (accel, gyro, orientation, status) match the routing pattern Plan 02 will use
- Connection state machine reports status to MAX for UI feedback
- Auto-start scanning means node.script with @autostart 1 will begin port discovery immediately

## Self-Check: PASSED

- [x] node/package.json exists
- [x] node/package-lock.json exists
- [x] node/.gitignore exists
- [x] node/serial-bridge.js exists (237 lines)
- [x] Commit 028efd4 exists (Task 1)
- [x] Commit 96fc69c exists (Task 2)

---
*Phase: 02-serial-bridge*
*Completed: 2026-02-13*
