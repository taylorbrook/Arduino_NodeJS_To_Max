# Phase 5: Abstraction and WiFi - Context

**Gathered:** 2026-02-13
**Status:** Ready for planning

<domain>
## Phase Boundary

Package the entire sensor pipeline as a drop-in MAX abstraction with clean inlets/outlets/arguments, and add WiFi/UDP as a wireless transport alternative to USB serial. The abstraction exposes all existing functionality (smoothing, mapping, thresholds, quaternion) through a message-based interface. A help patch documents everything with working examples. WiFi runs alongside USB in dual-mode firmware.

</domain>

<decisions>
## Implementation Decisions

### Abstraction design
- All outlets exposed: raw accel, raw gyro, raw orientation, calibrated versions, smoothed, mapped, quaternion, triggers — user picks what to connect
- Controls are configurable via external messages (e.g., `smoothing 0.5`, `threshold pitch 45`) — no need to open the abstraction to tweak
- Arguments: port name as main argument, plus optional attributes (`@smooth`, `@transport`, `@ip`) to set initial state at load time
- 3D visualization is a separate companion patch — connects to the abstraction's quaternion outlet, keeps the abstraction lightweight

### Help patch
- Basic usage documentation PLUS 2-3 creative recipe examples
- Recipe selection is Claude's discretion — should showcase the abstraction's range (likely tilt-to-synth, gesture triggers, spatialization)
- Annotated style — comment boxes explain each section, message formats, and outlet meanings
- Includes built-in test signal (simulated sine waves on axes) so the help patch works without hardware connected

### WiFi transport
- Discovery/addressing approach is Claude's discretion — pick simplest reliable method for Arduino Uno WiFi R2
- Dual-mode firmware preferred (single sketch supports both USB serial and WiFi) — unless dual-mode introduces latency to USB, in which case use separate sketches
- WiFi credentials configuration is Claude's discretion — pick most practical approach for this board
- Latency tolerance: best effort — get data flowing, optimization can come later

### Transport switching
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

</decisions>

<specifics>
## Specific Ideas

- User explicitly wants the abstraction to feel like a complete instrument interface — all outlets available, everything controllable via messages
- Help patch should be genuinely useful without hardware — simulation mode is important for people evaluating the tool
- Dual-mode firmware is preferred but latency on USB is the hard constraint — if WiFi degrades the 114 Hz USB path, separate sketches are acceptable

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 05-abstraction-wifi*
*Context gathered: 2026-02-13*
