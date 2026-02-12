# Feature Research

**Domain:** Real-time Arduino IMU sensor-to-MAX/MSP creative software pipeline
**Researched:** 2026-02-12
**Confidence:** MEDIUM-HIGH

## Feature Landscape

### Table Stakes (Users Expect These)

Features users assume exist. Missing these = product feels incomplete.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| Raw 6-axis data output (accel XYZ + gyro XYZ) | Fundamental purpose of the IMU pipeline. Without raw data, nothing downstream works. | LOW | Arduino_LSM6DS3 library provides `readAcceleration()` and `readGyroscope()` out of the box. Default ODR is 104 Hz. Values in g and deg/s respectively. |
| Computed pitch and roll angles | Users expect orientation, not just raw sensor values. Accelerometer alone gives tilt via trigonometry (`atan2`). | MEDIUM | Accelerometer-only pitch/roll is noisy but zero-drift. Must fuse with gyro for stable output. This is the core value proposition. |
| Sensor fusion for stable orientation | Raw gyro drifts, raw accelerometer is noisy. Users expect stable, responsive orientation that combines both strengths. | MEDIUM | Use Mahony filter (not Madgwick) for 6DOF. Research shows Madgwick is not appropriate for 6DOF IMUs without magnetometer. Mahony is a "glorified complementary filter" with better accuracy and low compute cost suitable for ATmega4809. |
| USB serial transport (primary) | Most basic, most reliable connection. Every Arduino-to-MAX project starts here. Zero configuration on network layer. | LOW | Use the Max `[serial]` object or Node for Max with the `serialport` npm package. Baud rate must match both sides. 115200 baud recommended for throughput (not 9600). |
| Configurable sample rate | Users need to match data rate to their application (audio needs fast, visual can be slower). Mismatch causes either wasted bandwidth or missed data. | LOW | LSM6DS3 supports ODR of 13, 26, 52, 104, 208, 416, 833, 1666 Hz. Arduino_LSM6DS3 library defaults to 104 Hz and lacks easy rate-change API. Use SparkFun LSM6DS3 library or direct register writes for rate control. |
| Data parsing and delimiting in MAX | MAX must reliably parse multi-value serial streams without corruption or desync. | MEDIUM | Establish a clear protocol: delimiter-separated values (comma or space) with a newline terminator. Use `[route]` or `[unpack]` in MAX. Alternatively, Node for Max parses in JavaScript then calls `maxAPI.outlet()`. |
| Signal smoothing in MAX | Raw sensor data is inherently noisy. Unsmoothed values cause jitter in audio parameters and visual elements. | LOW | Use `[slide]` (exponential smoothing), `[line~]` (interpolation for audio-rate), or moving average. `[slide]` with configurable up/down coefficients is the standard approach for control-rate sensor data. |
| Value scaling and range mapping | Sensor output ranges (e.g., -2g to +2g, -180 to +180 degrees) rarely match target parameter ranges (0-1 for gain, 20-20000 for frequency). | LOW | Use `[scale]` object with exponential curve parameter for perceptual mapping. Linear mapping is wrong for frequency and amplitude -- use exponential curves (dB-to-amplitude, MIDI-to-frequency patterns). |
| Gyroscope bias calibration (stationary offset) | Gyroscope reads non-zero when stationary due to manufacturing bias. Without calibration, orientation drifts immediately. | MEDIUM | Average N samples (500-1000) at startup while device is stationary. Subtract this offset from all subsequent readings. Must happen before sensor fusion. Simple but critical. |
| Connection status indication | Users must know whether the Arduino is connected and sending data. Silent failures are unacceptable in live performance. | LOW | Detect serial port presence and data flow. In MAX, use `[serial]` port enumeration or Node for Max `serialport.list()`. Add a heartbeat or watchdog that flags stale data (no new samples for N ms). |

### Differentiators (Competitive Advantage)

