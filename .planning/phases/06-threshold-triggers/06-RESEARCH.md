# Phase 6: Threshold Triggers and Gap Closure - Research

**Researched:** 2026-02-13
**Domain:** MAX/MSP threshold/event detection with hysteresis, abstraction integration, documentation remediation
**Confidence:** HIGH

## Summary

Phase 6 closes the single remaining v1.0 milestone gap: MAXI-03 (threshold/event detection). The core problem is well-understood and partially solved. The sensor-pipeline.maxpat development patch already contains 6 complete threshold subpatchers (`p thresh_pitch`, `p thresh_roll`, `p thresh_yaw`, `p thresh_ax`, `p thresh_ay`, `p thresh_az`) with full hysteresis logic (dual comparators + change + select pattern), configurable threshold values, and adjustable hysteresis width. However, these subpatchers have no output routing (numoutlets: 0) and use global send/receive names instead of #0-prefixed instance-isolated names. Additionally, the imu-sensor.maxpat abstraction has no threshold logic at all -- it routes `threshold` messages from the inlet to Node via `prepend threshold -> node.script`, but serial-bridge.js has zero threshold handlers.

The implementation strategy has two viable approaches: (A) implement thresholds in Node (serial-bridge.js processes threshold configuration and evaluates thresholds on incoming smoothed data, outputting events via a new tagged outlet), or (B) implement thresholds entirely in MAX within the abstraction (tap smoothed data from the route output, run comparators, output via outlet 13). Approach B is strongly recommended because it matches the existing architecture pattern where Node handles data processing (calibration, smoothing) and MAX handles consumer-side musical features (mapping already lives in MAX subpatchers within the abstraction). Thresholds are a consumer-side feature -- the user configures them per their musical application.

The gap closure work also requires: fixing the help patch Recipe 2 to match the actual implementation, updating ROADMAP.md progress table to show Phase 4 as 2/3 (not 3/3), correcting outlet numbering in documentation (outlet 13 in JSON index, referred to as "outlet 12" in help patch which is correct in MAX 0-based display), and updating STATE.md with Phase 6 completion.

**Primary recommendation:** Build threshold logic in MAX within imu-sensor.maxpat abstraction, adapting the proven pattern from sensor-pipeline.maxpat's threshold subpatchers. Use #0-prefixed sends for instance isolation. Accept threshold configuration via the existing `threshold` route in the control inlet, parse it in MAX (not Node), and output events on outlet 13 (the existing placeholder triggers outlet).

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| max-api | (built-in) | MAX<->Node communication | Provided by MAX runtime, already in use |
| serialport | 12.0.0 | Serial port communication | Already installed, no changes needed |

### MAX Objects Used (no installation needed)
| Object | Purpose | Why This Object |
|--------|---------|-----------------|
| `>` / `<` | Threshold comparison (upper/lower bound) | Built-in comparators with right-inlet threshold update |
| `change` | Detect 0->1 and 1->0 transitions | Filters repeated values; standard crossing detection |
| `select 1` | Fire bang only on 0->1 transition | Isolates the crossing moment from the sustained state |
| `/ 2.` | Compute hysteresis half-width | Splits hysteresis into upper/lower offset |
| `+ 0.` / `- 0.` | Add/subtract hysteresis offset from threshold | Computes upper_bound and lower_bound |
| `route` | Parse threshold configuration messages | Already used throughout abstraction for message dispatch |
| `unpack` | Extract per-axis values from smoothed data | Already used in abstraction for data splitting |
| `prepend` | Tag trigger output with axis name | Standard MAX message tagging pattern |
| `button` | Visual flash on threshold fire | Feedback indicator (exists in sensor-pipeline subpatchers) |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| No new npm packages | - | - | - |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| MAX-side thresholds | Node-side thresholds | Node approach requires new handlers + outlet calls at 114Hz per threshold; adds IPC overhead; breaks pattern where musical features live in MAX |
| Per-axis subpatchers | Inline threshold objects | Subpatchers keep the abstraction clean; sensor-pipeline already uses this pattern successfully |
| `past` object | `>` + `change` + `select` | `past` only detects upward crossings; we need bidirectional (up + down) detection with hysteresis |

