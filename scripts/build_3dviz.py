#!/usr/bin/env python3
"""
Build hideable Jitter 3D orientation visualization subpatcher.
Adds: textbutton toggle, pcontrol, subpatcher with jit.world, arrow shape,
ground grid, axis lines, camera, and enable/disable on open/close.
"""
import json

# Load existing patch
with open("/Users/taylorbrook/Dev/Aruido_AcceleromotersAndGyro/max/sensor-pipeline.maxpat", "r") as f:
    patch = json.load(f)

# Find the Y position of the threshold banner to place 3D viz after thresholds
# The threshold section starts at Y=1940, with 2 rows of 3 axes, each row is ~120px
# So thresholds end around Y=2180. Place 3D viz at Y=2220
VIZ_Y = 2220
VIZ_X = 60

new_boxes = []
new_lines = []

# ---- MAIN PATCH: 3D Viz Controls ----

# Banner
new_boxes.append({
    "box": {
        "fontface": 1,
        "fontsize": 16,
        "id": "obj-comment-3dviz-banner",
        "maxclass": "comment",
        "numinlets": 1,
        "numoutlets": 0,
        "patching_rect": [VIZ_X, VIZ_Y, 300, 24],
        "text": "=== 3D VISUALIZATION ==="
    }
})

# Textbutton toggle: "Show 3D" / "Hide 3D"
new_boxes.append({
    "box": {
        "id": "obj-btn-3dviz",
        "maxclass": "textbutton",
        "mode": 1,
        "numinlets": 1,
        "numoutlets": 3,
        "outlettype": ["", "", "int"],
        "parameter_enable": 0,
        "patching_rect": [VIZ_X, VIZ_Y + 35, 100, 30],
        "text": "Show 3D",
        "texton": "Hide 3D"
    }
})

# select 1 0
new_boxes.append({
    "box": {
        "id": "obj-sel-3dviz",
        "maxclass": "newobj",
        "numinlets": 3,
        "numoutlets": 3,
        "outlettype": ["bang", "bang", ""],
        "patching_rect": [VIZ_X, VIZ_Y + 75, 80, 22],
        "text": "select 1 0"
    }
})

# message "open"
new_boxes.append({
    "box": {
        "id": "obj-msg-3dopen",
        "maxclass": "message",
        "numinlets": 2,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [VIZ_X, VIZ_Y + 105, 40, 22],
        "text": "open"
    }
})

# message "close"
new_boxes.append({
    "box": {
        "id": "obj-msg-3dclose",
        "maxclass": "message",
        "numinlets": 2,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [VIZ_X + 50, VIZ_Y + 105, 40, 22],
        "text": "close"
    }
})

# pcontrol
new_boxes.append({
    "box": {
        "id": "obj-pcontrol-3d",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [VIZ_X, VIZ_Y + 135, 60, 22],
        "text": "pcontrol"
    }
})

# ---- BUILD 3D VIZ SUBPATCHER ----

sub_boxes = []
sub_lines = []

# Receive smoothed orientation
sub_boxes.append({
    "box": {
        "id": "obj-r-viz-pitch",
        "maxclass": "newobj",
        "numinlets": 0,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [30, 30, 90, 22],
        "text": "r smooth_pitch"
    }
})
sub_boxes.append({
    "box": {
        "id": "obj-r-viz-roll",
        "maxclass": "newobj",
        "numinlets": 0,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [130, 30, 85, 22],
        "text": "r smooth_roll"
    }
})
sub_boxes.append({
    "box": {
        "id": "obj-r-viz-yaw",
        "maxclass": "newobj",
        "numinlets": 0,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [230, 30, 85, 22],
        "text": "r smooth_yaw"
    }
})

# Pack rotation values: pitch=X, roll=Y, yaw=Z
sub_boxes.append({
    "box": {
        "id": "obj-pack-rot",
        "maxclass": "newobj",
        "numinlets": 3,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [30, 70, 80, 22],
        "text": "pack 0. 0. 0."
    }
})

# Prepend rotatexyz for both shapes
sub_boxes.append({
    "box": {
        "id": "obj-prepend-rot",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [30, 110, 115, 22],
        "text": "prepend rotatexyz"
    }
})

# Trigger to send rotation to both shapes
sub_boxes.append({
    "box": {
        "id": "obj-t-rot",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["", ""],
        "patching_rect": [30, 150, 40, 22],
        "text": "t l l"
    }
})

# Arrow tip (cone) - red-ish
sub_boxes.append({
    "box": {
        "id": "obj-cone",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["jit_gl_texture", ""],
        "patching_rect": [30, 200, 500, 22],
        "text": "jit.gl.gridshape myworld @shape cone @lighting_enable 1 @scale 0.3 0.3 0.5 @position 0. 0.5 0. @color 1.0 0.3 0.2 1.0"
    }
})

