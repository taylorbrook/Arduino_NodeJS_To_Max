# Stack Research

**Domain:** Arduino IMU-to-MAX/MSP Sensor Pipeline via Node for Max
**Researched:** 2026-02-12
**Confidence:** MEDIUM-HIGH (Arduino/serial layers verified via official docs; Node for Max specifics rely on multiple credible sources but some version details are training-data-only)

## Recommended Stack

### Arduino Side -- Core Technologies

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| Arduino_LSM6DS3 | 1.0.3 | Read accelerometer + gyroscope from onboard LSM6DS3 IMU | Official Arduino library for the Uno WiFi Rev2's built-in IMU. Connected via SPI internally -- zero wiring needed. Simpler API than SparkFun alternative. **Confidence: HIGH** (verified via Arduino reference + GitHub) |
| Arduino IDE / CLI | 2.x | Compile and upload sketches | Standard toolchain. CLI enables scripting uploads. **Confidence: HIGH** |
| WiFiNINA | latest (1.8.x+) | WiFi + UDP for secondary wireless transport | Official library for the NINA-W102 module on this board. Required for any WiFi/UDP/OSC path. **Confidence: HIGH** (verified via Arduino docs) |
| CNMAT OSC | 3.5.8 | OSC message encoding on Arduino for WiFi path | Most feature-rich OSC implementation for Arduino. Supports UDP transport via Arduino Stream class. Only needed for WiFi/OSC secondary path. **Confidence: MEDIUM** (last release Sep 2023, occasionally maintained) |

### Node for Max Side -- Core Technologies

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| max-api | (bundled) | Node-to-Max communication | Ships with Max. Provides `outlet()`, `post()`, `addHandler()` for bidirectional communication between Node.js and Max patch. No install needed. **Confidence: HIGH** (official Cycling 74 API) |
| serialport | 12.x | USB serial communication with Arduino | De facto standard for Node.js serial (5200+ dependents on npm). Uses N-API via prebuildify -- no recompilation needed across Node versions. Ships with prebuilt binaries for macOS/Windows/Linux. **Confidence: HIGH** (verified via serialport.io docs) |
| @serialport/parser-readline | 12.x (match serialport) | Parse newline-delimited serial data | Transform stream that buffers incoming bytes and emits complete lines on `\n` delimiter. Essential for text-based serial protocols. **Confidence: HIGH** |
| ahrs | 1.3.3 | Madgwick/Mahony sensor fusion (orientation from raw IMU) | JavaScript AHRS implementation supporting both Madgwick and Mahony algorithms. Outputs quaternion, Euler angles (heading/pitch/roll). Configurable sample interval, beta (noise), kp/ki gains. **Confidence: MEDIUM** (last updated Oct 2023, small package, but well-tested algorithm) |

### Supporting Libraries

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| osc-js | 2.4.x | OSC message handling in Node.js | Only for WiFi/UDP secondary transport path. DatagramPlugin for UDP receive. Bridge mode if forwarding to WebSocket. Not needed for USB serial primary path. **Confidence: MEDIUM** |
| @serialport/parser-byte-length | 12.x | Parse fixed-length binary serial packets | Only if you switch from text to binary serial protocol for higher throughput (Phase 2+ optimization). **Confidence: HIGH** |

### Development Tools

| Tool | Purpose | Notes |
|------|---------|-------|
| Arduino IDE 2.x | Sketch development, Serial Monitor for debugging | Serial Monitor locks COM port -- close before running Max. Only one program can own the serial port at a time. |
| Arduino CLI | Scriptable compile/upload | Useful for automated workflows. `arduino-cli compile --fqbn arduino:megaavr:uno2018wifi` |
| Max 8.6+ / Max 9 | Patcher environment with Node for Max | Max 8.6+ bundles Node.js v20.x (LTS). Older Max 8 versions ship Node 16 (EOL). Verify with Max > About. |
| node.script | Run Node.js scripts from Max | Primary interface. Send `script npm install <package>` to install dependencies. Outputs to Max via `maxApi.outlet()`. |

## Critical Configuration

### Baud Rate: Use 115200

**Rationale:** The ATmega4809 on the Uno WiFi Rev2 has 4 USARTs with fractional baud rate generators supporting up to 500kbps. However, 115200 is the sweet spot:

