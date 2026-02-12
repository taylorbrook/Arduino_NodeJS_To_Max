# Architecture Research

**Domain:** Real-time Arduino IMU to MAX/MSP sensor pipeline
**Researched:** 2026-02-12
**Confidence:** MEDIUM-HIGH

## System Overview

```
┌───────────────────────────────────────────────────────────────────────┐
│                        HARDWARE LAYER                                 │
│  ┌──────────────────────────────────────────────────────────────┐     │
│  │  Arduino Uno WiFi Rev2 (ATmega4809 @ 16MHz)                 │     │
│  │  ┌─────────────┐   ┌──────────────┐   ┌───────────────┐    │     │
│  │  │  LSM6DS3    │──>│  Firmware    │──>│  USB Serial   │    │     │
│  │  │  IMU (SPI)  │   │  (read+pack) │   │  (115200+)    │    │     │
│  │  └─────────────┘   └──────────────┘   └───────┬───────┘    │     │
│  └────────────────────────────────────────────────┼────────────┘     │
└───────────────────────────────────────────────────┼───────────────────┘
                                                    │ USB Cable
┌───────────────────────────────────────────────────┼───────────────────┐
│                     HOST COMPUTER                  │                   │
│  ┌─────────────────────────────────────────────────┼────────────┐     │
│  │  MAX/MSP Patch                                  │            │     │
│  │                                                 v            │     │
│  │  ┌────────────┐    ┌───────────────┐    ┌──────────────┐    │     │
│  │  │ node.script│<───│  Node.js      │<───│  serialport  │    │     │
│  │  │ (Max obj)  │    │  process      │    │  (npm)       │    │     │
│  │  └─────┬──────┘    │               │    └──────────────┘    │     │
│  │        │           │  ┌──────────┐ │                        │     │
│  │        │           │  │ Madgwick │ │                        │     │
│  │        │           │  │ AHRS     │ │                        │     │
│  │        │           │  └──────────┘ │                        │     │
│  │        v           └───────────────┘                        │     │
│  │  ┌──────────────────────────────────────────────────┐       │     │
│  │  │  MAX Patch Logic                                 │       │     │
│  │  │  ┌────────┐  ┌───────────┐  ┌────────────────┐  │       │     │
│  │  │  │ Parse  │  │ Calibrate │  │ Route/Scale    │  │       │     │
│  │  │  │ + Unpack│  │ + Offset  │  │ to Outlets     │  │       │     │
│  │  │  └────────┘  └───────────┘  └────────────────┘  │       │     │
│  │  └──────────────────────────────────────────────────┘       │     │
│  │        │                                                    │     │
│  │        v                                                    │     │
│  │  ┌──────────────────────────────────────────────────┐       │     │
│  │  │  Abstraction Outlets                             │       │     │
│  │  │  [raw 6-axis] [pitch/roll/yaw] [calibration]    │       │     │
│  │  └──────────────────────────────────────────────────┘       │     │
│  └─────────────────────────────────────────────────────────────┘     │
└───────────────────────────────────────────────────────────────────────┘
```

## Component Responsibilities

| Component | Responsibility | Typical Implementation |
|-----------|----------------|------------------------|
| **LSM6DS3 IMU** | Produce raw accelerometer + gyroscope readings at configured ODR | Arduino_LSM6DS3 library or SparkFun LSM6DS3 library with register-level ODR config |
| **Arduino Firmware** | Read IMU, format data, transmit over serial | `.ino` sketch using `Serial.print()` with delimiter protocol |
| **USB Serial Link** | Transport bytes from Arduino to host | USB CDC at 115200 baud minimum (higher possible) |
| **Node.js Serial Reader** | Open serial port, parse incoming lines, buffer/validate | `serialport` npm + `@serialport/parser-readline` inside `node.script` |
| **Orientation Filter** | Fuse accel+gyro into pitch/roll/yaw | Madgwick or Mahony AHRS algorithm running in Node.js |
| **Calibration Module** | Store offsets, apply zero-point corrections, toggle on/off | State management in Node.js with Max dict or handler messages |
| **MAX Patch (Abstraction)** | Present clean interface: inlets for control, outlets for data | `.maxpat` abstraction or bpatcher wrapping `node.script` |

## Critical Architecture Decision: Where to Compute Orientation

**Recommendation: Compute orientation in Node.js on the host, NOT on the Arduino.**

### Rationale

