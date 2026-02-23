# Requirements: Arduino-to-MAX Sensor Pipeline

**Defined:** 2026-02-22
**Core Value:** Reliable, lowest-possible-latency delivery of clean sensor data from Arduino to MAX

## v1.1 Requirements

Requirements for gesture recognition and mapping milestone. Each maps to roadmap phases.

### Core Infrastructure

- [x] **CORE-01**: Gesture engine runs as separate node.script (gesture-engine.js) without modifying serial-bridge.js
- [x] **CORE-02**: Gesture engine receives smoothed sensor data from imu-sensor.maxpat outlets via MAX patch cables
- [x] **CORE-03**: Energy-based activity detection gates all gesture recognition (idle vs motion states)
- [x] **CORE-04**: Sliding window buffer maintains recent sensor history for pattern matching

### Predefined Gestures

- [x] **GEST-01**: User can detect shake gesture with configurable threshold
- [x] **GEST-02**: User can detect tap gesture with configurable threshold
- [x] **GEST-03**: User can detect flip gesture (180-degree inversion)
- [x] **GEST-04**: User can detect tilt-left with configurable angle threshold
- [x] **GEST-05**: User can detect tilt-right with configurable angle threshold
- [x] **GEST-06**: User can detect tilt-forward with configurable angle threshold
- [x] **GEST-07**: User can detect tilt-back with configurable angle threshold
- [x] **GEST-08**: User can enable/disable individual predefined gestures
- [x] **GEST-09**: All predefined gestures output as named bang events with debounce

### Custom DTW Gestures

- [ ] **DTW-01**: User can record a custom gesture template by performing the gesture
- [ ] **DTW-02**: User can record multiple examples (3-5) of the same gesture for better recognition
- [ ] **DTW-03**: System recognizes custom gestures using DTW with Sakoe-Chiba band constraint
- [ ] **DTW-04**: DTW match outputs gesture name and confidence value (0.0-1.0)
- [ ] **DTW-05**: System rejects non-gesture motion via null rejection thresholds
- [ ] **DTW-06**: User can save gesture library to JSON file
- [ ] **DTW-07**: User can load gesture library from JSON file
- [ ] **DTW-08**: User can delete individual gesture templates
- [ ] **DTW-09**: User can configure which sensor axes are used for matching
- [ ] **DTW-10**: DTW matching runs at reduced rate (~22Hz) to preserve performance budget

### Position Interpolation

- [ ] **POS-01**: User can record position A by holding device and clicking "set"
- [ ] **POS-02**: User can record position B by holding device and clicking "set"
- [ ] **POS-03**: System outputs continuous 0.0-1.0 blend value between A and B
- [ ] **POS-04**: User can configure axes for interpolation (orientation-only or full 9-axis)
- [ ] **POS-05**: User can apply response curve via function object to interpolation output
- [ ] **POS-06**: User can clear recorded positions

### Visualization

- [ ] **VIZ-01**: Motion trail displays recent sensor path in 3D using Jitter
- [ ] **VIZ-02**: DTW match progress displays real-time confidence for each template
- [ ] **VIZ-03**: Position space map shows A, B, and current position in 2D
- [ ] **VIZ-04**: Gesture trigger indicators flash on predefined gesture detection
- [ ] **VIZ-05**: Recording status shows when DTW recording is active with sample count

### Dual Implementation

- [ ] **IMPL-01**: imu-gesture.maxpat wraps gesture-engine.js with clean inlet/outlet interface
- [ ] **IMPL-02**: imu-gesture-max.maxpat provides equivalent functionality using pure MAX/MSP objects
- [ ] **IMPL-03**: Both implementations share the same outlet interface (gestures, DTW matches, position, status)
- [ ] **IMPL-04**: Help patch documents gesture abstraction usage with example recipes
- [ ] **IMPL-05**: Default gesture library ships with pre-recorded common gesture templates

## Future Requirements

Deferred to future milestones. Tracked but not in current roadmap.

### Advanced Gestures

- **GEST-10**: Double-tap detection (two taps within 400ms window)
- **GEST-11**: Circle gesture detection via gyro Z integration
- **GEST-12**: Gesture following with temporal progress reporting (0-100% through gesture)

### Advanced Position

- **POS-07**: Multi-position interpolation (>2 positions with inverse-distance weighting)
- **POS-08**: Position sequence recording (path between multiple positions)

### Output Protocols

- **OUT-01**: MIDI output from gesture events (notes, CC)
- **OUT-02**: OSC output from gesture events

### Machine Learning

- **ML-01**: ML-based gesture classification (replaces DTW for large vocabularies)
- **ML-02**: Online learning (adapt templates during performance)

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| Translational position tracking | Double integration of accelerometer drifts to meters of error in <2 seconds. Physically impossible without external reference. |
| Machine learning gesture recognition | DTW sufficient for <20 gesture vocabulary. ML deferred to future milestone. |
| Modifying serial-bridge.js | Core pipeline stability. Gesture engine is a separate consumer. |
| Arduino firmware changes | Existing 9-value CSV at 114 Hz provides all data needed for gesture recognition. |
| Real-time gesture synthesis | Generating motion from templates (inverse problem) -- outside project scope. |
| Multi-board gesture correlation | Single Arduino pipeline only. |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| CORE-01 | Phase 7 | Complete |
| CORE-02 | Phase 7 | Complete |
| CORE-03 | Phase 7 | Complete |
| CORE-04 | Phase 7 | Complete |
| GEST-01 | Phase 7 | Complete |
| GEST-02 | Phase 7 | Complete |
| GEST-03 | Phase 7 | Complete |
| GEST-04 | Phase 7 | Complete |
| GEST-05 | Phase 7 | Complete |
| GEST-06 | Phase 7 | Complete |
| GEST-07 | Phase 7 | Complete |
| GEST-08 | Phase 7 | Complete |
| GEST-09 | Phase 7 | Complete |
| IMPL-01 | Phase 7 | Pending |
| DTW-01 | Phase 8 | Pending |
| DTW-02 | Phase 8 | Pending |
| DTW-03 | Phase 8 | Pending |
| DTW-04 | Phase 8 | Pending |
| DTW-05 | Phase 8 | Pending |
| DTW-06 | Phase 8 | Pending |
| DTW-07 | Phase 8 | Pending |
| DTW-08 | Phase 8 | Pending |
| DTW-09 | Phase 8 | Pending |
| DTW-10 | Phase 8 | Pending |
| POS-01 | Phase 9 | Pending |
| POS-02 | Phase 9 | Pending |
| POS-03 | Phase 9 | Pending |
| POS-04 | Phase 9 | Pending |
| POS-05 | Phase 9 | Pending |
| POS-06 | Phase 9 | Pending |
| VIZ-01 | Phase 10 | Pending |
| VIZ-02 | Phase 10 | Pending |
| VIZ-03 | Phase 10 | Pending |
| VIZ-04 | Phase 10 | Pending |
| VIZ-05 | Phase 10 | Pending |
| IMPL-02 | Phase 11 | Pending |
| IMPL-03 | Phase 11 | Pending |
| IMPL-04 | Phase 11 | Pending |
| IMPL-05 | Phase 11 | Pending |

**Coverage:**
- v1.1 requirements: 39 total
- Mapped to phases: 39
- Unmapped: 0

---
*Requirements defined: 2026-02-22*
*Last updated: 2026-02-22 after roadmap creation (traceability populated)*
