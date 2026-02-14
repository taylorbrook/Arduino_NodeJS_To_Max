# Phase 5: Abstraction and WiFi - Research

**Researched:** 2026-02-13
**Domain:** MAX/MSP abstraction packaging, WiFiNINA UDP transport, Node for Max dgram, transport switching
**Confidence:** HIGH (abstraction), MEDIUM (WiFi latency/dual-mode)

## Summary

Phase 5 has two major workstreams: (1) packaging the existing sensor pipeline as a reusable MAX abstraction with message-based control, and (2) adding WiFi/UDP as an alternative transport to USB serial. These are architecturally independent -- the abstraction wraps existing functionality while WiFi adds a new data input path.

The abstraction workstream is well-understood. A `.maxpat` file with `inlet`, `outlet`, and `patcherargs` objects becomes a drop-in MAX object. Arguments use `#1`, `#2` substitution; attributes use `patcherargs` with `@` syntax on the right outlet. The existing `serial-bridge.js` and all patch logic (smoothing dials, mapping subpatchers, threshold modules, 3D viz) move inside the abstraction. External messages arrive through a single control inlet, get parsed by `route`, and dispatch to internal modules. A `.maxhelp` file with the same basename provides documentation. The 3D visualization becomes a separate companion patch per the user's decision, keeping the abstraction lightweight.

The WiFi workstream has more uncertainty. The Arduino Uno WiFi Rev2 uses the NINA-W102 module (ESP32-based) with the WiFiNINA library for WiFi/UDP. Key findings: (a) `WiFi.begin()` blocks for up to 10 seconds, so it must happen in `setup()`, not `loop()`. (b) UDP sending via `beginPacket`/`write`/`endPacket` uses SPI to the NINA module, which takes microseconds per call (measured: `parsePacket()` = 4 microseconds). (c) However, the NINA module has a systematic 20ms receive-side latency due to FreeRTOS tick timing, reducible to 3-5ms with `WiFi.noLowPowerMode()`. (d) The native MAX `udpreceive` object requires OSC format -- raw CSV-over-UDP must be received via Node for Max's `dgram` module instead. (e) Dual-mode firmware (USB serial + WiFi simultaneously) is feasible because the SPI overhead for UDP sends is microseconds, unlikely to degrade the 114 Hz USB serial loop. The WiFi connection happens in `setup()` (blocking) before the main loop starts. The main risk is untested -- dual SPI bus contention between the IMU (LSM6DS3 on SPI) and the NINA module (also on SPI) needs validation.

**Primary recommendation:** Build the abstraction first (known territory, high confidence), then add WiFi transport. Use dual-mode firmware with `WiFi.noLowPowerMode()` and fixed IP addressing. Receive UDP in Node for Max via `dgram`, unifying the data path so all processing (calibration, smoothing) applies regardless of transport. Fall back to separate sketches only if dual-mode SPI contention causes measurable USB degradation.

<user_constraints>

## User Constraints (from CONTEXT.md)

### Locked Decisions

#### Abstraction design
- All outlets exposed: raw accel, raw gyro, raw orientation, calibrated versions, smoothed, mapped, quaternion, triggers -- user picks what to connect
- Controls are configurable via external messages (e.g., `smoothing 0.5`, `threshold pitch 45`) -- no need to open the abstraction to tweak
- Arguments: port name as main argument, plus optional attributes (`@smooth`, `@transport`, `@ip`) to set initial state at load time
- 3D visualization is a separate companion patch -- connects to the abstraction's quaternion outlet, keeps the abstraction lightweight

#### Help patch
- Basic usage documentation PLUS 2-3 creative recipe examples
- Recipe selection is Claude's discretion -- should showcase the abstraction's range (likely tilt-to-synth, gesture triggers, spatialization)
- Annotated style -- comment boxes explain each section, message formats, and outlet meanings
- Includes built-in test signal (simulated sine waves on axes) so the help patch works without hardware connected

#### WiFi transport
- Discovery/addressing approach is Claude's discretion -- pick simplest reliable method for Arduino Uno WiFi R2
- Dual-mode firmware preferred (single sketch supports both USB serial and WiFi) -- unless dual-mode introduces latency to USB, in which case use separate sketches
- WiFi credentials configuration is Claude's discretion -- pick most practical approach for this board
- Latency tolerance: best effort -- get data flowing, optimization can come later

#### Transport switching
- Dropdown UI inside abstraction for interactive use, plus message-based control (`transport usb`, `transport wifi`) for programmatic use
- Switch behavior (clean cut vs overlap) is Claude's discretion
- Auto-detect: abstraction tries USB first, falls back to WiFi if no USB Arduino found
- Status outlet is transport-aware: reports `connected-usb`, `connected-wifi`, `switching...` etc.

### Claude's Discretion
- WiFi discovery mechanism (fixed IP, broadcast, mDNS)
- WiFi credential configuration method
- Transport switch behavior (clean cut vs overlap)
- Creative recipe selection for help patch (2-3 examples)
- Dual-mode vs separate firmware decision based on latency impact

### Deferred Ideas (OUT OF SCOPE)
None -- discussion stayed within phase scope

</user_constraints>

## Discretion Recommendations

