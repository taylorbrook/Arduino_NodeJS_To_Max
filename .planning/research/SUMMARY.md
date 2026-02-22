# Project Research Summary

**Project:** Arduino-to-MAX Sensor Pipeline — v1.1 Gesture Recognition & Mapping
**Domain:** Real-time IMU gesture recognition, DTW-based custom gesture matching, position interpolation, and motion visualization for sensor-to-music pipelines
**Researched:** 2026-02-22
**Confidence:** MEDIUM-HIGH

## Executive Summary

This milestone adds gesture recognition and position interpolation on top of a stable v1.0 IMU pipeline (Arduino LSM6DS3 at 114 Hz over USB serial into MAX/MSP via Node for Max). The v1.1 work is entirely additive — serial-bridge.js, imu-sensor.maxpat, and Arduino firmware must not change. Research confirms the correct approach: (1) a separate Node for Max script (`gesture-engine.js`) that receives smoothed data forwarded from MAX via patch cables, (2) threshold-based state machines for predefined gestures (shake, tap, flip, circle), (3) a custom ~40-line DTW implementation with Sakoe-Chiba band constraint for custom gestures, and (4) orientation-based position interpolation using pitch/roll/yaw — NOT translational position from accelerometer double integration. Zero new npm packages are needed; ml-lib from the Max Package Manager is an optional path for a pure-MAX DTW implementation, with a `js` object fallback ensuring it works regardless.

The recommended build order is critical: gesture segmentation (motion detection) must come first because it gates everything else — without knowing when a gesture starts and ends, DTW produces garbage on noise and predefined detectors trigger on ambient motion. Predefined gestures and position interpolation can then be built quickly as independent tracks before investing in the full DTW pipeline. A key subtlety on data routing: predefined gesture detectors (tap, shake) must receive **calibrated pre-smoothing** data because EMA smoothing attenuates the sharp transients these detectors rely on; DTW custom gestures should use **smoothed** data for consistent template matching. The dual implementation (pure MAX version) is the capstone and should be built last, treating the Node version as its behavioral specification.

The top risks are all avoidable with correct scoping upfront. Position interpolation must be framed as orientation interpolation before any code is written — translational position from IMU alone is physically unusable beyond 1-2 seconds (quadratic error accumulation). DTW must never block the serial event loop (run async every 5th frame, not every sample). Null rejection requires per-class thresholds computed from training statistics, not a single global threshold. Research confidence is high across all four areas; the main uncertainty is ml-lib's maintenance status on the current Max version and Apple Silicon, which the `js` object fallback handles completely.

---

## Key Findings

### Recommended Stack

The v1.1 stack requires **zero new npm packages**. All gesture recognition, DTW, and position interpolation logic is implemented in custom JavaScript (~500 lines) in a new `gesture-engine.js` script. The two JavaScript DTW packages on npm (`dynamic-time-warping` v1.0.0 last updated 2016; `dtw` v0.0.3 last updated 2013) are both unmaintained and lack multivariate support — implementing DTW from scratch is simpler, more capable, and zero-dependency risk. On the MAX side, all required objects are built-in. The one optional external is **ml-lib** (Max Package Manager) providing `ml.dtw`; availability on Apple Silicon needs verification, but the `js` object fallback ensures this never blocks implementation.

**Core technologies:**
- **gesture-engine.js (new Node for Max script):** Separate from serial-bridge.js — predefined gesture state machines, DTW engine, position interpolation, JSON template persistence. ~500 lines, pure JS.
- **Custom DTW (~40 lines, pure JS):** Sakoe-Chiba band constraint, multivariate Euclidean distance across configurable axes. No npm dependency. Standard textbook algorithm with O(N*W) complexity at window W.
- **js object (MAX built-in):** Fallback DTW in ES5 SpiderMonkey for the pure-MAX implementation; runs in Max scheduler thread. Note: no `let`, `const`, or arrow functions.
- **dict / coll (MAX built-ins):** Gesture template storage and recording buffers with JSON file persistence.
- **jit.gl.mesh + jit.matrix (Jitter built-ins):** Motion trail rendering using ring buffer of position vertices — `@draw_mode line_strip`.
- **ml-lib (Max Package Manager, OPTIONAL):** `ml.dtw` external for pure-MAX version; MEDIUM confidence on availability (Apple Silicon, current Max version). Not required — js fallback covers this.

### Expected Features

