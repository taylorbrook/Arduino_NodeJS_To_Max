# Pitfalls Research

**Domain:** Gesture recognition (DTW), position interpolation, and motion visualization added to existing real-time IMU sensor pipeline
**Researched:** 2026-02-22
**Confidence:** MEDIUM-HIGH (DTW pitfalls well-documented in academic literature and GRT toolkit; Node/MAX integration pitfalls based on v1.0 experience and official docs; position interpolation pitfalls verified by physics constraints)

## Critical Pitfalls

### Pitfall 1: Gesture Segmentation -- Not Knowing When a Gesture Starts and Ends

**What goes wrong:**
DTW compares two complete time series. But the incoming IMU data is a continuous stream at 114 Hz with no markers indicating "gesture starts here" or "gesture ends here." Without proper segmentation, DTW either never triggers (comparing against the entire infinite stream) or triggers constantly on noise (sliding window matches partial patterns in ambient motion). This is the single hardest problem in real-time DTW gesture recognition and the most common reason implementations fail.

**Why it happens:**
Developers implement DTW distance computation correctly, then realize they have no way to feed it bounded sequences from a continuous stream. The academic DTW literature often assumes pre-segmented data. When developers encounter continuous streams, the naive solution is a fixed-size sliding window, but gesture duration varies (a quick shake is 0.3s, a slow circle is 2s), so no single window size works. Developers then spend weeks tweaking window sizes and thresholds without understanding that segmentation is a separate problem from matching.

**How to avoid:**
- Implement explicit motion detection as a separate stage before DTW. Use acceleration magnitude thresholding: when `sqrt(ax^2 + ay^2 + az^2)` exceeds a "motion" threshold (e.g., 1.3g) after a period of stillness (below 1.1g), mark gesture start. When magnitude returns below threshold for N consecutive samples (e.g., 10 samples = ~88ms at 114 Hz), mark gesture end. Only then pass the captured segment to DTW.
- Use a minimum and maximum gesture duration constraint. Discard segments shorter than 0.2s (noise/bumps) or longer than 3s (not a gesture, just sustained movement).
- The GRT (Gesture Recognition Toolkit) uses this approach: a dead-reckoning state machine with IDLE -> MOTION_DETECTED -> RECORDING -> MATCHING states, and it works.
- For predefined gestures (shake, flip, tap), skip DTW entirely and use threshold-based state machines. DTW is for custom/complex gestures only.

**Warning signs:**
- DTW matching works perfectly on pre-recorded test data but fails on live data.
- System fires gesture events during normal handling/repositioning of the device.
- Gesture detection requires the user to hold perfectly still before and after the gesture.
- Recognition accuracy drops when gesture speed varies.

**Phase to address:**
Phase 1 (Predefined Gestures) should establish the motion detection/segmentation framework. Phase 2 (DTW Custom Gestures) builds on this segmentation for template matching.

**Confidence:** HIGH -- gesture segmentation is the most-discussed challenge in DTW gesture recognition literature; the GRT, uWave, and num.dtw implementations all address it explicitly.

---

### Pitfall 2: DTW Computational Cost Blowing the Real-Time Budget

**What goes wrong:**
Standard DTW has O(N*M) time and space complexity where N and M are the lengths of the two sequences. With 9-dimensional sensor data (aX/aY/aZ, gX/gY/gZ, pitch/roll/yaw) at 114 Hz, a 2-second gesture template is 228 samples. Matching one incoming segment against one template requires a 228x228 = 51,984-cell cost matrix computation with 9-dimensional distance calculations per cell. Matching against K templates multiplies this by K. If done in the real-time data callback, it blocks the Node for Max process, stalling all serial data processing and causing data loss in the existing pipeline.

**Why it happens:**
Developers implement DTW in the serial data handler (or directly downstream of `maxAPI.outlet`) because "that's where the data is." DTW computation then blocks the event loop during matching, causing serial buffer overflow. The `serialport` ReadlineParser buffers incoming data, but if the Node event loop is blocked for more than ~50ms, the serial buffer starts to fill. At 114 Hz with ~50-byte lines, that is about 5.7 KB/sec -- the 64KB default Node buffer fills in ~11 seconds of blocked processing, after which data is lost.

