# Milestones

## v1.0 MVP (Shipped: 2026-02-13)

**Phases completed:** 6 phases, 13 plans executed (1 deferred)
**Timeline:** 2 days (2026-02-12 to 2026-02-13)
**Commits:** 74
**Lines of code:** ~46,325 (Arduino .ino, JS, MAX .maxpat/.maxhelp)

**Delivered:** Complete low-latency IMU pipeline from Arduino Uno WiFi R2 to MAX/MSP as a reusable drop-in abstraction with USB and WiFi transport.

**Key accomplishments:**
- Arduino IMU firmware with Madgwick filter at 114.2 Hz, SPI bug fixes, clean 9-value CSV output
- Node for Max serial bridge with CSV validation, auto-reconnect, and tagged MAX outlets
- Interactive calibration from MAX: gyro bias correction, orientation reset, yaw zero
- Musical tools: three-tier EMA smoothing (13 dials), per-axis range mapping with 3 curve types, quaternion output
- Reusable `imu-sensor.maxpat` abstraction with 13 outlets, help patch with 3 creative recipes
- WiFi dual-mode transport with UDP fallback and threshold triggers with hysteresis on 6 axes

**Git range:** Initial commit to `cac813a`

---

