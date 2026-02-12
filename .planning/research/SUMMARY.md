# Project Research Summary

**Project:** Arduino IMU-to-MAX/MSP Sensor Pipeline
**Domain:** Real-time embedded sensor data pipeline for creative/musical applications
**Researched:** 2026-02-12
**Confidence:** MEDIUM

## Executive Summary

This project builds a real-time pipeline from an onboard LSM6DS3 IMU (accelerometer + gyroscope) on an Arduino Uno WiFi Rev2 into MAX/MSP for creative applications such as gestural music control, interactive installations, and motion-driven media. The expert approach uses Node for Max as the integration bridge: the Arduino sends raw 6-axis data over USB serial as newline-delimited CSV, a Node.js process (running inside MAX via `node.script`) parses the stream and computes orientation via a Mahony/Madgwick sensor fusion filter, then outputs both raw and computed data to the MAX patch through tagged messages. This architecture keeps the Arduino firmware simple (read sensor, format, send) and places all tunable computation on the host where CPU is abundant and parameters can be adjusted live from MAX.

The recommended approach is USB serial as the primary transport at 57600 baud -- not 115200 as commonly assumed. Research uncovered that the Uno WiFi Rev2's mEDBG debug chip cannot reliably transmit above 57600 baud, which is the single most impactful hardware constraint. At 57600 baud with ASCII CSV, throughput supports roughly 115-144 samples/sec, which exceeds the LSM6DS3 library's hardcoded 104 Hz ODR. The sensor fusion filter (Mahony recommended over Madgwick for 6-DOF without magnetometer) runs in Node.js where it can be tuned interactively. Sensor fusion should not run on the ATmega4809 -- it lacks a hardware FPU and the computational cost would reduce sample rate headroom.

The key risks are: (1) the 57600 baud ceiling invalidates assumptions from most Arduino serial tutorials and must be validated in the first hours of development; (2) yaw drift is physically unavoidable without a magnetometer -- this is a design constraint to accept and document, not a bug to fix; (3) the Madgwick/Mahony filter's declared sample rate must match the actual loop rate or orientation output will be wildly wrong; and (4) the official LSM6DS3 library locks ODR at 104 Hz with no API to change it, requiring library modification or replacement if higher rates are needed later.

## Key Findings

### Recommended Stack

The pipeline spans two execution environments -- an Arduino Uno WiFi Rev2 and a MAX/MSP host -- bridged by USB serial. On the Arduino side, the official Arduino_LSM6DS3 library reads the onboard IMU via SPI with zero wiring. On the host side, Node for Max runs a persistent process using the `serialport` npm package for serial communication and `ahrs` for sensor fusion. All computation-heavy work (orientation, calibration, validation) lives in Node.js. See [STACK.md](./STACK.md) for full details.

**Core technologies:**
- **Arduino_LSM6DS3** (v1.0.3): Read onboard IMU -- official Arduino library, zero-wiring, SPI-connected
- **serialport** (v12.x): USB serial in Node.js -- de facto standard, prebuilt binaries, N-API compatibility
- **@serialport/parser-readline** (v12.x): Line-based serial parsing -- buffers bytes, emits complete CSV lines
- **ahrs** (v1.3.3): Mahony/Madgwick sensor fusion in JavaScript -- outputs quaternions and Euler angles
- **max-api** (bundled): Node-to-MAX communication -- `outlet()`, `addHandler()`, ships with MAX
- **WiFiNINA** (v1.8.x+): WiFi/UDP for optional wireless path -- only for Phase 3+ if wireless is needed

**Critical configuration:** 57600 baud (not 115200 -- board hardware limitation), 104 Hz ODR default, newline-delimited CSV protocol.

### Expected Features

Research identified a clear priority hierarchy. See [FEATURES.md](./FEATURES.md) for the full landscape and dependency graph.

