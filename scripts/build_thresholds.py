#!/usr/bin/env python3
"""
Build threshold trigger modules with hysteresis for 6 axes (pitch, roll, yaw, aX, aY, aZ).
Each axis gets 2 threshold instances. Uses subpatchers per axis.
Adds boxes and patchlines to sensor-pipeline.maxpat.
"""
import json
import sys

# Load existing patch
with open("/Users/taylorbrook/Dev/Aruido_AcceleromotersAndGyro/max/sensor-pipeline.maxpat", "r") as f:
    patch = json.load(f)

# Configuration for 6 axes
ORIENT_AXES = [
    {"name": "pitch", "recv": "r smooth_pitch", "t1": 30.0, "t2": 60.0, "hyst": 5.0},
    {"name": "roll",  "recv": "r smooth_roll",  "t1": 30.0, "t2": 60.0, "hyst": 5.0},
    {"name": "yaw",   "recv": "r smooth_yaw",   "t1": 30.0, "t2": 60.0, "hyst": 5.0},
]

ACCEL_AXES = [
    {"name": "ax", "recv": "r smooth_ax", "t1": 0.5, "t2": 1.5, "hyst": 0.2},
    {"name": "ay", "recv": "r smooth_ay", "t1": 0.5, "t2": 1.5, "hyst": 0.2},
    {"name": "az", "recv": "r smooth_az", "t1": 0.5, "t2": 1.5, "hyst": 0.2},
]

ALL_AXES = ORIENT_AXES + ACCEL_AXES

# Starting Y position (below last mapping element at Y=1890)
BASE_Y = 1940
X_START = 60

new_boxes = []
new_lines = []

# Banner comment
new_boxes.append({
    "box": {
        "fontface": 1,
        "fontsize": 16,
        "id": "obj-comment-thresh-banner",
        "maxclass": "comment",
        "numinlets": 1,
        "numoutlets": 0,
        "patching_rect": [X_START, BASE_Y, 300, 24],
        "text": "=== THRESHOLDS ==="
    }
})

current_y = BASE_Y + 40

