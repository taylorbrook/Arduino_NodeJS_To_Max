# Pitfalls Research

**Domain:** Arduino IMU-to-MAX/MSP Sensor Pipeline (LSM6DS3 on Uno WiFi Rev2)
**Researched:** 2026-02-12
**Confidence:** MEDIUM-HIGH (multiple community sources corroborate; some board-specific claims verified via official forums only)

## Critical Pitfalls

### Pitfall 1: Uno WiFi Rev2 USB Serial Capped at 57600 Baud

**What goes wrong:**
The Arduino Uno WiFi Rev2 cannot reliably transmit USB serial data above 57600 baud. Setting `Serial.begin(115200)` produces garbled/corrupt data. This is the single most impactful constraint for a "maximum sample rate, minimum latency" project because it directly caps your throughput budget.

**Why it happens:**
The board uses an ATmega32u4-based mEDBG (Microchip Embedded Debugger) chip for USB-to-serial conversion. This chip has a baud rate error of approximately -3.5% at 115200 bps, causing bit-level corruption. Unlike the standard Uno Rev3 (which uses a separate USB interface chip), or the Uno R4 (which has native USB), the WiFi Rev2's debug chip is the bottleneck. There is a workaround of calling `Serial.begin(111111)` while the host reads at 115200, but this is fragile and undocumented behavior.

**How to avoid:**
- Design the entire pipeline around 57600 baud as a hard constraint from day one.
- Calculate your byte budget: at 57600 baud you get roughly 5760 bytes/sec (10 bits per byte with start/stop bits). If sending 6 float values as ASCII CSV with newline, each line is roughly 40-50 bytes, giving you ~115-144 lines/sec maximum throughput.
- Use binary protocol (Serial.write() with packed structs) instead of ASCII to cut per-sample byte count roughly in half, pushing practical throughput toward ~200+ samples/sec.
- Alternatively, if 57600 truly cannot meet requirements, plan the WiFi/UDP path as the primary transport from the start rather than treating it as secondary.

**Warning signs:**
- Random garbage characters in serial monitor at baud rates above 57600.
- Intermittent data corruption that "sometimes works" -- the -3.5% error means some bytes land correctly by chance.
- Data looks fine for short bursts but corrupts under sustained throughput.

**Phase to address:**
Phase 1 (Serial Foundation). This must be validated in the first hours of development. Building anything on an assumed 115200 baud rate will require rearchitecting later.

**Confidence:** MEDIUM -- verified by multiple Arduino forum threads, but the `Serial.begin(111111)` workaround has not been independently tested.

---

### Pitfall 2: LSM6DS3 Library Hardcodes 104 Hz Sample Rate

**What goes wrong:**
The official Arduino_LSM6DS3 library initializes both the accelerometer and gyroscope at 104 Hz ODR (Output Data Rate). There is no API to change this. Calling `IMU.readAcceleration()` or `IMU.readGyroscope()` faster than 104 Hz just re-reads stale register values, wasting cycles and serial bandwidth on duplicate data. The sensor hardware supports up to 1666 Hz (gyro) and 6664 Hz (accel), but the library locks you out.

**Why it happens:**
The Arduino_LSM6DS3 library was designed for simplicity, not performance. The ODR is set via a hardcoded register write in the library's `.cpp` file during `begin()`. There are no setter methods exposed. Developers assume "read faster = more data" without realizing the sensor itself has a fixed output cadence.

**How to avoid:**
- Option A (Recommended): Fork/modify the Arduino_LSM6DS3 library to change the ODR register values in `LSM6DS3.cpp`. The CTRL1_XL register (0x10) controls accelerometer ODR, and CTRL2_G (0x11) controls gyroscope ODR. Set both to 0x60 for 416 Hz, or 0x80 for 1666 Hz.
- Option B: Use the SparkFun LSM6DS3 library which exposes `settings.gyroSampleRate` and `settings.accelSampleRate` -- but note it has a known compilation error on the Uno WiFi Rev2 (`MSB_FIRST` vs `MSBFIRST` constant mismatch that requires a one-line fix).
- Option C: Write raw register values via Wire library after calling `IMU.begin()`, overriding the library's defaults.
- Match your Arduino loop rate to the actual sensor ODR. Polling at 416 Hz when the sensor outputs at 104 Hz wastes 75% of your serial bandwidth on duplicates.

