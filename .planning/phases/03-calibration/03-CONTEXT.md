# Phase 3: Calibration - Context

**Gathered:** 2026-02-12
**Status:** Ready for planning

<domain>
## Phase Boundary

Interactive calibration of gyro and accelerometer bias offsets, plus full orientation reset (pitch/roll/yaw to zero), all controlled from MAX during live performance. Calibration runs in Node (musicianship layer). Smoothing, scaling, and thresholds are Phase 4.

</domain>

<decisions>
## Implementation Decisions

### Calibration workflow
- Toggle button: click once to start collecting samples, click again to stop and apply
- Explicit reset button clears all bias offsets and returns to raw uncorrected values (distinct from re-calibrating)
- Calibration state is session-only — starts fresh each time the patch opens (gyro drift changes between sessions anyway)
- Calibrates both gyro AND accelerometer (zero-offset correction so flat = exactly 0,0,1g)

### Yaw reset behavior
- Full orientation reset: zeroing all three axes (pitch, roll, yaw), not yaw-only
- All axes smoothly transition to zero (not instant snap) — avoids jarring jumps when mapped to audio parameters
- Restorable: reset captures an offset, a second button restores the original gravity-referenced frame

### Feedback during calibration
- Progress bar in MAX while collecting samples (finite vs infinite bar is Claude's discretion)
- After calibration applied: status text changes AND computed bias offsets are displayed (e.g. gX: -0.42, gY: 0.18)
- Orientation reset shows a brief "Orientation reset" status message alongside the smooth value transition

### Output architecture
- Separate outlets for raw vs calibrated data — raw accel/gyro outlets stay untouched, new calibrated outlets added
- Orientation reset output routing is Claude's discretion (separate outlets or in-place modification — pick the most practical MAX wiring)
- All calibration controls added to the existing sensor-pipeline.maxpat (not a separate patch)

### Claude's Discretion
- Minimum sample count threshold before calibration can be applied (or trust the user)
- Progress bar style: finite with target sample count vs infinite activity indicator
- Orientation reset outlet routing pattern
- Smooth transition duration for orientation reset

</decisions>

<specifics>
## Specific Ideas

- Calibration is a performance tool — needs to be quick and non-disruptive during a live session
- Showing bias values after calibration gives transparency and helps debugging (user wants to see the numbers)
- The restore-original-frame button means the user can experiment with different "zero" positions without losing their reference

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 03-calibration*
*Context gathered: 2026-02-12*