**Must have (table stakes):**
- Gesture segmentation (energy-based activity detection) — gates all gesture features; without it, DTW and predefined detectors fail on continuous streams
- Shake detection — highest user expectation; validates the segmentation and predefined pipeline
- Tap detection (single and double-tap) — validates impact detection path; LSM6DS3 has no hardware tap detection, must be done in software
- Flip detection — validates orientation-threshold gesture path
- Position A/B recording and continuous 0-1 interpolation output — independent track, delivers immediate continuous control value
- Custom gesture recording with visual feedback — users must know recording is happening
- DTW matching with confidence output (normalized 0-1) — core differentiating capability
- Gesture library save/load — templates must persist across sessions or the feature is unusable in performance

**Should have (competitive / differentiators):**
- Circle/arc gesture detection (gyro Z integration path)
- Motion trail visualization (3D Jitter trail extending existing imu-sensor-3dviz companion)
- Gesture match progress visualization (multislider DTW score bars per template)
- Per-gesture axis selection (reduce dimensionality, improve accuracy)
- Configurable rejection threshold with auto-calibration mode (record 5x, compute mean + 3σ)
- Multi-position interpolation (N reference positions, inverse-distance weighting)

**Defer (v2+):**
- ML-based gesture classification — DTW achieves 98%+ for small vocabularies; ML adds massive complexity for marginal gain in music performance context
- Gesture following (temporal progress — streaming "you are 60% through this gesture") — high value, high complexity; needs full DTW pipeline stable first
- OSC gesture output — users can trivially convert MAX messages to OSC with `[udpsend]`

### Architecture Approach

The v1.1 architecture follows the existing consumer-downstream pattern established by imu-sensor-3dviz.maxpat: the new `imu-gesture.maxpat` abstraction sits downstream of imu-sensor.maxpat, receiving smoothed sensor data through patch cables and wrapping `gesture-engine.js` (separate node.script). The gesture engine outputs tagged messages which are routed to 5 abstraction outlets. A parallel pure-MAX implementation (`imu-gesture-max.maxpat`) provides the same outlet interface without Node dependency. A visualization companion (`imu-gesture-viz.maxpat`) handles motion trails, match progress, and position space maps.

**Data routing decision (critical):** Predefined gesture detectors receive `cal_accel`/`cal_gyro` (imu-sensor outlets 4-6, calibrated pre-smoothing); DTW receives `smooth_accel`/`smooth_gyro`/`smooth_orient` (outlets 7-9). These require different wiring inside imu-gesture.maxpat.

**Major components:**
1. **gesture-engine.js** — All gesture logic: sliding window buffer, predefined detectors, DTW engine, position interpolation, JSON template persistence. Three separate maxAPI handlers (smooth_accel, smooth_gyro, smooth_orient); smooth_orient arrival triggers per-frame processing.
2. **imu-gesture.maxpat** — MAX abstraction wrapping gesture-engine.js. 5 outlets: predefined gestures (symbol), DTW matches (name+confidence list), position blend (float 0-1), status messages, DTW progress (float 0-1).
3. **imu-gesture-max.maxpat** — Pure MAX/MSP implementation using ml.dtw or js fallback + native MAX objects. Same outlet interface as imu-gesture.maxpat.
4. **imu-gesture-viz.maxpat** — Visualization companion: Jitter motion trails (jit.gl.mesh ring buffer, fixed 256-point max), multislider DTW score bars, 2D position space map.

### Critical Pitfalls

1. **Gesture segmentation failure** — DTW on a continuous stream always fails without explicit activity gating. Must implement energy-based motion detection (acceleration magnitude threshold) as a separate stage before any DTW or predefined gesture logic. Fix: IDLE -> MOTION_DETECTED -> RECORDING -> MATCHING state machine. Without this, false triggers occur during ambient motion and DTW fires on noise constantly. Address in Phase 1.

2. **Position interpolation via double integration** — Translational position from accelerometer double integration drifts to meters of error within seconds (quadratic error accumulation from bias). This is a hard physics constraint, not a software bug. "Position interpolation" must mean orientation interpolation (pitch/roll/yaw from Madgwick filter). Scope this correctly before any code is written — building the wrong model wastes an entire phase with no recovery path. Address in Phase 3 scope definition.

3. **DTW blocking the serial event loop** — Running DTW synchronously in the sensor data callback blocks Node's event loop, causing serial buffer overflow and data loss from the existing pipeline. At 114 Hz, continuous blocking causes data loss within seconds. Fix: run DTW asynchronously (setImmediate/process.nextTick), match every 5th frame not every sample, use Sakoe-Chiba band. Address as architectural constraint in Phase 2.

