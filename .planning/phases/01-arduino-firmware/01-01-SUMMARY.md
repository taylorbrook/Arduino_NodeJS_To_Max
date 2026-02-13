---
phase: 01-arduino-firmware
plan: 01
subsystem: firmware
tags: [arduino, lsm6ds3, madgwick, imu, spi, ema-smoothing, serial]

# Dependency graph
requires: []
provides:
  - "Complete imu_firmware.ino sketch for Arduino Uno WiFi Rev2"
  - "SparkFun LSM6DS3 library installed with MSB_FIRST bug patched"
  - "MadgwickAHRS library installed"
  - "9-value CSV serial output format (ax,ay,az,gx,gy,gz,pitch,roll,yaw)"
  - "STARTUP header line with device ID and measured rate"
  - "Serial 'R' command for filter reset (used by Phase 3 calibration)"
affects: [02-serial-bridge, 03-calibration]

# Tech tracking
tech-stack:
  added: [arduino-cli, SparkFun LSM6DS3 Breakout 1.0.3, Madgwick 1.2.0]
  patterns: [SPI IMU access, Madgwick sensor fusion, EMA smoothing with angle-aware yaw, free-running loop paced by serial blocking]

key-files:
  created:
    - firmware/imu_firmware/imu_firmware.ino
  modified: []

key-decisions:
  - "CSV format with 2 decimal places for all 9 values -- maximizes throughput within 57600 baud"
  - "Angle-aware EMA for yaw to handle 360/0 boundary wrapping"
  - "Two-pass warmup: first pass measures rate, second pass converges filter at correct rate"
  - "No delay() in loop -- serial blocking at 57600 baud naturally paces to ~80-85 Hz"
  - "Single 'R' command for reset rather than full command parser"

patterns-established:
  - "STARTUP header format: STARTUP,device=ARUIDO_IMU,version=X.X,rate_hz=XX.X,format=..."
  - "CSV data format: 9 comma-separated values, 2 decimal places, terminated with newline"
  - "Error format: ERROR:REASON (parseable by Node for Max)"

# Metrics
duration: 3min
completed: 2026-02-12
---

# Phase 1 Plan 1: Arduino Firmware Summary

**LSM6DS3 IMU firmware with Madgwick fusion, EMA smoothing, and 9-value CSV serial output at 57600 baud for Arduino Uno WiFi Rev2**

## Performance

- **Duration:** 3 min
- **Started:** 2026-02-12T23:58:18Z
- **Completed:** 2026-02-13T00:01:12Z
- **Tasks:** 2
- **Files modified:** 1

## Accomplishments
- Installed SparkFun LSM6DS3 (1.0.3) and Madgwick (1.2.0) Arduino libraries via arduino-cli
- Patched SparkFun library MSB_FIRST compilation bug (3 occurrences changed to MSBFIRST)
- Wrote complete 165-line imu_firmware.ino with all required components
- Sketch compiles cleanly for arduino:megaavr:uno2018 (37% program storage, 10% dynamic memory)

## Task Commits

Each task was committed atomically:

1. **Task 1: Install Arduino libraries and fix SparkFun compilation bug** - No project files (library installation is external to repo; SparkFun MSB_FIRST bug patched in ~/Documents/Arduino/libraries/)
2. **Task 2: Write complete IMU firmware sketch** - `4bece29` (feat)

## Files Created/Modified
- `firmware/imu_firmware/imu_firmware.ino` - Complete IMU firmware: SPI init, Madgwick fusion, EMA smoothing, CSV serial output, warmup, reset command

## Decisions Made
- **CSV with 2 decimal places:** Matches Arduino's default float printing behavior, minimizes line length (~63 bytes) for maximum throughput at 57600 baud
- **Angle-aware yaw EMA:** Handles 360/0 boundary with shortest-path interpolation to prevent averaging artifacts
- **Two-pass warmup (200 iterations each):** First pass measures actual computation rate, second pass re-converges filter at the correct rate. Smoothing state initialized from converged filter output
- **Free-running loop (no delay):** Serial.print blocking at 57600 baud naturally paces the loop to ~80-85 Hz. No explicit timing control needed
- **Single-character reset command ('R'):** Minimal overhead in loop() check, sufficient for Phase 3 calibration needs. Full command parser avoided to preserve latency

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
- SparkFun library had 3 occurrences of MSB_FIRST (not just 1 as implied by plan). All 3 were patched to MSBFIRST. This was within the scope of Task 1's instructions.
- Wire.h requestFrom ambiguity warnings during compilation -- these are cosmetic warnings from the I2C subsystem (not used by our SPI code) and do not affect functionality.

## User Setup Required

None - no external service configuration required. Libraries are installed via arduino-cli on the development machine.

**Note:** Before uploading firmware to hardware (Plan 02), ensure the Arduino Uno WiFi Rev2 is connected via USB. The arduino-cli board core (arduino:megaavr) and libraries (SparkFun LSM6DS3, Madgwick) must be installed on any machine used for compilation.

## Next Phase Readiness
- Firmware is compile-verified and upload-ready for Plan 02 (hardware validation)
- Serial output format documented in STARTUP header for Phase 2 (Serial Bridge) parsing
- Reset command ('R') ready for Phase 3 (Calibration) yaw reset
- Baud rate (57600) confirmed in firmware, needs hardware validation in Plan 02

## Self-Check: PASSED

- FOUND: firmware/imu_firmware/imu_firmware.ino
- FOUND: .planning/phases/01-arduino-firmware/01-01-SUMMARY.md
- FOUND: commit 4bece29

---
*Phase: 01-arduino-firmware*
*Completed: 2026-02-12*
