# Phase 1: Arduino Firmware - Research

**Researched:** 2026-02-12
**Domain:** Arduino IMU firmware (LSM6DS3 + Madgwick filter + USB serial output)
**Confidence:** HIGH

<user_constraints>

## User Constraints (from CONTEXT.md)

### Locked Decisions

#### Serial output format
- All 9 values per line: accelX, accelY, accelZ, gyroX, gyroY, gyroZ, pitch, roll, yaw
- Fixed precision if it doesn't add latency vs default Arduino float printing -- choose whichever is lower latency
- Claude's discretion on format (CSV vs labeled), delimiter, and whether to include a header line on startup

#### Sensor configuration
- Target sample rate: as fast as the hardware and 57600 baud can sustain (maximize throughput)
- Wide sensor ranges to capture both subtle and vigorous motion (max out gyro and accel ranges to avoid clipping)
- Madgwick filter beta: Claude's discretion on value and whether it's hardcoded or adjustable via serial
- Serial direction (output-only vs accepting commands): Claude's discretion, considering what Phase 3 (Calibration) will need

#### Smoothing behavior
- Both layers: light smoothing on Arduino, additional smoothing available in Node for Max (Phase 4)
- Arduino-side smoothing: Claude's discretion -- lightest approach that removes sensor noise without adding perceptible latency
- Per-axis vs uniform smoothing: Claude's discretion based on LSM6DS3 noise characteristics
- Raw vs smoothed in output: Claude's discretion based on bandwidth budget at 57600 baud

#### Startup and status
- Wait until Madgwick filter converges before sending data (~1-2 seconds warmup)
- Print measured loop rate once at startup (not in every line)
- IMU failure handling: Claude's discretion on error behavior (LED blink, serial error message, retry)
- Boot identity string: Claude's discretion on whether to print version/identifier for Phase 2 device detection

### Claude's Discretion
- Serial line format choice (CSV vs labeled, delimiter)
- Header line on startup (yes/no)
- Fixed precision vs default float printing (latency is the deciding factor)
- Madgwick beta value and whether it's runtime-adjustable
- Whether firmware accepts incoming serial commands (considering Phase 3 needs)
- Arduino-side smoothing algorithm and aggressiveness
- Per-axis smoothing independence
- Whether to send raw + smoothed or smoothed only
- IMU initialization failure behavior
- Boot identity/version string

### Deferred Ideas (OUT OF SCOPE)
None -- discussion stayed within phase scope

</user_constraints>

## Summary

This phase implements firmware for the Arduino Uno WiFi Rev2 that reads its built-in LSM6DS3 IMU, fuses orientation via a Madgwick filter, applies light EMA smoothing, and streams 9 values as CSV over USB serial at 57600 baud. The primary challenge is maximizing throughput within the 57600 baud ceiling imposed by the board's mEDBG debug chip, while keeping latency minimal for live musical performance.

The LSM6DS3 on the Uno WiFi Rev2 is connected via SPI (not I2C), which is important for library configuration. The official Arduino_LSM6DS3 library is simple but has hardcoded 104 Hz ODR and fixed sensor ranges. The SparkFun LSM6DS3 library offers full configurability (ODR, range, bandwidth) but has a known one-line compilation bug on this board (`MSB_FIRST` must be changed to `MSBFIRST`). The SparkFun library is the right choice because the user needs maximum ranges (16g accel, 2000 dps gyro) and control over ODR.

The bandwidth budget is tight: at 57600 baud (~5760 bytes/sec), a 9-value CSV line with 2 decimal places is ~63 bytes, yielding a maximum of ~91 lines/sec. With the overhead of Serial.print calls and loop computation, a practical ceiling is ~80-85 Hz. This means the LSM6DS3 ODR should be set to 104 Hz (the sensor will produce data faster than we can send it, which is fine -- we just read the latest values each loop). The Madgwick filter sample rate must be declared to match the actual measured loop rate, not the sensor ODR.