| Factor | On Arduino (ATmega4809) | On Host (Node.js via node.script) |
|--------|------------------------|-----------------------------------|
| **CPU** | 8-bit AVR @ 16MHz, no FPU -- software float is slow | Multi-GHz x86/ARM with hardware FPU |
| **Madgwick cost** | ~2-5ms per iteration (estimated, software float on AVR) | Sub-microsecond (trivial on modern CPU) |
| **Serial bandwidth** | Must send 6 raw floats per sample regardless | Same bandwidth; orientation adds no serial cost |
| **Flexibility** | Changing filter params requires re-flash | Change filter params live from Max |
| **Debuggability** | Cannot inspect intermediate values easily | Full console.log, Max post(), live tuning |
| **Sample rate headroom** | At 416Hz+ the Madgwick computation may compete with the main loop | Unlimited headroom |

**Send raw 6-axis data from Arduino. Compute everything on the host.** This keeps the Arduino firmware simple (read sensor, format, send) and puts all tunable logic where it can be adjusted in real time.

The only exception would be if WiFi transport is used (UDP has packet loss), where pre-computing on Arduino reduces data that must survive the link. But for USB serial (the primary path), raw data is the right choice.

### Confidence: MEDIUM-HIGH
- ATmega4809 has no hardware FPU -- verified from datasheet (8-bit AVR architecture)
- Madgwick on 8-bit AVR is known to work but is computationally expensive -- multiple forum reports
- Node.js Madgwick implementations exist (ahrs npm package, or port the algorithm directly)

## Recommended Project Structure

```
project/
├── arduino/
│   └── imu_sender/
│       └── imu_sender.ino         # Arduino firmware: read LSM6DS3, send serial
├── node/
│   ├── package.json               # npm deps: serialport, max-api, ahrs/madgwick
│   ├── index.js                   # Entry point for node.script
│   ├── serial-reader.js           # Serial port open/parse/validate
│   ├── orientation.js             # Madgwick filter wrapper
│   └── calibration.js             # Zero-point calibration state
├── max/
│   ├── imu-pipeline.maxpat        # Main abstraction (the reusable component)
│   ├── imu-pipeline.maxhelp       # Help patch with usage examples
│   └── imu-demo.maxpat            # Demo/test patch
└── README.md
```

### Structure Rationale

- **arduino/:** Isolated firmware project. Opens cleanly in Arduino IDE. Single `.ino` file because the firmware is intentionally simple (read + send).
- **node/:** npm package living alongside the Max patch. `node.script` points to this folder. Modules separated by concern so orientation logic can be swapped or tuned independently.
- **max/:** The abstraction file (`imu-pipeline.maxpat`) is the deliverable. The help patch demonstrates usage. The demo patch is for development testing.

## Data Flow

### Primary Data Flow (USB Serial)

```
[LSM6DS3 IMU]                          (hardware, SPI bus, on-board)
    │
    │  IMU.readAcceleration(ax, ay, az)
    │  IMU.readGyroscope(gx, gy, gz)
    v
[Arduino Firmware]                     (format as delimited ASCII string)
    │
    │  Serial.println("ax,ay,az,gx,gy,gz")   e.g. "0.12,-0.98,0.03,1.23,-0.45,0.67"
    v
[USB Serial @ 115200 baud]            (bytes over USB CDC)
    │
    v
[serialport + ReadlineParser]          (Node.js, inside node.script process)
    │
    │  parser.on('data', line => ...)
    │  Split on comma, parseFloat each value
    v
[Validation Gate]                      (reject malformed/partial lines)
    │
    ├──> [Raw 6-axis outlet]           maxAPI.outlet("raw", ax, ay, az, gx, gy, gz)
    │
    v
[Calibration Module]                   (subtract stored offsets if enabled)
    │
    v
[Madgwick Filter]                      (updateIMU(gx, gy, gz, ax, ay, az))
    │
    │  filter.getRoll(), filter.getPitch(), filter.getYaw()
    v
[Orientation outlet]                   maxAPI.outlet("orientation", roll, pitch, yaw)
    │
    v
[MAX Patch receives on node.script outlets]
    │
    │  route "raw" "orientation" "status"
    v
[Downstream MAX processing]            (audio control, visualization, mapping, etc.)
```

### Control Flow (MAX to Node to Arduino)