4. **Smoothing pipeline attenuating transient gesture signals** — EMA-smoothed data attenuates the sharp acceleration spikes that shake/tap detection depends on. If gesture detectors are wired to smoothed outlets, they break whenever users adjust smoothing. Fix: wire predefined gesture detectors to `cal_accel`/`cal_gyro` outlets (calibrated, pre-smoothing). Address in Phase 1 data routing.

5. **DTW false positives from missing null rejection** — DTW always returns a distance value; without per-class rejection thresholds, every motion matches the closest template. A single global threshold does not work — each gesture class has different distance distributions. Fix: compute per-class thresholds from training statistics (mean + sigma * rejection_coefficient, GRT approach); require minimum 3 training examples; implement 500ms cooldown after match. Address in Phase 2 design.

---

## Implications for Roadmap

Based on research, suggested phase structure:

### Phase 1: Core Engine + Predefined Gestures
**Rationale:** Gesture segmentation is a hard prerequisite for everything else — it gates both predefined gesture detection and DTW matching. Predefined gestures are the highest-value, lowest-complexity features that also validate the end-to-end data pipeline before investing in the complex DTW engine. Establishing the separate script architecture here also enforces the serial-bridge.js non-modification constraint from the start.
**Delivers:** gesture-engine.js with sliding window buffer, energy-based activity segmentation (motion detection state machine), shake/tap/flip predefined detectors, correct data routing from cal outlets, and imu-gesture.maxpat abstraction wrapping the script end-to-end (Arduino to output bang).
**Addresses features:** gesture segmentation, shake detection, tap detection, flip detection, visual recording feedback
**Avoids pitfalls:** serial-bridge.js modification, smoothing vs. transient detection conflict, gravity contamination, segmentation failure before DTW investment

### Phase 2: Custom DTW Gesture Recognition
**Rationale:** DTW builds directly on the segmentation infrastructure from Phase 1. The sliding window buffer is already in place; DTW adds the recording pipeline, matching engine, and null rejection on top. DTW is the core differentiating capability of v1.1 and is the highest-complexity feature — it deserves its own dedicated phase.
**Delivers:** Custom gesture recording with visual feedback, DTW matching engine with Sakoe-Chiba band, per-class null rejection thresholds (GRT approach), confidence output (normalized 0-1), gesture library JSON save/load, configurable sensitivity.
**Addresses features:** custom gesture recording, DTW matching, confidence output, gesture library persistence, rejection threshold configuration
**Avoids pitfalls:** DTW blocking event loop (async design from the start), false positives (null rejection designed in, not bolted on), missing template metadata

### Phase 3: Position Interpolation
**Rationale:** Fully independent of DTW — position interpolation operates on orientation snapshots, not gesture sequences. It reuses the same data forwarding pattern from Phase 1 and can share gesture-engine.js infrastructure. Placed after Phase 2 to avoid competing focus, but Phase 3 could start in parallel with Phase 2 if bandwidth allows after Phase 1.
**Delivers:** Position A/B recording (averaged orientation snapshots over ~175ms), continuous 0-1 blend output at 114 Hz, axis selection (orientation-only vs. full 9-axis), yaw wrap-around handling.
**Addresses features:** position A/B recording, continuous position interpolation output
**Avoids pitfalls:** double integration drift (must be explicitly scoped as orientation interpolation before any code), Euler angle discontinuity at yaw 0/360 boundary

### Phase 4: Visualization and Advanced Features
**Rationale:** Visualization depends on output data from Phases 2-3. Motion trail needs accumulated orientation buffer; DTW match progress needs the dtw_progress outlet; position space map needs position snapshots. Building visualization after features are stable avoids rework when output formats change. Advanced features (circle, multi-position, per-axis selection) are grouped here as polish.
**Delivers:** imu-gesture-viz.maxpat with 3D Jitter motion trails (jit.gl.mesh ring buffer, fixed 256-point max), multislider DTW score bars, 2D position space map, circle/arc gesture detection, per-gesture axis selection, multi-position interpolation.
**Addresses features:** motion trail visualization, match progress visualization, circle detection, multi-position interpolation, position space map, per-gesture axis selection
**Avoids pitfalls:** Jitter visualization memory growth (fixed ring buffer, not unbounded array), jit.gl.sketch per-point slowdown above 200 points (use jit.gl.mesh instead)

### Phase 5: Pure MAX Implementation + Polish
**Rationale:** The Node version is the specification. Building the pure-MAX version last means it can be validated against known-correct Node behavior. Help patch and documentation belong here because the interface must be stable before documenting it.
**Delivers:** imu-gesture-max.maxpat (predefined gestures via native MAX objects; DTW via ml.dtw or js fallback; position interpolation via vexpr), imu-gesture.maxhelp with recipes, default gesture library file.
**Addresses features:** dual implementation (pure-MAX path), help patch, documentation, gesture following (temporal progress), rejection threshold auto-calibration
**Avoids pitfalls:** dual implementation divergence (verify identical results against Node version for same input data)

