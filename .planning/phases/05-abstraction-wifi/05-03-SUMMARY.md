---
phase: 05-abstraction-wifi
plan: 03
subsystem: documentation
tags: [max-msp, maxhelp, help-patch, documentation, test-signal, recipes, abstraction]

# Dependency graph
requires:
  - phase: 05-abstraction-wifi
    plan: 02
    provides: "imu-sensor.maxpat abstraction with 13-outlet API, message control, patcherargs attributes"
provides:
  - "imu-sensor.maxhelp: auto-discovered help patch with 8 sections covering full abstraction API"
  - "Documentation for all 13 outlets with purpose, data format, and value ranges"
  - "27 clickable message examples covering transport, calibration, smoothing, thresholds, mapping, WiFi"
  - "Test signal generator (~111 Hz) simulating realistic sensor data without hardware"
  - "Three musical recipes: tilt-to-filter (continuous), gesture triggers (discrete), spatial panning (3D)"
affects: []

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "MAX help file convention: .maxhelp with same basename as abstraction for auto-discovery"
    - "Test signal using metro + counter + expr math objects for hardware-free demonstration"
    - "Recipe pattern: annotated comment boxes explaining WHY in musical context, not just WHAT"
    - "Help patch as documentation + inspiration + working examples"

key-files:
  created:
    - "max/imu-sensor.maxhelp"
  modified:
    - "max/serial-bridge.js" (copied to max/ for abstraction discovery)
    - "max/node_modules" (symlinked for abstraction dependencies)

key-decisions:
  - "Test signal generates synthetic data in help patch (not via Node simulate handler) for simplicity"
  - "Three recipes chosen to showcase distinct use cases: continuous control, discrete events, 3D spatialization"
  - "All outlets documented with musical context -- not just technical specs but practical application"
  - "Clickable message boxes throughout for hands-on exploration without typing"

patterns-established:
  - "Help patch structure: title → basic usage → message reference → test signal → recipes → config examples"
  - "Recipe format: working MAX objects + annotated comments explaining musical application"
  - "Test signal design: metro ~111 Hz + counter + expr math matching real sensor ranges"

# Metrics
duration: 43min
completed: 2026-02-13
---

# Phase 5 Plan 3: Help Patch Documentation Summary

**Comprehensive imu-sensor.maxhelp with test signal generator, full API documentation, and three musical recipes (tilt-to-filter, gesture triggers, spatial panning) for learning without hardware**

## Performance

- **Duration:** 43 min
- **Started:** 2026-02-13T18:50:44-08:00
- **Completed:** 2026-02-13T19:34:43-08:00
- **Tasks:** 2
- **Files created:** 1

## Accomplishments
- Complete help patch with 8 sections: title/overview, basic usage with outlet documentation, message reference with 27 clickable examples, test signal generator, three recipes, configuration examples
- Test signal (~111 Hz metro) generates realistic synthetic sensor data across all 9 axes without requiring Arduino hardware
- Three musical recipes demonstrate distinct use cases: Recipe 1 (tilt-to-filter) for continuous parameter control, Recipe 2 (gesture triggers) for discrete event detection, Recipe 3 (spatial panning) for 3D audio positioning
- All 13 outlets documented with purpose, data format, value ranges, and musical context
- MAX auto-discovers help via same-basename convention (imu-sensor.maxhelp matches imu-sensor.maxpat)

## Task Commits

Each task was committed atomically:

1. **Task 1: Create imu-sensor.maxhelp with documentation, test signal, and recipe examples** - `ffb97cc` (feat)
2. **Task 2: Verify abstraction, WiFi, help patch, and 3D viz in MAX** - checkpoint:human-verify (approved by user)

**Additional fix commits after Task 1:**
- `4f6e841` - fix(05-02): copy serial-bridge.js to max/ for abstraction discovery
- `60dabe3` - fix(05-02): delay patcherargs init messages until node.script is ready
- `79b0680` - fix(05-03): reduce help patch to 1 live imu-sensor instance
- `df90960` - fix(05-02): use ready signal instead of timer for node.script init
- `160040b` - fix(05-02): symlink node_modules into max/ for abstraction deps

**Plan metadata:** (pending final commit)

## Files Created/Modified
- `max/imu-sensor.maxhelp` - Comprehensive help patch with 8 sections: full outlet/inlet docs, 27 message examples, test signal generator, 3 musical recipes
- `max/serial-bridge.js` - Copied to max/ directory so abstraction can load Node script via relative path
- `max/node_modules/` - Symlinked from parent node_modules/ for abstraction dependency resolution

