# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-12)

**Core value:** Reliable, lowest-possible-latency delivery of clean sensor data from Arduino to MAX
**Current focus:** Phase 2 in progress -- Serial Bridge (Plan 1 of 2 complete)

## Current Position

Phase: 2 of 5 (Serial Bridge)
Plan: 1 of 2 in current phase
Status: In Progress
Last activity: 2026-02-13 -- Completed 02-01-PLAN.md (serial bridge script)

Progress: [███░░░░░░░] 30%

## Performance Metrics

**Velocity:**
- Total plans completed: 3
- Average duration: 2.3min
- Total execution time: 0.12 hours

**By Phase:**

| Phase | Plans | Total | Avg/Plan |
|-------|-------|-------|----------|
| 01-arduino-firmware | 2 | 5min | 2.5min |
| 02-serial-bridge | 1 | 2min | 2min |

**Recent Trend:**
- Last 5 plans: 01-01 (3min), 01-02 (2min), 02-01 (2min)
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

### Pending Todos

None.

### Blockers/Concerns

- 57600 baud ceiling confirmed via hardware validation -- no longer a concern
- Yaw drift is physically unavoidable without magnetometer -- design constraint, not a bug
- Madgwick filter sample rate auto-measured and applied correctly at 114.2 Hz

## Session Continuity

Last session: 2026-02-13
Stopped at: Completed 02-01-PLAN.md -- Serial bridge script complete, ready for Plan 02 (MAX patch)
Resume file: None
