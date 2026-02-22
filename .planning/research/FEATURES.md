# Feature Landscape: v1.1 Gesture Recognition & Mapping

**Domain:** IMU gesture recognition, DTW-based custom gestures, position interpolation, and motion visualization for sensor-to-music pipelines
**Researched:** 2026-02-22
**Confidence:** MEDIUM-HIGH

## Table Stakes

Features users expect from any gesture recognition system built on top of an IMU pipeline. Missing any of these makes the system feel incomplete or broken.

| Feature | Why Expected | Complexity | Dependencies on v1.0 | Notes |
|---------|--------------|------------|----------------------|-------|
| Gesture segmentation (activity detection) | System must know when a gesture starts and stops. Without segmentation, DTW runs on noise or overlapping motions and produces garbage. | MEDIUM | Smoothed accel/gyro from EMA pipeline, threshold triggers with hysteresis | Use energy-based segmentation: compute Euclidean norm of acceleration (`sqrt(aX^2 + aY^2 + aZ^2)`), apply a stillness threshold (e.g. magnitude within 0.05g of 1.0g for 100ms = idle). Gesture starts when energy exceeds threshold, ends when energy drops below for a debounce window. Research shows adaptive thresholding with Bayes decision theory improves accuracy, but a fixed threshold with configurable sensitivity is the practical starting point at 114 Hz. |
| Predefined shake detection | Shake is the most universally expected gesture for any motion controller. Every IMU toolkit supports it. Users will test shake first. | LOW | Raw accel data (outlets 1-3 of imu-sensor) | Detect high-frequency, high-magnitude oscillation on any axis. Algorithm: compute acceleration magnitude, detect N peaks above threshold within a time window (e.g. 3+ peaks above 1.5g within 500ms). Use existing hysteresis threshold infrastructure. Output: bang on detection, optional intensity float (0-1 based on peak magnitude). |
| Predefined tap detection | Second most expected gesture. Physical tapping the sensor is intuitive and maps naturally to percussive triggers. | LOW | Raw accel data, threshold triggers | Detect sharp acceleration spike followed by rapid decay. Algorithm: magnitude exceeds high threshold (e.g. 2.0g) then drops below low threshold within a narrow window (50-100ms). Double-tap: two single taps within 200-400ms. The LSM6DS3 does NOT have built-in tap detection hardware (unlike CurieIMU), so this must be done in software. Use peak detection with debounce. |
| Predefined flip detection | Natural gesture for toggling states (flip the controller over). Orientation data already exists. | LOW | Pitch/roll from orientation outlets (4-5 of imu-sensor) | Detect pitch or roll crossing +/-150 degrees from rest position (near +/-180 means upside down). Use existing threshold trigger with hysteresis: "flipped" when abs(pitch) > 150, "unflipped" when abs(pitch) < 30. Output: bang on flip, bang on unflip. Already have the orientation data from Madgwick filter. |
| Custom gesture recording | Users must be able to record their own reference gestures. A library of only predefined gestures is too limiting for creative music applications. | MEDIUM | All 9 sensor values (accel, gyro, orientation), smoothing pipeline | Record a fixed-duration buffer of sensor data (1-3 seconds at 114 Hz = 114-342 samples). Use a "record" toggle: start fills a circular buffer, stop trims to the gesture segment using activity detection. Store as a template (array of N-dimensional sample vectors). Multiple recordings of the same gesture improve robustness (average or keep best 3). |
| DTW matching against recorded templates | DTW is the standard algorithm for time-series gesture recognition. It handles tempo variation (fast vs. slow performance of same gesture) which simple template correlation cannot. | HIGH | Gesture segmentation, recorded templates, smoothed sensor data | Standard DTW computes cost matrix between observed sequence and template, finds minimum-cost warping path. Distance metric: Euclidean distance across selected axes. At 114 Hz with 1-second gestures (~114 samples, 6-9 dimensions), DTW cost matrix is ~13K cells -- feasible in JavaScript but needs optimization. Use Sakoe-Chiba band constraint (e.g. band width = 10% of sequence length) to reduce computation to O(n*w) instead of O(n^2). Research shows 98.6% accuracy with 0.4ms recognition time at 100 Hz. |
| DTW confidence/distance output | Users need to know HOW WELL a gesture matched, not just whether it matched. Confidence enables downstream mapping (strong match = louder note). | LOW | DTW matching | DTW produces a raw distance cost. Normalize by path length to get per-step cost. Convert to 0-1 confidence: `confidence = max(0, 1 - (cost / rejection_threshold))`. Output both bang (matched) and float (confidence). Rejection threshold should be user-configurable. |
| Position A/B recording | Record two physical positions of the sensor and interpolate between them. This is the core of "position interpolation" and maps naturally to crossfade, morph, and blend controls. | MEDIUM | Smoothed orientation data (pitch/roll/yaw), optionally quaternion output | Record snapshot of orientation at position A and position B. Each snapshot is a 3D vector (pitch, roll, yaw) or quaternion. Store as reference points. Must handle the case where A and B are recorded at different times/sessions -- persist with `[dict]` or `[coll]`. |
| Continuous position interpolation output | The interpolated 0-1 value between recorded positions is the main continuous output. This is what drives musical parameters (crossfade, filter cutoff, mix amount). | MEDIUM | Position A/B snapshots, live orientation stream | Compute current position's proximity to A vs B. For Euler angles: project current orientation onto the A-B line in angle space, clamp to 0-1. For quaternions: use quaternion distance (angle between quaternions via dot product), compute `t = distance(current, A) / distance(A, B)`, clamp to 0-1. Quaternion approach avoids gimbal lock issues near pitch +/-90. Output at full 114 Hz rate as a continuous float stream. |
| Gesture library save/load | Recorded gestures and positions must persist across sessions. Losing recorded gestures when closing the patch is unacceptable for performance use. | MEDIUM | Custom gesture recording, position A/B recording | Save gesture templates and position snapshots to disk. Use MAX `[dict]` with `writeJSON` for structured data, or `[coll]` with `write` for simpler flat storage. File format should be human-readable (JSON) for debugging and sharing. Load on patch open. |
| Visual feedback during recording | Users need to see that recording is happening and when it captured a valid gesture. Without feedback, users wonder "did it get it?" | LOW | Custom gesture recording | During recording: animated indicator (pulsing color, progress bar). On capture: brief flash confirmation. On failed capture (too short, too still): error indicator. Use existing MAX UI patterns (toggle color, `[panel]` color changes). |