### 1. WiFi Discovery: Fixed IP with `WiFi.config()`
**Rationale:** mDNS is not reliably supported on the NINA module. Broadcast discovery adds complexity (the Arduino would need to listen for discovery packets while also sending data). Fixed IP is the simplest reliable approach: call `WiFi.config(staticIP)` before `WiFi.begin()` to assign a known IP address. The user sets the IP once in the Arduino sketch and once in the MAX abstraction (`@ip` attribute). This matches the existing pattern where the user configures the serial port name as an argument. For the receiving computer, `dgram` binds to `0.0.0.0` on a fixed port, accepting packets from any sender. The Arduino sends to a configurable destination IP (the computer running MAX).
**Confidence:** HIGH -- `WiFi.config()` is documented and verified for WiFiNINA.

### 2. WiFi Credentials: `arduino_secrets.h` header file
**Rationale:** This is Arduino's official recommended pattern. Create `arduino_secrets.h` with `#define SECRET_SSID "..."` and `#define SECRET_PASS "..."`. Include it in the firmware sketch. Add `arduino_secrets.h` to `.gitignore` and provide an `arduino_secrets.h.example` with placeholder values. This is the standard approach used in all WiFiNINA examples. No runtime configuration needed -- credentials are compiled into the firmware.
**Confidence:** HIGH -- this is the documented standard.

### 3. Transport Switch: Clean cut with status reporting
**Rationale:** Overlap (keeping both transports active during switching) adds complexity for minimal benefit. A clean cut is simpler and more predictable: (1) stop current transport, (2) update status to `switching...`, (3) start new transport, (4) report new status. The gap during switching is brief (< 1 second for USB, potentially up to 10 seconds for WiFi if not already connected). Since WiFi connection happens in Arduino `setup()`, switching TO WiFi from the MAX side just means Node opens a UDP socket (instant) -- the Arduino is already broadcasting. Switching TO USB means Node opens a serial port (fast). The only slow path is if WiFi was not initialized on the Arduino side.
**Confidence:** HIGH -- clean cut is standard practice and eliminates concurrency bugs.

### 4. Creative Recipe Selection for Help Patch
**Rationale:** Three recipes that showcase different capabilities:

1. **Tilt-to-Filter** (mapping + smoothing): Pitch controls a filter cutoff, roll controls resonance. Uses smoothed + mapped orientation data. Demonstrates the most common use case: continuous parameter control from tilt.

2. **Gesture Triggers** (thresholds): Rapid downward acceleration triggers a drum hit. Crossing 45-degree pitch threshold triggers a note on/off. Demonstrates threshold-based discrete events from continuous sensor data.

3. **Spatial Panning** (quaternion + orientation): Yaw controls stereo pan position. Uses the quaternion outlet for rotation-aware audio spatialization. Demonstrates advanced 3D orientation use.

All three work with the built-in test signal (simulated sine waves) when no hardware is connected.
**Confidence:** HIGH -- these represent the three core use cases: continuous control, discrete triggers, and spatial audio.

### 5. Dual-Mode vs Separate Firmware: Dual-mode recommended
**Rationale:** The SPI communication between ATmega4809 and the NINA module for a UDP send takes microseconds (measured: `parsePacket()` = 4us). The current loop iteration at 114 Hz takes approximately 8.8ms. Adding a `beginPacket`/`write`/`endPacket` sequence should add well under 1ms of SPI overhead per iteration. The LSM6DS3 also uses SPI, but since these are sequential (not concurrent) SPI operations in the same loop iteration, there is no bus contention -- the ATmega4809 is single-threaded. The critical concern is `WiFi.begin()` blocking for up to 10 seconds -- but this happens in `setup()` before the main loop starts, so it has zero impact on the 114 Hz data loop. The firmware should: (a) always output USB serial CSV, (b) additionally send the same CSV line via UDP if WiFi is connected. This way USB always works at full speed, and WiFi is additive overhead.

**Risk:** The per-loop SPI overhead of `beginPacket`/`write`/`endPacket` has not been precisely measured on this specific board. If it exceeds ~1ms, it could reduce the sample rate from 114 Hz to ~100 Hz. Mitigation: measure before/after timing with `micros()` and fall back to separate sketches if degradation is observed.
**Confidence:** MEDIUM -- architecture is sound but SPI timing needs on-hardware validation.

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| max-api | (built-in) | MAX<->Node communication | Provided by MAX runtime, already in use |
| serialport | 12.0.0 | USB serial communication | Already installed, Phase 2 |
| dgram | (Node built-in) | UDP socket for WiFi transport | Node.js built-in, no npm install needed |
| WiFiNINA | 1.8.x+ | Arduino WiFi/UDP over NINA module | Official Arduino library for Uno WiFi Rev2 |

