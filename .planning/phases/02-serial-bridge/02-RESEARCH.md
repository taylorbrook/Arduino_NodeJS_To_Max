# Phase 2: Serial Bridge - Research

**Researched:** 2026-02-12
**Domain:** Node for Max serial communication (serialport + max-api)
**Confidence:** HIGH

## Summary

Phase 2 bridges the Arduino firmware (Phase 1) into MAX/MSP via Node for Max. The Arduino sends 9-value CSV lines at ~114 Hz over USB serial at 57600 baud. A Node.js script running inside MAX's `node.script` object must receive these lines, validate them, parse them, and output tagged messages into MAX for downstream patching. The script must also report connection status and recover from USB disconnect/reconnect without restarting MAX.

The technology stack is straightforward and well-supported: the `serialport` npm package (v12.x) with `ReadlineParser` handles serial I/O and line buffering, while the built-in `max-api` module handles communication with MAX. The main complexity lies in robust connection lifecycle management -- detecting disconnection, polling for reconnection, and cleanly re-establishing the data pipeline. The `route` object in MAX handles demultiplexing tagged messages from a single `node.script` outlet into separate data streams.

**Primary recommendation:** Use serialport v12.x with ReadlineParser for line-delimited CSV parsing, tagged `maxAPI.outlet()` calls for routing data into MAX via `route`, and a polling-based reconnection loop using `SerialPort.list()` to detect the Arduino reappearing after disconnect.

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| serialport | 12.0.0 | Serial port communication | De facto Node.js serial library; ships prebuild binaries via N-API; works with Node 18+ |
| @serialport/parser-readline | 12.0.0 | Line-delimited parsing | Splits serial stream on `\n` delimiter; emits complete lines as strings |
| max-api | (built-in) | MAX<->Node communication | Provided by MAX runtime; do NOT npm install; use `require("max-api")` |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| @serialport/list | (included in serialport) | List available serial ports | Port discovery and reconnection polling |

### Version Selection Rationale

**Why serialport v12.x, not v13.x:** serialport v13.0.0 (released 2024-12-24) dropped Node 16 and 18 support, requiring Node >= 20.0.0. While Max 8 bundles Node v20.6.1 (compatible) and Max 9 bundles Node v22.18 (compatible), v12.x has broader compatibility and is the better-tested version for environments using non-standard Node.js binaries. If the user is on Max 9, v13.x would also work. Use v12.x for safety unless confirmed on Max 9.

**Why NOT install max-api via npm:** The `max-api` package on npm is a placeholder/stub that throws an error. The real max-api is injected by MAX's runtime when your script runs inside `node.script`. Just `require("max-api")`.

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| serialport | MAX's built-in `serial` object | `serial` requires polling, is byte-level, cannot handle line parsing or reconnection logic; serialport is far superior for this use case |
| ReadlineParser | DelimiterParser | ReadlineParser IS a DelimiterParser with `\n` default; no reason to use the generic one |
| Polling-based reconnect | usb-detection npm | Native dependency adds complexity; polling SerialPort.list() every 2-3s is simpler and sufficient |

**Installation:**
```bash
# Run from the directory containing your Node for Max script
npm init -y
npm install serialport@12
```

Or via MAX: send `script npm install serialport@12` to the `node.script` object.

## Architecture Patterns

### Recommended Project Structure
```
node/                        # Node for Max scripts directory
  serial-bridge.js           # Main bridge script (loaded by node.script)
  package.json               # npm manifest
  node_modules/              # Dependencies (serialport)
```

The `node/` folder sits alongside the MAX patch file. The `node.script` object references `serial-bridge.js` as its script argument. The `node_modules` folder lives next to `serial-bridge.js`.

### Pattern 1: Tagged Outlet Messages with MAX Route
**What:** All data exits `node.script` through a single left outlet. Each `maxAPI.outlet()` call includes a tag (selector) as the first argument. In MAX, a `route` object splits messages by tag into separate outlets.
**When to use:** Always -- this is THE pattern for Node for Max communication.
**Example:**
```javascript
// Source: Cycling '74 n4m-core-examples (verified)
const maxAPI = require("max-api");

// Tagged messages: first arg is the selector
maxAPI.outlet("accel", ax, ay, az);       // -> route "accel" outlet
maxAPI.outlet("gyro", gx, gy, gz);        // -> route "gyro" outlet
maxAPI.outlet("orientation", pitch, roll, yaw); // -> route "orientation" outlet
maxAPI.outlet("status", "connected");      // -> route "status" outlet
maxAPI.outlet("raw", ax, ay, az, gx, gy, gz, pitch, roll, yaw); // all 9 values
```