**How to avoid:**
- Never run DTW in the serial data callback. The existing `serial-bridge.js` must remain untouched (per project constraint). The new gesture recognition Node script must receive data from MAX via `maxAPI.addHandler()`, not by tapping into the serial stream directly.
- Use Sakoe-Chiba band constraint to limit the DTW warping path width. A band width of 10-15% of sequence length reduces computation by ~70-80% with minimal accuracy loss for gesture recognition.
- Reduce dimensionality before DTW: match on 3 axes (e.g., accel magnitude + pitch + roll) instead of all 9. Most gestures are distinguishable with 3-4 features.
- Implement DTW asynchronously: capture the segment, then compute DTW on the next event loop tick using `setImmediate()` or `process.nextTick()`. This keeps the data flow responsive.
- In the pure MAX/MSP implementation, use `deferlow` to push DTW computation out of the high-priority scheduler thread.

**Warning signs:**
- Serial data starts arriving in bursts instead of smoothly at 114 Hz.
- MAX console shows "[serial-bridge] error" messages during gesture matching.
- Sensor visualization stutters or freezes momentarily when DTW matching runs.
- CPU usage spikes during gesture matching periods.

**Phase to address:**
Phase 2 (DTW Custom Gestures). Must be designed from the start with async computation in mind. This is architectural, not a tuning problem.

**Confidence:** HIGH -- DTW O(N*M) complexity is well-documented; the serial buffer overflow scenario is verified by project experience with Node for Max at 114 Hz.

---

### Pitfall 3: DTW False Positives -- Everything Looks Like a Gesture

**What goes wrong:**
DTW always returns a distance value, even when the input is nothing like any trained gesture. Without proper null rejection, every segment of motion gets classified as the "closest" gesture, even if that closest match is terrible. The system fires gesture events during walking, adjusting the device, scratching your nose while holding it, or any motion whatsoever. Users lose trust in the system immediately.

**Why it happens:**
DTW is a distance metric, not a classifier with a rejection option. Developers set a single threshold ("if DTW distance < 500, it's a match") without understanding that the threshold must be calibrated per gesture class. A simple flick gesture has a small typical DTW distance (say 50-200) while a complex circle gesture has a larger typical distance (say 300-800). A single threshold either misses the flick (too high) or false-triggers the circle on noise (too low). Additionally, without training a "null class" (examples of non-gesture motion), the system has no concept of "this is not a gesture."

**How to avoid:**
- Compute per-class rejection thresholds using the GRT approach: `threshold = training_mean_distance + (training_sigma * null_rejection_coefficient)`. The default null rejection coefficient is 3.0 (three standard deviations). This requires at least 3-5 training examples per gesture class to compute meaningful mean and sigma values.
- Require a minimum of 3 training examples per custom gesture. With only 1 example, null rejection cannot work (no sigma to compute). Document this clearly: "Record at least 3 examples of each gesture."
- Add a "null class" of everyday motion: picking up the device, setting it down, walking with it. If the DTW distance to a gesture template is larger than the distance to any null-class template, reject the match.
- Implement a cooldown period after each gesture detection (e.g., 500ms) to prevent rapid-fire false triggers.
- Normalize DTW distance by sequence length. Raw DTW distance grows with longer sequences, making cross-gesture threshold comparison meaningless without normalization.

**Warning signs:**
- Gesture events fire when the user is not intentionally performing gestures.
- Changing the rejection threshold fixes one gesture but breaks another.
- Recognition accuracy reported as "90%+" in testing but feels unreliable in practice (the 10% false positives destroy user experience).
- System works well for the developer but fails for other users (different gesture styles produce different distance distributions).

**Phase to address:**
Phase 2 (DTW Custom Gestures). Null rejection must be designed into the DTW pipeline from the start, not added as an afterthought.

**Confidence:** HIGH -- this is extensively documented in the GRT wiki and academic literature on DTW gesture recognition. The GRT's null rejection implementation (mean + sigma * coefficient) is the standard approach.

---

### Pitfall 4: Position Integration Drift Makes Position Interpolation Unusable

**What goes wrong:**
Position interpolation (record position A, record position B, output 0.0-1.0 blend based on current position) seems to require knowing the device's position in space. The obvious approach is double-integrating accelerometer data to get position. This produces wildly inaccurate results within seconds: a constant error in acceleration produces a linear error in velocity and a quadratic error in position. After 10 seconds of integration, position estimates are meters off from reality. The feature appears broken.