```
[MAX Patch UI]
    │
    │  message to node.script: "calibrate", "reset", "start", "stop"
    v
[node.script inlet]
    │
    │  maxAPI.addHandler("calibrate", () => { ... })
    │  maxAPI.addHandler("reset", () => { ... })
    v
[Node.js handlers]
    │
    ├──> [Calibration: snapshot current values as zero-offsets]
    ├──> [Reset: clear offsets]
    ├──> [Start/Stop: open/close serial port]
    └──> [Status messages back to Max via maxAPI.outlet("status", ...)]
```

### Key Data Flows

1. **Sensor Read Loop (Arduino):** Runs at IMU ODR (104Hz default, up to 1666Hz with register config). Each iteration: poll `accelerationAvailable()` / `gyroscopeAvailable()`, read values, format string, `Serial.println()`. Total loop time must be less than 1/ODR seconds.

2. **Serial Ingest (Node.js):** ReadlineParser fires on each `\n`. Each line parsed into 6 floats. Malformed lines (wrong field count, NaN values) are silently dropped. Valid samples are immediately processed -- no batching, no queuing.

3. **Orientation Update (Node.js):** Madgwick `updateIMU()` called synchronously for each valid sample. The filter maintains internal quaternion state. Roll/pitch/yaw extracted after each update. Both raw and orientation data are sent to Max in the same processing tick.

4. **Calibration Capture (Node.js):** On "calibrate" message, the current raw values are stored as offsets. Subsequent raw values have offsets subtracted before being passed to the Madgwick filter. On "reset", offsets are zeroed.

## Architectural Patterns

### Pattern 1: Newline-Delimited ASCII Serial Protocol

**What:** Arduino sends one CSV line per sample, terminated by `\n`. Example: `"0.12,-0.98,0.03,1.23,-0.45,0.67\n"`

**When to use:** USB serial at moderate data rates (up to ~500Hz at 115200 baud with 6 float values).

**Trade-offs:**
- PRO: Human-readable, trivial to debug with Serial Monitor
- PRO: ReadlineParser handles framing automatically -- no custom byte-level parsing
- PRO: Robust to partial reads (incomplete lines discarded naturally)
- CON: ~40 bytes per sample vs ~24 bytes for binary (floats are 4 bytes each)
- CON: At very high sample rates (1000Hz+), ASCII overhead becomes significant

**Why chosen over binary:** At 115200 baud, theoretical max is ~11,520 bytes/sec. A 40-byte ASCII line at 416Hz = 16,640 bytes/sec -- this exceeds 115200 baud capacity. So for rates above ~280Hz, either increase baud rate (230400, 460800) or switch to binary. **For the default 104Hz, ASCII at 115200 is comfortable (4,160 bytes/sec, well under the 11,520 limit).**

**Example (Arduino):**
```cpp
void loop() {
  if (IMU.accelerationAvailable() && IMU.gyroscopeAvailable()) {
    float ax, ay, az, gx, gy, gz;
    IMU.readAcceleration(ax, ay, az);
    IMU.readGyroscope(gx, gy, gz);

    Serial.print(ax, 4); Serial.print(',');
    Serial.print(ay, 4); Serial.print(',');
    Serial.print(az, 4); Serial.print(',');
    Serial.print(gx, 4); Serial.print(',');
    Serial.print(gy, 4); Serial.print(',');
    Serial.println(gz, 4);
  }
}
```

**Example (Node.js parsing):**
```javascript
const { ReadlineParser } = require('@serialport/parser-readline');
const parser = port.pipe(new ReadlineParser({ delimiter: '\n' }));

parser.on('data', (line) => {
  const values = line.trim().split(',').map(Number);
  if (values.length === 6 && values.every(v => !isNaN(v))) {
    const [ax, ay, az, gx, gy, gz] = values;
    // Process valid sample
  }
  // Malformed lines silently dropped
});
```

### Pattern 2: Node for Max as the Integration Bridge

**What:** `node.script` runs a persistent Node.js process that owns the serial port connection, orientation computation, and calibration state. It communicates with the Max patch via `maxAPI.outlet()` (Node to Max) and `maxAPI.addHandler()` (Max to Node).

**When to use:** Whenever you need capabilities that are awkward or impossible in native Max objects -- serial port management, npm packages, stateful computation, file I/O.

**Trade-offs:**
- PRO: `node.script` runs in a separate OS process, so heavy computation does not block Max's audio/scheduler thread
- PRO: Full access to npm ecosystem (serialport, ahrs, mathjs, etc.)
- PRO: JavaScript is well-suited for the Madgwick algorithm (fast float math, no GC pressure at 100-400Hz)
- CON: Adds a process boundary -- data crosses via IPC, adding ~0.1-1ms latency per message
- CON: Error handling requires explicit status messages back to Max (port disconnected, etc.)
- CON: Debugging requires checking both Max console and Node console

