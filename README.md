# LSM6DS3 IMU → MAX/MSP Sensor Pipeline

Low-latency pipeline streaming accelerometer and gyroscope data from an LSM6DS3 6-axis IMU into MAX/MSP via Node for Max. Delivers raw 6-axis data (accel X/Y/Z, gyro X/Y/Z) and computed orientation (pitch/roll/yaw) at ~114 Hz for gestural audio control, visual parameter driving, and event triggering.

Should work with any Arduino-compatible board that has an LSM6DS3 (via SPI). Developed and tested on the Arduino Uno WiFi R2, which has the LSM6DS3 built in — other boards may need the chip select pin adjusted in the firmware (`SPIIMU_SS` on line 21).

## Architecture

```
Arduino + LSM6DS3 (SPI)
        │
        │  USB serial @ 57600 baud
        │  9-value CSV: aX,aY,aZ,gX,gY,gZ,pitch,roll,yaw
        ▼
Node for Max (serial-bridge.js)
  - Serial I/O & reconnection
  - CSV validation
  - Calibration & bias correction
  - EMA smoothing
        │
        │  maxAPI.outlet() tagged messages
        ▼
MAX/MSP (sensor-pipeline.maxpat)
  - UI controls (calibrate, smoothing, thresholds)
  - 3D orientation visualization
  - Threshold triggers with hysteresis
  - Downstream routing to audio/visual tools
```

## Prerequisites

- **Hardware:** Arduino board with LSM6DS3 IMU (e.g. Arduino Uno WiFi R2)
- **Software:** MAX/MSP 8+ with Node for Max, Arduino IDE
- **Libraries:** [SparkFun LSM6DS3](https://github.com/sparkfun/SparkFun_LSM6DS3_Breakout_Arduino_Library), [MadgwickAHRS](https://github.com/arduino-libraries/MadgwickAHRS)

## Setup

1. **Apply library patches** — see [`firmware/LIBRARY_PATCHES.md`](firmware/LIBRARY_PATCHES.md) for required fixes to the SparkFun LSM6DS3 library (SPI mode, transaction handling).

2. **Flash firmware** — open `firmware/imu_firmware/imu_firmware.ino` in Arduino IDE and upload to the board.

3. **Install Node dependencies:**
   ```
   cd node && npm install
   ```

4. **Open MAX patch** — open `max/sensor-pipeline.maxpat`. The Node for Max script connects to the Arduino automatically.

## Project Structure

```
firmware/           Arduino sketch (Madgwick fusion, EMA smoothing, CSV output)
node/               Node for Max serial bridge (calibration, smoothing, validation)
max/                MAX/MSP patch (UI, visualization, threshold triggers, routing)
scripts/            Build scripts for MAX patch components
```

## Features

- **Madgwick AHRS fusion** on-board for stable pitch/roll/yaw
- **Live calibration** — zero-offset reset without restarting
- **Per-axis EMA smoothing** with global, group, and individual controls
- **Threshold triggers** with hysteresis on all 6 raw axes
- **3D orientation visualization** via Jitter
- **Auto-reconnect** on USB disconnect/reconnect