### MAX Objects Used (no installation needed)
| Object | Purpose | Why This Object |
|--------|---------|-----------------|
| `inlet` / `outlet` | Abstraction interface | Define the abstraction's public API |
| `patcherargs` | Parse arguments + @attributes | Standard way to read abstraction arguments |
| `route` | Message dispatch | Parse incoming control messages to internal modules |
| `umenu` | Transport dropdown selector | Standard MAX UI for dropdown menus |
| `loadbang` | Initialization | Trigger default values and auto-start |
| `deferlow` | Safe initialization | Prevents "not ready" warnings on node.script messages |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| No new npm packages needed | - | dgram is built-in to Node.js | - |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| dgram in Node | MAX `udpreceive` | `udpreceive` requires OSC format; raw CSV needs Node |
| Fixed IP | mDNS/Bonjour | mDNS unreliable on NINA module; fixed IP is simpler |
| Fixed IP | Broadcast discovery | Adds bidirectional protocol complexity; fixed IP is one-time config |
| `arduino_secrets.h` | Serial command to set WiFi credentials | Requires command parser on Arduino + persistent storage; overkill |

### Installation
No new npm packages needed. `dgram` is a Node.js built-in module. WiFiNINA is installed via the Arduino Library Manager (likely already installed for the board). The only new file is `arduino_secrets.h` for WiFi credentials.

## Architecture Patterns

### Current Architecture (End of Phase 4)

```
[Arduino Uno WiFi R2]
  |
  | USB Serial 57600 baud
  | 9-value CSV at 114 Hz
  |
[serial-bridge.js (Node for Max)]
  | Validates CSV, calibration, EMA smoothing
  |
  | Tagged outlets: accel, gyro, orientation,
  |   cal_accel, cal_gyro, cal_orientation,
  |   cal_status, cal_progress, cal_bias, cal_toggle,
  |   smooth_accel, smooth_gyro, smooth_orientation,
  |   status
  |
[sensor-pipeline.maxpat]
  | route -> unpack -> flonum (raw + calibrated + smoothed)
  | Quaternion via jit.euler2quat
  | Range mapping subpatchers (9 axes)
  | Threshold triggers (6 axes)
  | 3D visualization subpatcher
  | Smoothing dials -> handlers back to Node
```

### Phase 5 Target Architecture

```
USER'S PATCH
  |
  [imu-sensor @port /dev/tty.usbmodem1234 @smooth 0.3 @transport usb]
  |                                   |        |           |         |
  |  inlet: control messages          |        |           |         |
  |  (smoothing 0.5)                  |        |           |         |
  |  (transport wifi)                 |        |           |         |
  |  (calibrate)                      |        |           |         |
  |  (threshold pitch 45)             |        |           |         |
  |                                   |        |           |         |
  outlet 0: status      ─────────────┘        |           |         |
  outlet 1: raw_accel                          |           |         |
  outlet 2: raw_gyro                           |           |         |
  outlet 3: raw_orientation                    |           |         |
  outlet 4: cal_accel                          |           |         |
  outlet 5: cal_gyro                           |           |         |
  outlet 6: cal_orientation                    |           |         |
  outlet 7: smooth_accel                       |           |         |
  outlet 8: smooth_gyro                        |           |         |
  outlet 9: smooth_orientation                 |           |         |
  outlet 10: mapped (all axes, tagged)         |           |         |
  outlet 11: quaternion                        |           |         |
  outlet 12: triggers (bang + direction)       |           |         |


INSIDE THE ABSTRACTION [imu-sensor.maxpat]:

  [inlet @comment "control messages"]
    |
    [route smoothing threshold transport calibrate mapping ...]
      |        |         |          |          |
    (dispatch to internal modules)
    |
  [patcherargs /dev/tty.usbmodem1234 @smooth 0.3 @transport usb @ip 192.168.1.50]
    |                                          |
  left: port name (#1)           right: @attributes
    |
  [node.script serial-bridge.js #1]  <-- port from argument
    |
  (all existing logic: CSV parse, calibrate, smooth, route)
    |
  [outlet @comment "status"] [outlet @comment "raw_accel"] ...


WiFi DATA PATH (additive, same processing pipeline):

  [Arduino] --WiFi UDP--> [dgram socket in serial-bridge.js] --same validation/calibration/smoothing--> same outlets

  The dgram socket receives the same CSV format over UDP.
  Data enters the same validation/calibration/smoothing pipeline.
  Outputs are identical regardless of transport.
```