**Why chosen over native Max `serial` object:** The native Max `serial` object works byte-by-byte, requiring manual ASCII accumulation and parsing with Max objects (`zl group`, `fromsymbol`, `atoi`, etc.). This is fragile and verbose for multi-value CSV lines. Node.js ReadlineParser handles this in 3 lines. Additionally, computing Madgwick in Max would require either `js` (single-threaded, blocks scheduler) or `gen~` (not designed for this), neither of which is a natural fit.

### Pattern 3: Max Abstraction with Tagged Outlets

**What:** The reusable Max abstraction uses a single `node.script` outlet and `route` to separate data streams by tag. Node sends tagged messages: `maxAPI.outlet("raw", ax, ay, az, gx, gy, gz)` and `maxAPI.outlet("orientation", roll, pitch, yaw)`.

**When to use:** Always, for any multi-stream data source in Max.

**Trade-offs:**
- PRO: Single outlet from node.script, clean routing in Max with `route raw orientation status`
- PRO: Users of the abstraction pick only the data they need
- PRO: New data streams can be added without changing the abstraction's outlet count
- CON: Slight overhead from route matching (negligible)

**Example (Max pseudo-patch):**
```
[node.script imu-pipeline]
    |
[route raw orientation status calibration]
    |         |            |         |
[raw 6-axis] [roll/pitch/yaw] [status msgs] [cal state]
```

## Anti-Patterns

### Anti-Pattern 1: Computing Orientation on Arduino

**What people do:** Run Madgwick/Mahony on the Arduino and send computed roll/pitch/yaw over serial.
**Why it's wrong:** The ATmega4809 has no hardware FPU. Software floating-point Madgwick takes significant time per iteration, reducing maximum achievable sample rate. Filter parameters (beta, sample frequency) become baked into firmware requiring re-flash to change. You lose access to raw data for alternative processing or logging.
**Do this instead:** Send raw 6-axis data. Compute orientation on the host where CPU is abundant and parameters can be tuned live.

### Anti-Pattern 2: Using Max's Native `serial` Object for Multi-Value Data

**What people do:** Use `[serial]` -> `[select 13 10]` -> `[zl group]` -> `[fromsymbol]` chains to parse CSV data in Max.
**Why it's wrong:** This approach is fragile, difficult to debug, and accumulates into a maze of patch cables for anything beyond single-value data. Error handling (malformed data, port disconnects) requires extensive Max logic.
**Do this instead:** Use `node.script` with the `serialport` npm package. Parsing, validation, and error handling are straightforward in JavaScript.

### Anti-Pattern 3: Polling IMU Instead of Checking Data-Ready

**What people do:** Read IMU values on a fixed timer without checking `accelerationAvailable()` / `gyroscopeAvailable()`.
**Why it's wrong:** Reading before new data is ready returns stale values. Reading too slowly means missed samples with no indication of data loss.
**Do this instead:** Always gate reads behind `IMU.accelerationAvailable()` and `IMU.gyroscopeAvailable()`. This ensures you read exactly at the IMU's ODR.

### Anti-Pattern 4: Sending Orientation as Euler Angles Without Quaternion Option

**What people do:** Only output roll/pitch/yaw degrees.
**Why it's wrong:** Euler angles suffer from gimbal lock at pitch = +/-90 degrees. Downstream users doing 3D work need quaternions.
**Do this instead:** Output both: Euler angles (convenient for most mapping) AND quaternions (correct for 3D rotation). The Madgwick filter maintains quaternions internally -- extracting them costs nothing.

## Scaling Considerations

This system does not scale in the traditional "users" sense. Scaling here means: higher sample rates, more sensors, or lower latency.

| Concern | At 104Hz (default) | At 416Hz | At 1000Hz+ |
|---------|-------------------|----------|------------|
| **Serial bandwidth** | 4.2 KB/s ASCII -- comfortable at 115200 baud | 16.6 KB/s -- needs 230400+ baud or binary protocol | Binary protocol required; 24 bytes/sample = 24 KB/s at 460800 baud |
| **Node.js processing** | Trivial; 104 Madgwick updates/sec is nothing | Still trivial | Still trivial for single sensor |
| **Max message rate** | 104 outlet calls/sec -- no issue | 416/sec -- fine | 1000/sec -- still fine for Max scheduler |
| **Arduino loop time** | 9.6ms budget per sample; plenty of headroom | 2.4ms budget; tight with ASCII formatting | Likely need to move to binary format and minimize Serial.print calls |
| **IMU ODR config** | Default Arduino_LSM6DS3 library | Requires SparkFun library or direct register writes | Direct register writes to CTRL1_XL and CTRL2_G |

