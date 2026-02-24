# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-22)

**Core value:** Reliable, lowest-possible-latency delivery of clean sensor data from Arduino to MAX
**Current focus:** Phase 8 - Custom DTW Gesture Recognition (v1.1)

## Current Position

Phase: 8 of 11 (Custom DTW Gesture Recognition)
Plan: 2 of 3 in current phase
Status: In progress
Last activity: 2026-02-24 -- Completed 08-02 (DTW gesture recognition subsystem)

Progress: [##################..] 72% (18/25 plans)

## Performance Metrics

**Velocity:**
- Total plans completed: 17
- Average duration: 5.7min
- Total execution time: 1.58 hours

**By Phase:**

| Phase | Plans | Total | Avg/Plan |
|-------|-------|-------|----------|
| 01-arduino-firmware | 2 | 5min | 2.5min |
| 02-serial-bridge | 2 | 6min | 3min |
| 03-calibration | 2 | 6min | 3min |
| 04-musical-tools | 2 | 12min | 6min |
| 05-abstraction-wifi | 3 | 52min | 17.3min |
| 06-threshold-triggers | 2 | 6min | 3min |
| 07-core-engine-gestures | 3 | 8min | 2.7min |
| 08-custom-dtw-gesture | 1 | 3min | 3min |

## Accumulated Context

### Decisions

Full decision log in PROJECT.md Key Decisions table.
- [v1.1 architecture]: gesture-engine.js is a SEPARATE node.script from serial-bridge.js; data flows via MAX patch cables, not internal JS
- [v1.1 architecture]: Predefined gesture detectors receive cal (pre-smoothing) data; DTW receives smoothed data
- [v1.1 scope]: Position interpolation means ORIENTATION interpolation (pitch/roll/yaw), NOT translational position from accelerometer double integration
- [07-01]: Fixed smoothing defaults (global=0.3) for gesture engine -- minimal sensor UI per user decision
- [07-01]: Gesture detectors receive calibrated pre-smoothing data; tilts use smoothed orientation for stability
- [07-02]: Shake threshold 1.5g-4.0g with 3-frame consecutive; tap spike 1.5g-5.0g above 10-frame running average
- [07-02]: Tilt hysteresis re-arm at 60% of threshold; checkTilt as sibling function for readability
- [Phase 07]: [07-03]: Hardware-verified all 7 predefined gestures via imu-gesture.maxpat abstraction; 7-outlet interface for gesture events + sensor data
- [08-01]: Local Madgwick fork (MadgwickLocal class) avoids Arduino IDE update conflicts
- [08-01]: Quaternion at 4 decimal places for DTW precision; passthrough without bias calibration

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

Last session: 2026-02-24
Stopped at: Completed 08-01-PLAN.md (quaternion firmware output)
Resume file: None
