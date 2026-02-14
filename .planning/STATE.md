# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-12)

**Core value:** Reliable, lowest-possible-latency delivery of clean sensor data from Arduino to MAX
**Current focus:** Phase 6 -- Threshold triggers and gap closure (MAXI-03 satisfaction)

## Current Position

Phase: 6 of 6 (Threshold Triggers)
Plan: 2 of 2 in current phase - COMPLETE
Status: Phase 6 Complete
Last activity: 2026-02-13 -- Completed 06-02-PLAN.md (Help patch Recipe 2 fix and project documentation updates)

Progress: [█████████████] 100%

## Performance Metrics

**Velocity:**
- Total plans completed: 13
- Average duration: 6.5min
- Total execution time: 1.4 hours

**By Phase:**

| Phase | Plans | Total | Avg/Plan |
|-------|-------|-------|----------|
| 01-arduino-firmware | 2 | 5min | 2.5min |
| 02-serial-bridge | 2 | 6min | 3min |
| 03-calibration | 2 | 6min | 3min |
| 04-musical-tools | 2 | 12min | 6min |
| 05-abstraction-wifi | 3 | 52min | 17.3min |
| 06-threshold-triggers | 2 | 6min | 3min |

**Recent Trend:**
- Last 5 plans: 05-02 (5min), 05-03 (43min), 06-01 (3min), 06-02 (3min)
- Trend: Final gap closure plans executed quickly -- well-researched documentation corrections

*Updated after each plan completion*
| Phase 06 P02 | 4min | 2 tasks | 3 files |

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
- Auto-stop calibration at TARGET_SAMPLES instead of requiring manual stop (03-02)
- cal_toggle outlet resets MAX button state when auto-stop fires (03-02)
- Orient reset/restore as two separate bang buttons instead of toggle (03-02)
- Removed Reset Cal button -- recalibrating overwrites old biases, raw data always visible (03-02)
- Quaternion computed in MAX via jit.euler2quat, not firmware -- 57600 baud cannot carry additional CSV fields (04-01)
- Dial objects with setminmax 1 50 for smoothing -- minimum 1 ensures pass-through default (04-01)
- maximum 1 objects enforce floor on effective slide factor after three-tier multiplication (04-01)
- Raw quaternion from raw orientation for accuracy; smoothed quaternion for 3D viz (04-01)
- slide objects use symmetric smoothing (slide-up = slide-down = same factor) (04-01)
- Subpatchers (p map_<axis>) for range mapping -- 9 axes x 45 objects inline would overwhelm main patch (04-02)
- Scale objects use float arguments (e.g., scale 0. 90. 0. 1.) to prevent integer truncation (04-02)
- Learn mode clears maximum/minimum on start to prevent stale values from previous sessions (04-02)
- Accel defaults: -2..2 g; Gyro defaults: -250..250 dps; Orientation defaults: 0..90 deg; All output 0..1 (04-02)
- Dual gate pattern with ! 1 inverter for clip toggle bypass (04-02)
- Fixed IP (192.168.1.50) via WiFi.config() for Arduino WiFi addressing (05-01)
- __has_include preprocessor guard for optional WiFi -- firmware compiles USB-only without arduino_secrets.h (05-01)
- WiFi.noLowPowerMode() reduces NINA UDP latency from 20ms to 3-5ms (05-01)
- Clean-cut transport switching: stop current transport, start new (05-01)
- Auto mode: 5s USB scan timeout before WiFi UDP fallback (05-01)
- dgram (Node built-in) for UDP reception -- no npm install, unified data pipeline (05-01)
- disconnect handler stops both USB serial and UDP for complete cleanup (05-01)
- #0 prefix on all internal send/receive for instance isolation in abstraction (05-02)
- patcherargs right outlet dispatches @attributes through deferlow chain to node.script (05-02)
- Euler-based 3D rotation in companion patch matching established X=pitch Y=yaw Z=roll convention (05-02)
- Triggers outlet (12) now fully functional with 6 threshold subpatchers (06-01, replaces 05-02 placeholder)
- Mapping subpatchers use #0_mapped_<axis> instance-isolated sends (05-02)
- serial-bridge.js copied to max/ directory for abstraction discovery via relative path (05-03)
- node_modules symlinked into max/ for abstraction dependency resolution (05-03)
- Ready signal from node.script to patcherargs ensures initialization order (05-03)
- Help patch uses single live abstraction instance to avoid resource contention (05-03)
- Test signal implemented purely in MAX (metro + counter + expr) without Node simulate handler (05-03)
- Single configurable threshold per axis in MAX (not Node) -- consumer-side feature matches mapping pattern (06-01)
- Direct wiring via t l l l third outlet for threshold data tap -- avoids send/receive #0 complexity (06-01)
- Removed dead prepend threshold -> node.script wiring -- thresholds handled entirely in MAX (06-01)
- Threshold message format is positional: threshold <axis> <value> [hysteresis] -- not keyword-based (06-02)
- Help patch Recipe 2 wired to live instance outlet 12 for threshold demo -- no second instance needed (06-02)
- [Phase 06]: Threshold message format is positional: threshold axis value hysteresis -- not keyword-based

### Pending Todos

None.

### Blockers/Concerns

- 57600 baud ceiling confirmed via hardware validation -- no longer a concern
- Yaw drift is physically unavoidable without magnetometer -- design constraint, not a bug
- Madgwick filter sample rate auto-measured and applied correctly at 114.2 Hz

## Session Continuity

Last session: 2026-02-13
Stopped at: Completed 06-02-PLAN.md -- All Phase 6 plans complete. Help patch Recipe 2 updated, ROADMAP/STATE accurate. v1.0 milestone fully satisfied.
Resume file: None
