# Phase 8: Custom DTW Gesture Recognition - Context

**Gathered:** 2026-02-24
**Status:** Ready for planning

<domain>
## Phase Boundary

Record custom gestures, recognize them in real-time via Dynamic Time Warping with confidence scores, and persist gesture libraries across sessions as sharable JSON files. Extends the sensor pipeline with quaternion output. Visualization of DTW matching is Phase 10.

</domain>

<decisions>
## Implementation Decisions

### Recording workflow
- Two recording modes: timed window (with adjustable duration) AND toggle (start/stop manually)
- After each recording, prompt "Record another example?" — user builds up examples sequentially
- Gestures use numbered slots with optional text labels — defaults to "gesture-1" if no name given

### Match behavior
- Two output modes: triggered bang + confidence when above threshold, PLUS a separate outlet for continuous confidence stream
- User-adjustable confidence threshold per gesture slot (dial/number box)
- Two match reporting modes (user-selectable): "best match only" or "all above threshold"
- Adjustable cooldown period after a gesture triggers before it can fire again

### Library management
- Save/load approach: Claude's discretion based on MAX conventions
- Libraries are sharable — JSON includes metadata (gesture names, descriptions, axis config, template data)
- Dynamic/unlimited gesture slots — user can add as many gestures as needed
- Per-gesture enable/disable toggle — consistent with predefined gesture UI pattern from Phase 7

### Axis selection
- All 9 existing channels (aX/aY/aZ, gX/gY/gZ, pitch/roll/yaw) plus quaternion data available for matching
- Quaternion output added to Arduino firmware and serial bridge in this phase
- Auto-detect relevant axes from recorded examples (based on variance analysis), with manual override available
- Axis selection approach (per-gesture vs global): Claude's discretion based on quality and MAX limitations

### Claude's Discretion
- Recording feedback UI (countdown, sample count, visual indicators)
- Save/load UX pattern (file dialog, auto-save, default paths)
- Axis selection architecture (per-gesture vs global vs hybrid)
- Exact compression/normalization of template data
- DTW implementation details (Sakoe-Chiba band width, distance metric)

</decisions>

<specifics>
## Specific Ideas

- User specifically wants quaternion data available for DTW matching — extend pipeline to output quaternion alongside existing 9 channels
- Recording should feel low-friction: timed window for quick captures, toggle for precise control
- Match behavior should support both performance use (triggered events) and parameter mapping (continuous stream)
- Library format should be portable enough to share between users/setups

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 08-custom-dtw-gesture-recognition*
*Context gathered: 2026-02-24*