**Must have (table stakes):**
- Raw 6-axis data output (accel XYZ + gyro XYZ) over USB serial
- Data parsing in MAX via Node for Max (CSV split, validation, `maxAPI.outlet()`)
- Gyroscope bias calibration at startup (500-1000 sample average while stationary)
- Sensor fusion for stable pitch and roll (Mahony filter recommended for 6-DOF)
- Signal smoothing in MAX (`[slide]` with configurable coefficients)
- Value scaling and range mapping (`[scale]` with exponential curves)
- Connection status indication (port detection, data flow watchdog)

**Should have (differentiators):**
- Relative yaw with explicit reset button (drift-acknowledged, useful for gesture arcs)
- Interactive calibration toggle/reset (one-click recalibration from MAX)
- Reusable MAX abstraction with clean inlets/outlets (the capstone deliverable)
- 3D orientation visualization via Jitter (immediate visual feedback)
- Threshold/event detection for gesture triggers (`[past]` with hysteresis)
- Data recording and playback for offline development

**Defer (v2+):**
- WiFi/UDP secondary transport (20ms+ latency floor, packet loss risk)
- Reusable MAX abstraction packaging (requires stable API from all v1 features)
- OSC output from MAX for interop with other creative software
- Accelerometer range configuration (only when impact detection is needed)

### Architecture Approach

The architecture follows a strict separation: Arduino is a dumb sensor-and-sender, Node.js is the computational bridge, and MAX handles user interface and creative routing. The critical decision is computing orientation on the host (Node.js), not on the Arduino. The ATmega4809 has no FPU, making software float Madgwick expensive and parameter tuning impossible without reflashing. Node for Max runs in a separate OS process so heavy computation does not block MAX's audio/scheduler thread. Data flows through tagged messages (`maxAPI.outlet("raw", ...)`, `maxAPI.outlet("orientation", ...)`) that are separated by `[route]` in MAX. See [ARCHITECTURE.md](./ARCHITECTURE.md) for diagrams and patterns.

**Major components:**
1. **Arduino Firmware** (`imu_sender.ino`) -- Read LSM6DS3 via SPI, format as CSV, `Serial.println()` at sensor ODR
2. **Node.js Serial Reader** (`serial-reader.js`) -- Open port, parse lines via ReadlineParser, validate 6-field numeric data
3. **Orientation Filter** (`orientation.js`) -- Mahony/Madgwick wrapper, quaternion + Euler output, configurable gains
4. **Calibration Module** (`calibration.js`) -- Gyro bias storage, offset subtraction, toggle/reset handlers
5. **MAX Abstraction** (`imu-pipeline.maxpat`) -- Wraps `node.script`, routes tagged outlets, exposes control inlets

### Critical Pitfalls

Research surfaced five critical pitfalls. The baud rate ceiling is the highest-impact surprise. See [PITFALLS.md](./PITFALLS.md) for full analysis and recovery strategies.

1. **USB serial capped at 57600 baud** -- The Uno WiFi Rev2's mEDBG chip has ~3.5% baud rate error at 115200, producing garbled data. Design around 57600 from day one. At 57600, ASCII CSV supports ~115-144 samples/sec, adequate for 104 Hz ODR. Validate in the first hour of development.

2. **Yaw drift without magnetometer** -- The LSM6DS3 is 6-DOF. No algorithm can produce stable yaw without a magnetometer. Accept this as a design constraint: provide relative yaw with a reset button, document that drift is expected, do not waste time tuning filter parameters to "fix" it.

3. **Filter sample rate mismatch** -- If the Madgwick/Mahony `begin()` frequency does not match the actual loop rate, orientation output is wrong. Measure actual loop rate with `micros()` and use that value. Build timing diagnostics into firmware from the start.

4. **LSM6DS3 library hardcodes 104 Hz** -- No API to change ODR. For Phase 1 this is fine (104 Hz is adequate). For future optimization, fork the library or use SparkFun's alternative (requires a one-line compilation fix on this board).