## Differentiators

Features that set this system apart from existing tools like IRCAM's MuBu/Gesture Follower. Not expected, but highly valued in a creative music context.

| Feature | Value Proposition | Complexity | Dependencies on v1.0 | Notes |
|---------|-------------------|------------|----------------------|-------|
| Predefined circle/arc gesture | Circular motion detection is creatively compelling (DJ-style scrub, orbiting filter sweeps) and rarely provided as a predefined gesture. | MEDIUM | Gyro data (yaw rate primarily), orientation data | Detect sustained rotation around one axis. Algorithm: integrate gyro Z (yaw rate) over a window, detect when cumulative rotation exceeds 270 degrees within 0.5-2 seconds. Determine direction (CW vs CCW) from sign of integrated value. Also detect partial arcs (90, 180 degrees) with separate thresholds. Output: bang + direction + arc-degrees. |
| Multi-position interpolation (more than A/B) | Place 3+ reference positions in orientation space and interpolate with inverse-distance weighting. Creates a "position space map" for complex parameter morphing. | HIGH | Position A/B infrastructure, quaternion output | Generalize A/B to N reference positions. Use inverse-distance weighting: `weight_i = 1/distance(current, pos_i)^p`, normalize weights to sum to 1. Each position can be associated with a parameter preset. This matches IRCAM's concept of "expressive timbral subspace" but implemented simply. Could use `[nodes]` object in MAX for 2D visualization of the position space. |
| Gesture following (temporal progress) | Report not just "gesture matched" but "you are 60% through the gesture." Enables continuous control during gesture execution, not just trigger at completion. | HIGH | DTW matching infrastructure | Rather than waiting for gesture completion, run a streaming variant: compare incoming samples against the template progressively. Output a 0-1 "progress" value updated every frame. This is what IRCAM's Gesture Follower does (hybrid DTW/HMM approach). Simpler approximation: sliding window DTW matching against progressive prefix slices of the template. Computationally expensive but transformative for musical expression. |
| Per-gesture axis selection | Let users choose which axes contribute to matching for each gesture. A "shake" might only care about accel magnitude, while a "circle" only cares about yaw. | LOW | DTW matching, predefined gesture detectors | Add a per-gesture configuration: bitmask or toggle array selecting which of the 9 data channels participate in the distance calculation. Reduces false positives and computation. Predefined gestures already implicitly do this (shake uses accel magnitude only). Expose the same control for custom DTW gestures. |
| Motion trail visualization | Real-time 3D trail showing recent motion history. Immediately communicates gesture shape and helps users understand what the sensor "sees." | MEDIUM | 3D viz from v1.0 (Jitter companion patch), orientation data | Use `jit.gl.mesh` with `draw_mode line_strip`. Maintain a circular buffer of recent orientation points (last 2-3 seconds = 228-342 points). Push new point, shift buffer. Color gradient from old (faded) to new (bright). This is a natural extension of the existing Jitter 3D viz. The MAV Framework from academic research uses exactly this pattern for motion capture data in MAX. |
| Gesture match progress visualization | Show a real-time bar or waveform indicating how closely the current motion matches each stored template. Provides "am I doing it right?" feedback during performance. | MEDIUM | DTW matching, gesture library | Display running DTW distance for each template as a horizontal bar (low distance = close match = green, high = red). Update at sensor rate. When distance drops below threshold, flash the matched gesture name. Use `[multislider]` for compact multi-template display. |
| Position space map visualization | 2D plot showing reference positions and current sensor position. Users see where they are in the "gesture space." | MEDIUM | Multi-position interpolation | Use MAX `[nodes]` object or custom `jit.gl.sketch` 2D rendering. Plot reference positions as labeled circles, current position as a moving dot. Lines/colors indicate interpolation weights. Inspired by the "Metasurface" mapping interface from IRCAM and the synthesizer preset interpolation concept from sound design tools. |
| Dual implementation (Node for Max + pure MAX) | Providing both allows users to choose based on their workflow: Node version for power users who want to extend in JS, pure MAX version for patchers who want to modify visually. | HIGH | Full feature set of both implementations | Node for Max version: DTW + gesture detection in `node/gesture-engine.js`, communicates via `maxAPI`. Pure MAX version: same logic built from `[coll]`, `[zl]`, `[expr]`, `[js]` or `[gen]` objects. The pure MAX version will be slower for DTW but removes the Node dependency. Target: Node version as primary (better performance for DTW computation), MAX version as lightweight alternative supporting predefined gestures + position interpolation (skip custom DTW). |
| Configurable rejection threshold | Users tune how strict gesture matching is. Too strict = never matches in live performance chaos. Too lenient = false triggers everywhere. | LOW | DTW matching | Expose a single dial (0-1 mapped to distance threshold). Lower = stricter. Provide a "calibrate threshold" mode: perform the gesture 5 times, system calculates 2x the maximum inter-recording DTW distance as the default threshold. This auto-calibration approach is common in practical DTW systems. |

