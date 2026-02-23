---
phase: 07-core-engine-and-predefined-gestures
plan: 01
subsystem: gesture-detection
tags: [node-for-max, serialport, imu, gesture, activity-gate, circular-buffer, ema-smoothing]

# Dependency graph
requires:
  - phase: 02-serial-bridge
    provides: serial I/O patterns, CSV validation, calibration, and smoothing code (copied and adapted)
  - phase: 03-calibration
    provides: bias offset calibration and orientation reset functions
  - phase: 05-abstraction-wifi
    provides: UDP transport and normalization patterns
provides:
  - Self-contained gesture-engine.js with embedded serial I/O, calibration, and smoothing
  - Energy-based activity gate (instant wake, 500ms delayed idle)
  - 64-frame circular buffer for gesture detector pattern matching
  - Per-gesture enable/disable, sensitivity, and cooldown configuration via MAX handlers
  - fireGesture function with cooldown debounce and LED feedback outlet
  - Stub functions for 7 gesture detectors (shake, tap, flip, 4 tilts)
affects: [07-02 gesture detectors, 07-03 MAX patch, 08 DTW custom gestures]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Copy-and-adapt serial I/O code rather than importing serial-bridge.js (avoids auto-start competition)"
    - "Gesture detectors receive calibrated pre-smoothing data; output outlets receive smoothed data"
    - "Activity gate with asymmetric timing: instant wake, delayed idle"
    - "Circular buffer with pushFrame/getFrame for temporal pattern access"
    - "Per-gesture state objects for enable/sensitivity/cooldown/lastFireTime"

key-files:
  created:
    - max/gesture-engine.js
  modified: []

key-decisions:
  - "Fixed smoothing defaults (global=0.3) instead of configurable dials -- minimal sensor UI per user decision"
  - "Gesture detectors called only when activityState is active -- no wasted computation during idle"
  - "Calibrated (pre-smoothing) frames pushed to buffer; tilts use smoothed orientation for stability"
  - "Gesture handler validation via hasOwnProperty prevents setting state for unknown gesture names"

patterns-established:
  - "gesture-engine.js processFrame pipeline: raw -> calibrate -> smooth -> buffer -> activity gate -> detectors"
  - "fireGesture outlets: gesture (name), gesture_led (name, on/off) for downstream route splitting"
  - "engine_status outlet for activity gate state (active/idle)"

requirements-completed: [CORE-01, CORE-02, CORE-03, CORE-04, GEST-08, GEST-09]

# Metrics
duration: 3min
completed: 2026-02-22
---

# Phase 7 Plan 01: Core Engine Summary

**Self-contained gesture-engine.js with serial I/O, calibration, EMA smoothing, energy-based activity gate, 64-frame circular buffer, and per-gesture enable/sensitivity/cooldown framework**

## Performance

- **Duration:** 3 min
- **Started:** 2026-02-23T05:31:11Z
- **Completed:** 2026-02-23T05:33:44Z
- **Tasks:** 1
- **Files modified:** 1

## Accomplishments
- Created 819-line gesture-engine.js with complete serial I/O pipeline adapted from serial-bridge.js
- Implemented energy-based activity gate with instant wake on single frame and 500ms delayed idle timeout
- Built 64-frame circular buffer (pushFrame/getFrame) for gesture detector temporal pattern matching
- Established per-gesture configuration framework (enable/disable, 0.0-1.0 sensitivity, millisecond cooldown) with 3 new MAX handlers
- fireGesture function with cooldown debounce and gesture_led outlet for visual LED feedback

## Task Commits

Each task was committed atomically:

1. **Task 1: Create gesture-engine.js with serial I/O, calibration, smoothing, and sensor output** - `2fdf60e` (feat)

**Plan metadata:** [pending] (docs: complete plan)

## Files Created/Modified
- `max/gesture-engine.js` - Self-contained Node for Max script with serial I/O, calibration, smoothing, activity gate, circular buffer, gesture state, 16 MAX handlers, and 4 gesture detector stubs

## Decisions Made
- Used fixed smoothing defaults (global=0.3, all groups=0, all per-axis=0) instead of configurable dials, consistent with "minimal sensor UI" user decision
- Gesture detectors only called when activityState === "active" to avoid unnecessary computation during idle
- Calibrated (pre-smoothing) data pushed to circular buffer for shake/tap/flip detectors; smoothed orientation used for tilt detectors (per research recommendation)
- Added hasOwnProperty validation in gesture handlers to prevent setting state for unknown gesture names
- Used `var` declarations throughout for consistency with serial-bridge.js style

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- gesture-engine.js is ready for Plan 02 to implement the 7 gesture detector functions (detectShake, detectTap, detectFlip, detectTilts)
- Circular buffer and activity gate are operational; detectors just need to be filled in
- fireGesture framework is complete and ready to be called from detectors
- Plan 03 will create imu-gesture.maxpat to wrap gesture-engine.js with UI controls

## Self-Check: PASSED

- FOUND: max/gesture-engine.js
- FOUND: commit 2fdf60e

---
*Phase: 07-core-engine-and-predefined-gestures*
*Completed: 2026-02-22*