### Pattern 1: Abstraction with `patcherargs` and Message-Based Control
**What:** The abstraction uses `patcherargs` to read positional arguments (#1 = port) and @attributes. A single control inlet routes messages to internal modules via `route`. All configuration is external -- users never need to open the abstraction.
**When to use:** For MAXI-04, MAXI-05.
**Example (inside abstraction):**
```
[inlet @comment "control messages: smoothing <f>, threshold <axis> <f>, transport <symbol>, calibrate, orient_reset"]
  |
  [route smoothing threshold transport calibrate orient_reset orient_restore mapping]
    |          |          |          |           |              |              |
  [handler] [handler] [handler]  [handler]  [handler]      [handler]     [handler]
```

For the `smoothing` route:
```
[route smoothing]
  |
  [route global accel_group gyro_group orient_group ax ay az gx gy gz pitch roll yaw]
    |       |           |           |           |  ... (dispatch to smooth handlers)
```

This allows: `smoothing global 0.5` or `smoothing pitch 0.8` as messages to the left inlet.

### Pattern 2: Unified Transport in Node with `dgram`
**What:** `serial-bridge.js` gains a UDP listener alongside the serial port. Both feed the same `validateLine` -> `outputData` pipeline. Transport state is managed by Node, not MAX.
**When to use:** For WIFI-01, WIFI-02, WIFI-03.
**Example (serial-bridge.js extension):**
```javascript
const dgram = require("dgram");
var udpSocket = null;
var udpActive = false;

function startUDP(port) {
  udpSocket = dgram.createSocket("udp4");
  udpSocket.on("message", function(msg, rinfo) {
    var line = msg.toString().trim();
    var values = validateLine(line);
    if (values) {
      outputData(values);
    }
  });
  udpSocket.on("listening", function() {
    udpActive = true;
    updateStatus("connected-wifi");
  });
  udpSocket.bind(port);
}

function stopUDP() {
  if (udpSocket) {
    udpSocket.close();
    udpSocket = null;
    udpActive = false;
  }
}
```

### Pattern 3: Transport Switching with Status
**What:** `transport` message handler in Node manages USB/WiFi switching. Clean cut: stop current, start new. Status outlet reports transport-aware state.
**When to use:** For WIFI-03.
**Example (serial-bridge.js):**
```javascript
maxAPI.addHandler("transport", function(mode) {
  updateStatus("switching");
  if (mode === "usb") {
    stopUDP();
    startScanning();  // existing USB scanning logic
  } else if (mode === "wifi") {
    cleanup();  // stop serial
    if (reconnectTimer) { clearInterval(reconnectTimer); reconnectTimer = null; }
    startUDP(UDP_PORT);
  } else if (mode === "auto") {
    // Try USB first, fall back to WiFi
    stopUDP();
    startScanning();
    // After timeout with no USB found, start UDP
    setTimeout(function() {
      if (state !== "connected-usb") {
        startUDP(UDP_PORT);
      }
    }, 5000);
  }
});
```

### Pattern 4: Help Patch with Test Signal
**What:** The `.maxhelp` file creates simulated sensor data using `cycle` (sine wave) objects at different frequencies to mimic sensor motion. This allows the help patch to demonstrate all features without hardware.
**When to use:** For MAXI-08.
**Example (inside help patch):**
```
[toggle "Simulate"]
  |
  [gate]
  |
  [metro 9]  <-- ~111 Hz, close to real sample rate
  |
  [counter 0 360]
  |
  [* 0.01745]  <-- deg to rad
  |
  [sin] [cos] [* 0.5 + 0.5]  <-- generate fake pitch/roll/yaw
  |      |          |
  [pack f f f]
  |
  [message "simulate_data $1 $2 $3 ..."]
  |
  [imu-sensor @transport simulate]  <-- test mode
```

Alternative: generate the test signal inside `serial-bridge.js` via a `simulate` handler that creates synthetic CSV data and feeds it through the same pipeline.

### Pattern 5: Abstraction File Placement
**What:** The abstraction file `imu-sensor.maxpat`, its help file `imu-sensor.maxhelp`, and the companion 3D viz patch `imu-sensor-3dviz.maxpat` all go in the same directory. When that directory is in MAX's search path, the user can create `[imu-sensor]` objects and access help via right-click.
**When to use:** For all abstraction-related requirements.
**Recommended structure:**
```
max/
  imu-sensor.maxpat          <-- the abstraction
  imu-sensor.maxhelp         <-- help patch (auto-discovered by MAX)
  imu-sensor-3dviz.maxpat    <-- companion 3D visualization
node/
  serial-bridge.js           <-- Node for Max script (referenced by abstraction)
  package.json
  node_modules/
firmware/
  imu_firmware/
    imu_firmware.ino          <-- updated with WiFi support
    arduino_secrets.h.example <-- WiFi credentials template
```

### Anti-Patterns to Avoid

- **Putting `udpreceive` in the abstraction for WiFi data:** The native MAX `udpreceive` object requires OSC-formatted data. The Arduino sends raw CSV. Use Node's `dgram` module instead to receive raw UDP in `serial-bridge.js`. This keeps the data path unified -- both USB and WiFi data flow through the same Node validation/calibration/smoothing pipeline.

- **Separate Node scripts for USB and WiFi:** Do NOT create `serial-bridge-usb.js` and `serial-bridge-wifi.js`. One script handles both transports. Otherwise calibration state, smoothing state, and bias offsets would need to be synchronized between two processes.

- **Making WiFi initialization blocking in the Arduino loop:** `WiFi.begin()` blocks for up to 10 seconds. It MUST happen in `setup()`, never in `loop()`. If WiFi connection fails, the sketch should still run USB serial normally and optionally retry WiFi periodically (e.g., every 30 seconds in a non-blocking check).

- **Using `#0` prefixed send/receive inside the abstraction for outlet data:** Inside an abstraction, `send` and `receive` objects with `#0` prefix create instance-unique names. This is correct for internal routing but NOT for outlet data. Outlet data must go through actual `outlet` objects so the parent patch can wire to them. Use `send`/`receive` only for internal routing within the abstraction (e.g., from node.script route to outlet objects).

- **Hard-coding WiFi settings in the Node script:** WiFi configuration (IP address, port) should be configurable via messages or @attributes, not hard-coded in `serial-bridge.js`. The abstraction passes these via handlers.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Abstraction argument parsing | Custom JavaScript arg parser | `patcherargs` object | Built-in, handles #1 substitution and @attributes |
| Message dispatch | Nested `if` statements | `route` object chain | Standard MAX pattern, auto-generates error messages for unknown messages |
| UDP socket | Raw socket library | Node.js `dgram` built-in | Part of Node standard library, no npm install, works in Node for Max |
| Inlet/outlet labels | Comment boxes near outlets | `@comment` attribute on inlet/outlet objects | Shows as tooltip on hover, standard MAX convention |
| Help file linkage | Custom documentation system | Same-name `.maxhelp` file | MAX auto-discovers help files by name |
| WiFi credential storage | Custom EEPROM read/write | `arduino_secrets.h` | Arduino standard, works with Arduino IDE secret management |
| Test signal generation | External audio file playback | `counter` + trig functions in MAX | Self-contained, no files needed, always available |

**Key insight:** The abstraction workstream is pure MAX/MSP packaging -- no new algorithms, just reorganizing existing working code into a reusable container. The WiFi workstream adds two things: Arduino firmware WiFi code (standard WiFiNINA patterns) and a `dgram` UDP listener in Node (a few lines of code). The complexity is in correctly wiring everything together, not in any single component.

## Common Pitfalls

### Pitfall 1: node.script Path Resolution in Abstraction Context
**What goes wrong:** The abstraction's `node.script` cannot find `serial-bridge.js` because the working directory changes when the abstraction is loaded from a different location.
**Why it happens:** When the abstraction is used from a different project folder, relative paths to the Node script break. Phase 2 already encountered this -- `node.script` requires absolute paths.
**How to avoid:** Use `thispatcher` to get the abstraction's directory and construct the path dynamically, OR keep `serial-bridge.js` in the same directory as the abstraction and use `@file serial-bridge.js` (node.script searches the Max search path). The simplest approach: place the .js file next to the abstraction and ensure both are in the Max search path.
**Warning signs:** "Cannot find module" error in the Max console when the abstraction is used from a different folder.

### Pitfall 2: WiFi.begin() Blocking the Arduino Loop
**What goes wrong:** The 114 Hz serial output pauses for up to 10 seconds during WiFi connection attempts.
**Why it happens:** `WiFi.begin()` is a blocking call that waits for connection or timeout.
**How to avoid:** Call `WiFi.begin()` ONLY in `setup()`, before the main loop starts. If WiFi needs to reconnect, do NOT call `WiFi.begin()` from `loop()`. Instead, check `WiFi.status()` periodically (non-blocking) and attempt reconnection only via a flag-based state machine that allows the main loop to continue between attempts. Or accept that WiFi only connects at boot -- for a firmware device, this is often sufficient.
**Warning signs:** USB serial data stops flowing for several seconds periodically.

### Pitfall 3: NINA Module 20ms UDP Latency
**What goes wrong:** WiFi sensor data arrives at 50 Hz instead of the expected 114 Hz.
**Why it happens:** The NINA module's FreeRTOS firmware has a default tick rate of 100 Hz (10ms per tick), and the receive-side buffering introduces systematic ~20ms latency. This doesn't throttle individual packet sends from the Arduino, but the receiving side (the Node dgram socket) may see packets arriving in batches.
**How to avoid:** Call `WiFi.noLowPowerMode()` after `WiFi.begin()` to disable power-saving mode. This reduces latency from ~20ms to 3-5ms. Even with this, WiFi will have higher latency than USB -- this is expected and acceptable per the user's "best effort" latency tolerance. Document the expected WiFi sample rate in the help patch.
**Warning signs:** Sensor data appears jerky or batched over WiFi compared to smooth USB data.

### Pitfall 4: SPI Bus Contention Between IMU and NINA Module
**What goes wrong:** IMU readings become corrupted or WiFi packets fail when both are active.
**Why it happens:** The LSM6DS3 (IMU) and NINA-W102 (WiFi) both communicate via SPI on the Arduino Uno WiFi Rev2. If the SPI bus is not properly shared (chip select management), one device's transaction could interfere with another's.
**How to avoid:** The Arduino SPI library handles bus sharing via `beginTransaction()`/`endTransaction()` with per-device settings. The SparkFun LSM6DS3 library and WiFiNINA library both use these APIs. As long as calls are sequential (not interrupt-driven concurrent access), there should be no contention. The main loop is single-threaded, so IMU read -> Serial print -> UDP send is naturally sequential. Verify by measuring loop timing before and after WiFi addition.
**Warning signs:** Occasional garbage IMU values or missing WiFi packets, especially under high load.

### Pitfall 5: Outlet Ordering in Abstraction
**What goes wrong:** Data arrives at the wrong outlet in the parent patch after reorganizing the abstraction internals.
**Why it happens:** Outlet order in a MAX abstraction is determined by the physical left-to-right position of `outlet` objects inside the abstraction, NOT by the order they were created. Moving outlets around changes their index.
**How to avoid:** Establish the outlet order early and lock it. Use `@comment` attributes on each outlet to document its purpose. Place outlets in a consistent left-to-right row. Never rearrange outlet positions after the API is established. Test outlet ordering by connecting `print` objects to each outlet in the parent patch.
**Warning signs:** Accel data appears where gyro data should be, or quaternion arrives on the status outlet.

### Pitfall 6: Abstraction Initialization Race Condition
**What goes wrong:** The abstraction's node.script sends outlet data before the parent patch has finished loading, causing missed initial messages.
**Why it happens:** `loadbang` fires before all connections in the parent patch are established. The node.script may auto-connect to serial and start sending data before the parent patch's route/unpack chain is wired.
**How to avoid:** Use `deferlow` between `loadbang` and any node.script initialization messages. This defers execution to the next scheduler pass, giving the parent patch time to complete its connections. This pattern is already established in the current patch (MEMORY.md notes: "`deferlow` between `loadbang` and node.script messages prevents 'not ready' warnings").
**Warning signs:** First few seconds of sensor data are missing after opening the patch.

### Pitfall 7: Multiple Abstraction Instances Conflicting
**What goes wrong:** Two `[imu-sensor]` instances in the same patch fight over the same serial port or UDP port.
**Why it happens:** Both instances try to open the same serial port or bind to the same UDP port.
**How to avoid:** Serial ports are naturally exclusive -- only one instance can open a given port. For UDP, each instance should use a different port (configurable via `@udpport` attribute). For `send`/`receive` pairs inside the abstraction, use `#0` prefix to create instance-unique names. Document in the help patch that multiple instances require different port configurations.
**Warning signs:** "Port already in use" errors, or data from one Arduino appearing in the wrong abstraction instance.

### Pitfall 8: Help Patch Test Signal Not Matching Real Data Range
**What goes wrong:** Recipes work perfectly with the test signal but behave differently with real hardware because the simulated data has different ranges.
**Why it happens:** The test signal generates idealized sine waves (e.g., -1 to 1) while real IMU data has specific ranges (accel: ~-2 to 2g, gyro: -250 to 250 dps, orientation: 0-360 degrees).
**How to avoid:** Generate test data that matches real sensor ranges. Simulate accel values in the -2 to 2 range, gyro in -250 to 250, and orientation in 0-180 degrees. Use different frequencies for each axis to create realistic-looking multi-axis movement. Document the simulated ranges in comment boxes.
**Warning signs:** Mapping ranges and thresholds that work with the test signal need completely different values for real hardware.

## Code Examples

### Arduino Dual-Mode Firmware WiFi Addition

```cpp
// Add to imu_firmware.ino for dual-mode operation:

#include <WiFiNINA.h>
#include <WiFiUdp.h>
#include "arduino_secrets.h"  // SECRET_SSID, SECRET_PASS

// ---- WiFi Configuration ----
const int UDP_PORT = 8888;
IPAddress staticIP(192, 168, 1, 50);  // Fixed IP for the Arduino
IPAddress destIP(192, 168, 1, 100);   // Computer running MAX
const int DEST_PORT = 8889;           // Port Node.js listens on

WiFiUDP udp;
bool wifiConnected = false;
char csvBuffer[128];  // Reusable buffer for CSV string

void setupWiFi() {
  WiFi.config(staticIP);
  int status = WiFi.begin(SECRET_SSID, SECRET_PASS);
  if (status == WL_CONNECTED) {
    WiFi.noLowPowerMode();  // Critical: reduces UDP latency from 20ms to 3-5ms
    udp.begin(UDP_PORT);
    wifiConnected = true;
    Serial.println("STARTUP,wifi=connected");
  } else {
    Serial.println("STARTUP,wifi=failed");
  }
}

// In setup(), AFTER Serial.begin() and IMU init, BEFORE warmup:
// setupWiFi();  // Blocking ~5-10s, but only runs once at boot

// In loop(), AFTER Serial.println() of CSV:
// if (wifiConnected) {
//   // Build CSV string once, send via UDP
//   int len = snprintf(csvBuffer, sizeof(csvBuffer),
//     "%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f",
//     ax, ay, az, gx, gy, gz, smoothPitch, smoothRoll, smoothYaw);
//   udp.beginPacket(destIP, DEST_PORT);
//   udp.write((uint8_t*)csvBuffer, len);
//   udp.endPacket();
// }
```

**Bandwidth note:** UDP has no baud rate limit. A ~70-byte CSV packet at 114 Hz = ~8KB/s, well within WiFi capacity. The bottleneck is the NINA module's FreeRTOS tick rate, not bandwidth.

### Node for Max UDP Receiver

```javascript
// Add to serial-bridge.js:
const dgram = require("dgram");

var udpSocket = null;
var transport = "usb";  // "usb", "wifi", "auto"

function startUDP(listenPort) {
  if (udpSocket) return;
  udpSocket = dgram.createSocket("udp4");

  udpSocket.on("message", function(msg, rinfo) {
    var line = msg.toString().trim();
    var values = validateLine(line);
    if (values) {
      outputData(values);
    }
  });

  udpSocket.on("listening", function() {
    var addr = udpSocket.address();
    maxAPI.post("[serial-bridge] UDP listening on " + addr.address + ":" + addr.port);
    updateStatus("connected-wifi");
  });

  udpSocket.on("error", function(err) {
    maxAPI.post("[serial-bridge] UDP error: " + err.message);
    udpSocket.close();
    udpSocket = null;
  });

  udpSocket.bind(listenPort);
}

function stopUDP() {
  if (udpSocket) {
    udpSocket.close();
    udpSocket = null;
    updateStatus("disconnected");
  }
}
```

### patcherargs for Abstraction Arguments

```
// Inside imu-sensor.maxpat:

[patcherargs /dev/tty.usbmodem1234 @smooth 0.3 @transport usb @ip 192.168.1.50 @udpport 8889]
  |                                           |
  left outlet: port name                     right outlet: @attributes one at a time
  |                                           |
  [prepend connect]                          [route smooth transport ip udpport]
  |                                           |        |          |       |
  [deferlow]                                [smooth] [transport] [ip]  [port]
  |                                           |        |          |       |
  [node.script serial-bridge.js]            (send to Node handlers)

// #1 substitution alternative for port:
// [node.script serial-bridge.js]
// [deferlow]
// [message connect #1]
```

### Abstraction Inlet Message API Design

```
// Messages accepted by the control inlet:

// Transport
transport usb           -- switch to USB serial
transport wifi          -- switch to WiFi UDP
transport auto          -- try USB, fall back to WiFi

// Connection
connect                 -- auto-scan for Arduino
connect /dev/tty.xxx    -- connect to specific serial port
disconnect              -- stop all transports

// Calibration
calibrate               -- start/toggle calibration
orient_reset            -- zero orientation
orient_restore          -- restore original orientation

// Smoothing
smoothing global 0.5       -- set global smooth factor (0.0-1.0)
smoothing accel_group 0.3  -- set accel group factor
smoothing pitch 0.7        -- set per-axis factor

// Thresholds
threshold pitch 45         -- set pitch threshold to 45 degrees
threshold pitch 45 hysteresis 5  -- with custom hysteresis

// Mapping
mapping pitch inrange 0 90      -- set input range
mapping pitch outrange 0 1      -- set output range
mapping pitch curve exponential -- set curve type

// WiFi
ip 192.168.1.50          -- set Arduino IP (for display/status)
udpport 8889             -- set UDP listen port
```

### Transport-Aware Status Messages

```javascript
// updateStatus() extended for transport awareness:
function updateStatus(newState) {
  state = newState;
  maxAPI.outlet("status", state);
  maxAPI.post("[serial-bridge] status: " + state);
}

// Status values:
// "disconnected"     -- no active transport
// "scanning"         -- looking for USB Arduino
// "connected-usb"    -- receiving data via USB serial
// "connected-wifi"   -- receiving data via WiFi UDP
// "switching"        -- transport change in progress
// "error"            -- connection error (with detail in Max console)
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Separate USB and WiFi sketches | Dual-mode single sketch | WiFiNINA 1.x+ | One firmware, both transports |
| `udpreceive` for sensor UDP | Node `dgram` for raw UDP | Always (udpreceive = OSC only) | Handles raw CSV without OSC overhead |
| bpatcher for reusable components | `.maxpat` abstraction with `patcherargs` | MAX 4+ | Cleaner API, auto-help-file discovery |
| Manual help file linking | Same-name `.maxhelp` convention | MAX 5+ | Auto-discovered by MAX |
| WiFi low-power mode default | `WiFi.noLowPowerMode()` | WiFiNINA 1.4+ | Reduces UDP latency from 20ms to 3-5ms |

**Deprecated/outdated:**
- Using `WiFi.begin()` in `loop()` for reconnection: Blocks for 10 seconds. Check `WiFi.status()` instead.
- OSC-wrapping raw sensor data for `udpreceive`: Unnecessary overhead. Use Node's `dgram` directly.
- Separate `.maxhelp` in a `max-help` subfolder: Current convention is same directory, same basename.

## Open Questions

1. **SPI Bus Timing with Dual-Mode Firmware**
   - What we know: `parsePacket()` takes 4 microseconds. `beginPacket`/`write`/`endPacket` is SPI-based and should be similarly fast. The IMU read is also SPI-based.
   - What's unclear: The cumulative SPI overhead of IMU read + Serial print + UDP send per loop iteration. Whether the sequential SPI operations interfere with each other via bus timing.
   - Recommendation: Implement dual-mode firmware and measure loop rate with `micros()` before and after adding WiFi. If rate drops below 100 Hz, fall back to separate sketches. This is a hardware validation question, not a design question.

2. **dgram Availability in Node for Max**
   - What we know: `dgram` is a Node.js built-in module. Node for Max runs a real Node.js instance. No documentation explicitly lists restricted modules.
   - What's unclear: Whether Node for Max sandboxes or restricts any built-in Node modules. The `serialport` native module works, so native modules are not blocked.
   - Recommendation: Test `require("dgram")` early in implementation. If it fails, the fallback is MAX's `udpreceive` with OSC formatting on the Arduino side (less elegant but functional). Confidence: HIGH that dgram will work -- Node for Max does not appear to restrict built-in modules.

3. **Abstraction Size and Performance**
   - What we know: The current `sensor-pipeline.maxpat` is ~16,000 lines of JSON. It includes smoothing dials, mapping subpatchers, threshold modules, and 3D viz.
   - What's unclear: Whether wrapping this large patch as an abstraction introduces any performance overhead vs using it as a standalone patch.
   - Recommendation: The abstraction is just a reference to the same patcher -- there should be zero performance overhead. However, the 3D viz should remain as a separate companion patch per the user's decision, which also reduces the abstraction's complexity.

4. **Multiple Instance Port Conflicts**
   - What we know: Only one process can bind to a given UDP port. Only one serial port connection can exist per port.
   - What's unclear: Whether users will actually want multiple instances (multiple Arduinos).
   - Recommendation: Support it by design (configurable ports via @attributes) but don't test extensively. Document in help patch that multiple instances need different port configurations.

## Sources

### Primary (HIGH confidence)
- [Cycling '74 Abstractions Guide](https://docs.cycling74.com/userguide/abstractions/) -- Arguments, #1 substitution, inlet/outlet ordering, @comment, help file discovery
- [Cycling '74 patcherargs Reference (Max 8)](https://docs.cycling74.com/max8/refpages/patcherargs) -- Left outlet (positional), right outlet (@attributes), default values
- [Arduino WiFiNINA Reference](https://www.arduino.cc/reference/en/libraries/wifinina/) -- WiFi.begin(), WiFi.config(), WiFiUDP API
- [Arduino WiFiUDP.beginPacket() Reference](https://www.arduino.cc/reference/en/libraries/wifinina/wifiudp.beginpacket/) -- UDP send pattern
- [Arduino WiFi.config() Reference](https://www.arduino.cc/reference/en/libraries/wifinina/wifi.config/) -- Static IP configuration
- [Node.js dgram Documentation](https://nodejs.org/api/dgram.html) -- UDP socket API, createSocket, bind, message event
- [Cycling '74 Forum: patcherargs attributes](https://cycling74.com/forums/-patcherargs-attributes) -- Right outlet behavior, @attribute parsing
- [Cycling '74 Forum: Adding attributes to abstractions](https://cycling74.com/forums/adding-attributes-to-an-abstraction-or-bpatcher) -- Abstraction vs bpatcher attribute limitations
- Existing codebase: `serial-bridge.js`, `sensor-pipeline.maxpat`, `imu_firmware.ino` -- verified current outlet tags, handler names, architecture

### Secondary (MEDIUM confidence)
- [WiFiNINA UDP 20ms Latency (GitHub Issue #192)](https://github.com/arduino-libraries/WiFiNINA/issues/192) -- FreeRTOS tick rate as root cause, 10ms tick = 20ms systematic latency
- [WiFiNINA Expected UDP Latency (GitHub Issue #72)](https://github.com/arduino-libraries/WiFiNINA/issues/72) -- `WiFi.noLowPowerMode()` reduces latency to 3-5ms, `parsePacket()` = 4 microseconds
- [WiFiNINA Non-blocking WiFi.begin (GitHub Issue #273)](https://github.com/arduino-libraries/WiFiNINA/issues/273) -- 10-second blocking timeout, keep in setup()
- [Cycling '74 Forum: Best way to receive UDP from sensors](https://cycling74.com/forums/best-way-to-receive-udp-data-form-sensors) -- `udpreceive` requires OSC, `sadam.udpReceiver` for raw UDP, Node dgram as alternative
- [Arduino Secrets Management](https://meganano.uno/arduino-secrets-management/) -- `arduino_secrets.h` pattern, `.gitignore`, example file convention
- [Arduino Forum: UDP on Uno WiFi Rev2](https://forum.arduino.cc/t/arduino-uno-wifi-rev2_sending-data-via-udp-wifi/652619) -- WiFiUDP setup pattern, common coding errors

### Tertiary (LOW confidence)
- Dual-mode SPI bus contention on Arduino Uno WiFi Rev2 -- no direct measurement found; theoretical analysis suggests microsecond overhead but needs hardware validation
- Exact `beginPacket`/`write`/`endPacket` timing in microseconds -- not directly measured in any source; inferred from `parsePacket()` = 4us
- Node for Max `dgram` module availability -- no official documentation confirming or denying; inferred from general Node.js module availability in node.script

## Metadata

**Confidence breakdown:**
- Abstraction design: HIGH -- `patcherargs`, inlet/outlet, `route` patterns are well-documented MAX fundamentals
- Help patch: HIGH -- `.maxhelp` same-name convention is standard and verified
- WiFi firmware: MEDIUM -- WiFiNINA UDP API is documented, but dual-mode SPI impact is unverified on this specific board
- WiFi latency: MEDIUM -- `noLowPowerMode()` improvement to 3-5ms verified in GitHub issues, but 114 Hz delivery over WiFi not guaranteed
- Transport switching: HIGH -- clean cut in Node via serial cleanup + dgram bind/close is straightforward
- Test signal: HIGH -- generating sine waves in MAX or Node for simulation is simple
- dgram in Node for Max: MEDIUM -- expected to work but not explicitly verified in Node for Max documentation

**Research date:** 2026-02-13
**Valid until:** 2026-03-15 (30 days -- stable domain; MAX abstraction patterns and WiFiNINA library are mature and unlikely to change)