**Primary recommendation:** Use SparkFun LSM6DS3 library in SPI mode with `LSM6DS3(SPI_MODE, SPIIMU_SS)`, fix the `MSB_FIRST` bug, set ranges to 16g/2000dps, run the Madgwick filter at the measured loop rate, output comma-delimited CSV with 2 decimal places, and apply a single-pole EMA (alpha ~0.15-0.2) to orientation values only.

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| SparkFun LSM6DS3 | 1.0.3 | Read accel/gyro from built-in IMU | Configurable ODR, range, bandwidth; SPI support; direct float output in g and dps |
| MadgwickAHRS | 1.2.0 | Sensor fusion for pitch/roll/yaw | Official Arduino library; accepts dps directly (converts internally); well-tested |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| Wire.h | built-in | I2C communication | NOT needed -- Uno WiFi Rev2 IMU uses SPI |
| SPI.h | built-in | SPI communication | Required for SparkFun library in SPI mode |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| SparkFun LSM6DS3 | Arduino_LSM6DS3 | Simpler but fixed at 104 Hz ODR, no range config, no bandwidth config -- insufficient for this project |
| MadgwickAHRS | Mahony filter | Lower CPU cost but less accurate; Madgwick is fine on ATmega4809 |
| MadgwickAHRS | Reefwing-AHRS | More features but heavier; overkill for 6DOF |

**Installation (via Arduino Library Manager):**
- "SparkFun LSM6DS3 Breakout" by SparkFun Electronics
- "Madgwick" by Arduino

## Architecture Patterns

### Recommended Project Structure
```
firmware/
  imu_firmware/
    imu_firmware.ino     # Main sketch: setup, loop, serial output
```

Single-file sketch is appropriate for this complexity level. All logic fits in one .ino file with clearly separated sections (config, globals, setup, loop, helpers).

### Pattern 1: Fixed-Interval Sensor Loop with micros()
**What:** Use `micros()` to measure actual loop time, feed that to the Madgwick filter as the real dt. Do NOT use `delay()`.
**When to use:** Always -- the Madgwick filter requires accurate sample rate knowledge.
**Example:**
```cpp
// Source: Arduino docs + MadgwickAHRS library source
unsigned long lastMicros = 0;
float sampleRate;

void loop() {
  unsigned long now = micros();
  float dt = (now - lastMicros) / 1000000.0f;
  lastMicros = now;
  sampleRate = 1.0f / dt;

  // Read sensor, update filter, print
  float ax = myIMU.readFloatAccelX();
  // ... (read all 6 values)

  filter.updateIMU(gx, gy, gz, ax, ay, az);

  float pitch = filter.getPitch();
  float roll = filter.getRoll();
  float yaw = filter.getYaw();

  // Output CSV
  Serial.print(ax, 2); Serial.print(',');
  // ... remaining values ...
  Serial.println(yaw, 2);
}
```

### Pattern 2: EMA (Exponential Moving Average) Smoothing
**What:** Single-pole IIR filter: `smoothed = alpha * new + (1 - alpha) * smoothed`. Zero memory overhead, one multiplication per axis.
**When to use:** On orientation values (pitch, roll, yaw) after Madgwick output, before serial print.
**Example:**
```cpp
// Source: Standard DSP pattern
float smoothPitch = 0, smoothRoll = 0, smoothYaw = 0;
const float alpha = 0.15; // Light smoothing: 0.1 = heavy, 0.3 = light, 1.0 = none

void applySmoothing(float pitch, float roll, float yaw) {
  smoothPitch = alpha * pitch + (1.0 - alpha) * smoothPitch;
  smoothRoll  = alpha * roll  + (1.0 - alpha) * smoothRoll;
  smoothYaw   = alpha * yaw   + (1.0 - alpha) * smoothYaw;
}
```