## Anti-Features

Features to explicitly NOT build. These seem logical but create problems in this specific context.

| Anti-Feature | Why Requested | Why Avoid | What to Do Instead |
|--------------|---------------|-----------|-------------------|
| Machine learning gesture classification (neural net, SVM) | "ML is better than DTW for gesture recognition" | DTW achieves 98%+ accuracy for small gesture vocabularies (under 20 gestures) typical in music performance. ML requires training data collection (dozens of examples per gesture), training time, model management, and debugging opacity. DTW works with 1-3 examples. ML adds massive complexity for marginal accuracy improvement in this use case. Explicitly listed as out of scope in PROJECT.md. | Use DTW for custom gestures. Reserve ML for a future v2.0 milestone if users hit DTW limitations (large vocabularies, highly variable performers). |
| Absolute position tracking (dead reckoning) | "Track the sensor's position in 3D space" | IMU double-integration drift makes position tracking useless after 2-3 seconds without external reference (GPS, camera, UWB). The LSM6DS3 accelerometer noise integrates to meters of error within seconds. This is a fundamental physics limitation, not a software problem. | Position interpolation uses orientation (rotation), not translation (movement through space). Orientation from Madgwick filter is stable. Clearly document that "position" means "orientation pose" not "location in room." |
| Real-time DTW on Arduino | "Do gesture matching on the microcontroller for lowest latency" | ATmega4809 at 16MHz with 6KB SRAM cannot hold DTW cost matrices for meaningful gesture lengths. A 100-sample x 100-sample matrix of 6D floats requires ~240KB. The Arduino is already at capacity running Madgwick at 114 Hz. | Run DTW in Node for Max (JavaScript on desktop CPU). Latency from Arduino to Node is ~1ms over USB -- negligible compared to gesture duration (500ms-3s). |
| Continuous DTW (always matching) | "Always be looking for gestures in the stream, no segmentation needed" | Subsequence DTW (SDTW) that scans continuously is O(n*m) per frame where n = template length. With multiple templates and 114 Hz input, this becomes a significant CPU burden. More importantly, it produces constant false positives during idle/transition periods. | Use energy-based activity detection to gate DTW matching. Only run DTW when the segmenter detects active motion. This reduces computation by 80%+ (sensor is idle most of the time in music performance) and eliminates idle-period false positives. |
| Gyroscope-only gesture recognition | "Just use gyro data, accelerometer is noisy" | Gyroscope measures angular velocity, not orientation. It drifts. Gestures involving tilt, gravity direction, or absolute pose need accelerometer data. Gyroscope-only misses tap/impact gestures entirely (those are acceleration events). | Use fused data: accelerometer for impact/tilt gestures, gyroscope for rotation gestures, orientation (pitch/roll/yaw) for pose-based gestures. Let per-gesture axis selection handle which channels matter for each gesture type. |
| OSC gesture output protocol | "Output recognized gestures as OSC messages for network distribution" | Adding OSC introduces a dependency (CNMAT library issues documented in v1.0), network configuration complexity, and a second output format to maintain. The v1.0 decision to avoid OSC on Arduino still applies. | Output gestures as standard MAX messages (bang, list, symbol). Users who need OSC can trivially convert in MAX using `[udpsend]` + message formatting. Keep the gesture engine focused on recognition, not transport. |
| Template morphing/blending between gestures | "Blend gesture template A with template B to create a new gesture" | Template morphing in DTW space is not well-defined. DTW aligns sequences by warping time, but averaging warped templates produces physically meaningless motion sequences. The resulting "blended gesture" would not correspond to any performable motion. | Keep gesture templates discrete. If users want continuous control, use position interpolation (which operates in orientation space where interpolation IS well-defined). Gestures are discrete events; positions are continuous spaces. |
| Gesture recognition during calibration | "Keep recognizing gestures while recalibrating the sensor" | Calibration changes the sensor baseline, which changes the meaning of all stored gesture templates. Recognizing gestures against templates recorded with different calibration produces unreliable matches. | Disable gesture recognition during calibration. After calibration completes, optionally prompt user to re-record custom gestures. Predefined gestures (shake, tap, flip) are threshold-based and adapt to new calibration automatically. |