# Arrow shaft (cylinder) - blue
sub_boxes.append({
    "box": {
        "id": "obj-cylinder",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["jit_gl_texture", ""],
        "patching_rect": [30, 240, 530, 22],
        "text": "jit.gl.gridshape myworld @shape cylinder @lighting_enable 1 @scale 0.15 0.15 0.7 @position 0. -0.1 0. @color 0.3 0.6 1.0 1.0"
    }
})

# Ground plane grid (wireframe)
sub_boxes.append({
    "box": {
        "id": "obj-ground",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["jit_gl_texture", ""],
        "patching_rect": [30, 290, 560, 22],
        "text": "jit.gl.gridshape myworld @shape plane @lighting_enable 1 @position 0. -1.2 0. @rotatexyz 90. 0. 0. @scale 3. 3. 1. @color 0.3 0.3 0.3 1.0 @poly_mode 1 1 @dim 10 10"
    }
})

# Sketch for axis lines
sub_boxes.append({
    "box": {
        "id": "obj-sketch",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["", ""],
        "patching_rect": [30, 370, 220, 22],
        "text": "jit.gl.sketch myworld @lighting_enable 0"
    }
})

# Loadbang for axis lines drawing
sub_boxes.append({
    "box": {
        "id": "obj-loadbang-axes",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 1,
        "outlettype": ["bang"],
        "patching_rect": [30, 330, 60, 22],
        "text": "loadbang"
    }
})

# Message for drawing axis lines (X=red, Y=green, Z=blue)
sub_boxes.append({
    "box": {
        "id": "obj-msg-axes",
        "linecount": 4,
        "maxclass": "message",
        "numinlets": 2,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [100, 330, 400, 35],
        "text": "reset, glcolor 1 0 0 1, moveto 0 0 0, lineto 2 0 0, glcolor 0 1 0 1, moveto 0 0 0, lineto 0 2 0, glcolor 0 0 1 1, moveto 0 0 0, lineto 0 0 2, draw_now"
    }
})

# Camera (fixed 3/4 angle)
sub_boxes.append({
    "box": {
        "id": "obj-camera",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["jit_gl_texture", ""],
        "patching_rect": [30, 420, 310, 22],
        "text": "jit.gl.camera myworld @position 3. 2.5 3. @lookat 0. 0. 0."
    }
})

# World
sub_boxes.append({
    "box": {
        "id": "obj-world",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["jit_matrix", ""],
        "patching_rect": [30, 500, 420, 22],
        "text": "jit.world myworld @enable 0 @fps 30 @size 400 400 @floating 1 @erase_color 0.15 0.15 0.15 1.0"
    }
})

# Enable/disable on open/close
# loadbang -> 1 -> "enable $1" -> jit.world (enable on open)
sub_boxes.append({
    "box": {
        "id": "obj-loadbang-enable",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 1,
        "outlettype": ["bang"],
        "patching_rect": [30, 450, 60, 22],
        "text": "loadbang"
    }
})
sub_boxes.append({
    "box": {
        "id": "obj-int-enable",
        "maxclass": "newobj",
        "numinlets": 2,
        "numoutlets": 1,
        "outlettype": ["int"],
        "patching_rect": [30, 475, 30, 22],
        "text": "i 1"
    }
})

# closebang -> 0 -> "enable $1" -> jit.world (disable on close)
sub_boxes.append({
    "box": {
        "id": "obj-closebang",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 1,
        "outlettype": ["bang"],
        "patching_rect": [200, 450, 65, 22],
        "text": "closebang"
    }
})
sub_boxes.append({
    "box": {
        "id": "obj-int-disable",
        "maxclass": "newobj",
        "numinlets": 2,
        "numoutlets": 1,
        "outlettype": ["int"],
        "patching_rect": [200, 475, 30, 22],
        "text": "i 0"
    }
})

# "enable $1" message
sub_boxes.append({
    "box": {
        "id": "obj-msg-enable",
        "maxclass": "message",
        "numinlets": 2,
        "numoutlets": 1,
        "outlettype": [""],
        "patching_rect": [100, 475, 65, 22],
        "text": "enable $1"
    }
})

# ---- SUBPATCHER PATCHLINES ----

# Receive -> pack rotation
sub_lines.append({
    "patchline": {
        "destination": ["obj-pack-rot", 0],
        "source": ["obj-r-viz-pitch", 0]
    }
})
sub_lines.append({
    "patchline": {
        "destination": ["obj-pack-rot", 1],
        "source": ["obj-r-viz-roll", 0]
    }
})
sub_lines.append({
    "patchline": {
        "destination": ["obj-pack-rot", 2],
        "source": ["obj-r-viz-yaw", 0]
    }
})