### Phase Ordering Rationale

- **Segmentation before everything:** Research consensus (GRT, uWave, academic literature) is unambiguous — without segmentation, all gesture recognition fails on live continuous streams. This enforces Phase 1 priority.
- **Predefined gestures before DTW:** Predefined gestures are independent of DTW (threshold vs. cost matrix) and validate the data pipeline cheaply. They also produce the sliding window buffer that Phase 2 DTW requires.
- **Position interpolation as its own phase:** Scope risk (orientation vs. translation) warrants explicit phase-level attention. Independent of DTW but reuses Phase 1 data flow.
- **Visualization last among feature phases:** Display-only; never gates another feature. Premature visualization investment is wasted if feature output formats change.
- **Pure MAX last:** Node implementation acts as ground truth for behavioral correctness. Porting requires Node behavior to be stable and tested.

### Research Flags

Phases likely needing deeper research during planning:
- **Phase 2 (DTW):** Async DTW pattern in node.script needs validation — setImmediate behavior in the Node for Max process model is not fully documented in official sources. Sakoe-Chiba window width (10-15% recommendation) needs empirical tuning for this specific gesture vocabulary and 114 Hz sample rate. Per-class threshold calibration strategy needs a concrete implementation plan.
- **Phase 3 (position interpolation):** Whether Euler-angle dot product is sufficient or quaternion distance is required for correct behavior at gimbal lock angles (pitch near ±90°) needs evaluation given the performance context.
- **Phase 5 (ml-lib):** ml-lib availability on Apple Silicon and current Max version needs verification before committing to it as the pure-MAX DTW path. The `js` fallback must be prototyped and benchmarked (ES5 SpiderMonkey vs. V8 — potential 5-10x speed difference).

Phases with standard patterns (skip research-phase):
- **Phase 1 (predefined gestures):** Shake/tap/flip algorithms are thoroughly documented from IMU datasheets (NXP AN3919) and open-source implementations. Data forwarding pattern mirrors existing imu-sensor-3dviz.maxpat. No unknown territory.
- **Phase 3 (position interpolation core math):** Linear projection (dot product onto A-B vector) is standard geometry — ~20 lines. Well-documented, no library needed.
- **Phase 4 (Jitter motion trails):** jit.gl.mesh with ring buffer matrix is well-documented in official Jitter tutorials; codebase already uses Jitter context from imu-sensor-3dviz.maxpat.

---

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | Zero new npm packages. DTW is textbook algorithm (~40 lines). All MAX objects are built-in and documented. ml-lib uncertainty is mitigated by js fallback. |
| Features | HIGH | Feature set grounded in academic literature (GRT, uWave, IRCAM Gesture Follower), existing tools (MuBu as benchmark), and direct mapping to v1.0 capabilities. Priority order reflects clear dependency chain. FEATURES.md includes concrete complexity ratings and phase assignments. |
| Architecture | HIGH | Separate script pattern mirrors v1.0's imu-sensor-3dviz approach (proven). Multiple node.script instances verified supported (each is independent OS process). Data forwarding via patch cables is standard MAX pattern. Performance budget shows ~15% CPU utilization with headroom. |
| Pitfalls | HIGH | Top pitfalls (segmentation, drift, event loop blocking, smoothing conflict, gravity) are well-documented in academic literature and IMU toolkit documentation. Prevention strategies are concrete, testable, and have verified recovery paths if encountered. |

**Overall confidence:** HIGH

### Gaps to Address

- **Smoothed vs. calibrated data routing in imu-gesture.maxpat:** Predefined gesture detectors need `cal_accel`/`cal_gyro` (pre-smoothing); DTW needs `smooth_*`. The imu-gesture.maxpat inlet design must accommodate both cleanly. This is a MAX patch design detail, not an architectural blocker, but needs explicit attention in Phase 1.
- **Gesture segmentation energy threshold values:** `REST_THRESHOLD` (magnitude < 1.1g for 10 samples) and `MOTION_THRESHOLD` (magnitude > 1.3g) are starting estimates; actual values need empirical measurement with the physical LSM6DS3 at 114 Hz during normal handling.
- **ml-lib availability on Apple Silicon:** ml-lib may not have ARM64 binaries for macOS. The `js` fallback must be fully implemented and benchmarked in Phase 5 before committing to ml-lib as the primary pure-MAX DTW path.
- **Quaternion vs. Euler angles for position interpolation:** Research recommends quaternion dot product for correctness near gimbal lock (pitch ±90°), but the existing pipeline primarily exposes Euler angles. Evaluate whether this edge case matters for typical music performance orientations or if Euler-angle dot product with clamping is sufficient.
- **DTW rejection threshold calibration:** Per-class thresholds (mean + 3σ of intra-class distances) require a minimum of 3-5 training examples. Document this clearly as a user requirement — single-example recording will produce unreliable matching.