### Pattern 3: Warmup Phase Before Data Transmission
**What:** Run the Madgwick filter for N iterations before starting serial output, to let quaternion converge from identity.
**When to use:** Always at startup.
**Example:**
```cpp
// Source: Madgwick filter convergence behavior
const int WARMUP_SAMPLES = 200; // ~2 seconds at 100 Hz

void setup() {
  // ... init serial, init IMU ...

  // Warmup: run filter without outputting
  for (int i = 0; i < WARMUP_SAMPLES; i++) {
    // read sensor + update filter (same as loop body, no serial output)
    delay(10); // approximate loop timing during warmup
  }

  // Print startup info
  Serial.print("STARTUP,rate_hz=");
  Serial.println(measuredRate, 1);
}
```

### Anti-Patterns to Avoid
- **Using delay() in main loop:** Blocks the processor, introduces jitter, wastes time that could be spent reading/computing. Use free-running loop with micros() timing.
- **Assuming loop rate equals sensor ODR:** The loop rate is determined by computation + serial time, not sensor rate. Always measure.
- **Printing more data than baud can handle:** Will cause Serial.print to block, stalling the loop and corrupting Madgwick timing. Stay within bandwidth budget.
- **Using String class on AVR:** Dynamic memory allocation causes fragmentation on ATmega4809's 6KB SRAM. Use Serial.print with numeric types directly.
- **Calling readFloat per axis separately in tight loop:** Each call does a separate SPI transaction. Acceptable with SparkFun library (fast enough at SPI speeds), but be aware of 6 SPI reads per loop iteration.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| IMU sensor fusion | Custom complementary filter or manual quaternion math | MadgwickAHRS library `updateIMU()` | Gradient descent optimization handles gyro drift correction; hand-rolled filters are less accurate |
| Sensor register access | Direct SPI register reads/writes for LSM6DS3 | SparkFun LSM6DS3 library | Handles register mapping, conversion math (raw to g/dps), initialization sequence, error checking |
| Float-to-string conversion | Custom itoa/dtostrf pipelines | `Serial.print(value, 2)` | Arduino's built-in print handles float formatting; no faster alternative for serial output |
| Quaternion-to-Euler conversion | Manual atan2/asin from quaternion | MadgwickAHRS `getRoll()`/`getPitch()`/`getYaw()` | Library handles the trig and gimbal-lock-aware conversion |

**Key insight:** The ATmega4809 has no FPU, so all float math is software-emulated. Every unnecessary float operation costs CPU time that could be spent maintaining loop rate. Use library functions that are already optimized.

## Common Pitfalls

### Pitfall 1: SparkFun Library MSB_FIRST Compilation Error
**What goes wrong:** SparkFun LSM6DS3 library fails to compile on Arduino Uno WiFi Rev2 (megaAVR architecture) with error: `'MSB_FIRST' was not declared in this scope`
**Why it happens:** The SparkFun library uses `MSB_FIRST` which is the correct constant for classic AVR, but megaAVR (ATmega4809) uses `MSBFIRST` (no underscore).
**How to avoid:** After installing the SparkFun library, edit `SparkFunLSM6DS3.cpp` and change `MSB_FIRST` to `MSBFIRST`. This is a one-line fix.
**Warning signs:** Compilation error immediately upon first build.

### Pitfall 2: Madgwick Sample Rate Mismatch
**What goes wrong:** Filter produces sluggish or oscillating orientation because the declared sample rate doesn't match actual loop timing.
**Why it happens:** `filter.begin(104)` assumes 104 Hz but actual loop runs at 80 Hz due to serial overhead. The filter's internal integration step uses the wrong dt.
**How to avoid:** Measure actual loop rate with `micros()` during the first few hundred iterations, then call `filter.begin(measuredRate)`. Alternatively, the library constructor sets `invSampleFreq = 1.0 / sampleFreqDef`, so calling `begin()` with the correct value is critical.
**Warning signs:** Pitch/roll values respond correctly to tilt direction but settle too slowly or overshoot.