Features that set the product apart. Not required, but valuable.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| Computed yaw (heading) with drift acknowledgment | Completes the orientation triple. Even without a magnetometer, relative yaw from gyro integration is useful for gesture detection and short-duration performances. | MEDIUM | Yaw from gyro-only will drift. Be explicit about this: provide yaw with a "yaw reset" button. Users can periodically re-zero. For many creative applications (gesture arcs, spin detection), relative yaw is sufficient. Do NOT pretend it is absolute heading. |
| Reusable MAX abstraction (sensor-tamer pattern) | A self-contained `.maxpat` abstraction that encapsulates the entire pipeline: serial input, parsing, calibration, fusion, smoothing, scaling, output. Drop it into any project. | HIGH | This is the real differentiator. Most Arduino-to-MAX examples are one-off patches. A proper abstraction with arguments (port, baud, smoothing amount) and clean inlets/outlets is rare. Use Max abstraction patterns: arguments via `#1`, `#2`, etc. Expose calibration toggle, raw/cooked output, individual axis outlets. |
| Interactive calibration with toggle/reset | One-click calibration: toggle on, hold device still, toggle off. Calibration values stored and applied. Reset returns to uncalibrated state. | MEDIUM | Calibration sequence: toggle starts N-sample collection, computes gyro bias offsets, optionally computes accelerometer offsets (device must be level). Store in a Max `[dict]` for persistence. Reset clears offsets to zero. Visual feedback during calibration (progress/countdown). |
| WiFi/UDP transport (secondary) | Wireless operation for installations, dance, wearable use cases where USB cable is limiting. | HIGH | Arduino Uno WiFi Rev2 has WiFiNINA module supporting UDP. Known issue: CNMAT OSC library 1.3.5 has compilation errors with this board. Use raw UDP with manual formatting instead of OSC, or fix the OSC library issue. Expect ~60ms+ latency vs ~1-2ms for USB serial. WiFi is secondary because of latency and reliability. |
| Threshold/event detection (gesture triggers) | Convert continuous orientation into discrete events: "device tilted past 45 degrees", "sharp acceleration detected", "spin completed". Enables bang-based creative triggers. | MEDIUM | Use `[past]` object for threshold crossing, hysteresis via dual thresholds (above/below with dead zone) to prevent jitter-triggered events. Debounce with `[delay]` to eliminate double-triggers. The `[thresh]` and `[quickthresh]` objects handle this natively. |
| Data recording and playback | Record a sensor performance session and replay it. Essential for iterating on mappings without needing the physical device present every time. | MEDIUM | Use `[coll]` or `[text]` to store timestamped sensor values. CSV format for interoperability. Playback with `[metro]` at recorded intervals. This enables offline development and session comparison. |
| 3D orientation visualization | Real-time 3D rendering of device orientation in MAX. Immediate visual feedback for understanding what the sensor is doing. | MEDIUM | Use Jitter (`jit.gl.gridshape` or similar) with `rotatexyz` attribute for Euler angles or `quat` attribute for quaternion rotation. `jit.quat2axis` avoids gimbal lock. A simple colored box rotating in a `jit.gl.render` context is sufficient and immediately useful. |
| Dual output mode (raw + computed) | Simultaneously output both raw 6-axis data and computed orientation. Different downstream consumers need different formats. | LOW | Trivial once both pipelines exist. Two outlet groups from the abstraction: one for raw accel/gyro (6 values), one for computed pitch/roll/yaw (3 values). Some users want raw for audio-rate modulation, computed for spatial reasoning. |
| Accelerometer range configuration | Switch between +/-2g, +/-4g, +/-8g, +/-16g ranges for different use cases (gentle tilt vs. vigorous shaking). | LOW | LSM6DS3 supports configurable ranges via register writes. Higher range = less resolution per LSB. Default +/-2g is correct for orientation. +/-8g or +/-16g for percussive/impact detection. Expose as a setting, not a runtime control. |

### Anti-Features (Commonly Requested, Often Problematic)

Features that seem good but create problems.