---

## Sources

### Primary (HIGH confidence)
- [DTW Wikipedia](https://en.wikipedia.org/wiki/Dynamic_time_warping) — Algorithm reference, Sakoe-Chiba band, O(NM) complexity
- [GRT DTW Implementation (GitHub)](https://github.com/nickgillian/grt/blob/master/GRT/ClassificationModules/DTW/DTW.h) — Null rejection coefficient, per-class thresholds, minimum training examples
- [GRT DTW Wiki](https://github.com/nickgillian/grt/wiki/dtw) — Rejection threshold formula: mean + sigma * coefficient
- [uWave: Accelerometer-based Gesture Recognition](https://www.yecl.org/publications/liu09percom.pdf) — Single-template DTW, 98.6% accuracy
- [Node for Max - node.script Reference (Cycling74)](https://docs.cycling74.com/max8/refpages/node.script) — Multiple instances, separate OS processes
- [MAX js Object Reference (Cycling74)](https://docs.cycling74.com/max7/refpages/js) — ES5 SpiderMonkey, scheduler thread
- [MAX dict Reference (Cycling74)](https://docs.cycling74.com/legacy/max8/refpages/dict) — JSON read/write, @embed persistence
- [jit.gl.mesh Reference (Cycling74)](https://docs.cycling74.com/legacy/max8/refpages/jit.gl.mesh) — draw_mode line_strip for motion trails
- [CH Robotics: Accelerometer Position Estimation](https://www.chrobotics.com/library/accel-position-velocity) — Double integration drift, practical IMU limitations
- [IMU Position Estimation (arxiv)](https://arxiv.org/pdf/1311.4572) — Constant acceleration error produces quadratic position error
- [NXP AN3919: Tap Detection](https://www.nxp.com/docs/en/application-note/AN3919.pdf) — Threshold algorithms for hardware-independent tap detection

### Secondary (MEDIUM confidence)
- [IMU Sensor-Based Hand Gesture Recognition (MDPI Sensors, Kim et al. 2019)](https://www.mdpi.com/1424-8220/19/18/3827) — DTW accuracy benchmarks: 98.6% at 0.4ms recognition; gravity separation with high-pass Butterworth
- [Real-time DTW for MAX/MSP and PureData (Bevilacqua et al.)](https://www.researchgate.net/publication/228987911_Real-time_DTW-based_gesture_recognition_external_object_for_MAXMSP_and_puredata) — DTW in MAX context, segmentation approaches, multi-grid DTW
- [ml-lib for Max (GitHub)](https://github.com/irllabs/ml-lib) — ml.dtw external, GRT-based, Max Package Manager availability
- [IRCAM MuBu for Max](https://ircam-ismm.github.io/max-msp/mubu.html) — Professional benchmark; deliberately ruled out as too heavyweight for v1.1
- [Head Gesture Recognition with DTW (PMC 2024)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11122069/) — DTW barycenter averaging, multi-template training, 97.5% accuracy
- [MetaBow: NIME 2025](https://nime.org/proceedings/2025/nime2025_62.pdf) — Recent IMU gesture mapping for musical performance
- [Wireless IMUs in Performing Arts (MDPI 2025)](https://www.mdpi.com/1424-8220/25/19/6188) — IMU usage survey in music/dance performance
- [Shake Detection (JavaScript)](https://slicker.me/javascript/shake/shake.htm) — Magnitude + debounce pattern
- [MAV Framework: Motion Data in Max/Jitter](https://www.academia.edu/20910357/The_MAV_Framework_Working_with_3D_Motion_Data_in_Max_MSP_Jitter) — Motion trail visualization patterns

### Tertiary (LOW confidence)
- [Gesture Variation Follower (GVF for MaxMSP)](https://github.com/bcaramiaux/ofxGVF) — Streaming gesture following alternative to DTW; scope is v2.0+ if needed
- [Unsupervised Gesture Segmentation by Motion Detection (IEEE)](https://ieeexplore.ieee.org/document/7576613/) — Threshold-based segmentation of continuous IMU streams

---
*Research completed: 2026-02-22*
*Milestone: v1.1 Gesture Recognition & Mapping*
*Ready for roadmap: yes*