**Why it happens:**
Developers confuse "position in space" (translation) with "orientation" (rotation). The existing pipeline provides excellent orientation data (pitch/roll/yaw from the Madgwick filter). But translational position from accelerometer double integration is a fundamentally different and much harder problem. The LSM6DS3 accelerometer noise is ~0.004g per sample -- after double integration at 114 Hz, this accumulates to multi-meter position errors within seconds. No amount of filtering fixes this because the error is systematic (bias drift), not just noise.

**How to avoid:**
- Do NOT implement position interpolation as translational position tracking. This is the wrong approach entirely.
- Instead, implement position interpolation as orientation interpolation: record orientation A (pitch_A, roll_A, yaw_A), record orientation B (pitch_B, roll_B, yaw_B), then compute how close the current orientation is to each reference orientation. Output 0.0 when orientation matches A, 1.0 when it matches B, and interpolated values between.
- Use angular distance (not Euclidean distance on Euler angles) for the interpolation metric. Quaternion dot product or geodesic distance avoids gimbal lock issues near pitch = 90 degrees.
- For the "position space map" visualization, display the orientation space (pitch vs. roll scatter plot), not a translational position map.
- If users truly need translational position (e.g., "how far left have I moved my hand?"), document clearly that this is not possible with a 6-DOF IMU without external reference (camera, UWB, etc.). This is a hard physics limitation, not a software problem.

**Warning signs:**
- Position values drift continuously even when the device is stationary.
- Position "resets" produce temporarily correct values that drift again within seconds.
- Position interpolation works for a few seconds after recording reference points, then becomes random.
- User complaints that "the blend doesn't respond to my movements" (because drift has overwhelmed the actual motion signal).

**Phase to address:**
Phase 3 (Position Interpolation). This must be explicitly scoped as orientation interpolation during architecture/design, before any code is written. Using the wrong approach (translational position) wastes an entire phase.

**Confidence:** HIGH -- double integration drift is a well-documented fundamental limitation of IMU position estimation. Academic consensus: position from IMU alone is reliable for only 1-2 seconds maximum.

---

### Pitfall 5: Modifying serial-bridge.js Instead of Building a Separate Script

**What goes wrong:**
The temptation to add gesture recognition directly into the existing `serial-bridge.js` is strong because "all the data is right there." But this violates the project constraint (serial-bridge.js must not be modified) and creates a maintenance nightmare: every gesture-related bug potentially breaks the core data pipeline, calibration, smoothing, and normalization that 100% of users depend on. A gesture recognition bug could cause data loss, latency spikes, or crashes in the foundational pipeline.

**Why it happens:**
The serial-bridge.js already has the parsed sensor data flowing through `outputData()`. Adding gesture detection there seems efficient -- one processing loop, no inter-process communication overhead, direct access to calibrated and smoothed data. Developers rationalize "I'll just add a small function" without realizing that DTW template storage, segmentation state machines, recording buffers, and matching computation represent a significant code surface that can interact badly with the existing calibration and smoothing state.

**How to avoid:**
- Create a completely separate Node for Max script (e.g., `gesture-engine.js`) that runs in its own `node.script` instance.
- Route data from serial-bridge.js outputs through MAX patch wiring to the gesture engine's inputs. The data path is: `serial-bridge.js -> maxAPI.outlet("smooth_accel",...) -> [route smooth_accel] -> [node.script gesture-engine.js]`. This adds ~1ms of IPC latency, which is negligible for gesture recognition (gestures are 200ms-3000ms events).
- The gesture engine receives pre-processed data (calibrated, smoothed) without needing to know anything about serial communication, calibration state, or smoothing parameters.
- This separation also enables the dual implementation goal: the pure MAX/MSP version replaces the gesture-engine.js node.script with MAX objects, while serial-bridge.js remains unchanged in both cases.

**Warning signs:**
- PR diffs showing changes to `serial-bridge.js`.
- Gesture-related state variables (templates, buffers, matching state) appearing alongside calibration and smoothing state.
- Gesture recognition bugs that also break raw data output.
- Difficulty testing gesture recognition in isolation from the serial pipeline.