| Feature | Why Requested | Why Problematic | Alternative |
|---------|---------------|-----------------|-------------|
| Absolute yaw/heading without magnetometer | "I want to know which direction I'm facing" | LSM6DS3 is 6DOF (no magnetometer). Gyro-only yaw drifts continuously. Faking absolute heading creates user confusion and unreliable behavior. Madgwick filter documentation explicitly states it is not appropriate for 6DOF heading. | Provide relative yaw with explicit reset button. Document the drift behavior. If absolute heading is truly needed, recommend adding an external magnetometer (LIS3MDL or similar) as a future hardware upgrade. |
| OSC over WiFi as primary transport | "OSC is the standard for creative sensor data" | CNMAT OSC library has known compilation issues with Arduino Uno WiFi Rev2. WiFi adds 60ms+ latency. UDP drops packets. OSC adds parsing overhead. For a primary transport, this is unreliable and slow. | Use USB serial as primary (1-2ms latency, reliable). Offer WiFi/UDP as secondary/optional transport with explicit latency warnings. If OSC is needed, implement it on the MAX side (convert serial data to OSC for forwarding to other software). |
| Kalman filter for sensor fusion | "Kalman filter is the gold standard for IMU fusion" | Kalman filters are computationally expensive, require careful tuning of process/measurement noise covariance matrices, and offer marginal improvement over Mahony/complementary filters for creative applications on an 8-bit microcontroller. Over-engineering for this use case. | Use Mahony filter. It is specifically recommended for small processors and 6DOF IMUs. One or two tunable gains vs. multiple covariance matrices. Good enough for creative applications where perceptual quality matters more than aerospace precision. |
| Machine learning gesture recognition on-device | "Classify gestures directly on the Arduino" | ATmega4809 at 16MHz with 6KB SRAM cannot run meaningful ML models. TinyML exists but requires different hardware (Cortex-M4+). Adding this scope would derail the project. | Send raw/fused data to MAX. Do gesture recognition in MAX or in Node for Max where JavaScript has full compute power. Simple threshold/state-machine gesture detection in MAX is more practical and debuggable. |
| Auto-discovery of serial port | "Just find the Arduino automatically" | Serial port names vary by OS, multiple devices may be connected, and auto-detection can connect to wrong devices. Fragile and platform-specific. | List available ports and let user select. Node for Max can enumerate ports via `serialport.list()` and present a dropdown (`[umenu]`). Semi-automatic: filter by known Arduino vendor IDs, but always confirm. |
| WiFi configuration UI in MAX | "Let me set SSID and password from the MAX patch" | Requires bidirectional serial protocol for configuration, credential storage on Arduino (security risk), and complex state machine for connection management. Massive scope expansion. | Hard-code WiFi credentials in the Arduino sketch. Document how to change them. WiFi is a secondary transport; configuration complexity should stay minimal. |
| Sensor fusion on the MAX side | "Do all the math in MAX/JavaScript, just send raw data" | Sensor fusion quality depends on consistent, high-frequency sampling. Serial transmission introduces jitter and dropped samples. Fusion on the receiving end produces worse orientation estimates because sample timing is unreliable. | Run sensor fusion on Arduino where sampling is deterministic. Send computed orientation values over serial. Arduino has consistent loop timing; MAX's serial polling does not. |

## Feature Dependencies

```
[Raw 6-axis data output]
    +--requires--> [USB serial transport]
    +--requires--> [Data parsing in MAX]
    |
    +--enables--> [Gyroscope bias calibration]
    |                 +--enables--> [Sensor fusion (Mahony)]
    |                                   +--enables--> [Computed pitch/roll]
    |                                   +--enables--> [Computed yaw (relative)]
    |                                   +--enables--> [3D orientation visualization]
    |
    +--enables--> [Signal smoothing]
    |                 +--enables--> [Value scaling/mapping]
    |                                   +--enables--> [Threshold/event detection]
    |
    +--enables--> [Data recording/playback]

[Reusable MAX abstraction]
    +--requires--> ALL table stakes features
    +--requires--> [Interactive calibration]
    +--requires--> [Dual output mode]

[WiFi/UDP transport]
    +--independent of--> [USB serial transport]
    +--requires--> [Data parsing in MAX] (same parser, different source)

[Configurable sample rate]
    +--independent--> can be set at any phase
    +--affects--> [Sensor fusion] (filter tuning depends on sample rate)

[Connection status]
    +--requires--> [USB serial transport] OR [WiFi/UDP transport]
```

### Dependency Notes