5. **Serial framing errors** -- Serial is a byte stream, not a message stream. Always use ReadlineParser on the receive side. Add per-field validation (check for 6 numeric values). Discard the first 1-2 lines after port open (Arduino reset produces garbage).

## Implications for Roadmap

Based on combined research, the project decomposes into 5 phases with a clear dependency chain. The architecture's component boundaries map directly to phases.

### Phase 1: Arduino Firmware and Serial Foundation
**Rationale:** Everything depends on getting bytes from sensor to host. This phase has zero external dependencies and is independently testable with Arduino Serial Monitor. The 57600 baud constraint must be validated here before any downstream work.
**Delivers:** Working Arduino sketch that reads LSM6DS3 at 104 Hz and sends CSV over serial at 57600 baud. Verified data integrity over sustained operation.
**Addresses:** Raw 6-axis data output, USB serial transport, configurable sample rate discovery
**Avoids:** Baud rate assumption pitfall (test 57600 vs 115200 immediately), serial framing errors (define protocol format), IMU polling without data-ready check
**Stack:** Arduino_LSM6DS3, Arduino IDE/CLI

### Phase 2: Node for Max Serial Bridge
**Rationale:** Depends on Phase 1 (needs a working Arduino sender). Proves the end-to-end pipeline from hardware into MAX. Node for Max is the integration bridge for all subsequent features.
**Delivers:** Node.js script running inside MAX that opens the serial port, parses CSV lines, validates data, and outputs raw 6-axis values to MAX via `maxAPI.outlet()`. Basic connection status reporting.
**Addresses:** Data parsing in MAX, connection status indication, serial error handling
**Avoids:** Using MAX's native `[serial]` object for multi-value parsing (anti-pattern), serial framing errors (ReadlineParser handles reassembly)
**Stack:** serialport v12, @serialport/parser-readline v12, max-api

### Phase 3: Sensor Fusion and Calibration
**Rationale:** Depends on Phase 2 (needs raw data flowing into Node.js). Sensor fusion is the core value proposition -- converting raw noisy data into stable orientation. Calibration must precede fusion (uncalibrated gyro bias degrades filter convergence).
**Delivers:** Gyro bias calibration on startup, Mahony filter producing stable pitch/roll, relative yaw with reset, quaternion output alongside Euler angles. Interactive recalibration triggered from MAX.
**Addresses:** Gyroscope bias calibration, sensor fusion (Mahony), computed pitch/roll, computed yaw (relative), interactive calibration toggle/reset, dual output mode (raw + orientation)
**Avoids:** Yaw drift surprise (document as known limitation), filter sample rate mismatch (measure actual rate in Node.js using `Date.now()` deltas), over-tuning beta for yaw stability
**Stack:** ahrs v1.3.3