**Phase to address:**
Phase 1 (Architecture/Setup). The separate script architecture must be established before any gesture code is written.

**Confidence:** HIGH -- this is a direct project constraint and a well-established architectural principle (separation of concerns). The existing v1.0 serial-bridge.js is ~650 lines and already handles calibration, smoothing, normalization, and transport switching.

---

### Pitfall 6: Predefined Gesture Algorithms That Fight the Smoothing Pipeline

**What goes wrong:**
The existing pipeline applies EMA (exponential moving average) smoothing to all sensor data before output. Predefined gesture detectors (shake, tap, flip) rely on detecting sharp transients -- exactly the signal features that smoothing attenuates. A shake gesture produces high-frequency acceleration spikes; heavy smoothing (alpha near 0) turns those spikes into gentle waves that never exceed the shake detection threshold. The gesture detector works in testing (with smoothing off) but fails in production (with user-configured smoothing on).

**Why it happens:**
Smoothing and gesture detection have fundamentally opposing requirements. Smoothing wants to remove high-frequency content (noise). Shake/tap detection wants to preserve high-frequency content (transients). Developers test gesture detection with raw or lightly-smoothed data, then are surprised when it fails after the user cranks up smoothing for their audio mapping. The smoothing and gesture detection are designed by the same developer but at different times, and the interaction is not considered.

**How to avoid:**
- Feed gesture detectors with raw (pre-smoothing) data, not smoothed data. The serial-bridge.js outputs both `cal_accel`/`cal_gyro` (calibrated but unsmoothed) and `smooth_accel`/`smooth_gyro` (smoothed). Gesture detection should tap `cal_accel` and `cal_gyro` outlets. Smoothed data goes to mapping/audio; raw calibrated data goes to gesture detection.
- For DTW custom gestures, use the same data path (raw calibrated) for both recording templates and matching. If templates are recorded from smoothed data but matching runs on raw data (or vice versa), DTW distances will be systematically wrong.
- Document clearly in the help patch: "Gesture detection uses calibrated data before smoothing. Smoothing settings do not affect gesture detection sensitivity."
- For predefined gestures that need some filtering (e.g., separating gravity from linear acceleration for tap detection), apply gesture-specific filters (high-pass Butterworth at 0.5 Hz for gravity removal) rather than reusing the general-purpose EMA smoothing.

**Warning signs:**
- Gesture detection works with smoothing dials at 0 but fails when smoothing is increased.
- Shake detection sensitivity varies wildly depending on smoothing settings.
- Users report "gestures stopped working" after adjusting smoothing for their audio mapping.
- DTW matching produces different distances for the same gesture depending on smoothing state.

**Phase to address:**
Phase 1 (Predefined Gestures). The data routing decision (raw calibrated vs. smoothed) must be made at the start.

**Confidence:** HIGH -- this is a direct consequence of the existing v1.0 architecture where smoothing is a core feature. The interaction between smoothing and transient detection is well-understood in signal processing.

---

### Pitfall 7: Gravity Contamination in Accelerometer-Based Gesture Features

**What goes wrong:**
The accelerometer always measures gravity (1g downward) in addition to linear acceleration from motion. When the device tilts, the gravity vector redistributes across axes. A gesture detector looking for "acceleration spike on X axis > 2g" fires incorrectly when the user simply tilts the device so the X axis points more downward (gravity contribution increases). Conversely, a shake gesture along the gravity axis appears weaker than the same shake perpendicular to gravity, because gravity is already occupying part of the measurement range on that axis.

**Why it happens:**
Developers use raw accelerometer values for gesture detection without separating the gravity component from the linear acceleration component. The Madgwick filter internally estimates the gravity vector, but the existing serial-bridge.js does not output a gravity-removed linear acceleration stream. Developers either ignore gravity (causing orientation-dependent gesture thresholds) or attempt to subtract a constant [0, 0, 1g] (which is only correct when the device is level).