- **Sensor fusion requires calibration:** Gyro bias must be removed before fusion filter receives data, otherwise the filter converges on wrong orientation.
- **Smoothing requires parsed data:** Cannot smooth until serial stream is reliably parsed into individual axis values.
- **Abstraction requires all table stakes:** The reusable abstraction is the packaging of all core features. It cannot be built until those features are individually working.
- **WiFi is independent:** Can be developed in parallel with serial pipeline. Same data format, different transport.
- **Sample rate affects fusion tuning:** Mahony filter gains must be tuned for the actual sample rate. Changing ODR requires re-tuning filter parameters.

## MVP Definition

### Launch With (v1)

Minimum viable product -- what is needed to validate end-to-end data flow.

- [x] Raw 6-axis data output from Arduino over USB serial -- proves the hardware works
- [x] Data parsing in MAX (serial receive, delimiter split, route to outlets) -- proves MAX receives
- [x] Gyroscope bias calibration (startup, stationary averaging) -- required for any useful orientation
- [x] Sensor fusion via Mahony filter on Arduino -- produces stable pitch/roll
- [x] Basic signal smoothing in MAX (`[slide]`) -- removes jitter for downstream use
- [x] Value scaling with `[scale]` -- maps sensor ranges to useful parameter ranges
- [x] Connection status indicator -- know when it is working vs. broken

### Add After Validation (v1.x)

Features to add once core pipeline is proven reliable.

- [ ] Interactive calibration with toggle/reset -- triggered by poor initial calibration or need to re-zero
- [ ] Relative yaw output with reset -- when users want rotation around vertical axis
- [ ] Threshold/event detection -- when users want discrete triggers, not just continuous streams
- [ ] Dual output mode (raw + computed simultaneously) -- when mapping needs both
- [ ] 3D orientation visualization (Jitter) -- when debugging orientation or showing live feedback
- [ ] Configurable sample rate -- when 104 Hz default is insufficient (audio-rate modulation)
- [ ] Data recording and playback -- when iterating on mappings without hardware

### Future Consideration (v2+)

Features to defer until core product is solid and real usage patterns emerge.

- [ ] WiFi/UDP secondary transport -- only when wireless is actually needed for a use case
- [ ] Accelerometer range configuration -- only when impact/shake detection is needed
- [ ] Reusable MAX abstraction packaging -- requires stable API from all v1.x features; this is the capstone deliverable
- [ ] OSC output from MAX (convert serial to OSC for forwarding) -- only when interop with other creative software is needed

## Feature Prioritization Matrix

| Feature | User Value | Implementation Cost | Priority |
|---------|------------|---------------------|----------|
| Raw 6-axis data output | HIGH | LOW | P1 |
| USB serial transport | HIGH | LOW | P1 |
| Data parsing in MAX | HIGH | MEDIUM | P1 |
| Gyroscope bias calibration | HIGH | LOW | P1 |
| Sensor fusion (Mahony) | HIGH | MEDIUM | P1 |
| Computed pitch/roll | HIGH | LOW (falls out of fusion) | P1 |
| Signal smoothing | HIGH | LOW | P1 |
| Value scaling/mapping | HIGH | LOW | P1 |
| Connection status | MEDIUM | LOW | P1 |
| Interactive calibration toggle/reset | HIGH | MEDIUM | P2 |
| Relative yaw with reset | MEDIUM | LOW | P2 |
| Threshold/event detection | MEDIUM | MEDIUM | P2 |
| Dual output mode | MEDIUM | LOW | P2 |
| 3D visualization (Jitter) | MEDIUM | MEDIUM | P2 |
| Configurable sample rate | LOW | LOW | P2 |
| Data recording/playback | MEDIUM | MEDIUM | P2 |
| WiFi/UDP transport | MEDIUM | HIGH | P3 |
| Accelerometer range config | LOW | LOW | P3 |
| Reusable MAX abstraction | HIGH | HIGH | P3 (capstone) |

**Priority key:**
- P1: Must have for launch -- without these, the pipeline does not function
- P2: Should have, add when core is stable -- each adds real value independently
- P3: Nice to have / capstone -- WiFi requires network debugging; abstraction requires stable API

## Competitor Feature Analysis