### Pitfall 3: Serial Buffer Blocking Stalls Loop
**What goes wrong:** `Serial.print()` fills the 64-byte TX buffer, then blocks until UART transmits a byte. This stalls the loop and introduces timing jitter.
**Why it happens:** At 57600 baud, the UART can only send ~5760 bytes/sec. If the loop tries to print more, it blocks.
**How to avoid:** Keep line length under ~63 bytes (2 decimal places, no labels, comma delimiter). At ~63 bytes/line, maximum throughput is ~91 lines/sec. The loop's computation time (~2-3ms for sensor read + Madgwick + smoothing) naturally paces output below this ceiling.
**Warning signs:** Measured loop rate drops well below expected; Serial.availableForWrite() returns 0.

### Pitfall 4: Yaw Drift Without Magnetometer
**What goes wrong:** Yaw drifts continuously over time, even when the board is stationary.
**Why it happens:** The LSM6DS3 is a 6DOF IMU (no magnetometer). The Madgwick filter's `updateIMU()` cannot correct gyro integration drift in yaw because gravity provides no yaw reference.
**How to avoid:** This is physically unavoidable with 6DOF. Document it, accept it, and plan for yaw reset in Phase 3 (Calibration). Gyro bias calibration at startup can slow but not eliminate drift.
**Warning signs:** Yaw increases or decreases steadily when the board is still.

### Pitfall 5: Wrong SPI Constructor for Onboard IMU
**What goes wrong:** IMU initialization returns error or reads zeros, because library defaults to I2C.
**Why it happens:** The SparkFun library defaults to `LSM6DS3(I2C_MODE, 0x6B)`, but on the Uno WiFi Rev2 the LSM6DS3 is wired via SPI to a dedicated chip select pin.
**How to avoid:** Must use `LSM6DS3 myIMU(SPI_MODE, SPIIMU_SS);` -- SPI mode with the board's predefined chip select constant.
**Warning signs:** `myIMU.begin()` returns non-zero error code; all readings are 0.0.

### Pitfall 6: Float Precision Beyond Meaningful Range
**What goes wrong:** Using `Serial.print(value, 6)` wastes bandwidth on meaningless decimal places.
**Why it happens:** Arduino float is 32-bit IEEE 754 with ~7 significant digits. For values like acceleration in g (-16.0 to 16.0) or angles (-180.0 to 180.0), 2 decimal places captures all meaningful precision.
**How to avoid:** Use `Serial.print(value, 2)` consistently. Saves 2-4 bytes per value * 9 values = 18-36 bytes/line, which directly translates to higher maximum throughput.
**Warning signs:** Line lengths exceeding 80 bytes; loop rate dropping below 70 Hz.

## Code Examples

### Complete Sensor Initialization
```cpp
// Source: SparkFun LSM6DS3 library docs + Woolsey Workshop tutorial
#include "SparkFunLSM6DS3.h"
#include "SPI.h"
#include <MadgwickAHRS.h>

// IMU via SPI on Uno WiFi Rev2 (NOT I2C!)
LSM6DS3 myIMU(SPI_MODE, SPIIMU_SS);

// Madgwick filter (sample rate set after measurement)
Madgwick filter;

void setup() {
  Serial.begin(57600);
  while (!Serial); // Wait for serial port on USB boards

  // Configure IMU before begin()
  myIMU.settings.gyroEnabled = 1;
  myIMU.settings.gyroRange = 2000;       // Max: +/-2000 dps (avoid clipping)
  myIMU.settings.gyroSampleRate = 416;   // Hz (faster than loop = always fresh data)
  myIMU.settings.gyroBandWidth = 100;    // Hz anti-alias filter
  myIMU.settings.accelEnabled = 1;
  myIMU.settings.accelRange = 16;        // Max: +/-16g (avoid clipping)
  myIMU.settings.accelSampleRate = 416;  // Hz (match gyro)
  myIMU.settings.accelBandWidth = 100;   // Hz anti-alias filter

  if (myIMU.begin() != 0) {
    Serial.println("ERROR:IMU_INIT_FAILED");
    while (1) {
      // Blink LED or halt
      digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));
      delay(500);
    }
  }
}
```