### Installation
No installation needed. All work uses existing Node dependencies and native MAX objects.

## Architecture Patterns

### Current Abstraction Architecture (relevant section)

```
[inlet ctrl] -> [route smoothing threshold transport ...]
                              |
                    outlet 1 (threshold messages)
                              |
                   [prepend threshold] -> [node.script]  <-- DEAD END (no handler)

[node.script] -> [route ... smooth_accel smooth_gyro smooth_orientation ...]
                                    |            |             |
                              [t l l]       [t l l]       [t l l]
                               |   |         |   |         |   |
                          outlet  mapping  outlet  mapping outlet  mapping
                                    |                |            |
                               [p map_ax]      [p map_gy]   [p map_yaw]

=== TRIGGERS (placeholder) ===
[obj-outlet-triggers index:13]  <-- nothing connects to it
```

### Recommended Architecture for Phase 6

```
[inlet ctrl] -> [route smoothing threshold transport ...]
                              |
                    outlet 1 (threshold messages)
                              |
            [route pitch roll yaw ax ay az set clear]
               |     |    |   |   |   |    |    |
            [p thresh_pitch] ...each axis... [config] [clear]
                              |
                         [prepend axis_name]
                              |
                         [outlet 13 (triggers)]

Data flow into threshold subpatchers:
[route ... smooth_accel smooth_gyro smooth_orientation ...]
                |              |              |
           [t l l l]      [t l l l]      [t l l l]    <-- add 3rd outlet for thresh
            |  |  |        |  |  |        |  |  |
       outlet map thresh  outlet map thresh  ...
                    |                  |
              [unpack f f f]    [unpack f f f]
               |    |    |      |    |    |
           [p thresh_ax] ...  [p thresh_pitch] ...
```

### Pattern 1: Threshold Subpatcher with Hysteresis (from sensor-pipeline.maxpat)
**What:** Each threshold instance uses dual comparators with hysteresis offset. The upper bound = threshold + hysteresis/2, lower bound = threshold - hysteresis/2. Upward crossing: `>` upper -> `change` -> `select 1` -> bang "up". Downward crossing: `<` lower -> `change` -> `select 1` -> bang "down".
**When to use:** Every threshold instance on every axis.
**Verified source:** Already built and working in sensor-pipeline.maxpat lines 10650-11400 (p thresh_pitch subpatcher).
**Example (from existing codebase):**
```
[inlet: smoothed value]
  |
  +--> [> upper_bound] --> [change] --> [select 1] --> "up" message
  |
  +--> [< lower_bound] --> [change] --> [select 1] --> "down" message
  |
  (upper_bound = threshold_value + hysteresis / 2)
  (lower_bound = threshold_value - hysteresis / 2)
```

### Pattern 2: Message-Based Threshold Configuration
**What:** User sends `threshold pitch 45` or `threshold pitch 45 hysteresis 5` to the abstraction inlet. A route object inside dispatches by axis name. The threshold value updates the right inlet of the `>` and `<` comparators (via the +/- hysteresis calculation chain).
**When to use:** For configuring thresholds from outside the abstraction.
**Example:**
```
[threshold pitch 45]
  |
[route pitch roll yaw ax ay az]
  |
[set threshold value in p thresh_pitch subpatcher]
```

### Pattern 3: Instance-Isolated Threshold Sends (#0 prefix)
**What:** All internal send/receive pairs in the abstraction use `#0_` prefix. Threshold subpatchers must follow this pattern, receiving smoothed data from #0-prefixed sends rather than global sends.
**When to use:** Always -- this is a locked architectural constraint from Phase 5 (05-02).
**Example:**
```
sensor-pipeline.maxpat:  [r smooth_pitch]          <-- global name
imu-sensor.maxpat:       [r #0_smooth_pitch]       <-- instance-isolated (DOES NOT EXIST YET)
```

**CRITICAL NOTE:** The abstraction currently does NOT have #0-prefixed sends for smoothed per-axis data. The smoothed data arrives as a list from `route ... smooth_accel smooth_gyro smooth_orientation`, gets split by `t l l` (one copy to outlet, one copy to mapping subpatcher). Threshold subpatchers need access to this same smoothed data. The simplest approach is to add a third outlet to `t l l` (making it `t l l l`) and wire the third copy to the threshold subpatcher.

