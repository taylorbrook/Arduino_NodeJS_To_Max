# Phase 1: Arduino Firmware - Context

**Gathered:** 2026-02-12
**Status:** Ready for planning

<domain>
## Phase Boundary

Arduino reliably reads the LSM6DS3 IMU, computes stable orientation via Madgwick filter, applies light smoothing, and sends clean structured data over USB serial at 57600 baud. The firmware is output-focused -- Node for Max handles all musical control, calibration UI, and parameter tuning in later phases.

</domain>

<decisions>
## Implementation Decisions

### Serial output format
- All 9 values per line: accelX, accelY, accelZ, gyroX, gyroY, gyroZ, pitch, roll, yaw
- Fixed precision if it doesn't add latency vs default Arduino float printing -- choose whichever is lower latency
- Claude's discretion on format (CSV vs labeled), delimiter, and whether to include a header line on startup

### Sensor configuration
- Target sample rate: as fast as the hardware and 57600 baud can sustain (maximize throughput)
- Wide sensor ranges to capture both subtle and vigorous motion (max out gyro and accel ranges to avoid clipping)
- Madgwick filter beta: Claude's discretion on value and whether it's hardcoded or adjustable via serial
- Serial direction (output-only vs accepting commands): Claude's discretion, considering what Phase 3 (Calibration) will need

### Smoothing behavior
- Both layers: light smoothing on Arduino, additional smoothing available in Node for Max (Phase 4)
- Arduino-side smoothing: Claude's discretion -- lightest approach that removes sensor noise without adding perceptible latency
- Per-axis vs uniform smoothing: Claude's discretion based on LSM6DS3 noise characteristics
- Raw vs smoothed in output: Claude's discretion based on bandwidth budget at 57600 baud

### Startup and status
- Wait until Madgwick filter converges before sending data (~1-2 seconds warmup)
- Print measured loop rate once at startup (not in every line)
- IMU failure handling: Claude's discretion on error behavior (LED blink, serial error message, retry)
- Boot identity string: Claude's discretion on whether to print version/identifier for Phase 2 device detection

### Claude's Discretion
- Serial line format choice (CSV vs labeled, delimiter)
- Header line on startup (yes/no)
- Fixed precision vs default float printing (latency is the deciding factor)
- Madgwick beta value and whether it's runtime-adjustable
- Whether firmware accepts incoming serial commands (considering Phase 3 needs)
- Arduino-side smoothing algorithm and aggressiveness
- Per-axis smoothing independence
- Whether to send raw + smoothed or smoothed only
- IMU initialization failure behavior
- Boot identity/version string

</decisions>

<specifics>
## Specific Ideas

- Latency minimization is the overriding priority -- every design choice should favor lower latency when there's a tradeoff
- User expects to capture both gentle tilts and vigorous shaking/striking with the same firmware
- The 57600 baud ceiling (from mEDBG chip) is the hard constraint -- all throughput decisions work within this

</specifics>

<deferred>
## Deferred Ideas

None -- discussion stayed within phase scope

</deferred>

---

*Phase: 01-arduino-firmware*
*Context gathered: 2026-02-12*
