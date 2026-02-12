# Requirements: Arduino-to-MAX Sensor Pipeline

**Defined:** 2026-02-12
**Core Value:** Reliable, lowest-possible-latency delivery of clean sensor data from Arduino to MAX

**Architecture:** Arduino handles the physics (sample, fuse, smooth, send clean values). Node for Max handles the musicianship (calibration, scaling, thresholding, mapping, routing into MAX). Arduino is a reliable, dumb data source. Node is the intelligent interpreter.

## v1 Requirements

Requirements for initial release. Each maps to roadmap phases.

### Arduino Firmware (Physics Layer)

- [ ] **ARDU-01**: Arduino reads LSM6DS3 accelerometer and gyroscope at sensor ODR (104 Hz default)
- [ ] **ARDU-02**: Arduino runs Madgwick filter on-device to compute stable pitch, roll, and relative yaw
- [ ] **ARDU-03**: Arduino applies basic smoothing to fused orientation values before sending
- [ ] **ARDU-04**: Arduino sends clean, structured data over USB serial at 57600 baud (newline-delimited CSV)
- [ ] **ARDU-05**: Arduino sends both raw 6-axis values and computed orientation in each message
- [ ] **ARDU-06**: Madgwick filter sample rate matches actual loop execution rate (measured, not assumed)

### Serial Communication

- [ ] **SERL-01**: Node for Max receives serial data via serialport npm package with ReadlineParser
- [ ] **SERL-02**: Node for Max validates incoming data (correct field count, no NaN values) and drops malformed lines
- [ ] **SERL-03**: Node for Max outputs parsed data to MAX via tagged maxAPI.outlet() messages
- [ ] **SERL-04**: User can see connection status (port detected, data flowing, disconnected) in MAX patch
- [ ] **SERL-05**: Pipeline recovers gracefully when Arduino is disconnected and reconnected

### WiFi Transport

- [ ] **WIFI-01**: Arduino can send IMU data over WiFi/UDP as alternative to USB serial
- [ ] **WIFI-02**: MAX patch can receive wireless IMU data via Node for Max UDP or udpreceive
- [ ] **WIFI-03**: User can switch between USB serial and WiFi transport without restarting MAX

### Calibration (Node Layer)

- [ ] **CALB-01**: User can trigger interactive calibration from MAX (toggle on, hold still, toggle off)
- [ ] **CALB-02**: Node computes and stores gyro bias offsets applied to subsequent readings
- [ ] **CALB-03**: User can toggle calibration on/off from MAX without restarting
- [ ] **CALB-04**: User can reset calibration to uncalibrated state (zero-offset reset) from MAX
- [ ] **CALB-05**: User can reset yaw to zero from MAX at any time
- [ ] **CALB-06**: Visual feedback in MAX during calibration (progress/status indication)

### MAX Integration (Musician's Layer)

- [ ] **MAXI-01**: Signal smoothing via configurable parameters reduces sensor noise for downstream use
- [ ] **MAXI-02**: Value scaling maps sensor ranges to user-defined parameter ranges with exponential curves
- [ ] **MAXI-03**: Threshold/event detection converts continuous orientation into discrete gesture triggers
- [ ] **MAXI-04**: Reusable MAX abstraction (.maxpat) encapsulates entire pipeline with clean inlets/outlets
- [ ] **MAXI-05**: Abstraction accepts arguments for configuration (port, smoothing amount)
- [ ] **MAXI-06**: 3D orientation visualization renders device orientation in real-time using Jitter
- [ ] **MAXI-07**: Quaternion orientation output available alongside Euler angles for 3D work
- [ ] **MAXI-08**: Abstraction includes help patch (.maxhelp) documenting usage and outlets

## v2 Requirements

Deferred to future release. Tracked but not in current roadmap.

### Performance Optimization

- **PERF-01**: Binary serial protocol for 400+ Hz sample rates
- **PERF-02**: Configurable LSM6DS3 ODR above 104 Hz via register writes or SparkFun library
- **PERF-03**: Configurable accelerometer range (+/-2g, 4g, 8g, 16g) for different use cases

### Extended Features

- **EXTD-01**: Data recording and playback for offline development without hardware
- **EXTD-02**: OSC output from MAX for interoperability with other creative software
- **EXTD-03**: Axis remapping for different sensor mounting orientations

## Out of Scope

| Feature | Reason |
|---------|--------|
| Absolute yaw/heading | LSM6DS3 has no magnetometer; physically impossible without hardware change |
| Machine learning gesture recognition | ATmega4809 too constrained; do in MAX/Node if needed |
| Multi-board support | Single Arduino pipeline; adding more boards is a different architecture |
| Auto-discovery of serial port | Fragile and platform-specific; user selects from list |
| WiFi configuration UI in MAX | Hard-code WiFi credentials in sketch; keeps scope manageable |
| Kalman filter | Over-engineering for creative applications; Madgwick sufficient |
| Mobile/tablet control | Desktop MAX only |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| ARDU-01 | TBD | Pending |
| ARDU-02 | TBD | Pending |
| ARDU-03 | TBD | Pending |
| ARDU-04 | TBD | Pending |
| ARDU-05 | TBD | Pending |
| ARDU-06 | TBD | Pending |
| SERL-01 | TBD | Pending |
| SERL-02 | TBD | Pending |
| SERL-03 | TBD | Pending |
| SERL-04 | TBD | Pending |
| SERL-05 | TBD | Pending |
| WIFI-01 | TBD | Pending |
| WIFI-02 | TBD | Pending |
| WIFI-03 | TBD | Pending |
| CALB-01 | TBD | Pending |
| CALB-02 | TBD | Pending |
| CALB-03 | TBD | Pending |
| CALB-04 | TBD | Pending |
| CALB-05 | TBD | Pending |
| CALB-06 | TBD | Pending |
| MAXI-01 | TBD | Pending |
| MAXI-02 | TBD | Pending |
| MAXI-03 | TBD | Pending |
| MAXI-04 | TBD | Pending |
| MAXI-05 | TBD | Pending |
| MAXI-06 | TBD | Pending |
| MAXI-07 | TBD | Pending |
| MAXI-08 | TBD | Pending |

**Coverage:**
- v1 requirements: 28 total
- Mapped to phases: 0
- Unmapped: 28

---
*Requirements defined: 2026-02-12*
*Last updated: 2026-02-12 after architecture clarification*
