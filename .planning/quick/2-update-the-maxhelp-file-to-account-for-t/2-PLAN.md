---
phase: quick
plan: 2
type: execute
wave: 1
depends_on: [quick-1]
files_modified: [max/imu-sensor.maxhelp]
autonomous: true
requirements: [NORM-DOC]

must_haves:
  truths:
    - "Help patch imu-sensor object shows 16 outlets (was 13) matching abstraction"
    - "Outlets 13-15 (norm_accel, norm_gyro, norm_orient) are labeled and documented"
    - "Normalize toggle message is shown in Message Reference section"
    - "User can see how to enable normalization and what the outputs look like"
  artifacts:
    - path: "max/imu-sensor.maxhelp"
      provides: "Updated help patch with normalization documentation"
      contains: "normalize"
  key_links:
    - from: "max/imu-sensor.maxhelp"
      to: "max/imu-sensor.maxpat"
      via: "outlet count and ordering must match"
      pattern: "numoutlets.*16"
---

<objective>
Update the imu-sensor.maxhelp file to document the 3 new normalized output outlets and the normalize toggle message added in quick task 1.

Purpose: Users opening the help patch need to see the new normalization feature -- how to enable it and what the 3 new outlets (13: norm_accel, 14: norm_gyro, 15: norm_orient) output.

Output: Updated max/imu-sensor.maxhelp with 16 outlets, normalized outlet documentation, normalize message in reference, and a normalization section/recipe.
</objective>

<execution_context>
@/Users/taylorbrook/.claude/get-shit-done/workflows/execute-plan.md
@/Users/taylorbrook/.claude/get-shit-done/templates/summary.md
</execution_context>

<context>
@.planning/quick/1-add-normalization-toggle-that-normalize-/1-SUMMARY.md
@max/imu-sensor.maxhelp
@max/imu-sensor.maxpat
@node/serial-bridge.js
</context>

<tasks>

<task type="auto">
  <name>Task 1: Update imu-sensor.maxhelp with normalization outlets and message reference</name>
  <files>max/imu-sensor.maxhelp</files>
  <action>
Read the full max/imu-sensor.maxhelp JSON file. Make the following targeted edits:

1. **Update subtitle comment** (obj-subtitle): Append ", and normalization" to the description text so it mentions the normalize feature alongside calibration, smoothing, mapping, etc.

2. **Update imu-sensor object outlet count** (obj-imu-basic):
   - Change `numoutlets` from 13 to 16
   - Update `outlettype` array to have 16 empty strings instead of 13
   - Keep the existing `patching_rect` width at 1100.0 (already wide enough)

3. **Add 3 new outlet label+print+description box groups** for outlets 13, 14, 15. Follow the exact same pattern as the existing outlets (e.g., outlet7-label through outlet12). Place them to the right of the existing outlet 12 (triggers) documentation.

   Outlet 13 - norm_accel:
   - Label comment (obj-outlet13-label): fontface 1, fontsize 10, patching_rect [20.0, 300.0-area... actually place at x=20, below triggers section is too cluttered -- place these AFTER outlet 12 at x positions continuing the row].

   Actually, the existing outlets span x=20 to x=1115. The patch rect width is 1200. We need to either extend the patch or place these on a second row. Looking at the existing layout, outlets are at y=210/230/248. The best approach is to widen the rect slightly and continue:

   Place the 3 new outlet groups continuing the horizontal row after outlet 12 (triggers at x=1115). But the patch rect is only 1200 wide. Instead, shift approach: the existing outlets at x=1115 end around x=1200, so there's no room. Place the 3 new normalized outlets on a NEW ROW below the existing outlet descriptions, around y=290.

   Outlet 13 - norm_accel (x=20.0, y=290):
   - Bold label: "13: norm_accel", fontface 1, fontsize 10, id "obj-outlet13-label", patching_rect [20.0, 308.0, 90.0, 18.0]
   - Print object: "print norm_accel", id "obj-print-norm-accel", patching_rect [20.0, 290.0, 105.0, 22.0]
   - Description: "3 floats: aX aY aZ\nnormalized 0.0-1.0", fontsize 9, linecount 2, id "obj-outlet13-desc", patching_rect [20.0, 326.0, 100.0, 27.0]

   Outlet 14 - norm_gyro (x=130.0, y=290):
   - Bold label: "14: norm_gyro", fontface 1, fontsize 10, id "obj-outlet14-label", patching_rect [130.0, 308.0, 90.0, 18.0]
   - Print object: "print norm_gyro", id "obj-print-norm-gyro", patching_rect [130.0, 290.0, 100.0, 22.0]
   - Description: "3 floats: gX gY gZ\nnormalized 0.0-1.0", fontsize 9, linecount 2, id "obj-outlet14-desc", patching_rect [130.0, 326.0, 100.0, 27.0]

   Outlet 15 - norm_orient (x=240.0, y=290):
   - Bold label: "15: norm_orient", fontface 1, fontsize 10, id "obj-outlet15-label", patching_rect [240.0, 308.0, 100.0, 18.0]
   - Print object: "print norm_orient", id "obj-print-norm-orient", patching_rect [240.0, 290.0, 107.0, 22.0]
   - Description: "3 floats: pitch roll yaw\nnormalized 0.0-1.0", fontsize 9, linecount 2, id "obj-outlet15-desc", patching_rect [240.0, 326.0, 110.0, 27.0]

   NOTE: Since these are on a new row below the existing outlet docs (which end at y~275), we need to push the "Message Reference" section and everything below it down by ~80px (the new outlet row takes about 80px). This means:
   - obj-section-messages patching_rect y: 300 -> 380
   - ALL subsequent objects: add 80 to their y coordinate in patching_rect
   - This includes ALL message boxes, descriptions, test signal section, recipes, config section, etc.