### Bandwidth Budget Calculation
```
57600 baud / 10 bits per byte (8N1) = 5760 bytes/sec

Line format (2 decimal places, comma-separated, no labels):
  -0.12,0.95,0.31,-1.23,0.45,-0.67,12.34,-5.67,178.90\n
  Typical: ~60-65 bytes per line

Max throughput: 5760 / 63 = ~91 lines/sec
With loop overhead: practical ceiling ~80-85 Hz

Sensor ODR at 416 Hz ensures fresh data every loop iteration.
Madgwick filter.begin() called with MEASURED loop rate (~80 Hz).
```

### Measured Loop Rate and Warmup
```cpp
// Source: Arduino millis()/micros() docs + Madgwick convergence behavior
const int WARMUP_ITERATIONS = 200;
unsigned long lastMicros;
float measuredRate = 80.0; // Initial estimate, will be measured

void performWarmup() {
  unsigned long startTime = micros();

  for (int i = 0; i < WARMUP_ITERATIONS; i++) {
    float ax = myIMU.readFloatAccelX();
    float ay = myIMU.readFloatAccelY();
    float az = myIMU.readFloatAccelZ();
    float gx = myIMU.readFloatGyroX();
    float gy = myIMU.readFloatGyroY();
    float gz = myIMU.readFloatGyroZ();
    filter.updateIMU(gx, gy, gz, ax, ay, az);
  }

  unsigned long elapsed = micros() - startTime;
  measuredRate = (float)WARMUP_ITERATIONS / (elapsed / 1000000.0f);

  // Reinitialize filter with measured rate
  filter.begin(measuredRate);

  // Re-run warmup with correct rate for proper convergence
  for (int i = 0; i < WARMUP_ITERATIONS; i++) {
    float ax = myIMU.readFloatAccelX();
    float ay = myIMU.readFloatAccelY();
    float az = myIMU.readFloatAccelZ();
    float gx = myIMU.readFloatGyroX();
    float gy = myIMU.readFloatGyroY();
    float gz = myIMU.readFloatGyroZ();
    filter.updateIMU(gx, gy, gz, ax, ay, az);
  }
}
```

### Main Loop with Smoothing and Output
```cpp
// Source: Composite from library APIs + EMA pattern
float smoothPitch = 0, smoothRoll = 0, smoothYaw = 0;
const float SMOOTH_ALPHA = 0.15;

void loop() {
  // Read raw sensor data
  float ax = myIMU.readFloatAccelX();  // in g
  float ay = myIMU.readFloatAccelY();
  float az = myIMU.readFloatAccelZ();
  float gx = myIMU.readFloatGyroX();   // in degrees/sec
  float gy = myIMU.readFloatGyroY();
  float gz = myIMU.readFloatGyroZ();

  // Update Madgwick filter (library converts dps to rad/s internally)
  filter.updateIMU(gx, gy, gz, ax, ay, az);

  // Get orientation
  float pitch = filter.getPitch();
  float roll  = filter.getRoll();
  float yaw   = filter.getYaw();

  // Apply EMA smoothing to orientation only
  smoothPitch = SMOOTH_ALPHA * pitch + (1.0 - SMOOTH_ALPHA) * smoothPitch;
  smoothRoll  = SMOOTH_ALPHA * roll  + (1.0 - SMOOTH_ALPHA) * smoothRoll;
  smoothYaw   = SMOOTH_ALPHA * yaw   + (1.0 - SMOOTH_ALPHA) * smoothYaw;

  // Output CSV: raw accel, raw gyro, smoothed orientation
  // ~63 bytes per line at 2 decimal places
  Serial.print(ax, 2); Serial.print(',');
  Serial.print(ay, 2); Serial.print(',');
  Serial.print(az, 2); Serial.print(',');
  Serial.print(gx, 2); Serial.print(',');
  Serial.print(gy, 2); Serial.print(',');
  Serial.print(gz, 2); Serial.print(',');
  Serial.print(smoothPitch, 2); Serial.print(',');
  Serial.print(smoothRoll, 2);  Serial.print(',');
  Serial.println(smoothYaw, 2);
}
```

## Discretion Recommendations