## Decisions Made
- Test signal implemented purely in MAX (metro + counter + expr math) rather than adding simulate handler to Node -- simpler and demonstrates what real data looks like
- Three recipes chosen to showcase breadth: continuous control (tilt-to-filter), discrete triggers (gesture detection), and 3D audio (spatial panning with quaternion)
- All outlet documentation includes musical context ("connect to svf~ cutoff", "use for ambisonics") not just technical specs
- Clickable message boxes throughout message reference section for hands-on exploration
- Help patch reduced to 1 live abstraction instance after testing revealed multiple instances caused resource issues

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] Copied serial-bridge.js to max/ for abstraction discovery**
- **Found during:** Task 2 verification (abstraction failed to load Node script)
- **Issue:** imu-sensor.maxpat references serial-bridge.js via relative path, but MAX search path requires it in max/ directory
- **Fix:** Copied node/serial-bridge.js to max/serial-bridge.js so abstraction loads script correctly
- **Files modified:** max/serial-bridge.js (new copy)
- **Verification:** Abstraction loads without console errors
- **Committed in:** `4f6e841` (separate fix commit)

**2. [Rule 3 - Blocking] Added deferlow chain for patcherargs initialization**
- **Found during:** Task 2 verification (node.script not ready warnings)
- **Issue:** patcherargs sends @attribute messages to node.script before node.script is ready, causing "not ready" warnings in MAX console
- **Fix:** Added deferlow between patcherargs and message formatting to delay init until next event cycle
- **Files modified:** max/imu-sensor.maxpat
- **Verification:** No "not ready" warnings on abstraction load
- **Committed in:** `60dabe3` (separate fix commit)

**3. [Rule 3 - Blocking] Reduced help patch to 1 live abstraction instance**
- **Found during:** Task 2 verification (MAX performance issues with multiple instances)
- **Issue:** Help patch originally had multiple [imu-sensor] instances for different examples, causing resource contention and slow UI
- **Fix:** Reduced to single live instance with clear documentation sections instead of multiple running instances
- **Files modified:** max/imu-sensor.maxhelp
- **Verification:** Help patch opens quickly, runs smoothly
- **Committed in:** `79b0680` (separate fix commit)

**4. [Rule 3 - Blocking] Used ready signal instead of timer for init synchronization**
- **Found during:** Task 2 verification (race condition edge cases)
- **Issue:** deferlow timer-based approach still occasionally hit race conditions on slower systems
- **Fix:** Implemented explicit ready signal from node.script → patcherargs for guaranteed initialization order
- **Files modified:** max/imu-sensor.maxpat, max/serial-bridge.js
- **Verification:** Abstraction loads reliably across multiple tests without warnings
- **Committed in:** `df90960` (separate fix commit)

**5. [Rule 3 - Blocking] Symlinked node_modules into max/ for dependency resolution**
- **Found during:** Task 2 verification (Node script failed to find serialport module)
- **Issue:** serial-bridge.js copied to max/ couldn't resolve node_modules dependencies from parent directory
- **Fix:** Created symlink: max/node_modules → ../node_modules so Node script finds dependencies regardless of location
- **Files modified:** max/node_modules (symlink created)
- **Verification:** Abstraction connects to Arduino successfully, all outlets output data
- **Committed in:** `160040b` (separate fix commit)

---

**Total deviations:** 5 auto-fixed (5 blocking issues)
**Impact on plan:** All fixes necessary for abstraction to function correctly in MAX's search path environment. No scope creep -- all fixes addressed deployment/integration issues discovered during verification.

## Issues Encountered
- MAX abstraction loading context differs from standalone patch: search paths, relative file references, and dependency resolution require explicit setup
- Multiple [imu-sensor] instances in help patch caused resource contention -- reduced to single live instance with documentation-focused layout
- patcherargs timing: messages sent before node.script ready required explicit synchronization via ready signal
- Node module resolution: copied Node script couldn't find dependencies without symlink from max/ to parent node_modules/

## User Setup Required
None - no external service configuration required. Help patch works standalone with built-in test signal, no Arduino required for learning.

## Next Phase Readiness
- **Phase 5 complete:** All plans (WiFi transport, abstraction, help patch) delivered and verified
- Abstraction is fully documented and ready for end users
- Test signal enables learning without hardware
- Three recipes provide starting points for musical applications
- Project is feature-complete per original ROADMAP.md objectives

---
*Phase: 05-abstraction-wifi*
*Completed: 2026-02-13*
