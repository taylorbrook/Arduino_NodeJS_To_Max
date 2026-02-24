---
phase: 08-custom-dtw-gesture-recognition
plan: 02
subsystem: gesture-recognition
tags: [dtw, sakoe-chiba, gesture-recording, template-matching, axis-detection, null-rejection, json-persistence]

# Dependency graph
requires:
  - phase: 07-core-engine-and-predefined-gestures
    provides: gesture-engine.js with serial I/O, calibration, smoothing, circular buffer, predefined gesture detectors
provides:
  - DTW recording state machine (timed/toggle modes)
  - Multi-dimensional DTW distance algorithm with Sakoe-Chiba band
  - Template management with best-representative selection
  - Null rejection via training statistics
  - Decimated real-time matching at ~22Hz
  - Variance-based axis auto-detection
  - JSON library save/load for gesture persistence
  - 17 MAX handler messages for DTW control
affects: [08-custom-dtw-gesture-recognition, 09-gesture-mapping, max-patch-integration]

# Tech tracking
tech-stack:
  added: [fs (Node builtin for JSON persistence)]
  patterns: [setImmediate yield for non-blocking DTW, decimated matching (every 5th frame), Sakoe-Chiba band constraint, variance-based axis selection, best-representative template via pairwise DTW distances]

key-files:
  created: []
  modified: [max/gesture-engine.js]

key-decisions:
  - "setImmediate polyfill via _setImmediate for Node for Max compatibility"
  - "DTW buffer separate from gesture buffer (256 frames vs 64 frames)"
  - "Wider null rejection coefficient (5.0) for 2-example slots vs standard 3.0"
  - "CSV validation extended to 9-13 fields for quaternion support"

patterns-established:
  - "DTW subsystem pattern: state variables, buffer, recording, template management, algorithm, matching, handlers"
  - "Decimated processing: DTW_MATCH_EVERY=5 yields ~22Hz from 114Hz pipeline"
  - "Named-axis frame objects for multi-dimensional DTW distance computation"

requirements-completed: [DTW-01, DTW-02, DTW-03, DTW-04, DTW-05, DTW-06, DTW-07, DTW-08, DTW-09, DTW-10]

# Metrics
duration: 3min
completed: 2026-02-24
---

# Phase 08 Plan 02: DTW Gesture Recognition Subsystem Summary

**Complete DTW subsystem in gesture-engine.js: recording state machine, Sakoe-Chiba DTW algorithm, best-representative template selection, null rejection, ~22Hz decimated matching with setImmediate yield, variance-based axis auto-detection, and JSON library save/load**

## Performance

- **Duration:** 3 min
- **Started:** 2026-02-24T18:28:52Z
- **Completed:** 2026-02-24T18:31:56Z
- **Tasks:** 1
- **Files modified:** 1

## Accomplishments
- Added complete DTW gesture recognition subsystem to gesture-engine.js (657 new lines, 1596 total)
- Recording state machine supports both timed window and toggle modes with progress reporting
- DTW algorithm uses Sakoe-Chiba band constraint for efficient multi-dimensional distance computation
- Template management computes best-representative from pairwise DTW distances and null rejection thresholds from training statistics
- Decimated matching at ~22Hz with setImmediate yield prevents blocking the 114Hz sensor pipeline
- Variance-based axis auto-detection selects relevant axes from recorded examples (minimum 3 axes)
- JSON save/load preserves all slot configuration, templates, examples, and training statistics
- 17 MAX handlers for full DTW control (record, stop, delete, enable, threshold, cooldown, name, label, axes, match mode, continuous, clear, etc.)
- CSV validation extended to accept 9-13 fields for quaternion data support

## Task Commits

Each task was committed atomically:

1. **Task 1: Add DTW recording state machine, DTW algorithm, template management, and null rejection** - `36d01dd` (feat)

## Files Created/Modified
- `max/gesture-engine.js` - Extended from 942 to 1596 lines with complete DTW subsystem: recording, matching, template management, axis detection, save/load, and all MAX handlers

## Decisions Made
- Used `_setImmediate` polyfill wrapping `setImmediate` with `setTimeout(fn, 0)` fallback for Node for Max compatibility
- DTW buffer (256 frames, ~2.25s) is separate from the existing 64-frame gesture circular buffer since DTW needs longer history
- Used wider null rejection coefficient (5.0) for slots with only 2 examples where sigma may be very small
- Extended CSV validation from exact 9-field match to 9-13 field range to support quaternion data passthrough

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness
- DTW subsystem is complete and integrated into the processFrame pipeline
- Ready for Phase 08 Plan 03 (MAX patch UI integration for DTW controls)
- All DTW handlers are registered and ready to receive messages from MAX patch
- setImmediate behavior in Node for Max noted as a concern in STATE.md -- the polyfill addresses this

## Self-Check: PASSED

- FOUND: max/gesture-engine.js
- FOUND: commit 36d01dd
- FOUND: 08-02-SUMMARY.md

---
*Phase: 08-custom-dtw-gesture-recognition*
*Completed: 2026-02-24*