# pack -> prepend rotatexyz
sub_lines.append({
    "patchline": {
        "destination": ["obj-prepend-rot", 0],
        "source": ["obj-pack-rot", 0]
    }
})

# prepend -> trigger (to send to both shapes)
sub_lines.append({
    "patchline": {
        "destination": ["obj-t-rot", 0],
        "source": ["obj-prepend-rot", 0]
    }
})

# trigger -> cone (right outlet = first to fire in trigger)
sub_lines.append({
    "patchline": {
        "destination": ["obj-cone", 0],
        "source": ["obj-t-rot", 0]
    }
})

# trigger -> cylinder (left outlet = second to fire)
sub_lines.append({
    "patchline": {
        "destination": ["obj-cylinder", 0],
        "source": ["obj-t-rot", 1]
    }
})

# loadbang for axes -> message -> sketch
sub_lines.append({
    "patchline": {
        "destination": ["obj-msg-axes", 0],
        "source": ["obj-loadbang-axes", 0]
    }
})
sub_lines.append({
    "patchline": {
        "destination": ["obj-sketch", 0],
        "source": ["obj-msg-axes", 0]
    }
})

# Enable on open: loadbang -> i 1 -> enable $1 -> jit.world
sub_lines.append({
    "patchline": {
        "destination": ["obj-int-enable", 0],
        "source": ["obj-loadbang-enable", 0]
    }
})
sub_lines.append({
    "patchline": {
        "destination": ["obj-msg-enable", 0],
        "source": ["obj-int-enable", 0]
    }
})

# Disable on close: closebang -> i 0 -> enable $1 -> jit.world
sub_lines.append({
    "patchline": {
        "destination": ["obj-int-disable", 0],
        "source": ["obj-closebang", 0]
    }
})
sub_lines.append({
    "patchline": {
        "destination": ["obj-msg-enable", 0],
        "source": ["obj-int-disable", 0]
    }
})

# enable message -> jit.world
sub_lines.append({
    "patchline": {
        "destination": ["obj-world", 0],
        "source": ["obj-msg-enable", 0]
    }
})


# Build subpatcher object
viz_subpatcher = {
    "fileversion": 1,
    "appversion": {
        "major": 9,
        "minor": 1,
        "revision": 1,
        "architecture": "x64",
        "modernui": 1
    },
    "classnamespace": "box",
    "rect": [100, 100, 650, 600],
    "boxes": sub_boxes,
    "lines": sub_lines
}

# Add the subpatcher box
new_boxes.append({
    "box": {
        "id": "obj-p-3dviz",
        "maxclass": "newobj",
        "numinlets": 1,
        "numoutlets": 0,
        "outlettype": [],
        "patching_rect": [VIZ_X, VIZ_Y + 165, 120, 22],
        "text": "p 3d_viz",
        "patcher": viz_subpatcher,
        "saved_object_attributes": {}
    }
})

# ---- MAIN PATCH PATCHLINES ----

# textbutton (outlet 2 = int toggle state) -> select 1 0
new_lines.append({
    "patchline": {
        "destination": ["obj-sel-3dviz", 0],
        "source": ["obj-btn-3dviz", 2]
    }
})

# select 1 -> "open" message
new_lines.append({
    "patchline": {
        "destination": ["obj-msg-3dopen", 0],
        "source": ["obj-sel-3dviz", 0]
    }
})

# select 0 -> "close" message
new_lines.append({
    "patchline": {
        "destination": ["obj-msg-3dclose", 0],
        "source": ["obj-sel-3dviz", 1]
    }
})

# "open" -> pcontrol
new_lines.append({
    "patchline": {
        "destination": ["obj-pcontrol-3d", 0],
        "source": ["obj-msg-3dopen", 0]
    }
})

# "close" -> pcontrol
new_lines.append({
    "patchline": {
        "destination": ["obj-pcontrol-3d", 0],
        "source": ["obj-msg-3dclose", 0]
    }
})

# pcontrol -> subpatcher
new_lines.append({
    "patchline": {
        "destination": ["obj-p-3dviz", 0],
        "source": ["obj-pcontrol-3d", 0]
    }
})

# Add to patch
patch["patcher"]["boxes"].extend(new_boxes)
patch["patcher"]["lines"].extend(new_lines)

# Write updated patch
with open("/Users/taylorbrook/Dev/Aruido_AcceleromotersAndGyro/max/sensor-pipeline.maxpat", "w") as f:
    json.dump(patch, f, indent=4)

print(f"Added {len(new_boxes)} boxes and {len(new_lines)} lines for 3D visualization")
print("3D viz subpatcher with: arrow (cone+cylinder), ground grid, axis lines, camera, enable/disable")