4. **Add normalize message to Message Reference section.** Add a new "-- Normalization --" header and "normalize 1" / "normalize 0" message boxes with descriptions, in the same style as the other message groups. Place them after the existing Smoothing section (which ends around y=502+80=582).

   Insert between smoothing and thresholds, or add after WiFi config. Best location: add a new section header and messages in the right column area (x=800) or in the left column below smoothing. Actually, to keep it clean, add after the Smoothing section at x=400:

   - Header comment: "-- Normalization --", fontface 1, id "obj-msg-header-normalize", patching_rect [400.0, (old 530 + 80 = 610), 200.0, 20.0]
   - Message "normalize 1": id "obj-msg-normalize-on", patching_rect [400.0, 632.0, 84.0, 22.0]
   - Description: "Enable normalized 0-1 output on outlets 13-15", fontsize 11, id "obj-msg-normalize-on-desc", patching_rect [490.0, 632.0, 300.0, 19.0], textcolor [0.4, 0.4, 0.4, 1.0]
   - Message "normalize 0": id "obj-msg-normalize-off", patching_rect [400.0, 657.0, 84.0, 22.0]
   - Description: "Disable normalization (outlets 13-15 go silent)", fontsize 11, id "obj-msg-normalize-off-desc", patching_rect [490.0, 657.0, 300.0, 19.0], textcolor [0.4, 0.4, 0.4, 1.0]

5. **Add patchlines** for:
   - obj-imu-basic outlet 13 -> obj-print-norm-accel inlet 0
   - obj-imu-basic outlet 14 -> obj-print-norm-gyro inlet 0
   - obj-imu-basic outlet 15 -> obj-print-norm-orient inlet 0
   - obj-msg-normalize-on outlet 0 -> obj-imu-basic inlet 0 (routed to left side like other messages)
   - obj-msg-normalize-off outlet 0 -> obj-imu-basic inlet 0

6. **Update args-info comment** (obj-args-info): Update text to mention the normalize message, e.g. append "| Messages: normalize, smoothing, threshold, transport, calibrate, mapping, connect, disconnect"

IMPORTANT IMPLEMENTATION NOTES:
- The maxhelp is a JSON file. Parse it, modify the data structure, and write it back with 4-space indentation.
- When shifting y coordinates, be thorough: every box and every patchline midpoint below y=275 needs the offset applied.
- Maintain the exact same JSON structure patterns (maxclass, numinlets, numoutlets, outlettype, patching_rect, etc.)
- For patchlines from the imu-sensor object to the new print objects, use the same pattern as existing outlet patchlines (source ["obj-imu-basic", N] -> destination ["obj-print-norm-accel", 0]).
- The outlet indices on obj-imu-basic map to position: outlet 13 is the 14th outlet (0-indexed = 13).
- Midpoints in patchlines are optional but help with routing clarity.
  </action>
  <verify>
1. Run `node -e "JSON.parse(require('fs').readFileSync('max/imu-sensor.maxhelp','utf8')); console.log('valid JSON')"` to verify the file is valid JSON.
2. Grep for "numoutlets.*16" in the imu-sensor object to confirm 16 outlets.
3. Grep for "norm_accel" and "normalize" to confirm new content exists.
4. Count total outlet connections: should be 13 original + 3 new = at least 16 patchlines from obj-imu-basic.
  </verify>
  <done>
- imu-sensor.maxhelp has valid JSON structure
- imu-sensor object shows 16 outlets matching the abstraction
- Outlets 13 (norm_accel), 14 (norm_gyro), 15 (norm_orient) have labels, print objects, and descriptions
- "normalize 1" and "normalize 0" messages appear in Message Reference with descriptions
- All message boxes route to the imu-sensor inlet via patchlines
- All new outlet connections have patchlines to print objects
- All existing content remains intact (recipes, test signal, config examples)
  </done>
</task>

</tasks>

<verification>
- `node -e "JSON.parse(require('fs').readFileSync('max/imu-sensor.maxhelp','utf8')); console.log('valid JSON')"` returns "valid JSON"
- The help patch contains documentation for all 16 outlets
- The normalize message is documented in the Message Reference
- Opening the help patch in MAX/MSP should show the updated outlet row and normalization messages
</verification>

<success_criteria>
- imu-sensor.maxhelp is valid JSON with 16-outlet imu-sensor object
- All 3 normalized outlets (13-15) are documented with labels, print objects, and range descriptions
- Normalize toggle messages (normalize 1, normalize 0) are in Message Reference section
- All patchlines connect properly (new outlets to prints, new messages to imu-sensor inlet)
</success_criteria>

<output>
After completion, create `.planning/quick/2-update-the-maxhelp-file-to-account-for-t/2-SUMMARY.md`
</output>