## Feature Dependencies

```
[Existing v1.0 Pipeline]
    +--provides--> Raw accel/gyro (outlets 1-6)
    +--provides--> Smoothed orientation (outlets 4-6 via EMA)
    +--provides--> Threshold triggers with hysteresis
    +--provides--> Quaternion output
    +--provides--> 3D Jitter visualization
    |
    +--enables--> [Gesture Segmentation (energy-based)]
    |                 |
    |                 +--enables--> [Predefined Gestures]
    |                 |                 +-- Shake detection (accel magnitude + peak counting)
    |                 |                 +-- Tap detection (accel spike + decay)
    |                 |                 +-- Flip detection (orientation threshold crossing)
    |                 |                 +-- Circle detection (gyro integration)
    |                 |
    |                 +--enables--> [Custom Gesture Recording]
    |                                   +--enables--> [DTW Template Storage]
    |                                   |                 +--enables--> [DTW Matching]
    |                                   |                                   +--enables--> [Confidence Output]
    |                                   |                                   +--enables--> [Gesture Following (progress)]
    |                                   |
    |                                   +--enables--> [Gesture Library Save/Load]
    |
    +--enables--> [Position A/B Recording]
    |                 +--enables--> [Position Interpolation (0-1 output)]
    |                 |                 +--enables--> [Multi-Position Interpolation]
    |                 |
    |                 +--enables--> [Position Space Map Visualization]
    |
    +--enables--> [Motion Trail Visualization]
    |                 +--builds-on--> Existing Jitter 3D viz
    |
    +--enables--> [Gesture Match Progress Visualization]

[Predefined Gestures] --independent of--> [DTW Custom Gestures]
    (predefined use threshold algorithms; custom uses DTW)

[Position Interpolation] --independent of--> [Gesture Recognition]
    (interpolation is continuous; gestures are discrete events)

[Dual Implementation]
    +--requires--> All features above finalized
    +-- Node version: primary, full features including DTW
    +-- MAX version: secondary, predefined gestures + position interpolation only
```