Based on research findings, here are prescriptive recommendations for all discretion areas:

### Serial Format: Comma-Delimited CSV, No Labels
**Recommendation:** Plain CSV with comma delimiter, no per-line labels.
**Rationale:** Labels add ~40+ bytes per line, cutting max throughput from ~91 Hz to ~55 Hz. Node for Max (Phase 2) will parse by position anyway. Latency is the overriding priority.

### Header Line on Startup: Yes
**Recommendation:** Print a single header line at startup: `STARTUP,version=1.0,rate_hz=XX.X,format=ax,ay,az,gx,gy,gz,pitch,roll,yaw`
**Rationale:** Aids Phase 2 device detection and Phase 3 calibration. Single line costs zero ongoing bandwidth. The `STARTUP` prefix distinguishes it from data lines.

### Fixed Precision: 2 Decimal Places
**Recommendation:** `Serial.print(value, 2)` for all values.
**Rationale:** Arduino float has ~7 significant digits. For ranges like +/-16g and +/-180 degrees, 2 decimal places gives 0.01 resolution, which is well beyond sensor noise floor. Default `Serial.print(float)` also uses 2 decimals, so there is no latency difference -- they are equivalent. Two decimal places minimizes line length (~63 bytes) for maximum throughput.

### Madgwick Beta: 0.1 (Library Default), Hardcoded
**Recommendation:** Use the library default beta of 0.1f. Do not make it adjustable at runtime.
**Rationale:** Beta 0.1 at ~80 Hz gives a (beta * sampleFreq) product of ~8, which is responsive without being noisy. The heuristic from the Arduino forum suggests (beta * freq) in the range of 10-60. At 0.1 * 80 = 8, this is at the responsive end, appropriate for musical performance where tracking speed matters more than absolute stability. Runtime adjustment adds code complexity, serial parsing overhead, and the risk of bad values crashing the filter. Phase 3 calibration will handle gyro bias, which is the bigger accuracy lever.

### Serial Direction: Output-Only with One Exception
**Recommendation:** Primarily output-only. Accept a single incoming command: `R\n` to trigger a soft reset (re-run warmup, zero yaw). Do NOT implement a full command parser.
**Rationale:** Phase 3 (Calibration) needs a yaw reset command. A single-character check costs almost nothing: `if (Serial.available() && Serial.read() == 'R') { resetOrientation(); }`. A full command parser would add latency to every loop iteration for a feature that fires rarely.

### Smoothing: EMA with Alpha 0.15, Uniform Across Axes
**Recommendation:** Single-pole EMA (alpha = 0.15) applied uniformly to pitch, roll, and yaw. Do NOT smooth raw accel/gyro values.
**Rationale:** The LSM6DS3 has comparable noise characteristics across all axes. Differential smoothing would add complexity without measurable benefit. Alpha 0.15 at ~80 Hz provides a cutoff frequency of about 2 Hz, which removes high-frequency jitter while preserving gesture-speed motion (~0.5-2 Hz typical). Raw accel/gyro values are sent unsmoothed because Node for Max (Phase 4) will apply its own configurable smoothing.

### Output Content: Raw 6-Axis + Smoothed Orientation (9 Values)
**Recommendation:** Send raw (unsmoothed) accel and gyro, plus smoothed pitch/roll/yaw. Total: 9 values per line.
**Rationale:** Requirement ARDU-05 mandates both raw 6-axis and orientation. Sending raw + smoothed orientation (not raw orientation) is correct because: (a) the smoothed values are what downstream actually needs, (b) sending both raw and smoothed orientation would be 12 values, pushing line length to ~85 bytes and throughput to ~68 Hz, and (c) the raw 6-axis data lets Node recalculate if ever needed.

### IMU Initialization Failure: Serial Error + LED Blink + Halt
**Recommendation:** Print `ERROR:IMU_INIT_FAILED` to serial, then enter infinite loop blinking the built-in LED.
**Rationale:** Serial message allows Phase 2 to detect the error programmatically. LED blink provides visual feedback without serial. Halting is correct because there is nothing useful the firmware can do without the IMU.