### Scaling Priorities

1. **First bottleneck: Serial bandwidth.** At 115200 baud, you max out around 280 samples/sec with 6-value ASCII CSV. Solution: increase baud rate or switch to binary protocol.

2. **Second bottleneck: Arduino loop time.** `Serial.print()` with float formatting is slow on AVR. At high rates, switch to `Serial.write()` with packed binary structs (24 bytes: 6 x 4-byte floats).

3. **Third bottleneck: IMU library.** The default Arduino_LSM6DS3 library hardcodes 104Hz ODR. For higher rates, use SparkFun's library or write register values directly.

## Integration Points

### External Services / Hardware

| Service | Integration Pattern | Notes |
|---------|---------------------|-------|
| LSM6DS3 IMU (on-board) | SPI via Arduino_LSM6DS3 library | Connected internally on Uno WiFi Rev2 -- no wiring needed |
| USB Serial | CDC over USB; appears as `/dev/tty.usbmodemXXXX` (macOS) or `COMX` (Windows) | Only one program can hold the port -- close Arduino Serial Monitor before starting Max |
| WiFi (secondary path) | UDP via WiFiNINA library; OSC protocol with ArduinoOSC | Higher latency (~5-20ms), potential packet loss; use only when USB is impractical |
| Arduino IDE | Firmware upload and Serial Monitor for debugging | Must close Serial Monitor before Max opens the port |

### Internal Boundaries

| Boundary | Communication | Notes |
|----------|---------------|-------|
| Arduino Firmware <-> Node.js | USB Serial (ASCII CSV over readline) | One-directional data flow (Arduino -> Node). Control messages (start/stop) handled by Node opening/closing the port. |
| Node.js <-> Max Patch | max-api IPC (`maxAPI.outlet` / `maxAPI.addHandler`) | Bidirectional. Node sends tagged data streams. Max sends control messages (calibrate, reset, port selection). |
| Max Abstraction <-> User Patch | Standard Max inlets/outlets | Abstraction presents: 1 inlet (control messages), multiple outlets (raw, orientation, status). Follows Max convention. |
| Calibration State <-> Orientation Filter | Internal to Node.js process | Calibration offsets are subtracted from raw values before they enter the Madgwick filter. State stored in module variables. |

## Secondary Transport: WiFi/OSC Path

For completeness, the WiFi path architecture differs:

```
[Arduino]──WiFi/UDP──>[Max udpreceive]──>[OSC parse]──>[route]──>[same downstream]
```

**Key differences from USB serial path:**
- Arduino runs both IMU read AND WiFi stack (NINA module), sharing CPU time
- UDP is unreliable -- packets can be dropped or arrive out of order
- Latency is higher and more variable (WiFi adds 5-20ms typical)
- OSC library compatibility with Uno WiFi Rev2 is problematic (CNMAT OSC library reported not working; ArduinoOSC is the alternative)
- Orientation computation could stay on host (receive raw data via OSC) or move to Arduino (send fewer values, reducing packet loss impact)

**Recommendation:** Build USB serial first. WiFi/OSC is a later enhancement, not the primary architecture. The Node.js bridge architecture supports both -- just swap the data source module.

## Build Order (Dependency Chain)

The components have clear dependencies that dictate build order:

```
Phase 1: Arduino Firmware (no dependencies)
    │     - Read IMU, format CSV, Serial.println()
    │     - Verify with Serial Monitor
    │
    v
Phase 2: Node.js Serial Reader (depends on Phase 1)
    │     - serialport + ReadlineParser
    │     - Parse and validate incoming data
    │     - maxAPI.outlet("raw", ...) for raw data
    │
    v
Phase 3: Orientation Computation (depends on Phase 2)
    │     - Madgwick filter in Node.js
    │     - maxAPI.outlet("orientation", ...)
    │     - Include quaternion output
    │
    v
Phase 4: Calibration (depends on Phase 2, enhances Phase 3)
    │     - Store/apply offsets
    │     - Toggle on/off from Max
    │     - Reset command
    │
    v
Phase 5: MAX Abstraction (depends on Phases 2-4)
    │     - Wrap node.script in reusable .maxpat
    │     - Clean inlet/outlet interface
    │     - Help patch with documentation
    │
    v
Phase 6: WiFi/OSC Path (optional, depends on Phase 5 design)
          - Alternative transport
          - ArduinoOSC library
          - udpreceive in Max or OSC parsing in Node
```