### Anti-Patterns to Avoid

- **Routing threshold messages to Node.js:** The current abstraction sends `prepend threshold -> node.script`, but this is dead code. Do NOT add threshold handlers to Node. Thresholds are a consumer-side feature that belongs in MAX. Remove the `prepend threshold -> node.script` wiring and handle threshold messages entirely in MAX.

- **Using global send/receive names:** The sensor-pipeline.maxpat threshold subpatchers use `r smooth_pitch` (no #0 prefix). These will NOT work in the abstraction because multiple instances would collide. Either use direct wiring (recommended) or #0-prefixed sends.

- **Using `past` for bidirectional detection:** `past` only fires on upward crossings. The requirement specifies bang + direction (up/down), requiring dual detection chains.

- **Hard-coding threshold values:** Thresholds must be configurable via the control inlet message API. Default values are fine for loadbang initialization, but the user must be able to change them at runtime.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Threshold comparison | Custom JS threshold state machine | MAX `>` and `<` with `change` + `select` | Already proven in sensor-pipeline.maxpat; standard MAX pattern |
| Hysteresis | Complex state tracking | Dual comparators with offset thresholds | The dual-threshold pattern IS hysteresis; no state machine needed |
| Message parsing | Custom JavaScript router | MAX `route` object | Already used throughout the abstraction for message dispatch |
| Transition detection | Custom edge-detection code | MAX `change` object | Built for exactly this purpose; handles int transitions |

**Key insight:** The threshold logic already exists in sensor-pipeline.maxpat. The primary work is migration (adapting to #0 prefix, wiring to the outlet, adding message-based configuration) -- not invention.

## Common Pitfalls

### Pitfall 1: Global Send/Receive in Abstraction Context
**What goes wrong:** Threshold subpatcher uses `r smooth_pitch` (global name) but the abstraction uses #0-prefixed routing. Multiple abstraction instances would share threshold data incorrectly.
**Why it happens:** Direct copy from sensor-pipeline.maxpat without adapting for abstraction context.
**How to avoid:** Use direct wiring from the smoothed data route output into threshold subpatchers (via `t l l l` to add a third copy). This avoids send/receive entirely and is simpler than adding new #0-prefixed sends.
**Warning signs:** Two imu-sensor instances share threshold firings when only one board is moving.

### Pitfall 2: Threshold Route Collision with Node Prepend
**What goes wrong:** `threshold` messages go to Node.js (via existing `prepend threshold -> node.script` wiring) where they are silently ignored, AND to the new MAX-side threshold router, causing confusion during debugging.
**Why it happens:** The existing `prepend threshold` wiring from 05-02 was a placeholder for future work.
**How to avoid:** Remove or disconnect the `prepend threshold -> node.script` patchline. Route threshold messages to the new MAX-side threshold configuration chain instead.
**Warning signs:** `threshold pitch 45` message doesn't produce any errors but also doesn't configure thresholds.

### Pitfall 3: Outlet Index Off-By-One
**What goes wrong:** Documentation says "outlet 12" but JSON index is 13. This causes confusion about which outlet to connect in user patches.
**Why it happens:** MAX displays outlets 0-indexed in patcher view but JSON uses 1-indexed `index` field (1-based). The triggers outlet has `"index": 13` in JSON, which is outlet 12 in MAX's 0-based display. The help patch currently says "outlet 12" which IS correct from the user's perspective (0-based).
**How to avoid:** Maintain the help patch convention of 0-based outlet numbering (outlet 12 = triggers). In JSON, index 13 is correct for the 13th outlet.
**Warning signs:** User connects to wrong outlet. Numbering mismatch in documentation.

### Pitfall 4: Threshold Subpatcher Has No Outlet
**What goes wrong:** The sensor-pipeline.maxpat threshold subpatchers have `numoutlets: 0` -- the threshold fires internally (flashes a button) but no data leaves the subpatcher.
**Why it happens:** The original 04-03 plan was never executed, and the partially-built subpatchers were designed for visual feedback only, without output routing.
**How to avoid:** Add outlet(s) to each threshold subpatcher so the bang + direction data can flow out, be tagged with the axis name via `prepend`, and routed to abstraction outlet 13.
**Warning signs:** Threshold buttons flash inside subpatchers but nothing comes out of outlet 12.

### Pitfall 5: Hysteresis Default of 0 Causes Oscillation
**What goes wrong:** If hysteresis defaults to 0, the upper and lower bounds equal the threshold value, and sensor noise causes rapid firing.
**Why it happens:** Forgetting to set a sensible default hysteresis on loadbang.
**How to avoid:** The existing sensor-pipeline subpatchers already default to 5.0 (orientation) and 0.2 (accelerometer). Preserve these defaults.
**Warning signs:** Threshold fires rapidly when board is held near the boundary, even with hysteresis supposedly active.

### Pitfall 6: `== 0` Not `!` for Logical NOT
**What goes wrong:** Using `!` as a MAX object produces an error or unexpected behavior.
**Why it happens:** `!` is not a valid MAX object name. The project memory documents this: use `== 0` for logical NOT.
**How to avoid:** Always use `== 0` instead of `! 1` or `!` in MAX patches.
**Warning signs:** MAX console error about unknown object.

### Pitfall 7: Help Patch Recipe 2 Documents Non-Existent Feature
**What goes wrong:** User follows Recipe 2 (Gesture Triggers), sends `threshold pitch 45`, and nothing happens on outlet 12.
**Why it happens:** The help patch was built in Phase 5 based on the planned API, but the threshold implementation was never built. This is "false documentation" identified in the audit.
**How to avoid:** After implementing thresholds, verify that Recipe 2's exact message sequence produces the documented behavior. Update the recipe if the API changed.
**Warning signs:** Help patch instructions don't match actual abstraction behavior.

## Code Examples

### Existing Threshold Subpatcher (from sensor-pipeline.maxpat)

The full pattern exists in `max/sensor-pipeline.maxpat` lines 10650-11400 for pitch. It contains:

```
Input: [inlet] - smoothed pitch value
Threshold 1: flonum (default 30.) + hysteresis flonum (default 5.)
  [/ 2.] -> half-width
  threshold + half-width -> upper_bound via [+ 0.]
  threshold - half-width -> lower_bound via [- 0.]
  input > upper_bound -> [change] -> [select 1] -> [button flash] + "up" message
  input < lower_bound -> [change] -> [select 1] -> [button flash] + "down" message
Threshold 2: flonum (default 60.) + hysteresis flonum (default 5.)
  (same pattern duplicated)
```

### Threshold Configuration Message API

The recommended message format for the control inlet:

```
threshold pitch 45           -- set pitch threshold to 45 degrees
threshold pitch 45 5         -- set pitch threshold to 45 with hysteresis 5
threshold roll 30            -- set roll threshold to 30 degrees
threshold ax 1.5             -- set accelerometer X threshold to 1.5g
threshold clear              -- clear all thresholds (stop firing)
```

### Trigger Output Format

Output on outlet 13 (displayed as outlet 12 in MAX):

```
pitch up                     -- pitch crossed upward through threshold
pitch down                   -- pitch crossed downward through threshold
roll up                      -- roll crossed upward
ax up                        -- accelerometer X crossed upward
```

The output is a message with axis name followed by direction, matching the help patch Recipe 2's `route pitch ax` pattern.

### Wiring Threshold Data in Abstraction

The smoothed data currently flows through `t l l` (trigger, two copies: one to outlet, one to mapping). Add a third copy:

```
[route ... smooth_accel smooth_gyro smooth_orientation]
              |                          |
         [t l l l]                  [t l l l]        <-- add 3rd outlet
          |  |  |                    |  |  |
     outlet map thresh          outlet map thresh
                  |                           |
            [unpack f f f]              [unpack f f f]
             |    |    |                |    |    |
        thresh_ax ay  az         thresh_pitch roll yaw
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Threshold in sensor-pipeline dev patch (global sends, no output) | Threshold in abstraction (direct wiring, outlet output) | Phase 6 | Thresholds become usable from any MAX patch |
| `prepend threshold -> node.script` (dead code) | MAX-side threshold routing via route | Phase 6 | Removes dead code path, proper architecture |
| Help patch documents non-existent API | Help patch matches working implementation | Phase 6 | Closes critical audit gap |

## Existing Assets to Migrate

This is a migration-heavy phase. Key assets that already exist:

| Asset | Location | State | Migration Work |
|-------|----------|-------|----------------|
| 6 threshold subpatchers (p thresh_pitch, etc.) | sensor-pipeline.maxpat lines 10600-15300 | Complete logic, no output, global sends | Add outlet, wire output, adapt for direct wiring |
| Threshold route in control inlet | imu-sensor.maxpat line 142 | Routes to prepend threshold -> node.script | Redirect to MAX-side threshold router |
| Triggers outlet (index 13) | imu-sensor.maxpat line 9587-9596 | Placeholder, nothing connects | Wire threshold output to it |
| Help patch Recipe 2 | imu-sensor.maxhelp lines 1650-1920 | Documents non-existent API | Update to match actual implementation |
| Threshold message examples | imu-sensor.maxhelp lines 860-910 | `threshold pitch 45`, `threshold pitch 45 hysteresis 5` | Verify these work after implementation |

## Implementation Approach Decision

### Node-Side vs MAX-Side Thresholds

**Decision: MAX-side thresholds (in abstraction)**

| Factor | Node-Side | MAX-Side |
|--------|-----------|----------|
| Architecture consistency | Breaks pattern (musical features in MAX) | Follows pattern (smoothing params -> Node, mapping/thresholds -> MAX) |
| IPC overhead | New outlet calls per threshold per sample at 114Hz | Zero additional IPC |
| Real-time config | Requires message to Node for every threshold change | Direct wiring, instant parameter update |
| Visual feedback | Requires outlet for button flash | Button object in subpatcher, direct wiring |
| Existing code | Nothing exists | 6 complete subpatchers in sensor-pipeline.maxpat |
| Instance isolation | Node naturally isolated per instance | Requires #0 prefix or direct wiring |
| Latency | Extra round-trip through IPC | Zero additional latency |

**Note on smoothing:** Smoothing was implemented in Node (serial-bridge.js) because it modifies the data stream before any consumer sees it -- every outlet benefits from smoothing. Thresholds are different: they are a consumer that reads smoothed data and outputs discrete events. This is the same pattern as mapping, which also lives in MAX.

### Single vs Multiple Thresholds Per Axis

**Decision: Single configurable threshold per axis (not 2 fixed as in sensor-pipeline)**

The sensor-pipeline.maxpat has 2 hardcoded thresholds per axis (T1=30, T2=60 for orientation). For the abstraction, a single threshold per axis that is configurable via messages is more useful:
- Users configure the threshold they need via `threshold pitch 45`
- If they need multiple thresholds on one axis, they can use multiple abstraction instances or post-process outlet 12 in their own patch
- This simplifies the abstraction and matches the help patch's documented API (`threshold pitch 45`, not `threshold pitch t1 30 t2 60`)

**Alternative considered:** Multiple thresholds per axis via `threshold pitch add 45`, `threshold pitch add 60`. This adds complexity for a feature most users won't need. Recommend single threshold per axis for v1.0; multi-threshold can be a v2 enhancement.

## Scope: Gap Closure Items

Per the v1.0 milestone audit, these gaps must be closed:

| Gap | Source | Fix |
|-----|--------|-----|
| MAXI-03 unsatisfied | Requirements coverage | Implement threshold triggers |
| Threshold handlers missing from serial-bridge.js | Integration check | N/A -- implementing in MAX, not Node. Remove dead `prepend threshold -> node.script` wiring |
| Threshold modules not migrated to abstraction | Integration check | Build threshold subpatchers in imu-sensor.maxpat |
| Threshold trigger flow documented but not implemented | E2E flow check | Implement the flow: message -> route -> comparison -> outlet 13 |
| Help file documents non-existent threshold API | Tech debt (critical) | Update Recipe 2 + threshold message examples to match implementation |
| ROADMAP shows Phase 4 as 3/3 (actually 2/3) | Tech debt (warning) | Update ROADMAP progress table |
| No 04-VERIFICATION.md | Tech debt (warning) | Out of scope for Phase 6 (Phase 4 verification is retrospective) |
| Outlet @comment attributes missing | Tech debt (info) | Low priority, cosmetic |

## Open Questions

1. **Single threshold vs multiple thresholds per axis**
   - What we know: sensor-pipeline has 2 per axis; help patch documents single threshold API (`threshold pitch 45`)
   - What's unclear: Whether users will need multiple thresholds per axis in practice
   - Recommendation: Single configurable threshold per axis for v1.0. The help patch already documents this API. Multi-threshold can be v2.

2. **Threshold output format: bang vs direction symbol vs both**
   - What we know: Original 04-03 plan specified bang + direction ("up"/"down"). Help patch Recipe 2 shows `route pitch ax` on outlet 12, implying axis-tagged messages.
   - What's unclear: Whether output should be `pitch up`, `pitch bang`, or both
   - Recommendation: Output `axis_name direction` (e.g., `pitch up`, `pitch down`). This matches Recipe 2's route pattern and provides both axis identification and direction in one message.

3. **Whether to keep `prepend threshold -> node.script` wiring**
   - What we know: Currently routes threshold messages to Node where nothing handles them. This is dead code.
   - What's unclear: Whether any future plan expects Node-side threshold processing.
   - Recommendation: Remove the dead wiring. If Node-side thresholds are ever needed, they can be added later. Dead code creates confusion.

4. **Updating max/serial-bridge.js (the copy in max/)**
   - What we know: serial-bridge.js was copied to max/ directory for abstraction discovery. If we don't add Node threshold handlers, the copy doesn't need updating.
   - What's unclear: Whether the copy is kept in sync manually or via script.
   - Recommendation: No changes to serial-bridge.js for this phase. Thresholds are MAX-side only.

## Sources

### Primary (HIGH confidence)
- Existing codebase analysis: sensor-pipeline.maxpat (lines 10600-15300) -- verified threshold subpatcher structure, hysteresis logic, default values
- Existing codebase analysis: imu-sensor.maxpat -- verified route handler (line 142), prepend threshold (line 373), outlet 13 placeholder (line 9590), `t l l` data routing pattern
- Existing codebase analysis: imu-sensor.maxhelp -- verified Recipe 2 (lines 1650-1920), threshold message examples (lines 860-910), outlet numbering
- Existing codebase analysis: serial-bridge.js -- verified zero threshold handlers exist
- v1.0 Milestone Audit (.planning/v1.0-MILESTONE-AUDIT.md) -- gap inventory, tech debt items
- Phase 4 Research (.planning/phases/04-musical-tools/04-RESEARCH.md) -- threshold architecture pattern, hysteresis design, MAX object recommendations
- Phase 4 Context (.planning/phases/04-musical-tools/04-CONTEXT.md) -- locked decisions for threshold triggers
- Phase 5 Summary (.planning/phases/05-abstraction-wifi/05-02-SUMMARY.md) -- abstraction outlet API, #0 prefix convention, triggers outlet placeholder
- Phase 5 Summary (.planning/phases/05-abstraction-wifi/05-03-SUMMARY.md) -- help patch structure, Recipe 2 details

### Secondary (MEDIUM confidence)
- Phase 4 Plan 03 (.planning/phases/04-musical-tools/04-03-PLAN.md) -- original threshold specification (never executed), threshold defaults, visual feedback design
- Cycling '74 change object documentation -- transition detection behavior
- Cycling '74 route object documentation -- message dispatch pattern

### Tertiary (LOW confidence)
- None -- all findings verified against existing codebase

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH -- all native MAX objects already used in codebase
- Architecture: HIGH -- pattern directly migrated from working sensor-pipeline.maxpat code; abstraction routing verified in JSON
- Pitfalls: HIGH -- identified from actual codebase analysis (dead code paths, missing outputs, global send names)
- Gap closure: HIGH -- exhaustive gap list from verified milestone audit

**Research date:** 2026-02-13
**Valid until:** 2026-03-15 (30 days -- stable domain, existing codebase, no external dependencies)