def build_threshold_subpatcher(axis_name, recv_text, thresh1_val, thresh2_val, hyst_val, is_accel):
    """Build the internal contents of a threshold subpatcher for one axis with 2 thresholds."""
    sub_boxes = []
    sub_lines = []

    # Inlet for the smoothed value
    sub_boxes.append({
        "box": {
            "id": "obj-inlet",
            "maxclass": "inlet",
            "numinlets": 0,
            "numoutlets": 1,
            "outlettype": [""],
            "patching_rect": [30, 20, 30, 30],
            "comment": f"Smoothed {axis_name} value"
        }
    })

    # For each threshold (2 per axis)
    for ti, (thresh_val, x_offset) in enumerate([(thresh1_val, 0), (thresh2_val, 400)]):
        prefix = f"t{ti+1}"
        bx = 30 + x_offset
        by = 70

        # Label
        sub_boxes.append({
            "box": {
                "fontface": 1,
                "fontsize": 11,
                "id": f"obj-label-{prefix}",
                "maxclass": "comment",
                "numinlets": 1,
                "numoutlets": 0,
                "patching_rect": [bx, by, 150, 19],
                "text": f"Threshold {ti+1}"
            }
        })

        # Threshold value flonum
        sub_boxes.append({
            "box": {
                "format": 6,
                "id": f"obj-thresh-val-{prefix}",
                "maxclass": "flonum",
                "numinlets": 1,
                "numoutlets": 2,
                "outlettype": ["", "bang"],
                "parameter_enable": 0,
                "patching_rect": [bx, by + 25, 64, 22]
            }
        })

        # Threshold default value message (via loadbang)
        sub_boxes.append({
            "box": {
                "id": f"obj-loadbang-{prefix}",
                "maxclass": "newobj",
                "numinlets": 1,
                "numoutlets": 1,
                "outlettype": ["bang"],
                "patching_rect": [bx + 70, by + 5, 60, 22],
                "text": "loadbang"
            }
        })
        sub_boxes.append({
            "box": {
                "id": f"obj-default-thresh-{prefix}",
                "maxclass": "message",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": [""],
                "patching_rect": [bx + 70, by + 25, 50, 22],
                "text": str(thresh_val)
            }
        })

        # Hysteresis label + flonum
        sub_boxes.append({
            "box": {
                "fontsize": 10,
                "id": f"obj-label-hyst-{prefix}",
                "maxclass": "comment",
                "numinlets": 1,
                "numoutlets": 0,
                "patching_rect": [bx + 140, by, 80, 19],
                "text": "Hysteresis"
            }
        })
        sub_boxes.append({
            "box": {
                "format": 6,
                "id": f"obj-hyst-val-{prefix}",
                "maxclass": "flonum",
                "numinlets": 1,
                "numoutlets": 2,
                "outlettype": ["", "bang"],
                "parameter_enable": 0,
                "patching_rect": [bx + 140, by + 25, 54, 22]
            }
        })
        # Hysteresis default
        sub_boxes.append({
            "box": {
                "id": f"obj-loadbang-hyst-{prefix}",
                "maxclass": "newobj",
                "numinlets": 1,
                "numoutlets": 1,
                "outlettype": ["bang"],
                "patching_rect": [bx + 200, by + 5, 60, 22],
                "text": "loadbang"
            }
        })
        sub_boxes.append({
            "box": {
                "id": f"obj-default-hyst-{prefix}",
                "maxclass": "message",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": [""],
                "patching_rect": [bx + 200, by + 25, 40, 22],
                "text": str(hyst_val)
            }
        })

        # Compute hysteresis / 2
        sub_boxes.append({
            "box": {
                "id": f"obj-div2-{prefix}",
                "maxclass": "newobj",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": ["float"],
                "patching_rect": [bx + 140, by + 55, 40, 22],
                "text": "/ 2."
            }
        })

        # Upper bound: threshold + hyst/2
        sub_boxes.append({
            "box": {
                "id": f"obj-upper-{prefix}",
                "maxclass": "newobj",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": ["float"],
                "patching_rect": [bx, by + 85, 40, 22],
                "text": "+ 0."
            }
        })

        # Lower bound: threshold - hyst/2
        sub_boxes.append({
            "box": {
                "id": f"obj-lower-{prefix}",
                "maxclass": "newobj",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": ["float"],
                "patching_rect": [bx + 100, by + 85, 40, 22],
                "text": "- 0."
            }
        })

        # Greater than upper bound (for upward crossing)
        sub_boxes.append({
            "box": {
                "id": f"obj-gt-{prefix}",
                "maxclass": "newobj",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": ["int"],
                "patching_rect": [bx, by + 115, 40, 22],
                "text": "> 0."
            }
        })

        # Less than lower bound (for downward crossing)
        sub_boxes.append({
            "box": {
                "id": f"obj-lt-{prefix}",
                "maxclass": "newobj",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": ["int"],
                "patching_rect": [bx + 100, by + 115, 40, 22],
                "text": "< 0."
            }
        })

        # Change objects (filter repeated values)
        sub_boxes.append({
            "box": {
                "id": f"obj-change-up-{prefix}",
                "maxclass": "newobj",
                "numinlets": 1,
                "numoutlets": 3,
                "outlettype": ["", "int", "int"],
                "patching_rect": [bx, by + 145, 55, 22],
                "text": "change"
            }
        })
        sub_boxes.append({
            "box": {
                "id": f"obj-change-dn-{prefix}",
                "maxclass": "newobj",
                "numinlets": 1,
                "numoutlets": 3,
                "outlettype": ["", "int", "int"],
                "patching_rect": [bx + 100, by + 145, 55, 22],
                "text": "change"
            }
        })

        # Select 1 (fires only on 0->1 transition)
        sub_boxes.append({
            "box": {
                "id": f"obj-sel-up-{prefix}",
                "maxclass": "newobj",
                "numinlets": 2,
                "numoutlets": 2,
                "outlettype": ["bang", ""],
                "patching_rect": [bx, by + 175, 55, 22],
                "text": "select 1"
            }
        })
        sub_boxes.append({
            "box": {
                "id": f"obj-sel-dn-{prefix}",
                "maxclass": "newobj",
                "numinlets": 2,
                "numoutlets": 2,
                "outlettype": ["bang", ""],
                "patching_rect": [bx + 100, by + 175, 55, 22],
                "text": "select 1"
            }
        })

        # Visual feedback button (flashes on crossing)
        sub_boxes.append({
            "box": {
                "id": f"obj-btn-flash-{prefix}",
                "maxclass": "button",
                "numinlets": 1,
                "numoutlets": 1,
                "outlettype": ["bang"],
                "parameter_enable": 0,
                "patching_rect": [bx + 200, by + 175, 24, 24]
            }
        })

        # Direction messages
        sub_boxes.append({
            "box": {
                "id": f"obj-msg-up-{prefix}",
                "maxclass": "message",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": [""],
                "patching_rect": [bx, by + 210, 35, 22],
                "text": "up"
            }
        })
        sub_boxes.append({
            "box": {
                "id": f"obj-msg-dn-{prefix}",
                "maxclass": "message",
                "numinlets": 2,
                "numoutlets": 1,
                "outlettype": [""],
                "patching_rect": [bx + 100, by + 210, 42, 22],
                "text": "down"
            }
        })

        # Outlets: bang (crossing event) and direction (up/down)
        # Outlet 0 = bang event for threshold ti
        # Outlet 1 = direction symbol for threshold ti

        # ---- PATCHLINES for this threshold ----

        # loadbang -> default thresh value
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-default-thresh-{prefix}", 0],
                "source": [f"obj-loadbang-{prefix}", 0]
            }
        })
        # default thresh -> thresh flonum
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-thresh-val-{prefix}", 0],
                "source": [f"obj-default-thresh-{prefix}", 0]
            }
        })
        # loadbang -> default hyst value
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-default-hyst-{prefix}", 0],
                "source": [f"obj-loadbang-hyst-{prefix}", 0]
            }
        })
        # default hyst -> hyst flonum
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-hyst-val-{prefix}", 0],
                "source": [f"obj-default-hyst-{prefix}", 0]
            }
        })
        # hyst flonum -> / 2
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-div2-{prefix}", 0],
                "source": [f"obj-hyst-val-{prefix}", 0]
            }
        })
        # thresh val -> upper bound (left inlet = threshold)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-upper-{prefix}", 0],
                "source": [f"obj-thresh-val-{prefix}", 0]
            }
        })
        # thresh val -> lower bound (left inlet = threshold)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-lower-{prefix}", 0],
                "source": [f"obj-thresh-val-{prefix}", 0]
            }
        })
        # hyst/2 -> upper bound (right inlet)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-upper-{prefix}", 1],
                "source": [f"obj-div2-{prefix}", 0]
            }
        })
        # hyst/2 -> lower bound (right inlet)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-lower-{prefix}", 1],
                "source": [f"obj-div2-{prefix}", 0]
            }
        })
        # upper bound -> > right inlet (sets the comparison value)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-gt-{prefix}", 1],
                "source": [f"obj-upper-{prefix}", 0]
            }
        })
        # lower bound -> < right inlet (sets the comparison value)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-lt-{prefix}", 1],
                "source": [f"obj-lower-{prefix}", 0]
            }
        })
        # inlet -> > (left inlet = input value)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-gt-{prefix}", 0],
                "source": ["obj-inlet", 0]
            }
        })
        # inlet -> < (left inlet = input value)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-lt-{prefix}", 0],
                "source": ["obj-inlet", 0]
            }
        })
        # > -> change (up path)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-change-up-{prefix}", 0],
                "source": [f"obj-gt-{prefix}", 0]
            }
        })
        # < -> change (down path)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-change-dn-{prefix}", 0],
                "source": [f"obj-lt-{prefix}", 0]
            }
        })
        # change -> select 1 (up path)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-sel-up-{prefix}", 0],
                "source": [f"obj-change-up-{prefix}", 0]
            }
        })
        # change -> select 1 (down path)
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-sel-dn-{prefix}", 0],
                "source": [f"obj-change-dn-{prefix}", 0]
            }
        })
        # select 1 up -> button flash
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-btn-flash-{prefix}", 0],
                "source": [f"obj-sel-up-{prefix}", 0]
            }
        })
        # select 1 down -> button flash
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-btn-flash-{prefix}", 0],
                "source": [f"obj-sel-dn-{prefix}", 0]
            }
        })
        # select 1 up -> "up" message
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-msg-up-{prefix}", 0],
                "source": [f"obj-sel-up-{prefix}", 0]
            }
        })
        # select 1 down -> "down" message
        sub_lines.append({
            "patchline": {
                "destination": [f"obj-msg-dn-{prefix}", 0],
                "source": [f"obj-sel-dn-{prefix}", 0]
            }
        })

    return {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [100, 100, 850, 500],
        "boxes": sub_boxes,
        "lines": sub_lines
    }, {}


