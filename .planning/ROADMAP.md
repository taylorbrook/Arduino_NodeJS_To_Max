# Roadmap: Arduino-to-MAX Sensor Pipeline

## Overview

This roadmap delivers a low-latency IMU pipeline from an Arduino Uno WiFi R2 into MAX/MSP. The Arduino handles the physics -- reading the LSM6DS3, running a Madgwick filter, smoothing, and sending clean structured data over USB serial. Node for Max handles the musicianship -- calibration, scaling, thresholding, mapping, and routing data into MAX. Phases follow the data path: firmware first, serial bridge second, calibration third, musical tools fourth, and finally the reusable abstraction plus WiFi alternative.

## Phases

**Phase Numbering:**
- Integer phases (1, 2, 3): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

Decimal phases appear between their surrounding integers in numeric order.

- [x] **Phase 1: Arduino Firmware** - IMU reading, Madgwick fusion, smoothing, and structured serial output
- [x] **Phase 2: Serial Bridge** - Node for Max receives, validates, and routes serial data into MAX
- [ ] **Phase 3: Calibration** - Gyro bias correction, yaw reset, and interactive calibration from MAX
- [ ] **Phase 4: Musical Tools** - Smoothing, scaling, thresholds, visualization, and quaternion output in MAX
- [ ] **Phase 5: Abstraction and WiFi** - Reusable MAX patch and wireless transport alternative

## Phase Details

### Phase 1: Arduino Firmware
**Goal**: Arduino reliably reads the LSM6DS3 IMU, computes stable orientation via Madgwick filter, and sends clean structured data over USB serial
**Depends on**: Nothing (first phase)
**Requirements**: ARDU-01, ARDU-02, ARDU-03, ARDU-04, ARDU-05, ARDU-06
**Success Criteria** (what must be TRUE):
  1. Arduino Serial Monitor shows continuous CSV lines at a steady rate containing 9 values (accelX/Y/Z, gyroX/Y/Z, pitch, roll, yaw) with no gaps or NaN
  2. Tilting the board produces smooth, responsive pitch and roll values that settle quickly and match physical orientation
  3. Rotating the board produces yaw values that track relative heading (drift acknowledged and acceptable)
  4. Measured loop rate printed at startup matches the sample rate declared to the Madgwick filter
  5. Serial output sustains for 10+ minutes without data corruption, freezing, or buffer overflow
**Plans:** 2 plans

Plans:
- [x] 01-01-PLAN.md -- Install libraries, fix SparkFun bug, write complete IMU firmware sketch
- [x] 01-02-PLAN.md -- Upload to hardware, verify sensor output, apply tuning adjustments

### Phase 2: Serial Bridge
**Goal**: Node for Max receives Arduino serial data, validates it, and outputs parsed streams into MAX with connection status reporting
**Depends on**: Phase 1
**Requirements**: SERL-01, SERL-02, SERL-03, SERL-04, SERL-05
**Success Criteria** (what must be TRUE):
  1. MAX patch receives and displays live sensor values (raw 6-axis and orientation) updating in real time when Arduino is connected
  2. Malformed or incomplete serial lines are silently dropped -- no crashes, no NaN propagation into MAX
  3. Connection status is visible in MAX: user can see whether the port is detected, data is flowing, or the device is disconnected
  4. Unplugging and re-plugging the Arduino causes the pipeline to recover automatically without restarting MAX or the Node script
**Plans:** 2 plans

Plans:
- [x] 02-01-PLAN.md -- Node.js serial bridge script with CSV validation, tagged outlet output, and auto-reconnect
- [x] 02-02-PLAN.md -- MAX patch with sensor display, status indicator, and end-to-end hardware verification

### Phase 3: Calibration
**Goal**: User can calibrate the sensor pipeline interactively from MAX -- correcting gyro bias, resetting yaw, and toggling calibration on/off during live performance
**Depends on**: Phase 2
**Requirements**: CALB-01, CALB-02, CALB-03, CALB-04, CALB-05, CALB-06
**Success Criteria** (what must be TRUE):
  1. User can trigger calibration from MAX (toggle on, hold board still, toggle off) and see gyro drift visibly reduced in the output
  2. Calibration bias offsets persist across readings until explicitly reset -- values stay corrected without recalibrating
  3. User can reset calibration to uncalibrated state from MAX and see raw uncorrected values resume
  4. User can reset yaw to zero from MAX at any time and see yaw snap to zero then track from that new reference
  5. MAX shows visual feedback during calibration (status text or indicator showing calibration in progress vs complete)
**Plans:** 2 plans

Plans:
- [ ] 03-01-PLAN.md -- Node.js calibration logic: bias offset computation, orientation reset with smooth transition, calibrated outlets
- [ ] 03-02-PLAN.md -- MAX patch calibration UI controls, progress bar, bias display, and end-to-end hardware verification

### Phase 4: Musical Tools
**Goal**: Sensor data becomes musically and creatively useful -- smoothed, scaled, triggering events, and visualized in 3D
**Depends on**: Phase 3
**Requirements**: MAXI-01, MAXI-02, MAXI-03, MAXI-06, MAXI-07
**Success Criteria** (what must be TRUE):
  1. User can adjust smoothing parameters in MAX and see sensor noise visibly reduced in real time without adding perceptible latency
  2. User can map sensor ranges to arbitrary parameter ranges with configurable exponential curves (e.g., pitch 0-90 mapped to frequency 200-2000 Hz with log scaling)
  3. User can define thresholds that fire discrete bang/trigger events when orientation crosses a boundary (e.g., tilt past 45 degrees triggers a note)
  4. A Jitter-based 3D visualization shows the board's orientation updating in real time, matching physical movement
  5. Quaternion orientation data is available as a separate output alongside Euler angles for downstream 3D work
**Plans**: TBD

Plans:
- [ ] 04-01: TBD
- [ ] 04-02: TBD

### Phase 5: Abstraction and WiFi
**Goal**: The entire pipeline is packaged as a drop-in MAX abstraction, and WiFi provides a wireless alternative to USB serial
**Depends on**: Phase 4
**Requirements**: MAXI-04, MAXI-05, MAXI-08, WIFI-01, WIFI-02, WIFI-03
**Success Criteria** (what must be TRUE):
  1. User can drop a single .maxpat abstraction into any MAX patch and get working sensor data with clean labeled inlets and outlets
  2. Abstraction accepts arguments for configuration (at minimum: serial port name, smoothing amount) and works with different setups
  3. A help patch (.maxhelp) opens from the abstraction and documents every inlet, outlet, and argument with working examples
  4. Arduino can send IMU data wirelessly over WiFi/UDP and MAX receives it through the same Node for Max pipeline
  5. User can switch between USB serial and WiFi transport from MAX without restarting the application
**Plans**: TBD

Plans:
- [ ] 05-01: TBD
- [ ] 05-02: TBD

## Progress

**Execution Order:**
Phases execute in numeric order: 1 -> 2 -> 3 -> 4 -> 5

| Phase | Plans Complete | Status | Completed |
|-------|---------------|--------|-----------|
| 1. Arduino Firmware | 2/2 | ✓ Complete | 2026-02-12 |
| 2. Serial Bridge | 2/2 | ✓ Complete | 2026-02-12 |
| 3. Calibration | 0/2 | Planned | - |
| 4. Musical Tools | 0/TBD | Not started | - |
| 5. Abstraction and WiFi | 0/TBD | Not started | - |

---
*Roadmap created: 2026-02-12*
*Last updated: 2026-02-12 (Phase 3 planned)*