**Why this order:**
- Phase 1 is independently testable (Serial Monitor)
- Phase 2 proves the serial pipeline end-to-end with Max
- Phase 3 adds value on top of working raw data
- Phase 4 requires raw data flowing to calibrate against
- Phase 5 packages everything -- cannot design the interface without knowing the data streams
- Phase 6 is additive, not blocking

## Sources

- [Arduino_LSM6DS3 Library Documentation](https://www.arduino.cc/en/Reference/ArduinoLSM6DS3) -- official Arduino library reference (HIGH confidence)
- [LSM6DS3 Sample Rate Forum Discussion](https://forum.arduino.cc/t/lsm6ds3-sample-rate/1156756) -- confirmed 104Hz default, lists available ODR values (MEDIUM confidence)
- [Woolsey Workshop LSM6DS3 Tutorial](https://www.woolseyworkshop.com/2020/02/12/using-the-arduino_lsm6ds3-library-to-access-the-arduino-uno-wifi-rev2-imu/) -- detailed Uno WiFi Rev2 IMU usage (MEDIUM confidence)
- [Arduino_LSM6DS3 source (LSM6DS3.cpp)](https://github.com/arduino-libraries/Arduino_LSM6DS3/blob/master/src/LSM6DS3.cpp) -- register values confirm 104Hz ODR config (HIGH confidence)
- [MadgwickAHRS Arduino Library](https://github.com/arduino-libraries/MadgwickAHRS) -- API: `begin(freq)`, `updateIMU(gx,gy,gz,ax,ay,az)`, `getRoll/Pitch/Yaw()` (HIGH confidence)
- [Yaw Drift with 6-axis LSM6DS3](https://github.com/arduino-libraries/MadgwickAHRS/issues/33) -- confirmed: yaw drifts without magnetometer (HIGH confidence)
- [Node for Max - node.script Reference](https://docs.cycling74.com/reference/node.script) -- runs in separate process, max-api for IPC (HIGH confidence)
- [Node for Max API Reference](https://docs.cycling74.com/apiref/nodeformax/) -- `outlet()`, `addHandler()`, `post()`, `getDict()` (HIGH confidence)
- [Cycling74 N4M Examples](https://github.com/Cycling74/n4m-examples) -- no serial example exists; confirmed need to build from scratch (MEDIUM confidence)
- [serialport npm](https://serialport.io/docs/api-parser-readline/) -- ReadlineParser API for newline-delimited parsing (HIGH confidence)
- [Edinburgh College Arduino-for-Max](https://github.com/Edinburgh-College-of-Art/Arduino-for-Max) -- community patterns for Arduino+Max integration (MEDIUM confidence)
- [Concordia SLAB Arduino-Max](https://slab.concordia.ca/arduino/arduino-max/) -- serial communication tutorial (MEDIUM confidence)
- [Max Serial Communication Tutorial](https://docs.cycling74.com/max8/tutorials/communicationschapter02) -- native `serial` object documentation (HIGH confidence)
- [Cycling74 Managing Complex Patches](https://cycling74.com/articles/managing-complex-patches-in-max) -- abstraction design principles (MEDIUM confidence)
- [OSC and Arduino Uno WiFi Rev2 Issue](https://github.com/CNMAT/OSC/issues/106) -- CNMAT OSC library incompatibility reported (LOW confidence -- may be resolved)
- [ArduinoOSC Library](https://github.com/hideakitai/ArduinoOSC) -- alternative OSC library for WiFi path (MEDIUM confidence)
- [Madgwick Yaw Drift Forum](https://forum.arduino.cc/t/drift-in-yaw-using-the-madgwick-library-example/955324) -- yaw drift is fundamental limitation of 6-axis IMU (HIGH confidence)
- [ATmega4809 Datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/ATmega4808-09-DataSheet-DS40002173B.pdf) -- 8-bit AVR, 20MHz max, no FPU (HIGH confidence)

---
*Architecture research for: Arduino IMU to MAX/MSP real-time sensor pipeline*
*Researched: 2026-02-12*
