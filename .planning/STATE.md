# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-22)

**Core value:** Reliable, lowest-possible-latency delivery of clean sensor data from Arduino to MAX
**Current focus:** Phase 7 - Core Engine and Predefined Gestures (v1.1)

## Current Position

Phase: 7 of 11 (Core Engine and Predefined Gestures)
Plan: 1 of 3 in current phase
Status: Executing
Last activity: 2026-02-22 -- Completed 07-01 (gesture-engine.js core)

Progress: [###########.........] 56% (14/25 plans)

## Performance Metrics

**Velocity:**
- Total plans completed: 14
- Average duration: 6.3min
- Total execution time: 1.45 hours

**By Phase:**

| Phase | Plans | Total | Avg/Plan |
|-------|-------|-------|----------|
| 01-arduino-firmware | 2 | 5min | 2.5min |
| 02-serial-bridge | 2 | 6min | 3min |
| 03-calibration | 2 | 6min | 3min |
| 04-musical-tools | 2 | 12min | 6min |
| 05-abstraction-wifi | 3 | 52min | 17.3min |
| 06-threshold-triggers | 2 | 6min | 3min |
| 07-core-engine-gestures | 1 | 3min | 3min |

## Accumulated Context

### Decisions

Full decision log in PROJECT.md Key Decisions table.
- [v1.1 architecture]: gesture-engine.js is a SEPARATE node.script from serial-bridge.js; data flows via MAX patch cables, not internal JS
- [v1.1 architecture]: Predefined gesture detectors receive cal (pre-smoothing) data; DTW receives smoothed data
- [v1.1 scope]: Position interpolation means ORIENTATION interpolation (pitch/roll/yaw), NOT translational position from accelerometer double integration
- [07-01]: Fixed smoothing defaults (global=0.3) for gesture engine -- minimal sensor UI per user decision
- [07-01]: Gesture detectors receive calibrated pre-smoothing data; tilts use smoothed orientation for stability

### Pending Todos

None.

### Blockers/Concerns

- [Phase 8]: Async DTW pattern in node.script needs validation (setImmediate behavior in Node for Max)
- [Phase 11]: ml-lib availability on Apple Silicon needs verification; js object fallback required

### Quick Tasks Completed

| # | Description | Date | Commit | Directory |
|---|-------------|------|--------|-----------|
| 1 | add normalization toggle that normalize outputs to be between 0. and 1. | 2026-02-22 | ab937d6 | [1-add-normalization-toggle-that-normalize-](./quick/1-add-normalization-toggle-that-normalize-/) |
| 2 | update the maxhelp file to account for the new normalization outlets | 2026-02-22 | 583286e | [2-update-the-maxhelp-file-to-account-for-t](./quick/2-update-the-maxhelp-file-to-account-for-t/) |

## Session Continuity

Last session: 2026-02-22
Stopped at: Completed 07-01-PLAN.md (gesture-engine.js core)
Resume file: None
