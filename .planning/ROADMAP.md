# Roadmap: Arduino-to-MAX Sensor Pipeline

## Milestones

- **v1.0 MVP** -- Phases 1-6 (shipped 2026-02-13)
- **v1.1 Gesture Recognition & Mapping** -- Phases 7-11 (in progress)

## Phases

<details>
<summary>v1.0 MVP (Phases 1-6) -- SHIPPED 2026-02-13</summary>

- [x] Phase 1: Arduino Firmware (2/2 plans) -- completed 2026-02-12
- [x] Phase 2: Serial Bridge (2/2 plans) -- completed 2026-02-12
- [x] Phase 3: Calibration (2/2 plans) -- completed 2026-02-12
- [x] Phase 4: Musical Tools (2/3 plans, 04-03 deferred to Phase 6) -- completed 2026-02-13
- [x] Phase 5: Abstraction and WiFi (3/3 plans) -- completed 2026-02-13
- [x] Phase 6: Threshold Triggers and Gap Closure (2/2 plans) -- completed 2026-02-13

</details>

### v1.1 Gesture Recognition & Mapping

- [x] **Phase 7: Core Engine and Predefined Gestures** - Separate gesture engine with activity detection and 7 predefined gesture detectors
- [ ] **Phase 8: Custom DTW Gesture Recognition** - Record, match, and persist custom gestures via Dynamic Time Warping
- [ ] **Phase 9: Position Interpolation** - Record orientation snapshots A and B, output continuous 0-1 blend
- [ ] **Phase 10: Visualization** - Motion trails, DTW match progress, position space map, and gesture indicators
- [ ] **Phase 11: Pure MAX Implementation and Polish** - Equivalent pure MAX/MSP version, help patch, and default gesture library

## Phase Details

### Phase 7: Core Engine and Predefined Gestures
**Goal**: Users can detect predefined gestures (shake, tap, flip, tilts) from live IMU data through a new gesture abstraction that runs alongside the existing sensor pipeline without modifying it
**Depends on**: v1.0 (Phase 6)
**Requirements**: CORE-01, CORE-02, CORE-03, CORE-04, GEST-01, GEST-02, GEST-03, GEST-04, GEST-05, GEST-06, GEST-07, GEST-08, GEST-09, IMPL-01
**Success Criteria** (what must be TRUE):
  1. User can drop imu-gesture.maxpat downstream of imu-sensor.maxpat and receive gesture bang events without any changes to serial-bridge.js or imu-sensor.maxpat
  2. User can shake the device and see a "shake" bang output with no false triggers while the device is stationary
  3. User can tap, flip, and tilt the device in four directions and receive correctly named bang events for each gesture type
  4. User can enable/disable individual gesture types and only enabled gestures produce output
  5. User can adjust sensitivity thresholds for each gesture type and see detection behavior change accordingly
**Plans**: 3 plans

Plans:
- [x] 07-01-PLAN.md -- Core gesture-engine.js: serial I/O, calibration, smoothing, activity gate, circular buffer, gesture handler framework
- [x] 07-02-PLAN.md -- 7 predefined gesture detectors: shake, tap, flip, and 4 directional tilts
- [x] 07-03-PLAN.md -- imu-gesture.maxpat: MAX abstraction with per-gesture UI rows and outlet interface

### Phase 8: Custom DTW Gesture Recognition
**Goal**: Users can record custom gestures and have the system recognize them in real-time with confidence scores, persisting gesture libraries across sessions
**Depends on**: Phase 7
**Requirements**: DTW-01, DTW-02, DTW-03, DTW-04, DTW-05, DTW-06, DTW-07, DTW-08, DTW-09, DTW-10
**Success Criteria** (what must be TRUE):
  1. User can record a custom gesture by performing it, record 3-5 examples, and see the system recognize that gesture during live performance with a confidence value between 0.0 and 1.0
  2. User can perform unrelated motions without the system falsely triggering any custom gesture match (null rejection works)
  3. User can save their gesture library to a JSON file, quit MAX, relaunch, load the library, and resume recognition with no re-recording
  4. User can delete individual gesture templates and configure which sensor axes are used for matching
  5. DTW matching does not cause any audible dropouts, serial data loss, or perceptible latency increase in the existing sensor pipeline
