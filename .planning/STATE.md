# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-12)

**Core value:** Reliable, lowest-possible-latency delivery of clean sensor data from Arduino to MAX
**Current focus:** Phase 3 in progress -- Calibration logic added to serial bridge, MAX UI pending

## Current Position

Phase: 3 of 5 (Calibration)
Plan: 1 of 2 in current phase - COMPLETE
Status: Executing
Last activity: 2026-02-12 -- Completed 03-01-PLAN.md (calibration logic in serial-bridge.js)

Progress: [█████░░░░░] 50%

## Performance Metrics

**Velocity:**
- Total plans completed: 5
- Average duration: 2.2min
- Total execution time: 0.24 hours

**By Phase:**

| Phase | Plans | Total | Avg/Plan |
|-------|-------|-------|----------|
| 01-arduino-firmware | 2 | 5min | 2.5min |
| 02-serial-bridge | 2 | 6min | 3min |
| 03-calibration | 1 | 1min | 1min |

**Recent Trend:**
- Last 5 plans: 01-02 (2min), 02-01 (2min), 02-02 (4min), 03-01 (1min)
- Trend: Consistent

*Updated after each plan completion*

## Accumulated Context

### Decisions

Decisions are logged in PROJECT.md Key Decisions table.
Recent decisions affecting current work:

- Madgwick filter runs on Arduino (not Node) -- Arduino handles physics, Node handles musicianship
- USB serial at 57600 baud as primary transport -- board hardware limitation (mEDBG chip)
- 57600 baud validated as clean on physical hardware -- no need to test 115200 (01-02)
- CSV format with 2 decimal places for all 9 values -- maximizes throughput within 57600 baud (01-01)
- Angle-aware EMA for yaw to handle 360/0 boundary wrapping (01-01)
- Two-pass warmup: first pass measures rate, second pass converges filter at correct rate (01-01)
- No delay() in loop -- serial blocking naturally paces to ~114 Hz (01-02 measured, was ~80-85 Hz estimate)
- Single 'R' command for reset rather than full command parser (01-01)
- Loop rate 114.2 Hz accepted as-is -- Madgwick auto-corrects via measured rate (01-02)
- Three SparkFun SPI bugs fixed: mode constant, beginTransaction, endTransaction (01-02)
- serialport v12 chosen over v13 for Max 8/9 compatibility (02-01)
- 3 outlet calls per sample (accel, gyro, orientation) at 114 Hz = 342 calls/sec (02-01)
- Polling reconnection at 2s interval via SerialPort.list() (02-01)
- max-api not installed via npm -- provided by MAX runtime (02-01)
- node.script requires absolute path instead of relative path for script loading (02-02)
- n4m.monitor bpatcher used instead of non-existent node.debug object (02-02)
- Status message box uses right inlet (1) for display text updates (02-02)
- Auto-start enabled via @autostart 1 on node.script for immediate connection (02-02)
- TARGET_SAMPLES=200 (~1.75s at 114Hz) with MIN_SAMPLES=50 safety threshold (03-01)
- Accelerometer Z-axis bias = (mean - 1.0) so flat reads exactly 1.0g after calibration (03-01)
- BLEND_SPEED=10 for ~500ms exponential decay on orientation reset transitions (03-01)
- calibrate_reset clears both biasOffsets and orientOffset to prevent stale orientation offsets (03-01)
- Calibrated outlets only fire when biasOffsets exist -- avoids duplicate IPC overhead (03-01)
- Orientation reset independent of bias calibration -- can reset orientation without calibrating first (03-01)

### Pending Todos

None.

### Blockers/Concerns

- 57600 baud ceiling confirmed via hardware validation -- no longer a concern
- Yaw drift is physically unavoidable without magnetometer -- design constraint, not a bug
- Madgwick filter sample rate auto-measured and applied correctly at 114.2 Hz

## Session Continuity

Last session: 2026-02-12
Stopped at: Completed 03-01-PLAN.md -- Calibration logic added to serial-bridge.js, ready for 03-02 (MAX UI)
Resume file: None
