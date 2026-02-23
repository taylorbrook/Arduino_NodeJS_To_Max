# Phase 7: Core Engine and Predefined Gestures - Context

**Gathered:** 2026-02-22
**Status:** Ready for planning

<domain>
## Phase Boundary

Standalone gesture detection patch (imu-gesture.maxpat) that handles its own serial/wifi connection, calibration, and smoothing — plus detects shake, tap, flip, and 4 directional tilts from live IMU data. This is an either/or alternative to imu-sensor.maxpat: users pick one or the other, they don't run simultaneously. Outputs both smoothed sensor data and gesture events.

</domain>

<decisions>
## Implementation Decisions

### Architecture — Autonomy from v1
- imu-gesture.maxpat is fully self-contained — owns its serial/wifi connection, calibration, smoothing, and gesture detection
- Either/or usage model: user runs imu-sensor.maxpat (raw data) OR imu-gesture.maxpat (data + gestures), not both
- imu-gesture outputs everything imu-sensor does (smoothed accel/gyro/orientation) PLUS gesture events — it's a superset
- Minimal sensor UI in imu-gesture: just port selector and connect button — focus is on gesture controls, sensor config uses sensible defaults

### Patch UI & Controls
- One row per gesture type (7 rows: shake, tap, flip, tilt-left, tilt-right, tilt-forward, tilt-back)
- Each row has: enable/disable toggle + sensitivity dial + fire LED indicator + cooldown dial
- No master enable/disable toggle — per-gesture toggles only
- Sensitivity and cooldown dial positions persist when patch is saved and reopened (stored in patcher)

### Gesture Output Design
- Single outlet for gesture events with named messages (e.g., "shake", "tap", "tilt-left") — downstream uses `route` to split
- Separate status outlet for engine state (active/idle) and diagnostics — outlet 1 = gestures, outlet 2 = status
- Sensor data outlets also present (superset of imu-sensor outlets)

### Detection Tuning
- All matching gestures fire independently — no priority system, no mutual exclusion
- Per-gesture-type cooldown ranges (shake/tap may need shorter ranges than flip/tilt)
- Occasional false trigger when setting device down is acceptable — prioritize responsiveness over zero false positives
- Sensitivity is user-controllable per gesture via dials — defaults are Claude's discretion

### Activity Gating
- Instant wake — first frame of significant motion enables detection immediately
- ~500ms idle timeout before returning to idle state (natural pauses don't reset detection)
- Activity threshold fixed internally — not user-adjustable

### Claude's Discretion
- Node architecture: single unified script vs reusing serial-bridge.js internals
- Gesture name convention for route messages
- Whether gesture messages include intensity metadata or are bang-only
- Activity gate visibility (LED in patch or internal-only)
- Default sensitivity and cooldown values per gesture type
- Exact cooldown dial ranges per gesture type

</decisions>

<specifics>
## Specific Ideas

- User explicitly wants this as a standalone alternative to imu-sensor, not an add-on that requires it
- Sensitivity must be a live-tunable parameter, not a preset — the user tunes during performance
- Minimal sensor UI keeps focus on gesture controls — don't replicate the full imu-sensor control surface

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 07-core-engine-and-predefined-gestures*
*Context gathered: 2026-02-22*