- At 115200 baud, throughput is ~14.4 KB/s (115200 / 8 bits / ~1 byte overhead)
- A 6-axis CSV line like `ax,ay,az,gx,gy,gz\n` is ~40-50 bytes
- That supports ~280-360 samples/sec -- well above the LSM6DS3 default 104 Hz ODR
- Universally supported, no compatibility issues with USB-CDC on this board
- Higher rates (230400, 500000) are possible but add risk of framing errors with no practical benefit at 104 Hz ODR

**Do NOT use 9600.** At 9600 baud (~1.2 KB/s), you max out at ~24-30 samples/sec, creating a bottleneck below the sensor's capability.

### LSM6DS3 Output Data Rate (ODR): Start at 104 Hz

**Rationale:** The Arduino_LSM6DS3 library defaults to 104 Hz for both accel and gyro. This is sufficient for human motion tracking and musical gesture control. The LSM6DS3 hardware supports 13/26/52/104/208/416/833/1666 Hz, but:

- 104 Hz provides ~10ms resolution, adequate for most interactive applications
- Higher ODRs (416 Hz+) require direct register manipulation (the official library hardcodes 104 Hz)
- The ATmega4809 at 16 MHz can read SPI fast enough, but serial throughput becomes the bottleneck above ~300 Hz at 115200 baud
- Start at 104 Hz; optimize to 208 or 416 Hz later via register writes if needed

### Serial Protocol: Newline-Delimited CSV (Text)

**Format:** `ax,ay,az,gx,gy,gz\n`

**Rationale for text over binary:**
- Human-readable in Arduino Serial Monitor for debugging
- Trivially parsed with `@serialport/parser-readline`
- No endianness or struct packing concerns
- At 104 Hz / 115200 baud, throughput is not a constraint
- Binary protocol is a Phase 2+ optimization if you need 400+ Hz

## Installation

### Arduino Libraries (via Library Manager)

```
Arduino_LSM6DS3    -- IMU access (install via Arduino IDE Library Manager)
WiFiNINA           -- WiFi/UDP (install via Arduino IDE Library Manager)
OSC                -- CNMAT OSC encoding (install via Arduino IDE Library Manager, only for WiFi path)
```

### Node for Max Packages (via node.script message or terminal)

```bash
# Primary: USB serial pipeline
npm install serialport@12 @serialport/parser-readline@12

# Orientation computation
npm install ahrs

# Secondary: WiFi/OSC path (only if implementing wireless)
npm install osc-js
```

**Important:** Install packages in the same directory as your `.js` script file, or in the Max project directory. Send `script npm install serialport` to the node.script object, or run npm from terminal in the script's directory.

### Why serialport@12 not @13

serialport v13.0.0 exists but was released over a year ago with limited adoption data. Version 12.x is the well-tested stable branch. The API is identical for our use case (both use named exports). If v13 works in your Node for Max environment, it is also acceptable -- the N-API/prebuildify architecture means binary compatibility is not version-sensitive. **Confidence: LOW** -- I could not find definitive evidence that v13 has issues; this is a conservative recommendation.

## Alternatives Considered

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| Arduino_LSM6DS3 (official) | SparkFun_LSM6DS3 Arduino Library 1.0.1 | When you need configurable ODR (settings.gyroSampleRate = 416), configurable range, or FIFO access. SparkFun lib exposes full register set. Trade-off: more complex init, designed for I2C by default (Uno WiFi Rev2 uses SPI internally). |
| serialport (npm) | Max `[serial]` object (native) | When you want zero Node.js dependency. Max's built-in `[serial]` object can read serial directly. Trade-off: requires manual byte parsing in Max, no readline equivalent, harder to compute orientation in pure Max. |
| ahrs (npm, Madgwick) | Complementary filter (hand-rolled) | When you want simpler math with fewer tuning params. A complementary filter blends gyro integration with accel tilt using a single alpha weight. Trade-off: less accurate during dynamic motion, no quaternion output, drift-prone on yaw axis. |
| ahrs (npm, Madgwick) | Run Madgwick on Arduino side (MadgwickAHRS Arduino library) | When you want to offload fusion to the microcontroller. Trade-off: ATmega4809 at 16 MHz is slower for floating-point math; reduces sample rate headroom; harder to tune interactively. Running fusion in Node lets you adjust beta in real-time from Max. |
| USB Serial (primary) | WiFi UDP/OSC | When wireless is required. Trade-off: WiFiNINA has a firmware-level ~20ms latency floor (FreeRTOS tick delay in NINA-W102 firmware), packet loss under congestion, and setup complexity. USB serial is deterministic and sub-1ms. |
| Text CSV protocol | Binary struct protocol | When you need >300 Hz sample rate. Binary cuts packet size from ~45 bytes to ~12 bytes (6x int16). Trade-off: not human-readable, requires `@serialport/parser-byte-length` + manual unpacking, struct alignment concerns. |
| osc-js (npm) | osc (npm, by Colin Clark) | osc.js is also a solid OSC library for Node.js. osc-js has cleaner plugin architecture and better docs. Either works for UDP receive in Node for Max. |