### Boot Identity String: Yes, In Startup Line
**Recommendation:** Include version and identity in the startup line: `STARTUP,device=ARUIDO_IMU,version=1.0,rate_hz=XX.X`
**Rationale:** Phase 2 (Serial Bridge) needs to confirm it is talking to the right device. A device identifier in the startup line costs zero ongoing bandwidth and makes auto-detection possible.

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Arduino_LSM6DS3 with fixed 104 Hz | SparkFun library with configurable ODR | SparkFun library available since 2017 | Full control over sensor config |
| Complementary filter for fusion | Madgwick gradient-descent filter | Madgwick AHRS lib v1.0 (2016) | Better accuracy, single beta parameter |
| delay()-based loop timing | Free-running loop with micros() measurement | Arduino best practice for years | Accurate dt for filter, max throughput |
| I2C for onboard sensors | SPI on Uno WiFi Rev2 | Board design choice | Faster bus, requires SPI_MODE constructor |

**Deprecated/outdated:**
- Arduino_LSM6DS3 library: Still maintained but insufficient for this project due to fixed 104 Hz ODR and no range configuration
- delay() in sensor loops: Wastes CPU time and introduces jitter; never use in performance-critical sensor loops
- String class on AVR: Causes heap fragmentation on ATmega4809; always use Serial.print with native types

## Open Questions

1. **Actual achievable loop rate on hardware**
   - What we know: Bandwidth math suggests ~80-91 Hz ceiling. Sensor reads + Madgwick + serial print take an estimated 2-3ms computation, rest is serial blocking time.
   - What's unclear: Actual measured rate on real hardware. SPI read time for 6 floats on ATmega4809 is not precisely documented.
   - Recommendation: Measure during first implementation session. If actual rate differs significantly from ~80 Hz, adjust Madgwick's `begin()` parameter accordingly. This is why the firmware measures its own loop rate.

2. **57600 vs 115200 baud viability**
   - What we know: Forum reports confirm 115200 produces garbage on Uno WiFi Rev2 due to mEDBG limitation. 57600 is the confirmed maximum stable rate.
   - What's unclear: Whether board revision or firmware updates have changed this.
   - Recommendation: Start at 57600. Optionally test 115200 on actual hardware in first session. If it works, throughput nearly doubles.

3. **SparkFun library MSB_FIRST fix stability**
   - What we know: The fix (change `MSB_FIRST` to `MSBFIRST`) is well-documented in forum posts and appears to be the only incompatibility.
   - What's unclear: Whether there are other subtle incompatibilities on megaAVR that surface at runtime.
   - Recommendation: Fix the compilation error, test basic reads, and verify sensor values match expected ranges before building the full pipeline.

4. **EMA alpha value tuning**
   - What we know: Alpha 0.15 is a reasonable starting point for ~80 Hz sensor data with musical gestural input.
   - What's unclear: Whether the LSM6DS3's actual noise at 416 Hz ODR with 100 Hz bandwidth filter requires more or less smoothing.
   - Recommendation: Start with alpha 0.15. If orientation values are still jittery, decrease to 0.1. If response feels laggy, increase to 0.2. Make this a `const float` at the top of the file for easy tuning.

5. **Yaw wrapping behavior around 360/0 boundary**
   - What we know: MadgwickAHRS `getYaw()` returns 0-360 degrees. EMA smoothing will produce artifacts at the 360/0 boundary (averaging 359 and 1 gives 180, not 0).
   - What's unclear: How frequently users will encounter this in practice.
   - Recommendation: Implement angle-aware EMA for yaw using shortest-path interpolation. This is a small addition but prevents a showstopper bug for any rotation-based interaction.

## Sources