**Plans**: TBD

Plans:
- [ ] 08-01: TBD
- [ ] 08-02: TBD
- [ ] 08-03: TBD

### Phase 9: Position Interpolation
**Goal**: Users can record two orientation positions and receive a continuous 0-1 blend value as they move between them, enabling smooth parameter control from physical gesture
**Depends on**: Phase 7
**Requirements**: POS-01, POS-02, POS-03, POS-04, POS-05, POS-06
**Success Criteria** (what must be TRUE):
  1. User can record position A, record position B, and see a continuous float output that reads 0.0 at position A and 1.0 at position B
  2. User can hold the device at intermediate orientations and see proportional blend values between 0.0 and 1.0
  3. User can apply a response curve via function object to reshape the interpolation output for musical mapping
  4. User can clear recorded positions and re-record new ones without restarting the patch
**Plans**: TBD

Plans:
- [ ] 09-01: TBD
- [ ] 09-02: TBD

### Phase 10: Visualization
**Goal**: Users can see real-time visual feedback of their motion, gesture matching progress, and position interpolation state
**Depends on**: Phases 8, 9
**Requirements**: VIZ-01, VIZ-02, VIZ-03, VIZ-04, VIZ-05
**Success Criteria** (what must be TRUE):
  1. User can see a 3D motion trail in Jitter that traces the device's recent movement path and stays responsive at 114 Hz
  2. User can see real-time DTW confidence bars for each recorded template updating as they move, and see recording status with sample count when recording is active
  3. User can see a 2D map showing positions A, B, and the current device position, and see gesture trigger indicators flash when predefined gestures fire
**Plans**: TBD

Plans:
- [ ] 10-01: TBD
- [ ] 10-02: TBD

### Phase 11: Pure MAX Implementation and Polish
**Goal**: Users can choose between the Node-based and pure MAX/MSP gesture implementations with identical behavior, and have documentation and a default gesture library to get started immediately
**Depends on**: Phases 8, 9, 10
**Requirements**: IMPL-02, IMPL-03, IMPL-04, IMPL-05
**Success Criteria** (what must be TRUE):
  1. User can swap imu-gesture-max.maxpat for imu-gesture.maxpat and get identical gesture detection, DTW matching, and position interpolation behavior through the same outlet interface
  2. User can open the help patch and follow example recipes to connect gesture outputs to musical parameters within minutes
  3. User can load the default gesture library and immediately detect common gestures (shake, circle, swipe) without recording any templates
**Plans**: TBD

Plans:
- [ ] 11-01: TBD
- [ ] 11-02: TBD

## Progress

**Execution Order:** Phases 7 -> 8 -> 9 -> 10 -> 11 (Phase 9 may run in parallel with Phase 8)

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 1. Arduino Firmware | v1.0 | 2/2 | Complete | 2026-02-12 |
| 2. Serial Bridge | v1.0 | 2/2 | Complete | 2026-02-12 |
| 3. Calibration | v1.0 | 2/2 | Complete | 2026-02-12 |
| 4. Musical Tools | v1.0 | 2/3 | Complete (04-03 deferred) | 2026-02-13 |
| 5. Abstraction and WiFi | v1.0 | 3/3 | Complete | 2026-02-13 |
| 6. Threshold Triggers | v1.0 | 2/2 | Complete | 2026-02-13 |
| 7. Core Engine and Predefined Gestures | v1.1 | 3/3 | Complete | 2026-02-24 |
| 8. Custom DTW Gesture Recognition | v1.1 | 0/3 | Not started | - |
| 9. Position Interpolation | v1.1 | 0/2 | Not started | - |
| 10. Visualization | v1.1 | 0/2 | Not started | - |
| 11. Pure MAX Implementation and Polish | v1.1 | 0/2 | Not started | - |

---
*Roadmap created: 2026-02-12*
*v1.0 milestone archived: 2026-02-13*
*v1.1 milestone added: 2026-02-22*