## What NOT to Use

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| Firmata / Johnny-Five | Designed for remote-controlling Arduino from Node, not high-speed sensor streaming. Adds protocol overhead, limits sample rate, wrong abstraction for this use case. | Direct serial with custom protocol |
| Max `[serial]` object alone | Byte-level parsing in Max is tedious. No readline equivalent. Computing Madgwick filter in pure Max/gen~ is possible but unnecessarily complex. | Node for Max with serialport + ahrs |
| WiFi as primary transport | WiFiNINA firmware has hardcoded ~20ms latency floor (FreeRTOS tick in NINA-W102). That limits you to ~50 Hz max with packet loss risk. USB serial is 10-100x lower latency. | USB serial as primary; WiFi as secondary/optional |
| serialport v9 or older | Deprecated import patterns (`const SerialPort = require('serialport')`), no N-API support, requires rebuild per Node version. | serialport v12+ with named exports |
| Running Madgwick on ATmega4809 | 8-bit AVR at 16 MHz is slow for floating-point quaternion math. Reduces available CPU for sensor reading and serial output. Harder to tune beta interactively. | Run ahrs filter in Node for Max where you have GHz-class CPU |
| Arduino_LSM6DS3 for high-ODR | Library hardcodes 104 Hz ODR. No API to change it. | SparkFun_LSM6DS3 if you need 208+ Hz, or direct register writes |
| Baud rate 9600 | Only ~1.2 KB/s. Bottlenecks at ~25 samples/sec. Wastes the sensor's 104 Hz capability. | 115200 baud minimum |

## Stack Patterns by Variant

**If USB-only (recommended for Phase 1):**
- Arduino: Arduino_LSM6DS3 + Serial at 115200
- Node for Max: serialport + @serialport/parser-readline + ahrs
- Protocol: CSV text, newline-delimited
- Because: simplest path, lowest latency, most reliable

**If WiFi/OSC secondary path (Phase 2+):**
- Arduino: add WiFiNINA + CNMAT OSC library
- Node for Max: add osc-js with DatagramPlugin
- Protocol: OSC over UDP
- Because: wireless freedom, but accept 20ms+ latency floor and packet loss risk

**If high sample rate needed (Phase 3+ optimization):**
- Arduino: SparkFun_LSM6DS3 with ODR set to 416 Hz, binary struct protocol
- Node for Max: @serialport/parser-byte-length, manual struct unpacking
- Baud rate: 230400 or higher
- Because: 4x more data, requires binary protocol to fit in serial bandwidth

## Version Compatibility

| Package | Compatible With | Notes |
|---------|-----------------|-------|
| serialport@12 | Node.js 16, 18, 20 | N-API means no rebuild needed. Max 8.6+ ships Node 20. |
| ahrs@1.3.3 | Node.js 12+ | Pure JavaScript, no native dependencies. Works everywhere. |
| osc-js@2.4.x | Node.js 14+ | Pure JavaScript. UDP via Node's dgram module. |
| max-api | Max 8.x, Max 9 | Bundled with Max. Version matches your Max installation. |
| Arduino_LSM6DS3@1.0.3 | Arduino IDE 1.8+, 2.x | Requires megaAVR boards package for Uno WiFi Rev2. |
| WiFiNINA@1.8.x+ | Arduino IDE 1.8+, 2.x | Board must have NINA-W102 module. Uno WiFi Rev2 qualifies. |
| CNMAT OSC@3.5.8 | Arduino IDE 1.8+, 2.x | Works with any UDP-capable Arduino. |

