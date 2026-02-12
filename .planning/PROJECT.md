# Arduino-to-MAX Sensor Pipeline

## What This Is

A low-latency pipeline that streams accelerometer and gyroscope data from an Arduino Uno WiFi R2's built-in LSM6DS3 sensor through USB serial into MAX/MSP via Node for Max. Delivers both raw 6-axis data and computed orientation (pitch/roll/yaw) as a reusable abstraction for audio control, visual generation, and event triggering.

## Core Value

Reliable, lowest-possible-latency delivery of sensor data from Arduino to MAX — if the data doesn't arrive fast and clean, nothing downstream works.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] Arduino reads LSM6DS3 accelerometer + gyroscope at maximum sample rate
- [ ] Data transmitted over USB serial with minimal overhead
- [ ] Node for Max script receives, parses, and outputs serial data
- [ ] Raw 6-axis output (accelX/Y/Z, gyroX/Y/Z) available as separate streams
- [ ] Computed orientation (pitch/roll/yaw) calculated in Node before output
- [ ] Sensor calibration with drift correction for gyro
- [ ] Calibration toggle (on/off) controllable from MAX
- [ ] Zero-offset reset button triggerable from MAX
- [ ] Reusable MAX abstraction (helper patch) droppable into any patch
- [ ] WiFi transport as alternative to USB serial

### Out of Scope

- Full demo patches with audio/visual examples — user builds their own
- Mobile/tablet control interfaces — desktop MAX only
- Multiple simultaneous Arduino boards — single board pipeline
- External accelerometer/gyro modules — using built-in LSM6DS3 only

## Context

- **Board:** Arduino Uno WiFi R2 with built-in LSM6DS3 6-axis IMU (I2C)
- **Host software:** MAX/MSP with Node for Max
- **Primary connection:** USB serial (reliable, lowest latency)
- **Secondary connection:** WiFi (wireless freedom, slightly higher latency)
- **Use cases:** Gestural audio control, visual parameter driving, event triggering — general-purpose sensor input
- **Performance priority:** Maximum sample rate, minimum latency throughout the entire chain
- **Orientation math:** Complementary filter or similar for pitch/roll/yaw fusion in Node.js

## Constraints

- **Hardware**: Arduino Uno WiFi R2 — limited processing power, LSM6DS3 via I2C
- **Transport**: USB serial as primary — baud rate and packet size affect throughput
- **Runtime**: Node for Max — runs inside MAX's Node.js environment, must use compatible npm packages
- **Latency**: End-to-end latency must be imperceptible for live performance use

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| USB serial as primary transport | Lowest latency, most reliable, simplest setup | — Pending |
| Orientation computed in Node, not Arduino | Offload processing from constrained Arduino to more powerful host | — Pending |
| LSM6DS3 built-in sensor (not external module) | No extra wiring, already on the board | — Pending |
| Calibration toggle + reset button | Live performance needs — re-zero mid-set without restarting | — Pending |

---
*Last updated: 2026-02-12 after initialization*
