# Arduino-to-MAX Sensor Pipeline

## What This Is

A low-latency pipeline that streams accelerometer and gyroscope data from an Arduino Uno WiFi R2's built-in LSM6DS3 sensor into MAX/MSP via Node for Max. Delivers raw 6-axis data, computed orientation (pitch/roll/yaw), quaternion output, and gesture triggers as a reusable drop-in abstraction (`imu-sensor.maxpat`) with USB serial and WiFi transport options.

## Core Value

Reliable, lowest-possible-latency delivery of sensor data from Arduino to MAX -- if the data doesn't arrive fast and clean, nothing downstream works.

## Requirements

### Validated

- ✓ Arduino reads LSM6DS3 at 114.2 Hz with Madgwick filter -- v1.0
- ✓ Clean CSV over USB serial at 57600 baud -- v1.0
- ✓ Node for Max receives, validates, and routes serial data -- v1.0
- ✓ Raw 6-axis and orientation output as separate streams -- v1.0
- ✓ Interactive calibration with gyro bias correction from MAX -- v1.0
- ✓ Yaw reset to zero from MAX -- v1.0
- ✓ Three-tier EMA smoothing with 13 configurable dials -- v1.0
- ✓ Per-axis range mapping with linear/exponential/custom curves -- v1.0
- ✓ Threshold triggers with hysteresis on 6 axes -- v1.0
- ✓ Quaternion output alongside Euler angles -- v1.0
- ✓ Reusable `imu-sensor.maxpat` abstraction with 13 outlets -- v1.0
- ✓ Help patch with documentation, test signal, and 3 creative recipes -- v1.0
- ✓ WiFi/UDP transport as alternative to USB serial -- v1.0
- ✓ Transport switching (USB/WiFi/auto) without restart -- v1.0
- ✓ 3D orientation visualization via Jitter companion patch -- v1.0

### Active

(None -- planning next milestone)

### Out of Scope

- Absolute yaw/heading -- LSM6DS3 has no magnetometer
- Machine learning gesture recognition -- ATmega4809 too constrained
- Multi-board support -- single Arduino pipeline
- Auto-discovery of serial port -- fragile and platform-specific
- WiFi configuration UI in MAX -- credentials hardcoded in sketch
- Kalman filter -- over-engineering for creative applications
- Mobile/tablet control -- desktop MAX only

## Context

Shipped v1.0 with ~46,325 LOC across Arduino C++, JavaScript, and MAX/MSP JSON patches.
Tech stack: Arduino Uno WiFi R2 (LSM6DS3, Madgwick), Node for Max (serialport v12, dgram), MAX/MSP (Jitter for 3D).
Sample rate: 114.2 Hz measured (9 values per sample).
Transport: USB serial primary (57600 baud), WiFi UDP secondary (3-5ms latency with noLowPowerMode).
All 28 v1 requirements satisfied. No known blocking issues.

## Constraints

- **Hardware**: Arduino Uno WiFi R2 -- limited processing power, LSM6DS3 via SPI, mEDBG caps serial at 57600 baud
- **Transport**: 57600 baud ceiling on USB; WiFi adds 3-5ms latency
- **Runtime**: Node for Max -- runs inside MAX's Node.js environment, must use compatible npm packages
- **Latency**: End-to-end latency must be imperceptible for live performance use

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| USB serial as primary transport | Lowest latency, most reliable | ✓ Good -- 57600 baud confirmed clean on hardware |
| Madgwick filter runs on Arduino | Arduino handles physics; Node handles musicianship | ✓ Good -- clean separation, 114.2 Hz achieved |
| LSM6DS3 built-in sensor (not external) | No extra wiring, already on the board | ✓ Good -- SPI bugs fixed, works reliably |
| Calibration toggle + reset button | Live performance needs -- re-zero mid-set | ✓ Good -- auto-stop at 200 samples, smooth transitions |
| Arduino = dumb data source, Node = intelligent interpreter | Clear separation of concerns | ✓ Good -- architecture held through all 6 phases |
| serialport v12 over v13 | Max 8/9 Node.js compatibility | ✓ Good -- no compatibility issues |
| CSV format with 2 decimal places | Maximizes throughput within 57600 baud | ✓ Good -- 114 Hz sustained |
| Quaternion computed in MAX (jit.euler2quat) | 57600 baud can't carry extra CSV fields | ✓ Good -- avoids firmware complexity |
| #0 prefix for abstraction instance isolation | Multiple instances don't interfere | ✓ Good -- tested with help patch |
| Thresholds in MAX (not Node) | Consumer-side feature matches mapping pattern | ✓ Good -- simpler, hysteresis works well |
| WiFi.noLowPowerMode() for UDP | Reduces NINA latency from 20ms to 3-5ms | ✓ Good -- significant improvement |
| dgram (Node built-in) for UDP | No npm install, unified data pipeline | ✓ Good -- zero dependencies added |

---
*Last updated: 2026-02-13 after v1.0 milestone*