**Critical compatibility note:** Max 8.6+ bundles Node.js v20. If you are on an older Max 8 (pre-8.6) or Ableton Live 11 (which ships an older Max), you have Node 16 which is EOL. serialport@12 still works on Node 16, but upgrade Max or use a custom Node binary for security. Check your Node version: in Max, send `script node -v` to node.script.

## Sources

- [Arduino_LSM6DS3 GitHub](https://github.com/arduino-libraries/Arduino_LSM6DS3) -- version 1.0.3, last release Jan 2024 **[HIGH confidence]**
- [Arduino_LSM6DS3 Reference](https://reference.arduino.cc/reference/en/libraries/arduino_lsm6ds3/) -- official API docs **[HIGH confidence]**
- [Arduino Uno WiFi Rev2 Docs](https://docs.arduino.cc/hardware/uno-wifi-rev2/) -- hardware specs, SPI IMU connection **[HIGH confidence]**
- [Node for Max API](https://docs.cycling74.com/nodeformax/api/) -- max-api outlet, post, handlers **[HIGH confidence]**
- [Node for Max npm guide](https://docs.cycling74.com/max8/vignettes/02_n4m_usingnpm) -- package installation patterns **[HIGH confidence]**
- [Cycling 74 Forum: Node.js version](https://cycling74.com/forums/bundled-nodejs-version-end-of-life-on-2023-09-11) -- Max 8.6 ships Node v20 **[MEDIUM confidence]**
- [SerialPort docs](https://serialport.io/) -- API, parsers, installation, platform support **[HIGH confidence]**
- [serialport npm](https://www.npmjs.com/package/serialport) -- v13.0.0 latest, v12.x stable **[HIGH confidence]**
- [ahrs npm](https://www.npmjs.com/package/ahrs) -- v1.3.3, Madgwick/Mahony, last updated Oct 2023 **[MEDIUM confidence]**
- [ahrs GitHub](https://github.com/psiphi75/ahrs) -- API docs, configuration options **[MEDIUM confidence]**
- [LSM6DS3 Datasheet](https://content.arduino.cc/assets/st_imu_lsm6ds3_datasheet.pdf) -- ODR tables, register config **[HIGH confidence]**
- [LSM6DS3 Sample Rate Forum](https://forum.arduino.cc/t/lsm6ds3-sample-rate/1156756) -- 104Hz default, SparkFun alternative for ODR config **[MEDIUM confidence]**
- [SparkFun LSM6DS3 Library](https://github.com/sparkfun/SparkFun_LSM6DS3_Arduino_Library) -- configurable ODR, v1.0.1 **[MEDIUM confidence]**
- [WiFiNINA UDP Latency Issue #192](https://github.com/arduino-libraries/WiFiNINA/issues/192) -- 20ms latency floor, NINA firmware root cause **[HIGH confidence]**
- [CNMAT OSC Releases](https://github.com/CNMAT/OSC/releases) -- v3.5.8, Sep 2023 **[MEDIUM confidence]**
- [osc-js npm](https://www.npmjs.com/package/osc-js) -- v2.4.x, UDP/WebSocket/Bridge plugins **[MEDIUM confidence]**
- [SerialPort Upgrade Guide](https://serialport.io/docs/guide-upgrade/) -- v10+ named exports, N-API migration **[HIGH confidence]**
- [Woolsey Workshop LSM6DS3 Tutorial](https://www.woolseyworkshop.com/2020/02/12/using-the-arduino_lsm6ds3-library-to-access-the-arduino-uno-wifi-rev2-imu/) -- SPI connection details, range specs **[MEDIUM confidence]**
- [Arduino Forum: IMU Polling Rate Hack](https://forum.arduino.cc/t/imu-polling-rate-hack-for-arduino-lsm6ds3/1161593) -- direct register writes for ODR changes **[MEDIUM confidence]**

---
*Stack research for: Arduino IMU-to-MAX/MSP Sensor Pipeline*
*Researched: 2026-02-12*