| Feature | Traditional MAX `[serial]` approach | Node for Max approach | Our Approach |
|---------|-------------------------------------|----------------------|--------------|
| Serial parsing | `[serial]` + `[select]` + `[zl group]` -- brittle, hard to debug | `serialport` npm + JavaScript parsing -- robust, programmable | Node for Max for parsing (JavaScript is far better for string/protocol handling), with `maxAPI.outlet()` to MAX message flow |
| Sensor fusion | Done in MAX with `[expr]` chains or external -- clunky, timing-dependent | Could be done in JS -- but timing jitter from serial polling degrades quality | Done on Arduino (deterministic timing), sent as computed values |
| Calibration | Manual offset entry or basic `[mean]` -- error-prone | Computed in JS with statistical methods -- better but still timing-dependent | On Arduino: startup bias averaging. Interactive recalibration triggered from MAX via serial command. |
| Smoothing | `[slide]` or `[line]` -- well-established | `line~` equivalent not available; would need custom JS | In MAX using `[slide]` -- this is what MAX is built for |
| Abstraction/reuse | Copy-paste patches between projects | npm package pattern -- possible but unusual for MAX users | MAX abstraction (`.maxpat` with arguments) -- standard MAX pattern that users expect |
| WiFi/wireless | Requires separate OSC library, `[udpreceive]` | Could use Node.js `dgram` module | Arduino WiFiNINA UDP + MAX `[udpreceive]` or Node for Max `dgram` |

## Sources

- [Arduino_LSM6DS3 library](https://www.arduino.cc/en/Reference/ArduinoLSM6DS3) -- Official Arduino library reference
- [Arduino_LSM6DS3 roll/pitch/yaw PR (unmerged)](https://github.com/arduino-libraries/Arduino_LSM6DS3/pull/4) -- Complementary filter approach, calibration patterns
- [Woolsey Workshop: LSM6DS3 on Uno WiFi Rev2](https://www.woolseyworkshop.com/2020/02/12/using-the-arduino_lsm6ds3-library-to-access-the-arduino-uno-wifi-rev2-imu/) -- Board-specific library usage
- [LSM6DS3 sample rate forum thread](https://forum.arduino.cc/t/lsm6ds3-sample-rate/1156756) -- ODR configuration, SparkFun library alternative
- [MadgwickAHRS Arduino library](https://github.com/arduino-libraries/MadgwickAHRS) -- Official Madgwick implementation
- [OlliW: IMU Data Fusing](https://www.olliw.eu/2013/imu-data-fusing/) -- Critical analysis showing Madgwick is not appropriate for 6DOF; Mahony recommended (MEDIUM confidence -- single but authoritative source)
- [Adafruit: Sensor Fusion Algorithms](https://learn.adafruit.com/ahrs-for-adafruits-9-dof-10-dof-breakout/sensor-fusion-algorithms) -- Mahony vs Madgwick comparison
- [x-io Technologies: Open source AHRS algorithms](https://x-io.co.uk/open-source-imu-and-ahrs-algorithms/) -- Madgwick's original implementation
- [Node for Max API](https://docs.cycling74.com/apiref/nodeformax/) -- `outlet()`, `addHandler()`, `post()` methods
- [Max serial object reference](https://docs.cycling74.com/reference/serial/) -- Baud rates, polling, async reading
- [Cycling '74: Abstractions documentation](https://docs.cycling74.com/userguide/abstractions/) -- Reusable abstraction patterns
- [CNMAT OSC library](https://github.com/CNMAT/OSC) -- Known issue #106 with Arduino Uno WiFi Rev2
- [jit.quat2euler](https://docs.cycling74.com/max7/refpages/jit.quat2euler) -- Quaternion to Euler conversion in Jitter
- [Cycling '74: Smoothing control signals](https://cycling74.com/forums/averagingsmoothing-a-ctrl-object-output) -- `[slide]` and `[line~]` patterns
- [Adafruit: Gyroscope Calibration](https://learn.adafruit.com/adafruit-sensorlab-gyroscope-calibration?view=all) -- Stationary bias averaging methodology
- [WiFiNINA library](https://github.com/arduino-libraries/WiFiNINA) -- UDP support for Uno WiFi Rev2
- [Arduino Forum: Connecting Uno WiFi Rev2 and MaxMSP](https://forum.arduino.cc/t/connecting-uno-wifi-rev-2-and-maxmsp/1317264) -- Community integration examples

---
*Feature research for: Arduino-to-MAX IMU sensor pipeline*
*Researched: 2026-02-12*