### Dependency Notes

- **Segmentation gates everything:** Without activity detection, both predefined and custom gestures produce false positives during idle periods. Build segmentation first.
- **Predefined gestures are independent of DTW:** Shake/tap/flip/circle use simple threshold/peak/integration algorithms. They do not need the DTW engine. Build these first for quick wins.
- **Position interpolation is fully independent:** It operates on orientation snapshots, not gesture sequences. Can be developed in parallel with gesture recognition.
- **Visualization depends on the features it displays:** Motion trails need the orientation buffer; match progress needs DTW scores; position map needs position snapshots. Build features first, visualization second.
- **Dual implementation is the capstone:** Finalize all features in Node for Max first, then port the subset to pure MAX. Do not develop both simultaneously.
- **DTW requires segmentation + recording:** The DTW engine cannot be tested without recorded templates and segmented input. Build the recording pipeline before the matching engine.

## MVP Recommendation

### Phase 1: Predefined Gestures + Position Interpolation

Build the highest-value, lowest-complexity features first.

Prioritize:
1. **Gesture segmentation** (energy-based activity detection) -- gates all gesture features, reuses existing threshold infrastructure
2. **Shake detection** -- simplest predefined gesture, highest user expectation, validates the segmentation pipeline
3. **Tap detection** -- second simplest, validates impact detection path
4. **Flip detection** -- validates orientation-based gesture path
5. **Position A/B recording + interpolation** -- independent track, delivers continuous control output immediately

Defer: Circle detection (needs gyro integration testing), DTW engine, visualization, dual implementation

### Phase 2: Custom DTW Gestures

6. **Custom gesture recording** -- record reference templates with visual feedback
7. **DTW matching engine** -- core algorithm with Sakoe-Chiba band optimization
8. **Confidence output** -- normalized distance score
9. **Gesture library save/load** -- persistence across sessions
10. **Rejection threshold configuration** -- tuning for live performance reliability