**How to avoid:**
- Use acceleration magnitude `sqrt(ax^2 + ay^2 + az^2)` for orientation-invariant motion detection. At rest, this is always ~1g regardless of tilt. During motion, it deviates from 1g. A threshold of "magnitude > 1.5g" or "magnitude < 0.5g" detects motion events regardless of orientation.
- For axis-specific gesture detection (e.g., "shook left-right"), apply a high-pass filter (simple first-order: `linear_accel = current - alpha * previous`, where alpha ~0.8) to remove the slowly-changing gravity component while preserving fast gesture accelerations.
- Use gyroscope data for rotational gestures (circle, flip). Gyroscope is not affected by gravity. A flip is a large angular velocity spike on one axis; a circle is sustained angular velocity on one axis with sinusoidal patterns on the other two.
- For the pure MAX/MSP implementation, use `[biquad~]` or `[slide]` configured as a high-pass filter to separate gravity from linear acceleration.

**Warning signs:**
- Gesture detection works when device is held level but fails when tilted.
- Shake sensitivity varies depending on which direction the user shakes.
- Tap detection triggers when the user tilts the device.
- Circle gesture detection produces different results depending on the plane the circle is drawn in.

**Phase to address:**
Phase 1 (Predefined Gestures). Gravity handling must be addressed in the gesture feature extraction stage before any threshold or matching logic.

**Confidence:** HIGH -- gravity contamination is the most commonly discussed problem in accelerometer-based gesture detection literature. Every serious IMU gesture system separates gravity from linear acceleration.

---

## Technical Debt Patterns

Shortcuts that seem reasonable but create long-term problems.

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Single DTW distance threshold for all gesture classes | Quick to implement, one parameter to tune | Each gesture class has different distance distributions; threshold that works for one fails for others | Never in production. Always use per-class thresholds computed from training statistics. |
| Storing gesture templates as raw sample arrays without metadata | Simple data structure, easy to serialize | No record of sample rate, axis configuration, or recording conditions; templates become invalid if pipeline changes | Phase 2 prototyping only. Production templates need metadata: sample rate, axes used, recording date, training statistics. |
| Running DTW synchronously in the data callback | No async complexity, results available immediately | Blocks event loop, causes serial data loss during matching, creates visible stuttering | Never. Even during prototyping, use setImmediate() or deferlow to defer computation. |
| Using Euclidean distance on Euler angles for position interpolation | Simple math, easy to understand | Gimbal lock at pitch = +/-90 degrees, discontinuity at yaw = 0/360 boundary, wrong interpolation path | Phase 3 prototyping only. Production must use quaternion distance (dot product or geodesic) for correct behavior at all orientations. |
| Hardcoding gesture library (shake/flip/tap thresholds) | Works for the developer's device and mounting | Different users hold the device differently, requiring different thresholds | Acceptable if sensitivity parameter is exposed. Hardcoded thresholds with a configurable sensitivity multiplier is a reasonable compromise. |
| Skipping DTW path constraint (Sakoe-Chiba band) | Correct DTW computation, maximum matching flexibility | O(N^2) instead of O(N*W) where W is band width; 5-10x slower for no practical accuracy gain in gesture recognition | Never. Band constraint should always be applied. W = 10-15% of sequence length is standard. |

## Integration Gotchas

Common mistakes when connecting the gesture system to the existing pipeline.

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| Gesture Node script receiving data from MAX | Using `maxAPI.addHandler()` with individual axis messages (one handler per axis, assembling the sample in the gesture script) -- creates timing issues where axes arrive at different times | Send all axes in one message: route `smooth_accel` output through a `[pak f f f]` or just forward the original 3-value list directly to the gesture script as a single handler call. |
| Two node.script instances (serial-bridge + gesture-engine) | Assuming they share memory or state. Each node.script is a separate Node.js process with its own memory space. | Communicate exclusively through MAX patch wiring: serial-bridge outlets -> MAX routing -> gesture-engine inlets. No shared state, no IPC between Node processes. |
| Pure MAX DTW vs. Node DTW producing different results | Using different distance metrics, normalization, or sequence preprocessing in the two implementations. | Define the DTW algorithm once (in documentation) and implement identically in both. Test both against the same recorded gesture data and verify identical distance values. |
| Jitter visualization competing with data processing | Running jit.gl.render at 60 FPS in the same patch while processing 114 Hz sensor data and running DTW computation | Separate visualization into its own `jit.world` or subpatch. Use `@fps 30` for visualization (30 FPS is sufficient for motion trails). Use `deferlow` between data processing and visualization updates. |
| Gesture events (bangs) feeding back into the sensor pipeline | A gesture "flip" detection resets orientation, which changes the data, which re-triggers the flip detection, creating a feedback loop | Gate gesture outputs with a one-shot cooldown: after a gesture fires, suppress detection on that gesture class for a configurable cooldown period (default 500ms). |

