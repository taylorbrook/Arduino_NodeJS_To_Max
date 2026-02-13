{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [
            688.0,
            95.0,
            900.0,
            1600.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        17.0,
                        59.0,
                        64.0,
                        22.0
                    ],
                    "text": "script start"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-1",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "n4m.monitor.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [
                        0.0,
                        0.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        632.0,
                        -3.0,
                        400.0,
                        220.0
                    ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        350.0,
                        15.0,
                        280.0,
                        27.0
                    ],
                    "text": "Arduino IMU Serial Bridge"
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        102.5,
                        59.0,
                        65.0,
                        22.0
                    ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "id": "obj-msg-disconnect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        182.5,
                        59.0,
                        80.0,
                        22.0
                    ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-msg-listports",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        277.5,
                        59.0,
                        68.0,
                        22.0
                    ],
                    "text": "listports"
                }
            },
            {
                "box": {
                    "id": "obj-msg-reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        362.5,
                        59.0,
                        50.0,
                        22.0
                    ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "obj-nodescript",
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        120.0,
                        320.0,
                        49.0
                    ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "watch": 0
                    },
                    "text": "node.script /Users/taylorbrook/Dev/Aruido_AcceleromotersAndGyro/node/serial-bridge.js @autostart 1",
                    "textfile": {
                        "filename": "serial-bridge.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-route",
                    "maxclass": "newobj",
                    "numinlets": 12,
                    "numoutlets": 12,
                    "outlettype": [
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        200.0,
                        620.0,
                        22.0
                    ],
                    "text": "route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias cal_toggle"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-accel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        270.0,
                        140.0,
                        21.0
                    ],
                    "text": "Accelerometer (g)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        60.0,
                        300.0,
                        140.0,
                        22.0
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-ax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        330.0,
                        30.0,
                        20.0
                    ],
                    "text": "aX"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-ax",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        60.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-ay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        130.0,
                        330.0,
                        30.0,
                        20.0
                    ],
                    "text": "aY"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-ay",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        130.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-az",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        200.0,
                        330.0,
                        30.0,
                        20.0
                    ],
                    "text": "aZ"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-az",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        200.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-gyro",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        310.0,
                        270.0,
                        130.0,
                        21.0
                    ],
                    "text": "Gyroscope (dps)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        310.0,
                        300.0,
                        140.0,
                        22.0
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-gx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        310.0,
                        330.0,
                        30.0,
                        20.0
                    ],
                    "text": "gX"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-gx",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        310.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-gy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        380.0,
                        330.0,
                        30.0,
                        20.0
                    ],
                    "text": "gY"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-gy",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        380.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-gz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        450.0,
                        330.0,
                        30.0,
                        20.0
                    ],
                    "text": "gZ"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-gz",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        450.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-orient",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        597.0,
                        270.0,
                        165.0,
                        21.0
                    ],
                    "text": "Orientation (degrees)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        597.0,
                        300.0,
                        140.0,
                        22.0
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        597.0,
                        330.0,
                        40.0,
                        20.0
                    ],
                    "text": "Pitch"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-pitch",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        597.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        667.0,
                        330.0,
                        40.0,
                        20.0
                    ],
                    "text": "Roll"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-roll",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        667.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        737.0,
                        330.0,
                        40.0,
                        20.0
                    ],
                    "text": "Yaw"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-yaw",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        737.0,
                        350.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-status",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        573.0,
                        200.5,
                        140.0,
                        21.0
                    ],
                    "text": "Connection Status"
                }
            },
            {
                "box": {
                    "id": "obj-status-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        494.0,
                        236.0,
                        150.0,
                        22.0
                    ],
                    "text": "scanning"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-cal-section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        420.0,
                        180.0,
                        21.0
                    ],
                    "text": "Calibration Controls"
                }
            },
            {
                "box": {
                    "id": "obj-btn-calibrate",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "",
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        60.0,
                        450.0,
                        120.0,
                        30.0
                    ],
                    "text": "Calibrate",
                    "texton": "Stop & Apply"
                }
            },
            {
                "box": {
                    "id": "obj-sel-cal",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        490.0,
                        100.0,
                        22.0
                    ],
                    "text": "select 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calstart",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        520.0,
                        90.0,
                        22.0
                    ],
                    "text": "calibrate_start"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calstop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        160.0,
                        520.0,
                        90.0,
                        22.0
                    ],
                    "text": "calibrate_stop"
                }
            },
            {
                "box": {
                    "id": "obj-btn-orient",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "",
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        541.0,
                        452.0,
                        120.0,
                        30.0
                    ],
                    "text": "Reset Orient"
                }
            },
            {
                "box": {
                    "id": "obj-btn-orientrestore",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "",
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        671.0,
                        452.0,
                        120.0,
                        30.0
                    ],
                    "text": "Restore Orient"
                }
            },
            {
                "box": {
                    "id": "obj-msg-orientreset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        541.0,
                        492.0,
                        80.0,
                        22.0
                    ],
                    "text": "orient_reset"
                }
            },
            {
                "box": {
                    "id": "obj-msg-orientrestore",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        671.0,
                        492.0,
                        90.0,
                        22.0
                    ],
                    "text": "orient_restore"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-progress",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        327.0,
                        420.0,
                        170.0,
                        21.0
                    ],
                    "text": "Calibration Progress"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-progress",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        327.0,
                        456.0,
                        100.0,
                        22.0
                    ],
                    "text": "unpack i i"
                }
            },
            {
                "box": {
                    "id": "obj-slider-progress",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "orientation": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        327.0,
                        486.0,
                        200.0,
                        20.0
                    ],
                    "size": 201.0
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-calstatus",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        327.0,
                        520.0,
                        100.0,
                        21.0
                    ],
                    "text": "Cal Status"
                }
            },
            {
                "box": {
                    "id": "obj-cal-status-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        327.0,
                        546.0,
                        150.0,
                        22.0
                    ],
                    "text": "idle"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-bias",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        560.0,
                        120.0,
                        21.0
                    ],
                    "text": "Bias Offsets"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-bias",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [
                        "float",
                        "float",
                        "float",
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        60.0,
                        586.0,
                        200.0,
                        22.0
                    ],
                    "text": "unpack f f f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-sprintf-bias",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        616.0,
                        400.0,
                        22.0
                    ],
                    "text": "sprintf aX:%.2f aY:%.2f aZ:%.2f gX:%.2f gY:%.2f gZ:%.2f"
                }
            },
            {
                "box": {
                    "id": "obj-bias-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        646.0,
                        400.0,
                        22.0
                    ],
                    "text": "aX:-0.07 aY:0.06 aZ:-0.12 gX:-15.40 gY:-3.50 gZ:-7.54"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-cal-data",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        670.0,
                        150.0,
                        21.0
                    ],
                    "text": "Calibrated Data"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-calaccel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        700.0,
                        140.0,
                        21.0
                    ],
                    "text": "Cal Accel (g)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-calaccel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        60.0,
                        726.0,
                        140.0,
                        22.0
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-ax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "caX"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-ax",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        60.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-ay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        130.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "caY"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-ay",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        130.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-az",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        200.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "caZ"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-az",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        200.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-calgyro",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        310.0,
                        700.0,
                        140.0,
                        21.0
                    ],
                    "text": "Cal Gyro (dps)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-calgyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        310.0,
                        726.0,
                        140.0,
                        22.0
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-gx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        310.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "cgX"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-gx",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        310.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-gy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        380.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "cgY"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-gy",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        380.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-gz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        450.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "cgZ"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-gz",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        450.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-calorient",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        597.0,
                        700.0,
                        160.0,
                        21.0
                    ],
                    "text": "Cal Orient (deg)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-calorient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        597.0,
                        726.0,
                        140.0,
                        22.0
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        597.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "cPit"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-pitch",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        597.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        667.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "cRol"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-roll",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        667.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        737.0,
                        756.0,
                        40.0,
                        20.0
                    ],
                    "text": "cYaw"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-cal-yaw",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        737.0,
                        776.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-set-cal-toggle",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        393.0,
                        45.0,
                        22.0
                    ],
                    "text": "set $1"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-comment-smooth-banner",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        820.0,
                        300.0,
                        24.0
                    ],
                    "text": "=== SMOOTHING ==="
                }
            },
            {
                "box": {
                    "id": "obj-loadbang-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        60.0,
                        850.0,
                        58.0,
                        22.0
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-int-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        60.0,
                        876.0,
                        29.0,
                        22.0
                    ],
                    "text": "i 1"
                }
            },
            {
                "box": {
                    "id": "obj-comment-global-dial",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        905.0,
                        50.0,
                        20.0
                    ],
                    "text": "Global"
                }
            },
            {
                "box": {
                    "id": "obj-dial-global",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        60.0,
                        925.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-accel-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        160.0,
                        905.0,
                        80.0,
                        20.0
                    ],
                    "text": "Accel Group"
                }
            },
            {
                "box": {
                    "id": "obj-dial-accel-group",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        160.0,
                        925.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-global-accel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        160.0,
                        975.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-ax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        130.0,
                        1005.0,
                        30.0,
                        20.0
                    ],
                    "text": "aX"
                }
            },
            {
                "box": {
                    "id": "obj-dial-ax",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        130.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-ax",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        130.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-ax",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        130.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-ax",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-ay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        190.0,
                        1005.0,
                        30.0,
                        20.0
                    ],
                    "text": "aY"
                }
            },
            {
                "box": {
                    "id": "obj-dial-ay",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        190.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-ay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        190.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-ay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        190.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-ay",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        190.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-az",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        250.0,
                        1005.0,
                        30.0,
                        20.0
                    ],
                    "text": "aZ"
                }
            },
            {
                "box": {
                    "id": "obj-dial-az",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        250.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-az",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        250.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-az",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        250.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-az",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        320.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-gyro-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        400.0,
                        905.0,
                        80.0,
                        20.0
                    ],
                    "text": "Gyro Group"
                }
            },
            {
                "box": {
                    "id": "obj-dial-gyro-group",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        400.0,
                        925.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-global-gyro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        400.0,
                        975.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-gx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        370.0,
                        1005.0,
                        30.0,
                        20.0
                    ],
                    "text": "gX"
                }
            },
            {
                "box": {
                    "id": "obj-dial-gx",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        370.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-gx",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        370.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-gx",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        370.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-gx",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        370.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-gy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        430.0,
                        1005.0,
                        30.0,
                        20.0
                    ],
                    "text": "gY"
                }
            },
            {
                "box": {
                    "id": "obj-dial-gy",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        430.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-gy",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        430.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-gy",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        430.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-gy",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        430.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-gz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        490.0,
                        1005.0,
                        30.0,
                        20.0
                    ],
                    "text": "gZ"
                }
            },
            {
                "box": {
                    "id": "obj-dial-gz",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        490.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-gz",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        490.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-gz",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        490.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-gz",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        490.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-orient-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        640.0,
                        905.0,
                        80.0,
                        20.0
                    ],
                    "text": "Orient Group"
                }
            },
            {
                "box": {
                    "id": "obj-dial-orient-group",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        640.0,
                        925.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-global-orient",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        640.0,
                        975.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        610.0,
                        1005.0,
                        40.0,
                        20.0
                    ],
                    "text": "Pitch"
                }
            },
            {
                "box": {
                    "id": "obj-dial-pitch",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        610.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-pitch",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        610.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-pitch",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        610.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-pitch",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        610.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        670.0,
                        1005.0,
                        40.0,
                        20.0
                    ],
                    "text": "Roll"
                }
            },
            {
                "box": {
                    "id": "obj-dial-roll",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        670.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-roll",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        670.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-roll",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        670.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-roll",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        670.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        730.0,
                        1005.0,
                        40.0,
                        20.0
                    ],
                    "text": "Yaw"
                }
            },
            {
                "box": {
                    "id": "obj-dial-yaw",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        730.0,
                        1025.0,
                        40.0,
                        40.0
                    ],
                    "size": 50.0,
                    "floatoutput": 1,
                    "setminmax": [
                        1.0,
                        50.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mul-yaw",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        730.0,
                        1075.0,
                        40.0,
                        22.0
                    ],
                    "text": "* 1."
                }
            },
            {
                "box": {
                    "id": "obj-max-yaw",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        730.0,
                        1101.0,
                        55.0,
                        22.0
                    ],
                    "text": "maximum 1"
                }
            },
            {
                "box": {
                    "id": "obj-slide-yaw",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        730.0,
                        1130.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 1. 1."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-smooth-output",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        1165.0,
                        200.0,
                        21.0
                    ],
                    "text": "Smoothed Output"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "saX"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-ax",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        60.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        1240.0,
                        72.0,
                        22.0
                    ],
                    "text": "s smooth_ax"
                }
            },
            {
                "box": {
                    "id": "obj-comment-say",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        190.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "saY"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-ay",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        190.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        190.0,
                        1240.0,
                        72.0,
                        22.0
                    ],
                    "text": "s smooth_ay"
                }
            },
            {
                "box": {
                    "id": "obj-comment-saz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        320.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "saZ"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-az",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        320.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        320.0,
                        1240.0,
                        72.0,
                        22.0
                    ],
                    "text": "s smooth_az"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sgx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        370.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "sgX"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-gx",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        370.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-gx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        370.0,
                        1240.0,
                        72.0,
                        22.0
                    ],
                    "text": "s smooth_gx"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sgy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        430.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "sgY"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-gy",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        430.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-gy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        430.0,
                        1240.0,
                        72.0,
                        22.0
                    ],
                    "text": "s smooth_gy"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sgz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        490.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "sgZ"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-gz",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        490.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-gz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        490.0,
                        1240.0,
                        72.0,
                        22.0
                    ],
                    "text": "s smooth_gz"
                }
            },
            {
                "box": {
                    "id": "obj-comment-spitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        610.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "sPit"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-pitch",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        610.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        610.0,
                        1240.0,
                        85.0,
                        22.0
                    ],
                    "text": "s smooth_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sroll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        670.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "sRol"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-roll",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        670.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        670.0,
                        1240.0,
                        80.0,
                        22.0
                    ],
                    "text": "s smooth_roll"
                }
            },
            {
                "box": {
                    "id": "obj-comment-syaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        730.0,
                        1190.0,
                        40.0,
                        20.0
                    ],
                    "text": "sYaw"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-smooth-yaw",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        730.0,
                        1210.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        730.0,
                        1240.0,
                        80.0,
                        22.0
                    ],
                    "text": "s smooth_yaw"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-comment-quat-banner",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        1280.0,
                        300.0,
                        24.0
                    ],
                    "text": "=== QUATERNION ==="
                }
            },
            {
                "box": {
                    "id": "obj-pack-euler-raw",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        1320.0,
                        100.0,
                        22.0
                    ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-euler2quat-raw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "jit_matrix",
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        1350.0,
                        100.0,
                        22.0
                    ],
                    "text": "jit.euler2quat"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-quat-raw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [
                        "float",
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        60.0,
                        1380.0,
                        180.0,
                        22.0
                    ],
                    "text": "unpack f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-qx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        60.0,
                        1410.0,
                        30.0,
                        20.0
                    ],
                    "text": "qX"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-qx",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        60.0,
                        1430.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-qy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        130.0,
                        1410.0,
                        30.0,
                        20.0
                    ],
                    "text": "qY"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-qy",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        130.0,
                        1430.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-qz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        200.0,
                        1410.0,
                        30.0,
                        20.0
                    ],
                    "text": "qZ"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-qz",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        200.0,
                        1430.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-qw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        270.0,
                        1410.0,
                        30.0,
                        20.0
                    ],
                    "text": "qW"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-qw",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        270.0,
                        1430.0,
                        64.0,
                        22.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-r-smooth-pitch",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        450.0,
                        1290.0,
                        85.0,
                        22.0
                    ],
                    "text": "r smooth_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-r-smooth-roll",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        550.0,
                        1290.0,
                        80.0,
                        22.0
                    ],
                    "text": "r smooth_roll"
                }
            },
            {
                "box": {
                    "id": "obj-r-smooth-yaw",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        650.0,
                        1290.0,
                        80.0,
                        22.0
                    ],
                    "text": "r smooth_yaw"
                }
            },
            {
                "box": {
                    "id": "obj-pack-euler-smooth",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        450.0,
                        1320.0,
                        100.0,
                        22.0
                    ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-euler2quat-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "jit_matrix",
                        ""
                    ],
                    "patching_rect": [
                        450.0,
                        1350.0,
                        100.0,
                        22.0
                    ],
                    "text": "jit.euler2quat"
                }
            },
            {
                "box": {
                    "id": "obj-send-quat-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        450.0,
                        1380.0,
                        90.0,
                        22.0
                    ],
                    "text": "s quat_smooth"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-smoothquat",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        450.0,
                        1405.0,
                        200.0,
                        19.0
                    ],
                    "text": "Smoothed Quat (for 3D viz)"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        26.5,
                        105.0,
                        259.5,
                        105.0
                    ],
                    "source": [
                        "obj-3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sel-cal",
                        0
                    ],
                    "midpoints": [
                        69.5,
                        483.0,
                        69.5,
                        483.0
                    ],
                    "source": [
                        "obj-btn-calibrate",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-orientreset",
                        0
                    ],
                    "midpoints": [
                        550.5,
                        483.0,
                        550.5,
                        483.0
                    ],
                    "source": [
                        "obj-btn-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-orientrestore",
                        0
                    ],
                    "midpoints": [
                        680.5,
                        483.0,
                        680.5,
                        483.0
                    ],
                    "source": [
                        "obj-btn-orientrestore",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        69.5,
                        543.0,
                        45.0,
                        543.0,
                        45.0,
                        117.0,
                        259.5,
                        117.0
                    ],
                    "source": [
                        "obj-msg-calstart",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        169.5,
                        543.0,
                        312.0,
                        543.0,
                        312.0,
                        384.0,
                        276.0,
                        384.0,
                        276.0,
                        234.0,
                        237.0,
                        234.0,
                        237.0,
                        117.0,
                        259.5,
                        117.0
                    ],
                    "source": [
                        "obj-msg-calstop",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        112.0,
                        105.0,
                        259.5,
                        105.0
                    ],
                    "source": [
                        "obj-msg-connect",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        192.0,
                        105.0,
                        259.5,
                        105.0
                    ],
                    "source": [
                        "obj-msg-disconnect",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        287.0,
                        105.0,
                        259.5,
                        105.0
                    ],
                    "source": [
                        "obj-msg-listports",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        550.5,
                        516.0,
                        528.0,
                        516.0,
                        528.0,
                        384.0,
                        276.0,
                        384.0,
                        276.0,
                        234.0,
                        237.0,
                        234.0,
                        237.0,
                        117.0,
                        259.5,
                        117.0
                    ],
                    "source": [
                        "obj-msg-orientreset",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        680.5,
                        525.0,
                        528.0,
                        525.0,
                        528.0,
                        384.0,
                        276.0,
                        384.0,
                        276.0,
                        234.0,
                        237.0,
                        234.0,
                        237.0,
                        117.0,
                        259.5,
                        117.0
                    ],
                    "source": [
                        "obj-msg-orientrestore",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        372.0,
                        105.0,
                        259.5,
                        105.0
                    ],
                    "source": [
                        "obj-msg-reset",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-btn-calibrate",
                        0
                    ],
                    "midpoints": [
                        69.5,
                        417.0,
                        57.0,
                        417.0,
                        57.0,
                        444.0,
                        69.5,
                        444.0
                    ],
                    "source": [
                        "obj-msg-set-cal-toggle",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "midpoints": [
                        560.5,
                        171.0,
                        582.0,
                        171.0,
                        582.0,
                        93.0,
                        345.0,
                        93.0,
                        345.0,
                        0.0,
                        627.0,
                        0.0,
                        627.0,
                        -3.0,
                        641.5,
                        -3.0
                    ],
                    "source": [
                        "obj-nodescript",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route",
                        0
                    ],
                    "midpoints": [
                        259.5,
                        171.0,
                        259.5,
                        171.0
                    ],
                    "source": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-cal-status-display",
                        1
                    ],
                    "midpoints": [
                        641.9545454545455,
                        231.0,
                        645.0,
                        231.0,
                        645.0,
                        267.0,
                        582.0,
                        267.0,
                        582.0,
                        438.0,
                        528.0,
                        438.0,
                        528.0,
                        531.0,
                        467.5,
                        531.0
                    ],
                    "source": [
                        "obj-route",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-set-cal-toggle",
                        0
                    ],
                    "midpoints": [
                        805.8636363636364,
                        336.0,
                        813.0,
                        336.0,
                        813.0,
                        390.0,
                        69.5,
                        390.0
                    ],
                    "source": [
                        "obj-route",
                        10
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-status-display",
                        1
                    ],
                    "midpoints": [
                        423.4090909090909,
                        234.0,
                        489.0,
                        234.0,
                        489.0,
                        231.0,
                        634.5,
                        231.0
                    ],
                    "source": [
                        "obj-route",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-accel",
                        0
                    ],
                    "midpoints": [
                        259.5,
                        255.0,
                        45.0,
                        255.0,
                        45.0,
                        297.0,
                        69.5,
                        297.0
                    ],
                    "source": [
                        "obj-route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-bias",
                        0
                    ],
                    "midpoints": [
                        751.2272727272727,
                        255.0,
                        645.0,
                        255.0,
                        645.0,
                        267.0,
                        582.0,
                        267.0,
                        582.0,
                        273.0,
                        450.0,
                        273.0,
                        450.0,
                        255.0,
                        45.0,
                        255.0,
                        45.0,
                        582.0,
                        69.5,
                        582.0
                    ],
                    "source": [
                        "obj-route",
                        9
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-calaccel",
                        0
                    ],
                    "midpoints": [
                        478.0454545454545,
                        255.0,
                        45.0,
                        255.0,
                        45.0,
                        723.0,
                        69.5,
                        723.0
                    ],
                    "source": [
                        "obj-route",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-calgyro",
                        0
                    ],
                    "midpoints": [
                        532.6818181818182,
                        225.0,
                        480.0,
                        225.0,
                        480.0,
                        315.0,
                        528.0,
                        315.0,
                        528.0,
                        687.0,
                        297.0,
                        687.0,
                        297.0,
                        723.0,
                        319.5,
                        723.0
                    ],
                    "source": [
                        "obj-route",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-calorient",
                        0
                    ],
                    "midpoints": [
                        587.3181818181818,
                        231.0,
                        480.0,
                        231.0,
                        480.0,
                        315.0,
                        528.0,
                        315.0,
                        528.0,
                        723.0,
                        606.5,
                        723.0
                    ],
                    "source": [
                        "obj-route",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-gyro",
                        0
                    ],
                    "midpoints": [
                        314.1363636363636,
                        255.0,
                        297.0,
                        255.0,
                        297.0,
                        297.0,
                        319.5,
                        297.0
                    ],
                    "source": [
                        "obj-route",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-orient",
                        0
                    ],
                    "midpoints": [
                        368.77272727272725,
                        255.0,
                        480.0,
                        255.0,
                        480.0,
                        297.0,
                        606.5,
                        297.0
                    ],
                    "source": [
                        "obj-route",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-progress",
                        0
                    ],
                    "midpoints": [
                        696.590909090909,
                        255.0,
                        645.0,
                        255.0,
                        645.0,
                        267.0,
                        582.0,
                        267.0,
                        582.0,
                        405.0,
                        312.0,
                        405.0,
                        312.0,
                        453.0,
                        336.5,
                        453.0
                    ],
                    "source": [
                        "obj-route",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-calstart",
                        0
                    ],
                    "midpoints": [
                        69.5,
                        513.0,
                        69.5,
                        513.0
                    ],
                    "source": [
                        "obj-sel-cal",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-calstop",
                        0
                    ],
                    "midpoints": [
                        110.0,
                        513.0,
                        169.5,
                        513.0
                    ],
                    "source": [
                        "obj-sel-cal",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bias-display",
                        1
                    ],
                    "midpoints": [
                        69.5,
                        639.0,
                        450.5,
                        639.0
                    ],
                    "source": [
                        "obj-sprintf-bias",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-ax",
                        0
                    ],
                    "midpoints": [
                        69.5,
                        324.0,
                        57.0,
                        324.0,
                        57.0,
                        345.0,
                        69.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-ay",
                        0
                    ],
                    "midpoints": [
                        130.0,
                        327.0,
                        126.0,
                        327.0,
                        126.0,
                        345.0,
                        139.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-accel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-az",
                        0
                    ],
                    "midpoints": [
                        190.5,
                        345.0,
                        209.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-accel",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sprintf-bias",
                        5
                    ],
                    "midpoints": [
                        250.5,
                        609.0,
                        450.5,
                        609.0
                    ],
                    "source": [
                        "obj-unpack-bias",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sprintf-bias",
                        4
                    ],
                    "midpoints": [
                        214.3,
                        609.0,
                        374.3,
                        609.0
                    ],
                    "source": [
                        "obj-unpack-bias",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sprintf-bias",
                        3
                    ],
                    "midpoints": [
                        178.1,
                        609.0,
                        298.1,
                        609.0
                    ],
                    "source": [
                        "obj-unpack-bias",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sprintf-bias",
                        2
                    ],
                    "midpoints": [
                        141.9,
                        609.0,
                        221.9,
                        609.0
                    ],
                    "source": [
                        "obj-unpack-bias",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sprintf-bias",
                        1
                    ],
                    "midpoints": [
                        105.7,
                        609.0,
                        145.7,
                        609.0
                    ],
                    "source": [
                        "obj-unpack-bias",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sprintf-bias",
                        0
                    ],
                    "midpoints": [
                        69.5,
                        609.0,
                        69.5,
                        609.0
                    ],
                    "source": [
                        "obj-unpack-bias",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-ax",
                        0
                    ],
                    "midpoints": [
                        69.5,
                        750.0,
                        57.0,
                        750.0,
                        57.0,
                        771.0,
                        69.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calaccel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-ay",
                        0
                    ],
                    "midpoints": [
                        130.0,
                        753.0,
                        126.0,
                        753.0,
                        126.0,
                        771.0,
                        139.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calaccel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-az",
                        0
                    ],
                    "midpoints": [
                        190.5,
                        771.0,
                        209.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calaccel",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-gx",
                        0
                    ],
                    "midpoints": [
                        319.5,
                        750.0,
                        306.0,
                        750.0,
                        306.0,
                        771.0,
                        319.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calgyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-gy",
                        0
                    ],
                    "midpoints": [
                        380.0,
                        753.0,
                        375.0,
                        753.0,
                        375.0,
                        771.0,
                        389.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calgyro",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-gz",
                        0
                    ],
                    "midpoints": [
                        440.5,
                        771.0,
                        459.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calgyro",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-pitch",
                        0
                    ],
                    "midpoints": [
                        606.5,
                        750.0,
                        594.0,
                        750.0,
                        594.0,
                        771.0,
                        606.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calorient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-roll",
                        0
                    ],
                    "midpoints": [
                        667.0,
                        753.0,
                        663.0,
                        753.0,
                        663.0,
                        771.0,
                        676.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calorient",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-cal-yaw",
                        0
                    ],
                    "midpoints": [
                        727.5,
                        771.0,
                        746.5,
                        771.0
                    ],
                    "source": [
                        "obj-unpack-calorient",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-gx",
                        0
                    ],
                    "midpoints": [
                        319.5,
                        324.0,
                        306.0,
                        324.0,
                        306.0,
                        345.0,
                        319.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-gy",
                        0
                    ],
                    "midpoints": [
                        380.0,
                        327.0,
                        375.0,
                        327.0,
                        375.0,
                        345.0,
                        389.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-gyro",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-gz",
                        0
                    ],
                    "midpoints": [
                        440.5,
                        345.0,
                        459.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-gyro",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-pitch",
                        0
                    ],
                    "midpoints": [
                        606.5,
                        324.0,
                        594.0,
                        324.0,
                        594.0,
                        345.0,
                        606.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-roll",
                        0
                    ],
                    "midpoints": [
                        667.0,
                        327.0,
                        663.0,
                        327.0,
                        663.0,
                        345.0,
                        676.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-orient",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-yaw",
                        0
                    ],
                    "midpoints": [
                        727.5,
                        345.0,
                        746.5,
                        345.0
                    ],
                    "source": [
                        "obj-unpack-orient",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slider-progress",
                        0
                    ],
                    "midpoints": [
                        336.5,
                        480.0,
                        336.5,
                        480.0
                    ],
                    "source": [
                        "obj-unpack-progress",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-int-1",
                        0
                    ],
                    "source": [
                        "obj-loadbang-smooth",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-global",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-accel-group",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-gyro-group",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-orient-group",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-ax",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-ay",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-az",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-gx",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-gy",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-gz",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-pitch",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-roll",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-dial-yaw",
                        0
                    ],
                    "source": [
                        "obj-int-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-global-accel",
                        1
                    ],
                    "source": [
                        "obj-dial-global",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-global-gyro",
                        1
                    ],
                    "source": [
                        "obj-dial-global",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-global-orient",
                        1
                    ],
                    "source": [
                        "obj-dial-global",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-global-accel",
                        0
                    ],
                    "source": [
                        "obj-dial-accel-group",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-global-gyro",
                        0
                    ],
                    "source": [
                        "obj-dial-gyro-group",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-global-orient",
                        0
                    ],
                    "source": [
                        "obj-dial-orient-group",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-ax",
                        1
                    ],
                    "source": [
                        "obj-mul-global-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-ay",
                        1
                    ],
                    "source": [
                        "obj-mul-global-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-az",
                        1
                    ],
                    "source": [
                        "obj-mul-global-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-ax",
                        0
                    ],
                    "source": [
                        "obj-dial-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-ax",
                        0
                    ],
                    "source": [
                        "obj-mul-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-ax",
                        1
                    ],
                    "source": [
                        "obj-max-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-ax",
                        2
                    ],
                    "source": [
                        "obj-max-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-ay",
                        0
                    ],
                    "source": [
                        "obj-dial-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-ay",
                        0
                    ],
                    "source": [
                        "obj-mul-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-ay",
                        1
                    ],
                    "source": [
                        "obj-max-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-ay",
                        2
                    ],
                    "source": [
                        "obj-max-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-az",
                        0
                    ],
                    "source": [
                        "obj-dial-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-az",
                        0
                    ],
                    "source": [
                        "obj-mul-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-az",
                        1
                    ],
                    "source": [
                        "obj-max-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-az",
                        2
                    ],
                    "source": [
                        "obj-max-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-gx",
                        1
                    ],
                    "source": [
                        "obj-mul-global-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-gy",
                        1
                    ],
                    "source": [
                        "obj-mul-global-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-gz",
                        1
                    ],
                    "source": [
                        "obj-mul-global-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-gx",
                        0
                    ],
                    "source": [
                        "obj-dial-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-gx",
                        0
                    ],
                    "source": [
                        "obj-mul-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gx",
                        1
                    ],
                    "source": [
                        "obj-max-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gx",
                        2
                    ],
                    "source": [
                        "obj-max-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-gy",
                        0
                    ],
                    "source": [
                        "obj-dial-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-gy",
                        0
                    ],
                    "source": [
                        "obj-mul-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gy",
                        1
                    ],
                    "source": [
                        "obj-max-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gy",
                        2
                    ],
                    "source": [
                        "obj-max-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-gz",
                        0
                    ],
                    "source": [
                        "obj-dial-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-gz",
                        0
                    ],
                    "source": [
                        "obj-mul-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gz",
                        1
                    ],
                    "source": [
                        "obj-max-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gz",
                        2
                    ],
                    "source": [
                        "obj-max-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-pitch",
                        1
                    ],
                    "source": [
                        "obj-mul-global-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-roll",
                        1
                    ],
                    "source": [
                        "obj-mul-global-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-yaw",
                        1
                    ],
                    "source": [
                        "obj-mul-global-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-pitch",
                        0
                    ],
                    "source": [
                        "obj-dial-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-pitch",
                        0
                    ],
                    "source": [
                        "obj-mul-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-pitch",
                        1
                    ],
                    "source": [
                        "obj-max-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-pitch",
                        2
                    ],
                    "source": [
                        "obj-max-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-roll",
                        0
                    ],
                    "source": [
                        "obj-dial-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-roll",
                        0
                    ],
                    "source": [
                        "obj-mul-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-roll",
                        1
                    ],
                    "source": [
                        "obj-max-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-roll",
                        2
                    ],
                    "source": [
                        "obj-max-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mul-yaw",
                        0
                    ],
                    "source": [
                        "obj-dial-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-max-yaw",
                        0
                    ],
                    "source": [
                        "obj-mul-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-yaw",
                        1
                    ],
                    "source": [
                        "obj-max-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-yaw",
                        2
                    ],
                    "source": [
                        "obj-max-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-ax",
                        0
                    ],
                    "source": [
                        "obj-unpack-calaccel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-ay",
                        0
                    ],
                    "source": [
                        "obj-unpack-calaccel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-az",
                        0
                    ],
                    "source": [
                        "obj-unpack-calaccel",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gx",
                        0
                    ],
                    "source": [
                        "obj-unpack-calgyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gy",
                        0
                    ],
                    "source": [
                        "obj-unpack-calgyro",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-gz",
                        0
                    ],
                    "source": [
                        "obj-unpack-calgyro",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-pitch",
                        0
                    ],
                    "source": [
                        "obj-unpack-calorient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-roll",
                        0
                    ],
                    "source": [
                        "obj-unpack-calorient",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-slide-yaw",
                        0
                    ],
                    "source": [
                        "obj-unpack-calorient",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-ax",
                        0
                    ],
                    "source": [
                        "obj-slide-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-ax",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-ay",
                        0
                    ],
                    "source": [
                        "obj-slide-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-ay",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-az",
                        0
                    ],
                    "source": [
                        "obj-slide-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-az",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-gx",
                        0
                    ],
                    "source": [
                        "obj-slide-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-gx",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-gy",
                        0
                    ],
                    "source": [
                        "obj-slide-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-gy",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-gz",
                        0
                    ],
                    "source": [
                        "obj-slide-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-gz",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-pitch",
                        0
                    ],
                    "source": [
                        "obj-slide-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-pitch",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-roll",
                        0
                    ],
                    "source": [
                        "obj-slide-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-roll",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-smooth-yaw",
                        0
                    ],
                    "source": [
                        "obj-slide-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-smooth-yaw",
                        0
                    ],
                    "source": [
                        "obj-flonum-smooth-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-raw",
                        0
                    ],
                    "source": [
                        "obj-unpack-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-raw",
                        1
                    ],
                    "source": [
                        "obj-unpack-orient",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-raw",
                        2
                    ],
                    "source": [
                        "obj-unpack-orient",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-euler2quat-raw",
                        0
                    ],
                    "source": [
                        "obj-pack-euler-raw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-quat-raw",
                        0
                    ],
                    "source": [
                        "obj-euler2quat-raw",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-qx",
                        0
                    ],
                    "source": [
                        "obj-unpack-quat-raw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-qy",
                        0
                    ],
                    "source": [
                        "obj-unpack-quat-raw",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-qz",
                        0
                    ],
                    "source": [
                        "obj-unpack-quat-raw",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-flonum-qw",
                        0
                    ],
                    "source": [
                        "obj-unpack-quat-raw",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-smooth",
                        0
                    ],
                    "source": [
                        "obj-r-smooth-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-smooth",
                        1
                    ],
                    "source": [
                        "obj-r-smooth-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-smooth",
                        2
                    ],
                    "source": [
                        "obj-r-smooth-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-euler2quat-smooth",
                        0
                    ],
                    "source": [
                        "obj-pack-euler-smooth",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-send-quat-smooth",
                        0
                    ],
                    "source": [
                        "obj-euler2quat-smooth",
                        1
                    ]
                }
            }
        ],
        "autosave": 0
    }
}