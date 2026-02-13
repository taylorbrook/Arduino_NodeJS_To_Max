# Phase 4: Musical Tools - Context

**Gathered:** 2026-02-13
**Status:** Ready for planning

<domain>
## Phase Boundary

Sensor data becomes musically and creatively useful. Smoothing reduces noise, range mapping converts sensor values to arbitrary parameter ranges with curves, thresholds fire discrete trigger events on boundary crossings, and a Jitter-based 3D visualization shows board orientation. Quaternion output is available alongside Euler angles. Creating sound/music and the reusable abstraction are separate phases.

</domain>

<decisions>
## Implementation Decisions

### Smoothing controls
- Three-tier hierarchy: global → group (accel, gyro, orientation) → per-axis
- No smoothing by default — raw data passes through, user dials up as needed
- Controlled via rotary dials (knobs)
- All smoothing controls live in the main patch, directly accessible

### Range mapping & curves
- Per-axis mappers — each sensor axis gets its own mapping controls
- Three curve types available: linear, exponential, and custom curve (user-drawn)
- Input range capture via both learn mode (move board to set min/max) and manual number entry for fine-tuning
- Per-axis clip toggle — user chooses whether output clips to defined range or allows overflow

### Threshold triggers
- Output: bang + crossing direction (up or down)
- Multiple thresholds per axis (e.g., 30°, 45°, 60° for zone-based triggering)
- Adjustable hysteresis per threshold — user-controllable dead zone width
- Available on orientation axes (pitch, roll, yaw) and accelerometer axes — not raw gyro

### 3D visualization
- Abstract geometric shape (cube, arrow, or similar) — not a board model
- Reference elements: ground plane grid + colored XYZ axis lines
- Expandable view, hidden by default — user opens it when needed
- Camera behavior: Claude's discretion

### Quaternion output
- Available as separate output alongside Euler angles for downstream 3D work

### Claude's Discretion
- Camera behavior for 3D view (fixed vs orbitable)
- Exact abstract shape choice for 3D visualization
- Smoothing algorithm implementation (EMA, moving average, etc.)
- Custom curve editor implementation approach
- Layout organization of all controls in the main patch
- Learn mode UX (start/stop buttons, visual feedback during capture)

</decisions>

<specifics>
## Specific Ideas

- Three-tier smoothing (global/group/per-axis) is a specific hierarchy request — not just "per-axis with a master"
- Learn mode for range capture: move the board around, it captures the actual range you use
- Threshold triggers with direction allow different musical responses for crossing up vs crossing down
- 3D view is expandable/hideable — treat it as a utility, not a centerpiece

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 04-musical-tools*
*Context gathered: 2026-02-13*