In MAX patch:
```
[node.script serial-bridge.js @autostart 1]
  |
[route accel gyro orientation status raw]
  |     |     |        |       |
 ...   ...   ...      ...     ...
```

### Pattern 2: Connection State Machine
**What:** The bridge script maintains a state machine: DISCONNECTED -> SCANNING -> CONNECTING -> CONNECTED -> DISCONNECTED (on error/close). Each transition reports status to MAX.
**When to use:** Always -- required for SERL-04 and SERL-05.
**Example:**
```javascript
// States: "disconnected", "scanning", "connected"
let state = "disconnected";
let port = null;
let reconnectTimer = null;

function updateStatus(newState) {
  state = newState;
  maxAPI.outlet("status", state);
}
```

### Pattern 3: Polling Reconnection via SerialPort.list()
**What:** On disconnect, start an interval timer that calls `SerialPort.list()` every 2-3 seconds. When the target port reappears, create a new SerialPort instance and reconnect.
**When to use:** SERL-05 (auto-recovery after disconnect).
**Example:**
```javascript
const { SerialPort } = require("serialport");

function startScanning() {
  updateStatus("scanning");
  reconnectTimer = setInterval(async () => {
    const ports = await SerialPort.list();
    const arduino = ports.find(p =>
      p.path.includes("usbmodem") || p.path.includes("ttyACM")
    );
    if (arduino) {
      clearInterval(reconnectTimer);
      reconnectTimer = null;
      connectToPort(arduino.path);
    }
  }, 2000);
}
```

### Pattern 4: CSV Validation Before Output
**What:** Each line from ReadlineParser is validated before being output to MAX. Check field count (must be 9), check for NaN, check for non-numeric values. Drop silently on failure.
**When to use:** Always -- required for SERL-02.
**Example:**
```javascript
function validateAndParse(line) {
  // Skip STARTUP header lines
  if (line.startsWith("STARTUP") || line.startsWith("ERROR")) {
    maxAPI.post(line);  // Log to MAX console
    return null;
  }

  const parts = line.split(",");
  if (parts.length !== 9) return null;

  const values = parts.map(Number);
  if (values.some(isNaN)) return null;

  return values;
}
```

### Anti-Patterns to Avoid
- **Opening port with autoOpen: true and no error handler:** Always either set `autoOpen: false` and call `port.open()` explicitly, OR attach an error handler immediately. Unhandled errors crash the Node process.
- **Using MAX's serial object alongside Node serialport:** Only one process can own a serial port at a time. The MAX `serial` object and Node `serialport` will conflict if both try to open the same port.
- **Outputting every CSV field as a separate maxAPI.outlet() call:** This creates 9+ outlet calls per sample at 114 Hz = 1000+ calls/sec. Instead, batch related values in a single outlet call (e.g., `maxAPI.outlet("accel", ax, ay, az)`).
- **Storing state in the MAX patch:** Keep all connection state, parsing, and validation in the Node script. MAX should be a passive consumer of clean data.
- **Using try/catch around maxAPI.outlet():** outlet() is synchronous and does not throw. Error handling belongs on the serialport side.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Serial port I/O | Raw `fs.open('/dev/tty...')` | `serialport` npm package | Handles platform differences, baud rate config, native bindings, proper close/drain semantics |
| Line-delimited parsing | Manual buffer + split on `\n` | `ReadlineParser` from serialport | Handles partial reads, buffer boundaries, encoding; battle-tested |
| Port enumeration | `ls /dev/tty*` via child_process | `SerialPort.list()` | Cross-platform, returns metadata (manufacturer, vendorId, productId) |
| MAX communication | `process.stdout.write()` | `maxAPI.outlet()` / `maxAPI.post()` | Only API MAX understands; handles type conversion, dictionary serialization |

**Key insight:** The serialport ecosystem has already solved every serial communication edge case. Line boundary handling across partial USB reads is notoriously tricky -- ReadlineParser handles this correctly. Don't attempt raw serial I/O.

## Common Pitfalls

### Pitfall 1: serialport Native Binary Mismatch
**What goes wrong:** `npm install serialport` succeeds but the script crashes with `NODE_MODULE_VERSION` mismatch at runtime.
**Why it happens:** serialport has native (C++) bindings. If installed with system Node but run inside MAX's bundled Node (different version), the binary won't load.
**How to avoid:** Install serialport using MAX's own npm: send `script npm install serialport@12` to `node.script`, or run npm using MAX's Node binary directly.
**Warning signs:** Error message mentioning `NODE_MODULE_VERSION`, `was compiled against a different Node.js version`, or `bindings.node` not found.