## Performance Traps

Patterns that work at small scale but fail as gesture library grows.

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| Matching every segment against every template serially | Works with 3 templates, each taking ~2ms | Pre-filter with acceleration magnitude envelope; only run DTW against templates whose energy profile matches the segment's | Above 10 templates (10 * 2ms = 20ms per segment, starts competing with the ~8.8ms inter-sample interval) |
| Storing full DTW cost matrix in memory for each match | Works for short gestures | Use only two rows of the cost matrix (current and previous), reducing space from O(N*M) to O(M). Full matrix only needed if you need the warping path. | Templates longer than ~500 samples (500*500*8 bytes = 2MB per match) |
| Motion trail visualization storing unlimited history | Works for a few seconds | Use a ring buffer with fixed maximum length (e.g., 500 points = ~4.4 seconds at 114 Hz). Older points are overwritten. | After minutes of continuous operation, memory grows unbounded and Jitter rendering slows |
| Recording gesture templates at full 9-axis dimensionality | Works but slow DTW matching | Reduce to the 3-4 most discriminative axes per gesture class. For most hand gestures, accel magnitude + gyro X + gyro Y are sufficient. | When matching latency exceeds 50ms and users perceive a delay between gesture completion and response |
| Jitter `jit.gl.sketch` drawing individual points for motion trails | Works for 50 points | Use `jit.gl.mesh` with `@draw_mode lines` or `line_strip` and a matrix of vertices. GPU-accelerated rendering handles 1000+ points without frame drops. | Above 200 points, jit.gl.sketch per-point drawing causes visible frame rate drops |

## UX Pitfalls

Common user experience mistakes in gesture recognition interfaces.

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| No feedback during gesture recording -- user performs gesture but has no idea if it was captured | User records incomplete or wrong gestures, then recognition fails, and they blame the recognition algorithm | Show real-time visualization of the recording: motion trail that appears during recording, sample count indicator, "recording complete" confirmation with playback of what was captured. |
| Requiring exactly the same speed for gesture recognition | User learns a gesture at one speed, but DTW threshold rejects it when performed faster or slower. DTW handles speed variation in theory but poorly in practice without enough training examples. | Record 3-5 examples at different speeds (slow, medium, fast). DTW template averaging or multi-template matching handles speed variation much better than single-template with loose threshold. |
| Position interpolation with no visual reference -- user sees a 0.0-1.0 number but has no spatial understanding of where A and B are | User cannot remember what orientation they recorded as A and B, making the interpolation feel random | Show the position space map: a 2D plot with A and B marked, and a moving dot showing current position. Even a simple `[multislider]` showing the current blend value with A/B labels helps. |
| Gesture library management with no save/load -- user records custom gestures, closes MAX, and they're gone | Losing 20 minutes of gesture training is infuriating; users stop using custom gestures | Auto-save templates to a JSON file on recording. Auto-load on patch open. Use MAX `[dict]` for structured storage and `[dict.serialize]` for file persistence. |
| Predefined gesture names that don't match user expectations -- "shake" triggers on gentle waggling, "flip" triggers on a 90-degree tilt | Users develop incorrect mental models of what each gesture means, leading to frustration | Define gestures precisely in the help patch with video/animation examples. Make sensitivity adjustable. Use descriptive names: "rapid-shake" not "shake", "180-flip" not "flip". |

## "Looks Done But Isn't" Checklist

Things that appear complete but are missing critical pieces.