Defer: Gesture following (progress), multi-position interpolation

### Phase 3: Visualization + Advanced Features

11. **Motion trail visualization** -- extends existing Jitter companion
12. **Gesture match progress visualization** -- multislider DTW scores
13. **Circle/arc gesture** -- completes predefined gesture library
14. **Multi-position interpolation** -- extends A/B to N positions
15. **Position space map visualization** -- 2D plot of position space
16. **Per-gesture axis selection** -- fine-tuning for custom gestures

Defer: Gesture following (progress tracking), dual implementation

### Phase 4: Dual Implementation + Polish

17. **Gesture following (temporal progress)** -- streaming DTW progress output
18. **Pure MAX implementation** -- predefined gestures + position interpolation only (no DTW)
19. **Configurable rejection threshold auto-calibration** -- record 5x, compute threshold
20. **Help patches and documentation** for gesture abstractions

## Feature Prioritization Matrix

| Feature | User Value | Complexity | Priority | Phase |
|---------|------------|------------|----------|-------|
| Gesture segmentation (activity detection) | HIGH | MEDIUM | P1 | 1 |
| Shake detection | HIGH | LOW | P1 | 1 |
| Tap detection | HIGH | LOW | P1 | 1 |
| Flip detection | HIGH | LOW | P1 | 1 |
| Position A/B recording + interpolation | HIGH | MEDIUM | P1 | 1 |
| Visual feedback during recording | MEDIUM | LOW | P1 | 1 |
| Custom gesture recording | HIGH | MEDIUM | P2 | 2 |
| DTW matching engine | HIGH | HIGH | P2 | 2 |
| DTW confidence output | MEDIUM | LOW | P2 | 2 |
| Gesture library save/load | HIGH | MEDIUM | P2 | 2 |
| Rejection threshold configuration | MEDIUM | LOW | P2 | 2 |
| Motion trail visualization | MEDIUM | MEDIUM | P3 | 3 |
| Match progress visualization | MEDIUM | MEDIUM | P3 | 3 |
| Circle/arc gesture detection | MEDIUM | MEDIUM | P3 | 3 |
| Multi-position interpolation | MEDIUM | HIGH | P3 | 3 |
| Position space map visualization | LOW | MEDIUM | P3 | 3 |
| Per-gesture axis selection | LOW | LOW | P3 | 3 |
| Gesture following (progress) | MEDIUM | HIGH | P4 | 4 |
| Pure MAX implementation | MEDIUM | HIGH | P4 | 4 |
| Rejection threshold auto-calibration | LOW | LOW | P4 | 4 |

**Priority key:**
- P1: Must have -- delivers immediate value, validates the pipeline
- P2: Core DTW -- the main differentiating capability of v1.1
- P3: Visual + advanced -- polish and power-user features
- P4: Capstone -- dual implementation and streaming progress

## Existing Ecosystem Reference

### IRCAM MuBu / Gesture Follower
The closest existing tool. MuBu provides DTW, HMM, KNN, GMM, PCA, and Gesture Following in MAX via externals. It is the academic gold standard but: (a) requires IRCAM Forum account, (b) complex API with steep learning curve, (c) designed for researchers not musicians, (d) does not integrate with a specific IMU pipeline. Our system is simpler, opinionated, and tightly integrated with the existing imu-sensor abstraction.

### JavaScript DTW Libraries (npm)
- `dtw` (npm): Minimal, MIT license, dormant (5 commits total). API: `new DTW()`, `.compute(s,t)`, `.path()`. No band constraint support.
- `dynamic-time-warping` (npm): Slightly more active. Custom distance function support. Also minimal.
- `dynamic-time-warping-2` (npm): Modern fork of above.

**Recommendation:** Implement DTW from scratch in the gesture engine script. The algorithm is ~50 lines of JavaScript. Custom implementation allows adding Sakoe-Chiba band constraint, multi-dimensional distance, and streaming updates -- none of which the npm packages support. Avoids an npm dependency for a trivial algorithm.