### Pitfall 2: Port Already In Use
**What goes wrong:** `Error: Opening /dev/tty.usbmodemXXXX: Resource busy`
**Why it happens:** Arduino IDE Serial Monitor, another MAX patch, or a previous crashed Node process still has the port open.
**How to avoid:** Close Arduino Serial Monitor before starting the Node script. Use only one `node.script` instance per serial port. Handle the error event and report "port busy" status to MAX.
**Warning signs:** Error event fires immediately after open attempt.

### Pitfall 3: Silent Data Loss on Disconnect (macOS)
**What goes wrong:** On macOS, the `close` event fires when USB is unplugged, but the port object becomes unusable. Attempting to reuse or re-open the same port object fails silently.
**Why it happens:** The OS invalidates the file descriptor. The serialport instance is now permanently dead.
**How to avoid:** On `close` event, destroy the old port instance completely (`port = null`), then start the polling reconnection loop to create a fresh `SerialPort` instance when the device reappears.
**Warning signs:** No data events after reconnection; port.isOpen returns false but no error is thrown.

### Pitfall 4: STARTUP Header Parsed as Sensor Data
**What goes wrong:** The firmware sends a `STARTUP,device=ARUIDO_IMU,...` line after boot and after reset. If the validator tries to parse it as 9 numeric CSV values, it fails.
**Why it happens:** The STARTUP line has a different format than data lines.
**How to avoid:** Check if line starts with "STARTUP" or "ERROR" before CSV parsing. Log these to MAX console via `maxAPI.post()` instead.
**Warning signs:** NaN values or validation failures immediately after connection or reset.

### Pitfall 5: Not Handling the 'error' Event on SerialPort
**What goes wrong:** Node process crashes with `Unhandled 'error' event`.
**Why it happens:** Node.js EventEmitter throws if an `error` event has no listener.
**How to avoid:** Always attach `port.on('error', ...)` immediately after creating the SerialPort instance.
**Warning signs:** Intermittent Node script crashes, especially on connect/disconnect.

### Pitfall 6: maxAPI.outlet() Call Rate at 114 Hz
**What goes wrong:** Potential performance issues if calling outlet() too many times per sample.
**Why it happens:** Each outlet() call crosses the Node-to-MAX process boundary. At 114 Hz, minimizing calls per sample matters.
**How to avoid:** Batch related values into single outlet calls. Use `maxAPI.outlet("accel", ax, ay, az)` not three separate calls. Keep total outlet calls to 2-4 per sample maximum (e.g., status + orientation + raw).
**Warning signs:** MAX UI becomes sluggish or unresponsive; increasing latency between physical movement and MAX display.

## Code Examples

Verified patterns from official sources:

### Complete Serial Bridge Script (Skeleton)
```javascript
// serial-bridge.js -- Node for Max serial bridge for Arduino IMU
// Source: Synthesized from serialport docs + Cycling '74 N4M docs

const maxAPI = require("max-api");
const { SerialPort } = require("serialport");
const { ReadlineParser } = require("@serialport/parser-readline");

// ---- Configuration ----
const BAUD_RATE = 57600;
const EXPECTED_FIELDS = 9;
const RECONNECT_INTERVAL_MS = 2000;

// ---- State ----
let port = null;
let parser = null;
let reconnectTimer = null;
let state = "disconnected"; // disconnected | scanning | connected

// ---- Status Reporting ----
function updateStatus(newState) {
  state = newState;
  maxAPI.outlet("status", state);
  maxAPI.post(`[serial-bridge] status: ${state}`);
}

// ---- Validation ----
function validateLine(line) {
  if (line.startsWith("STARTUP") || line.startsWith("ERROR")) {
    maxAPI.post(`[arduino] ${line}`);
    return null;
  }
  const parts = line.split(",");
  if (parts.length !== EXPECTED_FIELDS) return null;
  const values = parts.map(Number);
  if (values.some(isNaN)) return null;
  return values;
}

// ---- Data Output ----
function outputData(values) {
  const [ax, ay, az, gx, gy, gz, pitch, roll, yaw] = values;
  maxAPI.outlet("accel", ax, ay, az);
  maxAPI.outlet("gyro", gx, gy, gz);
  maxAPI.outlet("orientation", pitch, roll, yaw);
}

// ---- Connection ----
function connectToPort(portPath) {
  updateStatus("connecting");
  port = new SerialPort({ path: portPath, baudRate: BAUD_RATE, autoOpen: false });
  parser = port.pipe(new ReadlineParser({ delimiter: "\n" }));

  port.on("open", () => {
    updateStatus("connected");
  });

  port.on("error", (err) => {
    maxAPI.post(`[serial-bridge] error: ${err.message}`);
  });

  port.on("close", () => {
    cleanup();
    updateStatus("disconnected");
    startScanning();
  });

  parser.on("data", (line) => {
    const values = validateLine(line.trim());
    if (values) outputData(values);
  });

  port.open((err) => {
    if (err) {
      maxAPI.post(`[serial-bridge] open failed: ${err.message}`);
      cleanup();
      startScanning();
    }
  });
}

// ---- Cleanup ----
function cleanup() {
  if (parser) { parser.removeAllListeners(); parser = null; }
  if (port) {
    port.removeAllListeners();
    if (port.isOpen) port.close();
    port = null;
  }
}

// ---- Reconnection ----
async function startScanning() {
  if (reconnectTimer) return; // Already scanning
  updateStatus("scanning");

  reconnectTimer = setInterval(async () => {
    try {
      const ports = await SerialPort.list();
      const arduino = ports.find(p =>
        p.path.includes("usbmodem") || p.path.includes("ttyACM")
      );
      if (arduino) {
        clearInterval(reconnectTimer);
        reconnectTimer = null;
        connectToPort(arduino.path);
      }
    } catch (err) {
      maxAPI.post(`[serial-bridge] scan error: ${err.message}`);
    }
  }, RECONNECT_INTERVAL_MS);
}

// ---- MAX Message Handlers ----
maxAPI.addHandler("connect", (portPath) => {
  if (port && port.isOpen) {
    cleanup();
  }
  if (portPath) {
    connectToPort(portPath);
  } else {
    startScanning();
  }
});

maxAPI.addHandler("disconnect", () => {
  if (reconnectTimer) { clearInterval(reconnectTimer); reconnectTimer = null; }
  cleanup();
  updateStatus("disconnected");
});

maxAPI.addHandler("listports", async () => {
  const ports = await SerialPort.list();
  ports.forEach(p => maxAPI.post(`[ports] ${p.path} (${p.manufacturer || "unknown"})`));
});

maxAPI.addHandler("reset", () => {
  if (port && port.isOpen) {
    port.write("R");  // Send reset command to Arduino firmware
  }
});

// ---- Auto-start scanning ----
startScanning();
```

### MAX Patch Routing Pattern
```
[node.script serial-bridge.js @autostart 1]
  |                                          \
  |                                    [node.debug] (right outlet -> lifecycle info)
  |
[route accel gyro orientation status]
  |      |       |            |
[unpack f f f]  [unpack f f f]  [unpack f f f]   [message status $1]
  |  |  |        |  |  |        |   |   |
 aX aY aZ       gX gY gZ    pitch roll yaw
```

### SerialPort.list() Output Format
```javascript
// Source: serialport docs
// On macOS with Arduino Uno WiFi Rev2:
{
  path: "/dev/tty.usbmodem14101",
  manufacturer: "Arduino (www.arduino.cc)",
  serialNumber: "XXXXXXXXXXXX",
  vendorId: "2341",
  productId: "8054",
  // ... other fields may be undefined
}
```