- [ ] **DTW matching:** Returns correct distances on test data -- but haven't tested with live segmented data from the motion detector. Segmentation boundaries change DTW distances significantly.
- [ ] **Shake detection:** Works on your desk -- but haven't tested while walking, while the device is mounted differently, or while someone else holds it. Gravity orientation and personal gesture style change everything.
- [ ] **Position interpolation:** Outputs 0.0 at position A and 1.0 at position B -- but haven't tested what happens between and beyond A/B. Does the value extrapolate past 1.0? Does it handle the case where current orientation is equidistant from A and B?
- [ ] **Gesture recording:** Records a template -- but haven't verified that re-recording the same gesture produces a low DTW distance against the first recording. High intra-class variance means recognition will be unreliable.
- [ ] **Motion trails visualization:** Looks good at first -- but haven't verified memory usage after 5 minutes of continuous operation. Unbounded arrays cause crashes.
- [ ] **Null rejection:** Threshold set and working -- but haven't tested with everyday non-gesture motion (picking up device, setting it down, walking, scratching head while holding device). These are the real false positive sources.
- [ ] **Dual implementation parity:** Node and MAX versions both detect gestures -- but haven't verified they produce the same results for the same input. Different floating-point behavior, different distance calculations, or different preprocessing will cause divergence.
- [ ] **Cooldown between gestures:** Added a 500ms cooldown -- but haven't tested rapid intentional repeated gestures. Does the user want to shake-shake-shake and get three events, or just one? Cooldown should be configurable and gesture-class-specific.
- [ ] **Template persistence:** Templates save and load -- but haven't tested loading templates recorded at a different smoothing level, different calibration state, or different sample rate. Templates must record their recording conditions or be invalidated when conditions change.

## Recovery Strategies

When pitfalls occur despite prevention, how to recover.

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| Segmentation not working (missed or false triggers) | MEDIUM | Retrofit motion detection stage between data input and DTW. Requires adding state machine, activity detection, and segment buffering. Does not require changing DTW implementation itself. |
| DTW too slow for real-time | LOW | Add Sakoe-Chiba band constraint (narrow the search corridor). Reduce feature dimensionality. If already constrained, move to subsequence DTW (sDTW) which avoids full matrix computation. |
| False positives overwhelming | MEDIUM | Retrain with more examples (minimum 5 per class). Add null class with non-gesture motion. Increase null rejection coefficient from 3.0 to 5.0. Add post-detection validation (gesture must repeat within 2 seconds to confirm). |
| Position interpolation built on double integration | HIGH | Complete redesign required. Replace translational position tracking with orientation-based interpolation. All UI, visualization, and downstream connections must be rewired. This is why it must be scoped correctly before coding begins. |
| Modified serial-bridge.js and broke existing pipeline | HIGH | Revert serial-bridge.js to v1.0 state. Extract gesture code into separate file. Re-route data through MAX wiring. May require significant MAX patch restructuring if gesture state was entangled with calibration/smoothing state. |
| Smoothing-dependent gesture detection | LOW-MEDIUM | Re-route gesture input from smoothed outlets to calibrated (pre-smoothing) outlets. May require adjusting gesture thresholds since calibrated data is noisier than smoothed data. |
| Gravity contamination in gesture thresholds | MEDIUM | Replace per-axis thresholds with magnitude-based detection. Add high-pass filter for gravity removal. All threshold values must be re-tuned after the change. |

## Pitfall-to-Phase Mapping

How roadmap phases should address these pitfalls.

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| Gesture segmentation failure | Phase 1: Predefined Gestures (establish motion detection framework) | Record 50 natural gesture performances; verify >90% are correctly segmented (start/end within 100ms of actual gesture boundary) |
| DTW computational cost | Phase 2: DTW Custom Gestures (architecture with async matching) | Measure end-to-end latency from gesture completion to bang output. Must be <100ms with 10 templates loaded. Verify no serial data loss during matching. |
| DTW false positives | Phase 2: DTW Custom Gestures (null rejection design) | Perform 5 minutes of non-gesture activity (walking, repositioning, scratching). Count false positives. Target: <2 false positives per 5 minutes per gesture class. |
| Position integration drift | Phase 3: Position Interpolation (scope as orientation interpolation) | Verify position interpolation output is stable when device is held stationary. Value must not drift more than 0.01 per minute. |
| Modifying serial-bridge.js | Phase 1: Architecture Setup | Code review: serial-bridge.js diff must be empty. All gesture code in separate files. |
| Smoothing vs. gesture detection conflict | Phase 1: Predefined Gestures (data routing) | Test all gestures with smoothing at 0.0, 0.5, and 1.0. Gesture detection must work identically at all smoothing levels. |
| Gravity contamination | Phase 1: Predefined Gestures (feature extraction) | Test all gestures at three orientations: level, tilted 45 degrees, tilted 90 degrees. Detection thresholds must produce consistent results across orientations. |
| Jitter visualization performance | Phase 4: Rich Visualization | Run visualization continuously for 10 minutes while gesture detection is active. Frame rate must stay above 24 FPS. Memory usage must not grow by more than 10MB. |
| Template persistence | Phase 2: DTW Custom Gestures (save/load) | Close and reopen MAX patch. Verify all previously recorded custom gestures are automatically loaded and still recognized correctly. |
| Dual implementation divergence | Phase 2 + pure MAX implementation phase | Feed identical recorded data to both Node and MAX implementations. DTW distances must match within 0.1%. Gesture detection results must be identical. |