# Build all 6 axis threshold subpatchers
for i, axis in enumerate(ALL_AXES):
    is_accel = (i >= 3)
    col = i % 3
    row = i // 3
    x = X_START + col * 200
    y = current_y + row * 120

    name = axis["name"]

    # Section label
    label_name = name.capitalize() if not is_accel else name
    group = "Accel" if is_accel else "Orientation"

    if col == 0:
        # Group header
        if i == 0:
            new_boxes.append({
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": f"obj-comment-thresh-orient-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [x, y - 5, 200, 20],
                    "text": "Orientation Thresholds"
                }
            })
        elif i == 3:
            new_boxes.append({
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": f"obj-comment-thresh-accel-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [x, y - 5, 200, 20],
                    "text": "Accelerometer Thresholds"
                }
            })

    # Per-axis label
    new_boxes.append({
        "box": {
            "fontface": 1,
            "fontsize": 11,
            "id": f"obj-comment-thresh-{name}",
            "maxclass": "comment",
            "numinlets": 1,
            "numoutlets": 0,
            "patching_rect": [x, y + 15, 150, 19],
            "text": f"--- {label_name} Thresholds ---"
        }
    })

    # Receive object for smoothed data
    new_boxes.append({
        "box": {
            "id": f"obj-r-thresh-{name}",
            "maxclass": "newobj",
            "numinlets": 0,
            "numoutlets": 1,
            "outlettype": [""],
            "patching_rect": [x, y + 40, 100, 22],
            "text": axis["recv"]
        }
    })

    # Build subpatcher
    sub_patcher, sub_attrs = build_threshold_subpatcher(
        name, axis["recv"], axis["t1"], axis["t2"], axis["hyst"], is_accel
    )

    new_boxes.append({
        "box": {
            "id": f"obj-p-thresh-{name}",
            "maxclass": "newobj",
            "numinlets": 1,
            "numoutlets": 0,
            "outlettype": [],
            "patching_rect": [x, y + 70, 130, 22],
            "text": f"p thresh_{name}",
            "patcher": sub_patcher,
            "saved_object_attributes": sub_attrs
        }
    })

    # Patchline: receive -> subpatcher
    new_lines.append({
        "patchline": {
            "destination": [f"obj-p-thresh-{name}", 0],
            "source": [f"obj-r-thresh-{name}", 0]
        }
    })

# Add boxes and lines to the patch
patch["patcher"]["boxes"].extend(new_boxes)
patch["patcher"]["lines"].extend(new_lines)

# Write updated patch
with open("/Users/taylorbrook/Dev/Aruido_AcceleromotersAndGyro/max/sensor-pipeline.maxpat", "w") as f:
    json.dump(patch, f, indent=4)

print(f"Added {len(new_boxes)} boxes and {len(new_lines)} lines for threshold modules")
print("Threshold modules added for: pitch, roll, yaw, ax, ay, az")