### Handling the Autostart Attribute
```javascript
// If using @autostart 1 on node.script, the script runs immediately
// when the patch opens. Start scanning on script load:
startScanning();

// If NOT using @autostart, the user sends "script start" to node.script,
// which runs the script. startScanning() is called at module level.
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| MAX `serial` object for Arduino | Node for Max + serialport npm | Max 8 (2018) | Node.js provides proper async I/O, line parsing, validation; no polling required |
| serialport v9.x callback API | serialport v12.x stream/promise API | v10 (2021) | `SerialPort.list()` returns Promise; constructor uses options object `{ path, baudRate }` |
| `@serialport/bindings` (prebuild) | `@serialport/bindings-cpp` (prebuildify, N-API) | v10+ | Binaries ship with package; no post-install download; N-API means no rebuild per Node version |
| Manual `require("serialport").parsers.Readline` | `require("@serialport/parser-readline").ReadlineParser` | v10+ | Parsers are separate packages; `ReadlineParser` is the class name |

**Deprecated/outdated:**
- `serialport.parsers.Readline` path -- use `@serialport/parser-readline` package import instead
- `comName` property in port listing -- renamed to `path` in v10+
- Callback-style `SerialPort.list(callback)` -- use Promise-style `await SerialPort.list()` in v10+

## Open Questions

1. **Exact macOS port path for Arduino Uno WiFi Rev2**
   - What we know: macOS uses `/dev/tty.usbmodemXXXX` format. Arduino vendorId is `2341`. The Uno WiFi Rev2 uses an mEDBG debugger chip for USB.
   - What's unclear: The exact path varies per machine and USB port. The productId for this specific board model needs verification at runtime.
   - Recommendation: Use `SerialPort.list()` at startup and filter by vendorId `2341` or path containing `usbmodem`. Allow the user to specify a port explicitly via a MAX message as fallback.

2. **maxAPI.outlet() throughput at 114 Hz**
   - What we know: Node for Max runs as a separate process. Each outlet() call crosses a process boundary. Community projects commonly stream sensor data through N4M.
   - What's unclear: No official documentation on maximum outlet call rate or latency characteristics.
   - Recommendation: Start with 3 outlet calls per sample (accel, gyro, orientation). If performance is an issue, consolidate to a single `maxAPI.outlet("data", ...all9values)` call and route in MAX. Monitor for dropped frames or UI sluggishness.

3. **Which serialport version to use (12 vs 13)**
   - What we know: v13.0.0 requires Node >= 20. Max 8 bundles Node v20.6.1 (compatible). Max 9 bundles Node v22.18 (compatible). v12.x supports Node >= 16.
   - What's unclear: Whether the user is on Max 8 or Max 9.
   - Recommendation: Use v12.x for broadest compatibility. Document how to check Max's Node version (`process.version`). If user confirms Max 9 / Node 22, v13.x is fine.

## Sources

### Primary (HIGH confidence)
- [Cycling '74 Node for Max API](https://docs.cycling74.com/nodeformax/api/module-max-api.html) - outlet(), addHandler(), post() methods
- [Cycling '74 Node for Max Programming Interfaces](https://docs.cycling74.com/max8/vignettes/07_n4m_maxapi) - Tagged message pattern, route object usage
- [Cycling '74 node.script Reference](https://docs.cycling74.com/max8/refpages/node.script) - Lifecycle, attributes, crash handling
- [Cycling '74 N4M Using npm](https://docs.cycling74.com/max8/vignettes/02_n4m_usingnpm) - npm install pattern, node_modules resolution
- [serialport Stream API docs](https://serialport.io/docs/api-stream/) - Constructor options, events (open/close/error), properties
- [serialport ReadlineParser docs](https://serialport.io/docs/api-parser-readline/) - Constructor, delimiter config, data event
- [serialport Installation Guide](https://serialport.io/docs/guide-installation/) - Prebuild binaries, platform support, version info
- [Cycling '74 n4m-core-examples](https://github.com/Cycling74/n4m-core-examples/commit/6c2b3509a68580e40096ce9762be0904358378ef) - outlet() best practices, tagged messages

### Secondary (MEDIUM confidence)
- [serialport GitHub Issue #1330](https://github.com/serialport/node-serialport/issues/1330) - Disconnect detection, platform behavior (close event on macOS vs Windows)
- [Cycling '74 Forum: node.js version](https://cycling74.com/forums/node-js-version) - Max 8 bundles Node v20.6.1, Max 9 bundles Node v22.18
- [Max 9.1.0 Release Notes](https://cycling74.com/releases/max/9.1.0) - Node v22.18 bundled
- [serialport on Libraries.io](https://libraries.io/npm/serialport) - v13.0.0 released 2024-12-24, drops Node 16/18

### Tertiary (LOW confidence)
- maxAPI.outlet() throughput at high frequency - no official documentation found; recommendation based on general IPC patterns
- Arduino Uno WiFi Rev2 specific macOS port path - varies per machine; recommendation is runtime discovery

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - serialport and max-api are well-documented, versions verified against official sources
- Architecture: HIGH - Tagged outlet + route pattern is the canonical N4M pattern per Cycling '74 docs and examples
- Pitfalls: HIGH - Native binary mismatch, port conflicts, disconnect handling all verified against official docs and GitHub issues
- Reconnection pattern: MEDIUM - Polling via SerialPort.list() is a community pattern; no official "blessed" reconnection strategy exists
- Performance at 114 Hz: LOW - No official throughput documentation; recommendation is pragmatic but unverified

**Research date:** 2026-02-12
**Valid until:** 2026-03-14 (30 days -- stable domain, serialport and N4M are mature)