## Sources

- [GRT DTW Implementation (GitHub)](https://github.com/nickgillian/grt/blob/master/GRT/ClassificationModules/DTW/DTW.h) -- Null rejection coefficient, per-class thresholds, template training (HIGH confidence)
- [GRT DTW Wiki](https://github.com/nickgillian/grt/wiki/dtw) -- Rejection threshold formula: mean + sigma * coefficient, minimum training examples (HIGH confidence)
- [Real-time DTW-based gesture recognition for MAX/MSP and PureData](https://www.researchgate.net/publication/228987911_Real-time_DTW-based_gesture_recognition_external_object_for_MAXMSP_and_puredata) -- Multi-grid DTW without prior segmentation, num.dtw external object (MEDIUM confidence)
- [uWave: Accelerometer-based Personalized Gesture Recognition](https://www.yecl.org/publications/liu09percom.pdf) -- Single-template DTW for accelerometer gestures, quantization for speed (MEDIUM confidence)
- [Structured Dynamic Time Warping for Continuous Hand Trajectory Gesture Recognition (ScienceDirect)](https://www.sciencedirect.com/science/article/abs/pii/S0031320318300621) -- Segmentation approaches for continuous streams (MEDIUM confidence)
- [Unsupervised Gesture Segmentation by Motion Detection (IEEE)](https://ieeexplore.ieee.org/document/7576613/) -- Threshold-based segmentation of continuous IMU streams (MEDIUM confidence)
- [IMU Position Estimation (arxiv)](https://arxiv.org/pdf/1311.4572) -- Drift error: constant acceleration error produces quadratic position error (HIGH confidence)
- [CH Robotics: Using Accelerometers to Estimate Position](https://www.chrobotics.com/library/accel-position-velocity) -- Double integration drift, practical limitations (HIGH confidence)
- [dtw npm package](https://www.npmjs.com/package/dtw) -- JavaScript DTW implementation for Node.js (HIGH confidence)
- [dynamic-time-warping npm](https://www.npmjs.com/package/dynamic-time-warping) -- Alternative JS DTW with custom distance functions (HIGH confidence)
- [Node for Max - Script Lifecycle](https://docs.cycling74.com/max8/vignettes/08_n4m_lifecycle) -- Each node.script is a separate process (HIGH confidence)
- [IMU Sensor-Based Hand Gesture Recognition (MDPI)](https://www.mdpi.com/1424-8220/19/18/3827) -- DTW outperforms other methods for time-dependent IMU data; gravity separation with high-pass Butterworth filter (MEDIUM confidence)
- [Head Gesture Recognition via DTW and Threshold Optimization (IEEE)](https://ieeexplore.ieee.org/document/7929592) -- Threshold-false positive tradeoff, F1-score optimization (MEDIUM confidence)
- [Cycling '74: Best Practices in Jitter](https://cycling74.com/tutorials/best-practices-in-jitter-part-1) -- Minimize CPU-GPU data copies, use textures over matrices (MEDIUM confidence)
- [Gesture Variation Follower (GVF) for MaxMSP](https://github.com/bcaramiaux/ofxGVF) -- Alternative to DTW: continuous gesture following, developed at IRCAM (LOW confidence -- not directly used but worth knowing)
- [MATLAB IMU Gesture Recognition](https://www.mathworks.com/help/nav/ug/gesture-recognition-using-inertial-measurement-units.html) -- Quaternion DTW for orientation-based gesture matching (MEDIUM confidence)

---
*Pitfalls research for: Adding gesture recognition (DTW), position interpolation, and motion visualization to existing real-time IMU sensor pipeline*
*Researched: 2026-02-22*