**Warning signs:**
- Pitch/roll/yaw values update noticeably slower than expected despite a fast loop.
- Serial output shows identical consecutive readings.
- Increasing baud rate or loop speed doesn't improve responsiveness.

**Phase to address:**
Phase 1 (Sensor Reading). Must be resolved before any meaningful latency measurement. The choice between library modification approaches should be made during initial setup.

**Confidence:** HIGH -- verified via Arduino official docs, forum threads, and the library source code on GitHub.

---

### Pitfall 3: Yaw Drift Is Physically Unavoidable Without a Magnetometer

**What goes wrong:**
The LSM6DS3 is a 6-DOF sensor (3-axis accelerometer + 3-axis gyroscope). No sensor fusion algorithm -- Madgwick, Mahony, complementary filter, or Kalman -- can produce a stable yaw (heading) estimate without a magnetometer. Yaw will drift continuously, accumulating degrees of error per minute. Developers spend weeks tuning filter parameters trying to "fix" what is a fundamental physics limitation.

**Why it happens:**
Accelerometers measure the gravity vector, which provides a reference for pitch and roll (tilt relative to Earth's surface). But gravity tells you nothing about rotation around the vertical axis (yaw). Gyroscopes measure angular velocity, which can be integrated to get yaw change, but integration accumulates bias error over time. A magnetometer provides an absolute heading reference (like a compass) that corrects this drift. Without it, no algorithm can distinguish real yaw rotation from sensor noise.

**How to avoid:**
- Set expectations explicitly: document that yaw is "relative, not absolute" and will drift over time. This is a product decision, not a bug.
- For musical/artistic applications, consider whether you actually need yaw at all. Pitch and roll (tilt) are stable and often sufficient for gestural control.
- If relative yaw is acceptable, implement a "reset yaw to zero" button that the performer can trigger. This is common in IMU-based musical controllers.
- If absolute heading is required, the project scope must expand to include an external magnetometer module (e.g., LIS3MDL) connected via I2C -- this is a hardware change, not a software fix.
- Do NOT increase the Madgwick/Mahony beta parameter trying to fix yaw drift; this makes pitch and roll noisier without helping yaw.

**Warning signs:**
- Yaw reading slowly climbs or drops when the sensor is stationary.
- Yaw drifts faster after physical movement (gyro bias changes with temperature/vibration).
- Hours spent tuning filter parameters with no improvement in yaw stability.

**Phase to address:**
Phase 2 (Sensor Fusion). This should be an explicit design decision made before writing any fusion code. The calibration/reset feature addresses this directly.

**Confidence:** HIGH -- this is a well-documented physical limitation confirmed across dozens of sources, official ST Microelectronics documentation, and the Madgwick paper itself.

---

### Pitfall 4: Madgwick/Mahony Filter Sample Rate Mismatch

**What goes wrong:**
The Madgwick filter's `begin(sampleFrequency)` parameter and the actual loop execution rate silently diverge, causing the filter to produce wildly wrong orientation estimates. If you tell the filter it's running at 104 Hz but your loop actually runs at 60 Hz (due to Serial.print overhead, for example), the filter's internal integration uses wrong time steps. The result: sluggish response, overshoot, or oscillating orientation values.

**Why it happens:**
The Madgwick/Mahony filters are regression algorithms where the beta/Kp gain parameters are tuned relative to the declared sample rate. The `begin()` call sets an internal time step (`1.0 / sampleFrequency`). If the actual rate differs, the filter either over-corrects (actual rate < declared rate, filter thinks more time passed than really did) or under-corrects (actual rate > declared). Developers typically set `begin(104)` to match the sensor ODR but forget that Serial.print(), sensor reads, and other processing consume time that reduces the effective loop rate.

**How to avoid:**
- Measure your actual loop rate with `micros()` timing and use that value in `begin()`.
- Better: compute delta-time per iteration using `micros()` and pass it to the filter update. The Arduino MadgwickAHRS library does not natively support variable delta-time, but a simple fork adding a `dt` parameter to `updateIMU()` eliminates this class of bugs entirely.
- Keep the Arduino loop as tight as possible: minimize string formatting, avoid `delay()`, avoid `Serial.print()` of debug text during production operation.
- Validate by printing actual loop frequency periodically (e.g., count iterations per second) and comparing to the declared filter rate.

**Warning signs:**
- Orientation responds sluggishly to fast movements but overshoots on slow movements.
- Filter output oscillates or rings after a quick rotation.
- Changing beta doesn't behave as expected (because the real issue is timing, not gain).
- `millis()` or `micros()` measurements show loop period varying significantly from expected.

**Phase to address:**
Phase 2 (Sensor Fusion). Must be validated immediately when integrating the filter. Build a loop-timing diagnostic into the firmware from the start.

**Confidence:** HIGH -- extensively documented in Arduino forums, Madgwick library GitHub issues, and the original Madgwick paper discusses sample rate assumptions.

---

### Pitfall 5: Serial Protocol Framing Errors (Lost/Merged Messages)

**What goes wrong:**
Without proper message framing, the receiving side (Node for Max) sees corrupted data: partial lines merged together, split across reads, or truncated mid-value. A typical failure: the Arduino sends `"1.23,4.56,7.89\n"` but Node for Max reads `"1.23,4.56,7.8"` followed by `"9\n-0.12,3.45,6.78\n"`, causing parse errors that produce NaN values or wild spikes in the MAX patch.

**Why it happens:**
Serial is a byte stream, not a message stream. `Serial.println()` does not guarantee the receiver gets a complete line in one read. The Arduino's 64-byte transmit buffer, the OS USB driver buffering, and node-serialport's read chunking all introduce boundaries that don't align with message boundaries. At high data rates (approaching the 57600 baud limit), partial reads become more frequent. Additionally, when the Arduino starts up or the serial connection opens, partial messages are common because the Arduino may already be mid-transmission.

**How to avoid:**
- Always use a line-based parser on the receive side: node-serialport's `ReadlineParser` with `\n` delimiter handles reassembly automatically. Never parse raw `data` events directly.
- Add a start-of-message marker for robustness: e.g., each line starts with a known character like `$` so the parser can discard any partial first message after connection.
- Keep message length well under 64 bytes to avoid Arduino transmit buffer backpressure (at 57600 baud, the buffer drains fast enough for short messages, but long messages can cause blocking in `Serial.print()`).
- Binary protocols need proper framing (header bytes, length field, checksum) -- CSV with newline delimiter is simpler and sufficient for 6-axis IMU data at the rates this hardware supports.

**Warning signs:**
- Occasional NaN or "undefined" values appearing in MAX.
- Data that's correct 99% of the time but occasionally spikes to extreme values.
- Problems that appear only at higher data rates or under sustained load.
- First 1-2 readings after serial port open are always garbage.

**Phase to address:**
Phase 1 (Serial Communication). The protocol format and parser must be defined before any data flows. This is foundational infrastructure.

**Confidence:** HIGH -- this is a universal serial communication issue documented extensively in Arduino forums, ITP Physical Computing resources, and node-serialport documentation.

---

## Technical Debt Patterns

Shortcuts that seem reasonable but create long-term problems.

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Using `Serial.print()` with ASCII floats instead of binary protocol | Human-readable output, easy debugging | 2-3x more bytes per sample, lower effective sample rate, string parsing overhead on both sides | During prototyping/Phase 1 only. Switch to binary if throughput is insufficient. |
| Hardcoding filter parameters (beta, sample rate) | Faster initial implementation | Cannot tune without reflashing Arduino, different mounting orientations need different tuning | Never in production. Expose as configurable parameters from MAX side. |
| Running sensor fusion on Arduino | Computed values arrive ready-to-use in MAX | ATmega4809 is slow at floating-point math (no FPU), limits loop rate, harder to change algorithms | Acceptable if loop rate stays above sensor ODR. Otherwise, move fusion to Node for Max. |
| Using `delay()` for timing | Simple loop rate control | Blocks all processing, prevents reading serial input, wastes CPU time that could be used for computation | Never. Use non-blocking `micros()` timing. |
| Skipping IMU calibration at startup | Faster startup, no user interaction needed | Gyro bias uncorrected, accelerometer offset uncorrected, all orientation estimates degraded | Only for quick testing. Production must include at minimum a 2-second stationary calibration on startup. |
| Using the default Arduino_LSM6DS3 library unmodified | No library management overhead | Locked to 104 Hz, no access to FIFO, no configurable ranges | Phase 1 prototyping only. Must be addressed before optimizing throughput. |

## Integration Gotchas

Common mistakes when connecting components in this pipeline.

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| Arduino to Node for Max (serial) | Opening serial port before Arduino finishes booting -- Arduino resets on serial open, first 1-2 seconds of data is garbage or the bootloader's output | Add a 2-second delay after port open before parsing data. Alternatively, have Arduino send a "READY" sentinel after setup() completes and wait for it. |
| Node for Max to MAX patch | Using `maxAPI.outlet()` at the raw sensor rate (100+ Hz) floods MAX's message queue. MAX processes messages on its scheduler thread, not in real-time. | Throttle output to MAX's scheduler rate or use `[defer]`/`[deferlow]` objects. Alternatively, output to a `[buffer~]` for signal-rate data. |
| SparkFun LSM6DS3 library on Uno WiFi Rev2 | Library won't compile: `MSB_FIRST` undefined error because the megaAVR core uses `MSBFIRST` | Change `MSB_FIRST` to `MSBFIRST` in the SparkFun library source, or add a `#define MSB_FIRST MSBFIRST` before the include. |
| WiFi UDP (OSC) as transport | Assuming WiFi has the same latency as serial. WiFiNINA's NINA module firmware has a built-in 20ms minimum latency due to FreeRTOS tick rate (10ms ticks, processed every other tick). | Accept 20ms floor on WiFi latency unless you reflash the NINA firmware to increase FreeRTOS tick rate to 1000 Hz. For minimum latency, USB serial is mandatory. |
| node-serialport with network activity | Serial port read/write performance degrades significantly when Node.js is also performing network I/O (documented node-serialport issue) | If using WiFi and serial simultaneously, isolate serial handling or avoid concurrent network requests during serial reads. |
| Madgwick filter `begin()` call | Passing the sensor ODR (e.g., 104) instead of the actual measured loop rate (which may be 70-80 Hz after accounting for Serial.print and processing overhead) | Measure actual loop rate with `micros()` timing and use that value. Or modify the filter to accept per-frame delta-time. |

## Performance Traps

Patterns that work at small scale but fail as data rate increases.

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| ASCII CSV with `Serial.println()` for all 6 axes + 3 orientation values | Works at 50 Hz, each line ~80 bytes | Switch to binary protocol or reduce fields per message. Send raw 6-axis at full rate, computed orientation at reduced rate. | Above ~70 samples/sec at 57600 baud (80 bytes * 70 = 5600 bytes/sec, near the 5760 byte/sec limit) |
| `String` concatenation on Arduino | Works for a few values, easy to read | Use `snprintf()` into a fixed char buffer, or `Serial.write()` with raw bytes. Arduino `String` class fragments heap memory. | After hours of continuous operation -- heap fragmentation causes memory allocation failures and crashes. |
| Synchronous `Serial.print()` calls | Works at low rates | `Serial.print()` blocks when the 64-byte transmit buffer is full. At 57600 baud this buffer drains in ~11ms, but burst writes of long messages can stall the main loop. | When total bytes per loop iteration exceed 64 bytes and loop rate is high enough that the buffer hasn't drained between iterations. |
| Polling IMU in main loop without checking data-ready | Works but wastes time reading stale data | Use `IMU.accelerationAvailable()` / `IMU.gyroscopeAvailable()` to check the data-ready flag before reading. Or configure the sensor's DRDY interrupt pin. | Always a waste, but becomes a throughput bottleneck when every microsecond matters for hitting target loop rate. |
| Sending every sensor reading to MAX without decimation | Works at low rates, MAX processes fine | Implement a send-rate independent of read-rate. Read sensor at full ODR for fusion quality, but send to MAX at 50-100 Hz. | Above ~100 Hz output to MAX, where scheduler overhead and message processing lag behind real-time. |

## UX Pitfalls

Common user experience mistakes in IMU-to-MAX controller design.

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| No calibration feedback -- user must hold sensor still for N seconds with no indication of progress or completion | User moves sensor too early, calibration is bad, all subsequent data is wrong, user doesn't know why | Provide visual/audio feedback in MAX during calibration. Show countdown. Confirm calibration quality (e.g., display gyro bias magnitude). |
| Orientation jumps on reconnect -- sensor fusion state is lost when serial disconnects and reconnects | Performer sees wild values during reconnect, must wait for filter to converge (can take 5-10 seconds with conservative beta) | Reset filter state on reconnect. Provide a "fusion converging" status flag. Allow manual re-zero. |
| No way to remap axes -- sensor mounted in different orientations for different use cases | Pitch and roll are swapped or inverted depending on how the Arduino is mounted | Provide axis remapping in the MAX abstraction (swap/negate axes). Better: provide a "set current orientation as zero" calibration that handles arbitrary mounting. |
| Raw gyro/accel values exposed without scaling explanation | User receives values like "0.02, -0.98, 0.15" with no indication of units (g's? degrees/sec? radians?) | Always document units. The LSM6DS3 library returns g's for accelerometer and degrees/sec for gyroscope. Label outputs in the MAX abstraction. |

## "Looks Done But Isn't" Checklist

Things that appear complete but are missing critical pieces.

- [ ] **Serial communication:** Receiving data in MAX -- but haven't tested what happens when Arduino is unplugged and reconnected mid-session. Does the patch recover automatically?
- [ ] **Sensor fusion:** Getting pitch/roll/yaw values -- but haven't verified the declared filter sample rate matches the actual loop rate. Measure with `micros()`.
- [ ] **Calibration:** Gyro zeroing works on bench -- but haven't tested whether calibration holds after the sensor warms up (LSM6DS3 gyro bias shifts with temperature, typically ~1-2 deg/sec over the first few minutes).
- [ ] **Data rate:** Seeing updates in MAX -- but haven't measured actual end-to-end latency (timestamp on Arduino, compare to arrival time in Node for Max). The "feels responsive" test misses 20-50ms of hidden latency.
- [ ] **Reusable abstraction:** MAX patch works for this project -- but haven't tested with a different Arduino board or different sensor. Hard-coded assumptions about data format, axes, and ranges make the abstraction brittle.
- [ ] **WiFi fallback:** OSC/UDP "works" in testing -- but haven't tested under WiFi congestion, at range, or for sustained periods. WiFi IMU data is unreliable for performance use without extensive testing.
- [ ] **Gyro saturation:** Orientation values look correct at normal movement speeds -- but haven't tested with fast gestures. The LSM6DS3 default range is +/-245 deg/sec; fast arm movements can exceed this, causing saturation and incorrect fusion output.
- [ ] **String parsing:** CSV parsing works with test data -- but haven't handled the case where a field is empty, a line is truncated, or a value is "nan" or "inf" (which the Arduino will print for certain float edge cases).

## Recovery Strategies

When pitfalls occur despite prevention, how to recover.

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| Built pipeline assuming 115200 baud | MEDIUM | Reduce to 57600, switch to binary protocol to recover throughput, or pivot to WiFi/UDP as primary transport. May require restructuring Arduino code and Node parser. |
| Hardcoded 104 Hz sample rate discovered late | LOW | Fork library or add register writes after `IMU.begin()`. Two lines of Wire library code. Test thoroughly as higher ODR means more noise. |
| Yaw drift discovered after building yaw-dependent features | HIGH | Fundamental limitation. Either add magnetometer hardware, redesign features to use pitch/roll only, or add manual yaw reset. All require significant rework if yaw was central to the design. |
| Filter sample rate mismatch causing bad orientation | LOW | Measure actual loop rate, update `begin()` parameter. Or add delta-time computation. Usually fixable in under an hour once diagnosed. |
| Serial framing errors causing intermittent crashes | MEDIUM | Add ReadlineParser if not present, add start-of-message sentinel, add per-field validation. Requires changes on both Arduino and Node sides. |
| Arduino `String` heap fragmentation causing crashes after hours | MEDIUM | Rewrite all string handling to use fixed `char[]` buffers and `snprintf()`. Tedious but mechanical refactoring. |
| MAX scheduler overwhelmed by high-rate messages | LOW-MEDIUM | Add decimation in Node for Max (send every Nth sample), or batch values into dictionaries. May require restructuring MAX patch routing. |

## Pitfall-to-Phase Mapping

How roadmap phases should address these pitfalls.

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| 57600 baud ceiling | Phase 1: Serial Foundation | Send continuous data at target rate, verify zero corruption over 5 minutes |
| 104 Hz ODR lock | Phase 1: Sensor Reading | Print `IMU.accelerationAvailable()` timing to confirm actual sensor output rate matches configured ODR |
| Yaw drift (6-DOF limitation) | Phase 2: Sensor Fusion (design decision) | Document as known limitation. Verify pitch/roll stability over 10 minutes stationary. Measure yaw drift rate (deg/min). |
| Filter sample rate mismatch | Phase 2: Sensor Fusion | Measure actual loop rate with `micros()`. Compare to `begin()` parameter. Must match within 10%. |
| Serial framing errors | Phase 1: Serial Protocol | Send 10,000 messages, verify all 10,000 parse correctly on receive side. Test disconnect/reconnect. |
| Node for Max event loop blocking | Phase 3: Node for Max Integration | Measure message arrival jitter in Node. Should be < 5ms standard deviation at target rate. |
| Calibration quality | Phase 4: Calibration System | Compare calibrated vs uncalibrated gyro readings at rest. Calibrated should be < 0.5 deg/sec on all axes. |
| WiFi/UDP 20ms floor latency | Phase 5: WiFi Transport (if pursued) | Measure round-trip with timestamps. Accept 20ms+ or reflash NINA firmware. |
| MAX scheduler flooding | Phase 3: MAX Abstraction | Monitor MAX CPU meter while running at target rate. Should stay below 30%. |
| Gyro range saturation | Phase 4: Calibration/Configuration | Test with fast gestures. If saturation occurs, increase range via register write (costs resolution). |

## Sources

- [Arduino Forum: Serial max speed Uno WiFi Rev 2](https://forum.arduino.cc/t/serial-max-speed-uno-wifi-rev-2/617529) -- 57600 baud limit, mEDBG chip limitation
- [Arduino Forum: UNO WiFi Rev2 USB Serial can't go faster than 57600](https://forum.arduino.cc/t/uno-wifi-rev2-usb-serial-cant-go-faster-then-57600/647341) -- confirmation of baud rate ceiling
- [Arduino Forum: LSM6DS3 sample rate](https://forum.arduino.cc/t/lsm6ds3-sample-rate/1156756) -- ODR register modification, library limitations
- [Arduino Forum: IMU polling rate hack for Arduino_LSM6DS3](https://forum.arduino.cc/t/imu-polling-rate-hack-for-arduino-lsm6ds3/1161593) -- direct register access approach
- [Arduino Forum: Drift in Yaw using the Madgwick library](https://forum.arduino.cc/t/drift-in-yaw-using-the-madgwick-library-example/955324) -- 6-DOF yaw drift is fundamental
- [GitHub: MadgwickAHRS Issue #33 - Yaw drift LSM6DS3](https://github.com/arduino-libraries/MadgwickAHRS/issues/33) -- LSM6DS3-specific yaw drift
- [GitHub: MadgwickAHRS Issue #1 - Implementation](https://github.com/arduino-libraries/MadgwickAHRS/issues/1) -- sample rate sensitivity
- [Arduino Forum: Help with Mahony or Madgwick AHRS filter settings](https://forum.arduino.cc/t/help-with-choosing-the-correct-settings-for-mahony-or-madgwick-ahrs-filters/968160) -- beta tuning, sample rate mismatch
- [Woolsey Workshop: Using Arduino_LSM6DS3 Library](https://www.woolseyworkshop.com/2020/02/12/using-the-arduino_lsm6ds3-library-to-access-the-arduino-uno-wifi-rev2-imu/) -- library capabilities and limitations
- [GitHub: WiFiNINA Issue #192 - UDP 20ms latency](https://github.com/arduino-libraries/WiFiNINA/issues/192) -- FreeRTOS tick rate root cause
- [GitHub: node-serialport Issue #797 - Network delays affect serial](https://github.com/serialport/node-serialport/issues/797) -- network I/O interference
- [GitHub: node-serialport Issue #165 - Event loop blocking](https://github.com/serialport/node-serialport/issues/165) -- serialport + Socket.IO blocking
- [Cycling '74: Node for Max API](https://docs.cycling74.com/nodeformax/api/module-max-api.html) -- maxAPI.outlet() behavior
- [ITP Physical Computing: Interpreting Serial Data](https://itp.nyu.edu/physcomp/lessons/interpreting-serial-data/) -- serial framing fundamentals
- [Embedded Related: Serial Data Framing](https://www.embeddedrelated.com/showarticle/113.php) -- protocol design best practices
- [Arduino Forum: Uno WiFi R2 gyroscope precision](https://forum.arduino.cc/t/uno-wifi-r2-gyroscope-precision-lsm6ds3tr-imu/851867) -- noise and precision issues
- [Hackaday: Fixing Arduino's Serial Latency Issues](https://hackaday.com/2011/05/18/fixing-arduinos-serial-latency-issues/) -- USB driver latency
- [Arduino Forum: How to calibrate a 6dof IMU](https://forum.arduino.cc/t/how-to-calibrate-a-6dof-imu/915970) -- calibration approaches

---
*Pitfalls research for: Arduino IMU-to-MAX/MSP Sensor Pipeline*
*Researched: 2026-02-12*