### Phase 4: MAX Patch Integration and Smoothing
**Rationale:** Depends on Phase 3 (needs both raw and orientation data flowing). This is where the data becomes musically/creatively useful. Smoothing, scaling, visualization, and event detection all operate on the computed data streams.
**Delivers:** MAX patch with signal smoothing (`[slide]`), value scaling (`[scale]` with exponential curves), threshold/event detection, 3D orientation visualization via Jitter, data recording/playback.
**Addresses:** Signal smoothing, value scaling/mapping, threshold/event detection, 3D visualization, data recording/playback
**Avoids:** MAX scheduler flooding (decimate output if needed), raw values without unit labels (document g's and deg/sec)
**Stack:** MAX/MSP native objects, Jitter

### Phase 5: Reusable Abstraction and Optional WiFi
**Rationale:** The abstraction is the capstone -- it packages all previous phases into a drop-in component. It cannot be designed until the data streams and control interface are stable. WiFi is optional and independent, bundled here because it requires a stable architecture to plug into.
**Delivers:** `imu-pipeline.maxpat` abstraction with arguments (port, baud, smoothing), clean inlets/outlets, help patch. Optionally: WiFi/UDP transport as an alternative data source.
**Addresses:** Reusable MAX abstraction, WiFi/UDP transport (optional), axis remapping for different mounting orientations
**Avoids:** Brittle abstraction (test with different scenarios), WiFi latency surprises (document 20ms+ floor), CNMAT OSC compilation issues (use raw UDP or ArduinoOSC instead)
**Stack:** WiFiNINA, osc-js or raw UDP (if WiFi pursued)

### Phase Ordering Rationale

- **Dependency-driven:** Each phase produces an artifact the next phase consumes. Arduino firmware (Phase 1) feeds the serial bridge (Phase 2), which feeds fusion (Phase 3), which feeds MAX patch logic (Phase 4), which is packaged into the abstraction (Phase 5).
- **Risk-front-loaded:** The two highest-risk items (57600 baud ceiling, serial protocol integrity) are validated in Phase 1 before any downstream work. Yaw drift is confronted as a design decision in Phase 3, not discovered late.
- **Incrementally testable:** Phase 1 is testable with Serial Monitor alone. Phase 2 is testable with MAX console output. Each phase adds visible, demonstrable capability.
- **Computation placement:** Following the architecture research recommendation, all tunable computation (fusion, calibration) lives in Node.js (Phases 2-3), keeping the Arduino firmware minimal and the tuning loop fast.

### Research Flags

Phases likely needing deeper research during planning:
- **Phase 1:** Needs hands-on validation of the 57600 baud ceiling. The research sources are forum posts; actual hardware testing is required to confirm whether 115200 works with this specific board revision.
- **Phase 3:** Mahony vs Madgwick for 6-DOF is based on a single authoritative source (OlliW analysis). The `ahrs` npm package supports both; plan to prototype both and compare. Filter gain tuning will require experimentation.
- **Phase 5 (WiFi):** CNMAT OSC library incompatibility with this board is reported but may be resolved. ArduinoOSC is the backup. WiFi latency floor (20ms) needs measurement on actual hardware.

Phases with standard patterns (skip research-phase):
- **Phase 2:** Node for Max with serialport is well-documented. The pattern (ReadlineParser, parse CSV, `maxAPI.outlet()`) is straightforward with clear examples.
- **Phase 4:** MAX signal processing (`[slide]`, `[scale]`, Jitter visualization) uses established MAX patterns with extensive documentation.

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | MEDIUM-HIGH | Core libraries (Arduino_LSM6DS3, serialport, max-api) are well-documented with official sources. The `ahrs` npm package is small and lightly maintained (last update Oct 2023). serialport v12 vs v13 choice is conservative but safe. |
| Features | MEDIUM-HIGH | Feature landscape is well-defined by the domain. Mahony-over-Madgwick recommendation for 6-DOF rests on a single detailed analysis (OlliW) corroborated by Adafruit. Table stakes vs differentiators are clear. |
| Architecture | MEDIUM-HIGH | The "compute on host, not Arduino" decision is well-supported by hardware constraints (no FPU on ATmega4809). Node for Max bridge pattern is sound. Project structure follows standard conventions. |
| Pitfalls | MEDIUM | The 57600 baud ceiling is the key uncertainty -- sourced from multiple forum posts but not from official Arduino/Microchip documentation. If this constraint is wrong, the entire throughput calculation changes (for the better). All other pitfalls are well-documented and HIGH confidence. |

**Overall confidence:** MEDIUM

The medium rating is driven by the baud rate uncertainty. If 115200 works, the project is easier than expected (more throughput headroom). If 57600 is indeed the ceiling, the design accommodates it but with tighter margins. Everything else is well-understood.

### Gaps to Address

- **57600 vs 115200 baud:** Must be tested on actual hardware in the first session. Forum evidence is strong but not conclusive. Design for 57600 but test 115200 early.
- **Mahony vs Madgwick for 6-DOF:** Prototype both in Phase 3. The `ahrs` package supports both algorithms. Compare stability, responsiveness, and CPU overhead.
- **`ahrs` npm package longevity:** Last updated Oct 2023. If it breaks on future Node versions, the Madgwick/Mahony algorithm is simple enough to implement directly in ~100 lines of JavaScript.
- **Node for Max message rate ceiling:** No definitive documentation on maximum `maxAPI.outlet()` call rate. At 104 Hz it should be fine, but test at higher rates. Decimation strategy (send every Nth sample) is the fallback.
- **SparkFun LSM6DS3 compilation fix:** The `MSBFIRST` vs `MSB_FIRST` fix is documented but needs verification on current library version if higher ODR is pursued.
- **Arduino reset on serial open:** The Uno WiFi Rev2 resets when the serial port is opened. First 1-2 seconds of data will be garbage. Node.js must handle this gracefully (discard early data, wait for "READY" sentinel).

## Sources

### Primary (HIGH confidence)
- [Arduino_LSM6DS3 GitHub + Reference](https://github.com/arduino-libraries/Arduino_LSM6DS3) -- library API, ODR defaults, SPI connection
- [Arduino Uno WiFi Rev2 Docs](https://docs.arduino.cc/hardware/uno-wifi-rev2/) -- hardware specs
- [LSM6DS3 Datasheet](https://content.arduino.cc/assets/st_imu_lsm6ds3_datasheet.pdf) -- ODR tables, register configuration
- [ATmega4809 Datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/ATmega4808-09-DataSheet-DS40002173B.pdf) -- 8-bit AVR, no FPU
- [SerialPort docs](https://serialport.io/) -- API, parsers, platform support
- [Node for Max API](https://docs.cycling74.com/nodeformax/api/) -- outlet, addHandler, process model
- [MadgwickAHRS GitHub Issues](https://github.com/arduino-libraries/MadgwickAHRS/issues/33) -- yaw drift with 6-DOF confirmed
- [WiFiNINA Issue #192](https://github.com/arduino-libraries/WiFiNINA/issues/192) -- 20ms latency floor, FreeRTOS root cause

### Secondary (MEDIUM confidence)
- [Arduino Forum: Serial max speed Uno WiFi Rev2](https://forum.arduino.cc/t/serial-max-speed-uno-wifi-rev-2/617529) -- 57600 baud ceiling
- [Arduino Forum: USB Serial can't go faster than 57600](https://forum.arduino.cc/t/uno-wifi-rev2-usb-serial-cant-go-faster-then-57600/647341) -- baud rate confirmation
- [OlliW: IMU Data Fusing](https://www.olliw.eu/2013/imu-data-fusing/) -- Mahony recommended for 6-DOF over Madgwick
- [Adafruit: Sensor Fusion Algorithms](https://learn.adafruit.com/ahrs-for-adafruits-9-dof-10-dof-breakout/sensor-fusion-algorithms) -- Mahony vs Madgwick comparison
- [ahrs npm](https://www.npmjs.com/package/ahrs) -- v1.3.3, Madgwick/Mahony in JavaScript
- [Woolsey Workshop LSM6DS3 Tutorial](https://www.woolseyworkshop.com/2020/02/12/using-the-arduino_lsm6ds3-library-to-access-the-arduino-uno-wifi-rev2-imu/) -- board-specific usage
- [Cycling74 N4M Examples](https://github.com/Cycling74/n4m-examples) -- no serial example exists; building from scratch
- [Edinburgh College Arduino-for-Max](https://github.com/Edinburgh-College-of-Art/Arduino-for-Max) -- community integration patterns

### Tertiary (LOW confidence)
- 57600 baud `Serial.begin(111111)` workaround -- mentioned in forums, untested
- serialport v12 vs v13 choice -- conservative recommendation, no evidence of v13 issues
- CNMAT OSC compilation issue status -- may be resolved in newer versions
- `maxAPI.outlet()` rate ceiling -- no documentation found, needs empirical testing

---
*Research completed: 2026-02-12*
*Ready for roadmap: yes*