### uWave (Academic Reference)
Accelerometer-based personalized gesture recognition system using DTW with quantization. Achieved 98.6% accuracy with single training example. Key insight: quantize acceleration vectors to reduce computation. Worth studying for the quantization optimization but the full system is overkill for our use case.

## Sources

- [IMU Sensor-Based Hand Gesture Recognition for HMI (Kim et al., 2019)](https://www.mdpi.com/1424-8220/19/18/3827) -- DTW accuracy benchmarks, 98.6% with 0.4ms recognition time
- [MATLAB: Gesture Recognition Using IMUs](https://www.mathworks.com/help/nav/ug/gesture-recognition-using-inertial-measurement-units.html) -- Quaternion DTW, segmentation patterns
- [Head Gesture Recognition with DTW (2024)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11122069/) -- DTW barycenter averaging, 97.5% accuracy
- [uWave: Accelerometer-based Gesture Recognition](https://www.yecl.org/publications/liu09percom.pdf) -- Single-template DTW, quantization optimization
- [IRCAM MuBu for Max](https://ircam-ismm.github.io/max-msp/mubu.html) -- Gesture Follower, XMM, DTW/HMM/KNN externals for MAX
- [IRCAM Gesture Follower](https://ismm.ircam.fr/gesture-follower/) -- Real-time gesture following with temporal progress
- [Real-time DTW for MAX/MSP and Pure Data (Bevilacqua et al.)](https://www.researchgate.net/publication/228987911_Real-time_DTW-based_gesture_recognition_external_object_for_MAXMSP_and_puredata) -- Academic precedent for DTW in MAX
- [MetaBow: NIME 2025](https://nime.org/proceedings/2025/nime2025_62.pdf) -- Recent IMU gesture mapping for musical performance
- [Arduino Tap Detection (CurieIMU)](https://www.arduino.cc/en/Tutorial/Genuino101CurieIMUTapDetect/) -- Hardware tap detection reference (different chip but same algorithm concept)
- [NXP AN3919: Tap Detection](https://www.nxp.com/docs/en/application-note/AN3919.pdf) -- Detailed tap detection algorithm with thresholds
- [MMA Framework: Motion Data in Max/Jitter](https://www.academia.edu/20910357/The_MAV_Framework_Working_with_3D_Motion_Data_in_Max_MSP_Jitter) -- Motion trail visualization patterns
- [jit.gl.mesh Reference](https://docs.cycling74.com/reference/jit.gl.mesh) -- line_strip mode for trail rendering
- [Cycling '74: jit.gl.mesh tutorial](https://cycling74.com/tutorials/my-favorite-object-jit%C2%B7gl%C2%B7mesh-1) -- Practical mesh usage patterns
- [dtw npm package](https://github.com/langholz/dtw) -- JavaScript DTW implementation (reviewed, too minimal)
- [dynamic-time-warping npm](https://www.npmjs.com/package/dynamic-time-warping) -- Alternative JS DTW (reviewed, adequate but no band constraint)
- [SensorWiki: Mapping References](https://sensorwiki.org/isidm/mapping/introductory_references) -- Comprehensive gesture-to-music mapping bibliography
- [IRCAM: Gestural Control of Music (Wanderley)](http://recherche.ircam.fr/equipes/analyse-synthese/wanderle/pub/kassel/) -- Foundational gesture mapping strategies
- [Gesture Segmentation with Adaptive Thresholds](https://link.springer.com/article/10.1007/s11042-014-2111-2) -- Bayes decision theory for threshold selection
- [Wireless IMUs in Performing Arts (2025)](https://www.mdpi.com/1424-8220/25/19/6188) -- Recent survey of IMU usage in music/dance performance

---
*Feature research for: v1.1 Gesture Recognition & Mapping milestone*
*Builds on: v1.0 MVP pipeline (shipped 2026-02-13)*
*Researched: 2026-02-22*