### Primary (HIGH confidence)
- [SparkFun LSM6DS3 Arduino Library](https://github.com/sparkfun/SparkFun_LSM6DS3_Arduino_Library) - API, settings struct, SPI constructor, version 1.0.3
- [MadgwickAHRS Library](https://github.com/arduino-libraries/MadgwickAHRS) - API (begin, updateIMU, getRoll/Pitch/Yaw), beta default 0.1f, internal dps-to-rad conversion, version 1.2.0
- [SparkFun LSM6DS3 Header File](https://github.com/sparkfun/SparkFun_LSM6DS3_Arduino_Library/blob/master/src/SparkFunLSM6DS3.h) - Full class API, settings fields, SPI_MODE constant
- [SparkFun LSM6DS3 Implementation](https://github.com/sparkfun/SparkFun_LSM6DS3_Arduino_Library/blob/master/src/SparkFunLSM6DS3.cpp) - Default settings values, begin() sequence, unit conversions
- [MadgwickAHRS Source Code](https://github.com/arduino-libraries/MadgwickAHRS/blob/master/src/MadgwickAHRS.cpp) - betaDef=0.1f, sampleFreqDef=512, internal rad/s conversion (multiply by 0.0174533f)
- [SparkFun LSM6DS3 Hookup Guide](https://learn.sparkfun.com/tutorials/lsm6ds3-breakout-hookup-guide/all) - Valid ODR values, range values, bandwidth values, units (g and dps)

### Secondary (MEDIUM confidence)
- [Woolsey Workshop: IMU on Uno WiFi Rev2](https://www.woolseyworkshop.com/2019/01/23/accessing-the-imu-on-the-new-arduino-uno-wifi-rev2/) - SPI connection, SPIIMU_SS constant, SparkFun SPI constructor
- [Woolsey Workshop: Arduino_LSM6DS3 Tutorial](https://www.woolseyworkshop.com/2020/02/12/using-the-arduino_lsm6ds3-library-to-access-the-arduino-uno-wifi-rev2-imu/) - SPI bus confirmation, basic Madgwick usage pattern
- [Arduino Forum: Uno WiFi Rev2 Serial Limit](https://forum.arduino.cc/t/uno-wifi-rev2-usb-serial-cant-go-faster-then-57600/647341) - Confirmed 57600 max baud due to mEDBG
- [Arduino Forum: Madgwick Beta Tuning](https://forum.arduino.cc/t/help-with-choosing-the-correct-settings-for-mahony-or-madgwick-ahrs-filters/968160) - (beta*sampleFreq)~=50-60 heuristic
- [Arduino Forum: LSM6DS3 Sample Rate Discussion](https://forum.arduino.cc/t/lsm6ds3-sample-rate/1156756) - Arduino_LSM6DS3 fixed at 104 Hz, SparkFun library recommended
- [MadgwickAHRS Gyro Input Units Discussion](https://forum.arduino.cc/t/madgwick-ahrs-gyro-input-units/1313027) - Confirmed library accepts dps, converts internally

### Tertiary (LOW confidence)
- LSM6DS3 noise density values: Could not extract from PDF datasheets. Typical values from training data suggest ~90 ug/sqrt(Hz) accel noise and ~4 mdps/sqrt(Hz) gyro noise, but these are UNVERIFIED. The 100 Hz bandwidth filter setting and EMA smoothing should adequately handle typical IMU noise regardless of exact values.
- Actual loop rate on ATmega4809: Estimated at 80-85 Hz based on bandwidth math, but real measurement needed on hardware. MEDIUM-LOW confidence.

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - Verified library versions, APIs, and compatibility from official repositories and tutorials
- Architecture: HIGH - Patterns based on verified library APIs and Arduino best practices
- Pitfalls: HIGH - Compilation bug, baud limit, and SPI requirement confirmed by multiple forum reports
- Bandwidth calculation: MEDIUM - Math is sound but actual throughput depends on hardware measurement
- Smoothing parameters: MEDIUM - EMA alpha 0.15 is a reasonable starting point but will need hardware tuning
- Sensor noise characteristics: LOW - Could not extract from PDF datasheet; recommendations are robust regardless

**Research date:** 2026-02-12
**Valid until:** 2026-03-12 (stable domain, mature libraries, no expected breaking changes)
