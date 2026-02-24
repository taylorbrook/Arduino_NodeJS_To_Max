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
            100,
            100,
            1206,
            745
        ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "obj-comment-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        7,
                        300,
                        22
                    ],
                    "text": "imu-gesture: Gesture Detection Abstraction"
                }
            },
            {
                "box": {
                    "comment": "control messages: connect, disconnect, transport, calibrate_start, gesture_enable, gesture_sensitivity, gesture_cooldown",
                    "id": "obj-inlet-ctrl",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        35,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-connection",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        72,
                        120,
                        20
                    ],
                    "text": "--- Connection ---"
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
                        20,
                        92,
                        55,
                        22
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
                        85,
                        92,
                        70,
                        22
                    ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-comment-status-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        170,
                        78,
                        50,
                        20
                    ],
                    "text": "status:"
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
                        170,
                        92,
                        120,
                        22
                    ],
                    "text": "scanning"
                }
            },
            {
                "box": {
                    "id": "obj-comment-activity-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        310,
                        78,
                        55,
                        20
                    ],
                    "text": "activity:"
                }
            },
            {
                "box": {
                    "id": "obj-activity-led",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ],
                    "oncolor": [
                        0,
                        0.8,
                        0,
                        1
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        310,
                        92,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-sel-active",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        310,
                        142,
                        110,
                        22
                    ],
                    "text": "sel active idle"
                }
            },
            {
                "box": {
                    "id": "obj-msg-led-on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        310,
                        165,
                        29.5,
                        22
                    ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-msg-led-off",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        355,
                        165,
                        29.5,
                        22
                    ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-nodescript",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        20,
                        130,
                        270,
                        22
                    ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "watch": 0
                    },
                    "text": "node.script gesture-engine.js @autostart 1",
                    "textfile": {
                        "filename": "gesture-engine.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-route-main",
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 27,
                    "numoutlets": 27,
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
                        "",
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        20,
                        158.5,
                        1160,
                        35
                    ],
                    "text": "route gesture gesture_led engine_status smooth_accel smooth_gyro smooth_orientation cal_accel cal_gyro cal_orientation norm_accel norm_gyro norm_orientation status cal_status cal_progress cal_bias cal_toggle dtw_match dtw_confidence dtw_record_status dtw_record_progress dtw_status dtw_library_info dtw_slot_info dtw_axes_detected quaternion"
                }
            },
            {
                "box": {
                    "id": "obj-sel-connected",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        370,
                        39,
                        110,
                        22
                    ],
                    "text": "sel connected-usb"
                }
            },
            {
                "box": {
                    "id": "obj-delay-autocal",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        370,
                        62,
                        63,
                        22
                    ],
                    "text": "delay 500"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calibrate",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        370,
                        91,
                        95,
                        22
                    ],
                    "text": "calibrate_start"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-gestures",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        192,
                        200,
                        20
                    ],
                    "text": "--- Gesture Configuration ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        210,
                        80,
                        20
                    ],
                    "text": "gesture"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-enable",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        105,
                        210,
                        50,
                        20
                    ],
                    "text": "enable"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-sensitivity",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        160,
                        210,
                        70,
                        20
                    ],
                    "text": "sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-cooldown",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        260,
                        210,
                        90,
                        20
                    ],
                    "text": "cooldown (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-fire",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        370,
                        210,
                        40,
                        20
                    ],
                    "text": "fire"
                }
            },
            {
                "box": {
                    "id": "obj-route-led",
                    "maxclass": "newobj",
                    "numinlets": 8,
                    "numoutlets": 8,
                    "outlettype": [
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
                        723,
                        216,
                        390,
                        22
                    ],
                    "text": "route shake tap flip tilt-left tilt-right tilt-forward tilt-back"
                }
            },
            {
                "box": {
                    "id": "obj-comment-shake",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        235,
                        80,
                        20
                    ],
                    "text": "shake"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-shake",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        115,
                        233,
                        24,
                        24
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "shake_enable",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "shake_en",
                            "parameter_type": 2
                        }
                    },
                    "varname": "shake_enable"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-enable-shake",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        115,
                        260,
                        174,
                        22
                    ],
                    "text": "prepend gesture_enable shake"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-sens-shake",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        170,
                        230,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "shake_sensitivity",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "shake_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1,
                    "varname": "shake_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-shake",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        317,
                        260,
                        190,
                        22
                    ],
                    "text": "prepend gesture_sensitivity shake"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-cool-shake",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        422,
                        225,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                300
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "shake_cooldown",
                            "parameter_mmax": 1000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "shake_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000,
                    "varname": "shake_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-shake",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        601,
                        260,
                        189,
                        22
                    ],
                    "text": "prepend gesture_cooldown shake"
                }
            },
            {
                "box": {
                    "id": "obj-led-shake",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ],
                    "oncolor": [
                        1,
                        0.5,
                        0,
                        1
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        701,
                        232,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-tap",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        290,
                        80,
                        20
                    ],
                    "text": "tap"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tap",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        115,
                        288,
                        24,
                        24
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tap_enable",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tap_en",
                            "parameter_type": 2
                        }
                    },
                    "varname": "tap_enable"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-enable-tap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        115,
                        315,
                        159,
                        22
                    ],
                    "text": "prepend gesture_enable tap"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-sens-tap",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        170,
                        285,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tap_sensitivity",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tap_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1,
                    "varname": "tap_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        317,
                        315,
                        175,
                        22
                    ],
                    "text": "prepend gesture_sensitivity tap"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-cool-tap",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        422,
                        280,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                200
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tap_cooldown",
                            "parameter_mmax": 500,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tap_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 500,
                    "varname": "tap_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        601,
                        315,
                        173,
                        22
                    ],
                    "text": "prepend gesture_cooldown tap"
                }
            },
            {
                "box": {
                    "id": "obj-led-tap",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ],
                    "oncolor": [
                        1,
                        0.5,
                        0,
                        1
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        701,
                        287,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-flip",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        345,
                        80,
                        20
                    ],
                    "text": "flip"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-flip",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        115,
                        343,
                        24,
                        24
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "flip_enable",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "flip_en",
                            "parameter_type": 2
                        }
                    },
                    "varname": "flip_enable"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-enable-flip",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        115,
                        370,
                        157,
                        22
                    ],
                    "text": "prepend gesture_enable flip"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-sens-flip",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        170,
                        340,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "flip_sensitivity",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "flip_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1,
                    "varname": "flip_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-flip",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        317,
                        370,
                        175,
                        22
                    ],
                    "text": "prepend gesture_sensitivity flip"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-cool-flip",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        422,
                        335,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                800
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "flip_cooldown",
                            "parameter_mmax": 2000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "flip_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 2000,
                    "varname": "flip_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-flip",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        601,
                        370,
                        172,
                        22
                    ],
                    "text": "prepend gesture_cooldown flip"
                }
            },
            {
                "box": {
                    "id": "obj-led-flip",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ],
                    "oncolor": [
                        1,
                        0.5,
                        0,
                        1
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        701,
                        342,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-tilt-left",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        400,
                        80,
                        20
                    ],
                    "text": "tilt-left"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tilt-left",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        115,
                        398,
                        24,
                        24
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_left_enable",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tl_en",
                            "parameter_type": 2
                        }
                    },
                    "varname": "tilt_left_enable"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-enable-tilt-left",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        115,
                        425,
                        174,
                        22
                    ],
                    "text": "prepend gesture_enable tilt-left"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-sens-tilt-left",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        170,
                        395,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_left_sensitivity",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tl_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1,
                    "varname": "tilt_left_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tilt-left",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        317,
                        425,
                        195,
                        22
                    ],
                    "text": "prepend gesture_sensitivity tilt-left"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-cool-tilt-left",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        422,
                        390,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                400
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_left_cooldown",
                            "parameter_mmax": 1000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tl_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000,
                    "varname": "tilt_left_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tilt-left",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        601,
                        425,
                        189,
                        22
                    ],
                    "text": "prepend gesture_cooldown tilt-left"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-left",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ],
                    "oncolor": [
                        1,
                        0.5,
                        0,
                        1
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        701,
                        397,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-tilt-right",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        455,
                        80,
                        20
                    ],
                    "text": "tilt-right"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tilt-right",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        115,
                        453,
                        24,
                        24
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_right_enable",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tr_en",
                            "parameter_type": 2
                        }
                    },
                    "varname": "tilt_right_enable"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-enable-tilt-right",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        115,
                        480,
                        181,
                        22
                    ],
                    "text": "prepend gesture_enable tilt-right"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-sens-tilt-right",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        170,
                        450,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_right_sensitivity",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tr_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1,
                    "varname": "tilt_right_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tilt-right",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        317,
                        480,
                        200,
                        22
                    ],
                    "text": "prepend gesture_sensitivity tilt-right"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-cool-tilt-right",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        422,
                        445,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                400
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_right_cooldown",
                            "parameter_mmax": 1000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tr_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000,
                    "varname": "tilt_right_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tilt-right",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        601,
                        480,
                        196,
                        22
                    ],
                    "text": "prepend gesture_cooldown tilt-right"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-right",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ],
                    "oncolor": [
                        1,
                        0.5,
                        0,
                        1
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        701,
                        452,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-tilt-forward",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        510,
                        80,
                        20
                    ],
                    "text": "tilt-forward"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tilt-forward",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        115,
                        508,
                        24,
                        24
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_forward_enable",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tf_en",
                            "parameter_type": 2
                        }
                    },
                    "varname": "tilt_forward_enable"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-enable-tilt-forward",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        115,
                        539,
                        198,
                        22
                    ],
                    "text": "prepend gesture_enable tilt-forward"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-sens-tilt-forward",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        170,
                        505,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_forward_sensitivity",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tf_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1,
                    "varname": "tilt_forward_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tilt-forward",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        416,
                        534,
                        215,
                        22
                    ],
                    "text": "prepend gesture_sensitivity tilt-forward"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-cool-tilt-forward",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        422,
                        500,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                400
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_forward_cooldown",
                            "parameter_mmax": 1000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tf_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000,
                    "varname": "tilt_forward_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tilt-forward",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        601,
                        535,
                        213,
                        22
                    ],
                    "text": "prepend gesture_cooldown tilt-forward"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-forward",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ],
                    "oncolor": [
                        1,
                        0.5,
                        0,
                        1
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        701,
                        507,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-tilt-back",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        565,
                        80,
                        20
                    ],
                    "text": "tilt-back"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tilt-back",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        115,
                        563,
                        24,
                        24
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_back_enable",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tb_en",
                            "parameter_type": 2
                        }
                    },
                    "varname": "tilt_back_enable"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-enable-tilt-back",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        115,
                        590,
                        183,
                        22
                    ],
                    "text": "prepend gesture_enable tilt-back"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-sens-tilt-back",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        170,
                        560,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_back_sensitivity",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tb_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1,
                    "varname": "tilt_back_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tilt-back",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        317,
                        590,
                        202,
                        22
                    ],
                    "text": "prepend gesture_sensitivity tilt-back"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-cool-tilt-back",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        422,
                        555,
                        32,
                        32
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                400
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_back_cooldown",
                            "parameter_mmax": 1000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tb_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000,
                    "varname": "tilt_back_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tilt-back",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        601,
                        590,
                        198,
                        22
                    ],
                    "text": "prepend gesture_cooldown tilt-back"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-back",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ],
                    "oncolor": [
                        1,
                        0.5,
                        0,
                        1
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        701,
                        562,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-outlets",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1170,
                        150,
                        20
                    ],
                    "text": "--- Outlets ---"
                }
            },
            {
                "box": {
                    "comment": "gesture events: shake, tap, flip, tilt-left, tilt-right, tilt-forward, tilt-back",
                    "id": "obj-outlet-gesture",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "engine status: active, idle",
                    "id": "obj-outlet-engine-status",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        130,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "smooth accel: ax ay az (3 floats)",
                    "id": "obj-outlet-smooth-accel",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        240,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "smooth gyro: gx gy gz (3 floats)",
                    "id": "obj-outlet-smooth-gyro",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        350,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "smooth orientation: pitch roll yaw (3 floats)",
                    "id": "obj-outlet-smooth-orient",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        460,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "connection status: connected-usb, connected-wifi, scanning, disconnected",
                    "id": "obj-outlet-status",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        570,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "calibration status: idle, collecting, applied, too_few_samples",
                    "id": "obj-outlet-cal-status",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        680,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-thru-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        679.9999999999998,
                        216,
                        32,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "obj-comment-dtw-header",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        660,
                        350,
                        22
                    ],
                    "text": "--- Custom DTW Gesture Recording ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-slot",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        690,
                        40,
                        20
                    ],
                    "text": "slot:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot-id",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        60,
                        690,
                        50,
                        22
                    ],
                    "minimum": 1,
                    "maximum": 99
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-mode",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        120,
                        690,
                        45,
                        20
                    ],
                    "text": "mode:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-mode-menu",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "items": [
                        "timed",
                        "toggle"
                    ],
                    "patching_rect": [
                        165,
                        690,
                        80,
                        22
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "dtw_record_mode",
                            "parameter_shortname": "dtw_mode",
                            "parameter_type": 2,
                            "parameter_modmode": 0
                        }
                    },
                    "varname": "dtw_record_mode"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-dur",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        255,
                        690,
                        40,
                        20
                    ],
                    "text": "dur:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-duration",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        295,
                        690,
                        55,
                        22
                    ],
                    "minimum": 500,
                    "maximum": 10000
                }
            },
            {
                "box": {
                    "id": "obj-dtw-dur-default",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        295,
                        670,
                        40,
                        22
                    ],
                    "text": "2000"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-dur-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        295,
                        650,
                        60,
                        22
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot-default",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        60,
                        670,
                        22,
                        22
                    ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        60,
                        650,
                        60,
                        22
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-record",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        370,
                        690,
                        55,
                        20
                    ],
                    "text": "Record"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-record-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        425,
                        690,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-stop",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        460,
                        690,
                        35,
                        20
                    ],
                    "text": "Stop"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-stop-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        495,
                        690,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-rec-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        370,
                        720,
                        140,
                        22
                    ],
                    "text": "pack i s i"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-rec-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        370,
                        745,
                        155,
                        22
                    ],
                    "text": "prepend dtw_record_start"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-stop-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        530,
                        720,
                        105,
                        22
                    ],
                    "text": "dtw_record_stop"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-recstatus",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        560,
                        690,
                        50,
                        20
                    ],
                    "text": "status:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-rec-status-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        610,
                        690,
                        120,
                        22
                    ],
                    "text": "idle"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-progress",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        740,
                        690,
                        55,
                        20
                    ],
                    "text": "frames:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-rec-progress",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        795,
                        690,
                        55,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        860,
                        690,
                        45,
                        20
                    ],
                    "text": "name:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-name-input",
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [
                        "",
                        "int",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        905,
                        690,
                        100,
                        22
                    ],
                    "text": ""
                }
            },
            {
                "box": {
                    "id": "obj-dtw-name-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        905,
                        715,
                        130,
                        22
                    ],
                    "text": "prepend dtw_name"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-name-pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        905,
                        740,
                        130,
                        22
                    ],
                    "text": "pack i s"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-dtw-slots-header",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        780,
                        350,
                        20
                    ],
                    "text": "--- DTW Gesture Slots ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-en",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        800,
                        40,
                        20
                    ],
                    "text": "en"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-slot",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50,
                        800,
                        50,
                        20
                    ],
                    "text": "slot"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        100,
                        800,
                        80,
                        20
                    ],
                    "text": "name"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-thresh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        185,
                        800,
                        70,
                        20
                    ],
                    "text": "threshold"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-cd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        270,
                        800,
                        70,
                        20
                    ],
                    "text": "cd (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-ex",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        350,
                        800,
                        60,
                        20
                    ],
                    "text": "examples"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-del",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        800,
                        40,
                        20
                    ],
                    "text": "del"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        24,
                        820,
                        20,
                        20
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_enable_1",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_en1",
                            "parameter_type": 2
                        }
                    },
                    "varname": "dtw_enable_1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-prepend-en",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        24,
                        845,
                        130,
                        22
                    ],
                    "text": "prepend dtw_enable 1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50,
                        820,
                        40,
                        20
                    ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        100,
                        820,
                        80,
                        20
                    ],
                    "text": "gesture-1"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dtw-slot1-thresh",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        195,
                        817,
                        32,
                        32
                    ],
                    "size": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.6
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_threshold_1",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_th1",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dtw_threshold_1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-prepend-th",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        195,
                        845,
                        155,
                        22
                    ],
                    "text": "prepend dtw_threshold 1"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dtw-slot1-cooldown",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        280,
                        817,
                        32,
                        32
                    ],
                    "size": 5000,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                500
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_cooldown_1",
                            "parameter_mmax": 5000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cd1",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dtw_cooldown_1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-prepend-cd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        280,
                        845,
                        155,
                        22
                    ],
                    "text": "prepend dtw_cooldown 1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-examples",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        360,
                        820,
                        40,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-del-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        425,
                        820,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-del-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        425,
                        845,
                        105,
                        22
                    ],
                    "text": "dtw_delete 1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        24,
                        875,
                        20,
                        20
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_enable_2",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_en2",
                            "parameter_type": 2
                        }
                    },
                    "varname": "dtw_enable_2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-prepend-en",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        24,
                        900,
                        130,
                        22
                    ],
                    "text": "prepend dtw_enable 2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50,
                        875,
                        40,
                        20
                    ],
                    "text": "2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        100,
                        875,
                        80,
                        20
                    ],
                    "text": "gesture-2"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dtw-slot2-thresh",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        195,
                        872,
                        32,
                        32
                    ],
                    "size": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.6
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_threshold_2",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_th2",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dtw_threshold_2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-prepend-th",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        195,
                        900,
                        155,
                        22
                    ],
                    "text": "prepend dtw_threshold 2"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dtw-slot2-cooldown",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        280,
                        872,
                        32,
                        32
                    ],
                    "size": 5000,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                500
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_cooldown_2",
                            "parameter_mmax": 5000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cd2",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dtw_cooldown_2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-prepend-cd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        280,
                        900,
                        155,
                        22
                    ],
                    "text": "prepend dtw_cooldown 2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-examples",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        360,
                        875,
                        40,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-del-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        425,
                        875,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-del-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        425,
                        900,
                        105,
                        22
                    ],
                    "text": "dtw_delete 2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        24,
                        930,
                        20,
                        20
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_enable_3",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_en3",
                            "parameter_type": 2
                        }
                    },
                    "varname": "dtw_enable_3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-prepend-en",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        24,
                        955,
                        130,
                        22
                    ],
                    "text": "prepend dtw_enable 3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50,
                        930,
                        40,
                        20
                    ],
                    "text": "3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        100,
                        930,
                        80,
                        20
                    ],
                    "text": "gesture-3"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dtw-slot3-thresh",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        195,
                        927,
                        32,
                        32
                    ],
                    "size": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.6
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_threshold_3",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_th3",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dtw_threshold_3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-prepend-th",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        195,
                        955,
                        155,
                        22
                    ],
                    "text": "prepend dtw_threshold 3"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dtw-slot3-cooldown",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        280,
                        927,
                        32,
                        32
                    ],
                    "size": 5000,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                500
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_cooldown_3",
                            "parameter_mmax": 5000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cd3",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dtw_cooldown_3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-prepend-cd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        280,
                        955,
                        155,
                        22
                    ],
                    "text": "prepend dtw_cooldown 3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-examples",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        360,
                        930,
                        40,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-del-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        425,
                        930,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-del-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        425,
                        955,
                        105,
                        22
                    ],
                    "text": "dtw_delete 3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        24,
                        985,
                        20,
                        20
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                1
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_enable_4",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_en4",
                            "parameter_type": 2
                        }
                    },
                    "varname": "dtw_enable_4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-prepend-en",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        24,
                        1010,
                        130,
                        22
                    ],
                    "text": "prepend dtw_enable 4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50,
                        985,
                        40,
                        20
                    ],
                    "text": "4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        100,
                        985,
                        80,
                        20
                    ],
                    "text": "gesture-4"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dtw-slot4-thresh",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        195,
                        982,
                        32,
                        32
                    ],
                    "size": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0.6
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_threshold_4",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_th4",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dtw_threshold_4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-prepend-th",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        195,
                        1010,
                        155,
                        22
                    ],
                    "text": "prepend dtw_threshold 4"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dtw-slot4-cooldown",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        280,
                        982,
                        32,
                        32
                    ],
                    "size": 5000,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                500
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_cooldown_4",
                            "parameter_mmax": 5000,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cd4",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "dtw_cooldown_4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-prepend-cd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        280,
                        1010,
                        155,
                        22
                    ],
                    "text": "prepend dtw_cooldown 4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-examples",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        360,
                        985,
                        40,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-del-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        425,
                        985,
                        20,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-del-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        425,
                        1010,
                        105,
                        22
                    ],
                    "text": "dtw_delete 4"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-dtw-match-section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1060,
                        300,
                        20
                    ],
                    "text": "--- DTW Match Settings ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-matchmode",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1085,
                        75,
                        20
                    ],
                    "text": "match mode:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-matchmode-menu",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "items": [
                        "best",
                        "all"
                    ],
                    "patching_rect": [
                        100,
                        1085,
                        70,
                        22
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "dtw_match_mode",
                            "parameter_shortname": "dtw_mm",
                            "parameter_type": 2,
                            "parameter_modmode": 0
                        }
                    },
                    "varname": "dtw_match_mode"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-matchmode-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        100,
                        1110,
                        145,
                        22
                    ],
                    "text": "prepend dtw_match_mode"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-continuous",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        260,
                        1085,
                        75,
                        20
                    ],
                    "text": "continuous:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-continuous-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        340,
                        1085,
                        20,
                        20
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_continuous",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cont",
                            "parameter_type": 2
                        }
                    },
                    "varname": "dtw_continuous"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-continuous-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        340,
                        1110,
                        145,
                        22
                    ],
                    "text": "prepend dtw_continuous"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-libstatus",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        500,
                        1085,
                        55,
                        20
                    ],
                    "text": "lib info:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-lib-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        560,
                        1085,
                        150,
                        22
                    ],
                    "text": "no library"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-lib-count",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "patching_rect": [
                        720,
                        1085,
                        45,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-libcount",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        770,
                        1085,
                        60,
                        20
                    ],
                    "text": "gestures"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-axes",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        840,
                        1085,
                        45,
                        20
                    ],
                    "text": "axes:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-axes-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        885,
                        1085,
                        120,
                        22
                    ],
                    "text": "(auto)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-dtw-saveload",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1140,
                        300,
                        20
                    ],
                    "text": "--- DTW Library Save/Load ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-save",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1165,
                        80,
                        20
                    ],
                    "text": "Save Library"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-save-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        105,
                        1165,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-savedialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "s",
                        "bang"
                    ],
                    "patching_rect": [
                        105,
                        1195,
                        110,
                        22
                    ],
                    "text": "savedialog JSON"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-save-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        105,
                        1220,
                        115,
                        22
                    ],
                    "text": "prepend dtw_save"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-load",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        240,
                        1165,
                        80,
                        20
                    ],
                    "text": "Load Library"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-load-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        325,
                        1165,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-opendialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "s",
                        "bang"
                    ],
                    "patching_rect": [
                        325,
                        1195,
                        110,
                        22
                    ],
                    "text": "opendialog JSON"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-load-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        325,
                        1220,
                        115,
                        22
                    ],
                    "text": "prepend dtw_load"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-clear",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        460,
                        1165,
                        60,
                        20
                    ],
                    "text": "Clear All"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-clear-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        525,
                        1165,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-clear-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        525,
                        1195,
                        85,
                        22
                    ],
                    "text": "dtw_clear_all"
                }
            },
            {
                "box": {
                    "comment": "DTW match events: gesture_name confidence",
                    "id": "obj-outlet-dtw-match",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        790,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "DTW continuous confidence: slot_id name confidence",
                    "id": "obj-outlet-dtw-confidence",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        900,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "quaternion: qw qx qy qz (4 floats)",
                    "id": "obj-outlet-quaternion",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1010,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot-info-route",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [
                        "",
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        550,
                        820,
                        200,
                        22
                    ],
                    "text": "route 1 2 3 4"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-msg-calibrate",
                        0
                    ],
                    "midpoints": [
                        379.5,
                        87,
                        379.5,
                        87
                    ],
                    "source": [
                        "obj-delay-autocal",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-cool-flip",
                        0
                    ],
                    "midpoints": [
                        431.5,
                        369,
                        417,
                        369,
                        417,
                        357,
                        303,
                        357,
                        303,
                        300,
                        417,
                        300,
                        417,
                        312,
                        588,
                        312,
                        588,
                        357,
                        610.5,
                        357
                    ],
                    "source": [
                        "obj-dial-cool-flip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-cool-shake",
                        0
                    ],
                    "midpoints": [
                        431.5,
                        258,
                        417,
                        258,
                        417,
                        210,
                        610.5,
                        210
                    ],
                    "source": [
                        "obj-dial-cool-shake",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-cool-tap",
                        0
                    ],
                    "midpoints": [
                        431.5,
                        312,
                        610.5,
                        312
                    ],
                    "source": [
                        "obj-dial-cool-tap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-cool-tilt-back",
                        0
                    ],
                    "midpoints": [
                        431.5,
                        588,
                        417,
                        588,
                        417,
                        576,
                        312,
                        576,
                        312,
                        624,
                        588,
                        624,
                        588,
                        585,
                        610.5,
                        585
                    ],
                    "source": [
                        "obj-dial-cool-tilt-back",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-cool-tilt-forward",
                        0
                    ],
                    "midpoints": [
                        431.5,
                        534,
                        417,
                        534,
                        417,
                        531,
                        324,
                        531,
                        324,
                        513,
                        312,
                        513,
                        312,
                        465,
                        417,
                        465,
                        417,
                        477,
                        588,
                        477,
                        588,
                        519,
                        610.5,
                        519
                    ],
                    "source": [
                        "obj-dial-cool-tilt-forward",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-cool-tilt-left",
                        0
                    ],
                    "midpoints": [
                        431.5,
                        423,
                        417,
                        423,
                        417,
                        411,
                        303,
                        411,
                        303,
                        465,
                        417,
                        465,
                        417,
                        477,
                        465,
                        477,
                        465,
                        459,
                        588,
                        459,
                        588,
                        420,
                        610.5,
                        420
                    ],
                    "source": [
                        "obj-dial-cool-tilt-left",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-cool-tilt-right",
                        0
                    ],
                    "midpoints": [
                        431.5,
                        477,
                        610.5,
                        477
                    ],
                    "source": [
                        "obj-dial-cool-tilt-right",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-sens-flip",
                        0
                    ],
                    "midpoints": [
                        179.5,
                        366,
                        156,
                        366,
                        156,
                        348,
                        141,
                        348,
                        141,
                        339,
                        111,
                        339,
                        111,
                        312,
                        156,
                        312,
                        156,
                        282,
                        213,
                        282,
                        213,
                        300,
                        303,
                        300,
                        303,
                        357,
                        326.5,
                        357
                    ],
                    "source": [
                        "obj-dial-sens-flip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-sens-shake",
                        0
                    ],
                    "midpoints": [
                        179.5,
                        282,
                        303,
                        282,
                        303,
                        255,
                        326.5,
                        255
                    ],
                    "source": [
                        "obj-dial-sens-shake",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-sens-tap",
                        0
                    ],
                    "midpoints": [
                        179.5,
                        312,
                        165,
                        312,
                        165,
                        282,
                        213,
                        282,
                        213,
                        300,
                        326.5,
                        300
                    ],
                    "source": [
                        "obj-dial-sens-tap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-sens-tilt-back",
                        0
                    ],
                    "midpoints": [
                        179.5,
                        624,
                        312,
                        624,
                        312,
                        585,
                        326.5,
                        585
                    ],
                    "source": [
                        "obj-dial-sens-tilt-back",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-sens-tilt-forward",
                        0
                    ],
                    "midpoints": [
                        179.5,
                        534,
                        111,
                        534,
                        111,
                        624,
                        312,
                        624,
                        312,
                        573,
                        402,
                        573,
                        402,
                        531,
                        425.5,
                        531
                    ],
                    "source": [
                        "obj-dial-sens-tilt-forward",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-sens-tilt-left",
                        0
                    ],
                    "midpoints": [
                        179.5,
                        447,
                        303,
                        447,
                        303,
                        420,
                        326.5,
                        420
                    ],
                    "source": [
                        "obj-dial-sens-tilt-left",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-sens-tilt-right",
                        0
                    ],
                    "midpoints": [
                        179.5,
                        477,
                        165,
                        477,
                        165,
                        447,
                        213,
                        447,
                        213,
                        465,
                        326.5,
                        465
                    ],
                    "source": [
                        "obj-dial-sens-tilt-right",
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
                        29.5,
                        66,
                        6,
                        66,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-inlet-ctrl",
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
                        379.5,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-msg-calibrate",
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
                        29.5,
                        117,
                        29.5,
                        117
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
                        94.5,
                        117,
                        29.5,
                        117
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
                        "obj-activity-led",
                        0
                    ],
                    "midpoints": [
                        364.5,
                        189,
                        297,
                        189,
                        297,
                        129,
                        306,
                        129,
                        306,
                        87,
                        319.5,
                        87
                    ],
                    "source": [
                        "obj-msg-led-off",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-activity-led",
                        0
                    ],
                    "midpoints": [
                        319.5,
                        189,
                        297,
                        189,
                        297,
                        129,
                        306,
                        129,
                        306,
                        87,
                        319.5,
                        87
                    ],
                    "source": [
                        "obj-msg-led-on",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route-main",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        153,
                        29.5,
                        153
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
                        "obj-nodescript",
                        0
                    ],
                    "midpoints": [
                        610.5,
                        393,
                        504,
                        393,
                        504,
                        300,
                        456,
                        300,
                        456,
                        312,
                        408,
                        312,
                        408,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-cool-flip",
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
                        610.5,
                        300,
                        456,
                        300,
                        456,
                        312,
                        408,
                        312,
                        408,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-cool-shake",
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
                        610.5,
                        339,
                        504,
                        339,
                        504,
                        300,
                        456,
                        300,
                        456,
                        312,
                        408,
                        312,
                        408,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-cool-tap",
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
                        610.5,
                        624,
                        102,
                        624,
                        102,
                        597,
                        6,
                        597,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-cool-tilt-back",
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
                        610.5,
                        576,
                        531,
                        576,
                        531,
                        624,
                        102,
                        624,
                        102,
                        597,
                        6,
                        597,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-cool-tilt-forward",
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
                        610.5,
                        450,
                        522,
                        450,
                        522,
                        312,
                        408,
                        312,
                        408,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-cool-tilt-left",
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
                        610.5,
                        504,
                        528,
                        504,
                        528,
                        312,
                        408,
                        312,
                        408,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-cool-tilt-right",
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
                        124.5,
                        393,
                        102,
                        393,
                        102,
                        375,
                        6,
                        375,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-enable-flip",
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
                        124.5,
                        285,
                        102,
                        285,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-enable-shake",
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
                        124.5,
                        339,
                        102,
                        339,
                        102,
                        321,
                        6,
                        321,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-enable-tap",
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
                        124.5,
                        615,
                        6,
                        615,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-enable-tilt-back",
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
                        124.5,
                        564,
                        102,
                        564,
                        102,
                        540,
                        6,
                        540,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-enable-tilt-forward",
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
                        124.5,
                        450,
                        102,
                        450,
                        102,
                        432,
                        6,
                        432,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-enable-tilt-left",
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
                        124.5,
                        504,
                        102,
                        504,
                        102,
                        486,
                        6,
                        486,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-enable-tilt-right",
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
                        326.5,
                        393,
                        285,
                        393,
                        285,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-sens-flip",
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
                        326.5,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-sens-shake",
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
                        326.5,
                        339,
                        285,
                        339,
                        285,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-sens-tap",
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
                        326.5,
                        624,
                        102,
                        624,
                        102,
                        597,
                        6,
                        597,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-sens-tilt-back",
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
                        425.5,
                        558,
                        324,
                        558,
                        324,
                        513,
                        300,
                        513,
                        300,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-sens-tilt-forward",
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
                        326.5,
                        450,
                        300,
                        450,
                        300,
                        294,
                        204,
                        294,
                        204,
                        282,
                        102,
                        282,
                        102,
                        267,
                        6,
                        267,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-sens-tilt-left",
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
                        326.5,
                        504,
                        312,
                        504,
                        312,
                        459,
                        204,
                        459,
                        204,
                        447,
                        102,
                        447,
                        102,
                        432,
                        6,
                        432,
                        6,
                        126,
                        29.5,
                        126
                    ],
                    "source": [
                        "obj-prepend-sens-tilt-right",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-led-flip",
                        0
                    ],
                    "midpoints": [
                        838.5,
                        348,
                        723,
                        348,
                        723,
                        339,
                        710.5,
                        339
                    ],
                    "source": [
                        "obj-route-led",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-led-shake",
                        0
                    ],
                    "midpoints": [
                        732.5,
                        240,
                        723,
                        240,
                        723,
                        252,
                        675,
                        252,
                        675,
                        213,
                        711,
                        213,
                        711,
                        228,
                        710.5,
                        228
                    ],
                    "source": [
                        "obj-route-led",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-led-tap",
                        0
                    ],
                    "midpoints": [
                        785.5,
                        255,
                        801,
                        255,
                        801,
                        294,
                        723,
                        294,
                        723,
                        282,
                        710.5,
                        282
                    ],
                    "source": [
                        "obj-route-led",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-led-tilt-back",
                        0
                    ],
                    "midpoints": [
                        1050.5,
                        567,
                        723,
                        567,
                        723,
                        558,
                        710.5,
                        558
                    ],
                    "source": [
                        "obj-route-led",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-led-tilt-forward",
                        0
                    ],
                    "midpoints": [
                        997.5,
                        513,
                        723,
                        513,
                        723,
                        504,
                        710.5,
                        504
                    ],
                    "source": [
                        "obj-route-led",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-led-tilt-left",
                        0
                    ],
                    "midpoints": [
                        891.5,
                        402,
                        723,
                        402,
                        723,
                        393,
                        710.5,
                        393
                    ],
                    "source": [
                        "obj-route-led",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-led-tilt-right",
                        0
                    ],
                    "midpoints": [
                        944.5,
                        459,
                        723,
                        459,
                        723,
                        447,
                        710.5,
                        447
                    ],
                    "source": [
                        "obj-route-led",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-cal-status",
                        0
                    ],
                    "midpoints": [
                        744.4999999999998,
                        195,
                        666,
                        195,
                        666,
                        255,
                        825,
                        255,
                        825,
                        645,
                        689.5,
                        645
                    ],
                    "source": [
                        "obj-route-main",
                        13
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-engine-status",
                        0
                    ],
                    "midpoints": [
                        139.49999999999997,
                        153,
                        6,
                        153,
                        6,
                        702,
                        117,
                        702,
                        117,
                        657,
                        139.5,
                        657
                    ],
                    "order": 1,
                    "source": [
                        "obj-route-main",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-gesture",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        195,
                        6,
                        195,
                        6,
                        657,
                        29.5,
                        657
                    ],
                    "source": [
                        "obj-route-main",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-smooth-accel",
                        0
                    ],
                    "midpoints": [
                        194.49999999999994,
                        195,
                        240,
                        195,
                        240,
                        246,
                        303,
                        246,
                        303,
                        525,
                        324,
                        525,
                        324,
                        576,
                        300,
                        576,
                        300,
                        645,
                        249.5,
                        645
                    ],
                    "source": [
                        "obj-route-main",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-smooth-gyro",
                        0
                    ],
                    "midpoints": [
                        249.49999999999994,
                        246,
                        303,
                        246,
                        303,
                        525,
                        324,
                        525,
                        324,
                        576,
                        312,
                        576,
                        312,
                        645,
                        359.5,
                        645
                    ],
                    "source": [
                        "obj-route-main",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-smooth-orient",
                        0
                    ],
                    "midpoints": [
                        304.49999999999994,
                        207,
                        246,
                        207,
                        246,
                        246,
                        303,
                        246,
                        303,
                        525,
                        324,
                        525,
                        324,
                        576,
                        312,
                        576,
                        312,
                        645,
                        469.5,
                        645
                    ],
                    "source": [
                        "obj-route-main",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route-led",
                        0
                    ],
                    "midpoints": [
                        84.49999999999999,
                        231,
                        102,
                        231,
                        102,
                        282,
                        303,
                        282,
                        303,
                        240,
                        417,
                        240,
                        417,
                        210,
                        732.5,
                        210
                    ],
                    "source": [
                        "obj-route-main",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sel-active",
                        0
                    ],
                    "midpoints": [
                        139.49999999999997,
                        153,
                        306,
                        153,
                        306,
                        138,
                        319.5,
                        138
                    ],
                    "order": 0,
                    "source": [
                        "obj-route-main",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-status",
                        0
                    ],
                    "midpoints": [
                        689.4999999999998,
                        195,
                        689.4999999999998,
                        195
                    ],
                    "source": [
                        "obj-route-main",
                        12
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-led-off",
                        0
                    ],
                    "midpoints": [
                        365,
                        165,
                        364.5,
                        165
                    ],
                    "source": [
                        "obj-sel-active",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-led-on",
                        0
                    ],
                    "midpoints": [
                        319.5,
                        165,
                        319.5,
                        165
                    ],
                    "source": [
                        "obj-sel-active",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-delay-autocal",
                        0
                    ],
                    "midpoints": [
                        379.5,
                        63,
                        379.5,
                        63
                    ],
                    "source": [
                        "obj-sel-connected",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-status",
                        0
                    ],
                    "midpoints": [
                        689.4999999999998,
                        255,
                        825,
                        255,
                        825,
                        645,
                        579.5,
                        645
                    ],
                    "order": 0,
                    "source": [
                        "obj-thru-status",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sel-connected",
                        0
                    ],
                    "midpoints": [
                        702.4999999999998,
                        240,
                        666,
                        240,
                        666,
                        195,
                        984,
                        195,
                        984,
                        24,
                        379.5,
                        24
                    ],
                    "source": [
                        "obj-thru-status",
                        1
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
                        689.4999999999998,
                        240,
                        666,
                        240,
                        666,
                        195,
                        984,
                        195,
                        984,
                        123,
                        291,
                        123,
                        291,
                        87,
                        280.5,
                        87
                    ],
                    "order": 1,
                    "source": [
                        "obj-thru-status",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-enable-flip",
                        0
                    ],
                    "midpoints": [
                        124.5,
                        369,
                        124.5,
                        369
                    ],
                    "source": [
                        "obj-toggle-flip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-enable-shake",
                        0
                    ],
                    "midpoints": [
                        124.5,
                        258,
                        124.5,
                        258
                    ],
                    "source": [
                        "obj-toggle-shake",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-enable-tap",
                        0
                    ],
                    "midpoints": [
                        124.5,
                        315,
                        124.5,
                        315
                    ],
                    "source": [
                        "obj-toggle-tap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-enable-tilt-back",
                        0
                    ],
                    "midpoints": [
                        124.5,
                        588,
                        124.5,
                        588
                    ],
                    "source": [
                        "obj-toggle-tilt-back",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-enable-tilt-forward",
                        0
                    ],
                    "midpoints": [
                        124.5,
                        534,
                        124.5,
                        534
                    ],
                    "source": [
                        "obj-toggle-tilt-forward",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-enable-tilt-left",
                        0
                    ],
                    "midpoints": [
                        124.5,
                        423,
                        124.5,
                        423
                    ],
                    "source": [
                        "obj-toggle-tilt-left",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-enable-tilt-right",
                        0
                    ],
                    "midpoints": [
                        124.5,
                        480,
                        124.5,
                        480
                    ],
                    "source": [
                        "obj-toggle-tilt-right",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-dur-loadbang",
                        0
                    ],
                    "destination": [
                        "obj-dtw-dur-default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-dur-default",
                        0
                    ],
                    "destination": [
                        "obj-dtw-duration",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot-loadbang",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot-default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot-default",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot-id",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-record-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-rec-pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot-id",
                        0
                    ],
                    "destination": [
                        "obj-dtw-rec-pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-mode-menu",
                        1
                    ],
                    "destination": [
                        "obj-dtw-rec-pack",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-duration",
                        0
                    ],
                    "destination": [
                        "obj-dtw-rec-pack",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-rec-pack",
                        0
                    ],
                    "destination": [
                        "obj-dtw-rec-prepend",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-rec-prepend",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-stop-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-stop-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-stop-msg",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-name-input",
                        0
                    ],
                    "destination": [
                        "obj-dtw-name-pack",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot-id",
                        0
                    ],
                    "destination": [
                        "obj-dtw-name-pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-name-pack",
                        0
                    ],
                    "destination": [
                        "obj-dtw-name-prepend",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-name-prepend",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot1-toggle",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot1-prepend-en",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot1-prepend-en",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot1-thresh",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot1-prepend-th",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot1-prepend-th",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot1-cooldown",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot1-prepend-cd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot1-prepend-cd",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot1-del-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot1-del-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot1-del-msg",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot2-toggle",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot2-prepend-en",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot2-prepend-en",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot2-thresh",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot2-prepend-th",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot2-prepend-th",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot2-cooldown",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot2-prepend-cd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot2-prepend-cd",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot2-del-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot2-del-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot2-del-msg",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot3-toggle",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot3-prepend-en",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot3-prepend-en",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot3-thresh",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot3-prepend-th",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot3-prepend-th",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot3-cooldown",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot3-prepend-cd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot3-prepend-cd",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot3-del-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot3-del-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot3-del-msg",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot4-toggle",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot4-prepend-en",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot4-prepend-en",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot4-thresh",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot4-prepend-th",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot4-prepend-th",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot4-cooldown",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot4-prepend-cd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot4-prepend-cd",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot4-del-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot4-del-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot4-del-msg",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-matchmode-menu",
                        1
                    ],
                    "destination": [
                        "obj-dtw-matchmode-prepend",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-matchmode-prepend",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-continuous-toggle",
                        0
                    ],
                    "destination": [
                        "obj-dtw-continuous-prepend",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-continuous-prepend",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-save-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-savedialog",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-savedialog",
                        0
                    ],
                    "destination": [
                        "obj-dtw-save-prepend",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-save-prepend",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-load-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-opendialog",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-opendialog",
                        0
                    ],
                    "destination": [
                        "obj-dtw-load-prepend",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-load-prepend",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-clear-btn",
                        0
                    ],
                    "destination": [
                        "obj-dtw-clear-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-clear-msg",
                        0
                    ],
                    "destination": [
                        "obj-nodescript",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        17
                    ],
                    "destination": [
                        "obj-outlet-dtw-match",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        18
                    ],
                    "destination": [
                        "obj-outlet-dtw-confidence",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        19
                    ],
                    "destination": [
                        "obj-dtw-rec-status-display",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        20
                    ],
                    "destination": [
                        "obj-dtw-rec-progress",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        21
                    ],
                    "destination": [
                        "obj-dtw-lib-status",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        22
                    ],
                    "destination": [
                        "obj-dtw-lib-count",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        23
                    ],
                    "destination": [
                        "obj-dtw-slot-info-route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        24
                    ],
                    "destination": [
                        "obj-dtw-axes-display",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-main",
                        25
                    ],
                    "destination": [
                        "obj-outlet-quaternion",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot-info-route",
                        0
                    ],
                    "destination": [
                        "obj-dtw-slot1-examples",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot-info-route",
                        1
                    ],
                    "destination": [
                        "obj-dtw-slot2-examples",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot-info-route",
                        2
                    ],
                    "destination": [
                        "obj-dtw-slot3-examples",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dtw-slot-info-route",
                        3
                    ],
                    "destination": [
                        "obj-dtw-slot4-examples",
                        0
                    ]
                }
            }
        ],
        "parameters": {
            "obj-dial-cool-flip": [
                "flip_cooldown",
                "flip_cd",
                0
            ],
            "obj-dial-cool-shake": [
                "shake_cooldown",
                "shake_cd",
                0
            ],
            "obj-dial-cool-tap": [
                "tap_cooldown",
                "tap_cd",
                0
            ],
            "obj-dial-cool-tilt-back": [
                "tilt_back_cooldown",
                "tb_cd",
                0
            ],
            "obj-dial-cool-tilt-forward": [
                "tilt_forward_cooldown",
                "tf_cd",
                0
            ],
            "obj-dial-cool-tilt-left": [
                "tilt_left_cooldown",
                "tl_cd",
                0
            ],
            "obj-dial-cool-tilt-right": [
                "tilt_right_cooldown",
                "tr_cd",
                0
            ],
            "obj-dial-sens-flip": [
                "flip_sensitivity",
                "flip_sens",
                0
            ],
            "obj-dial-sens-shake": [
                "shake_sensitivity",
                "shake_sens",
                0
            ],
            "obj-dial-sens-tap": [
                "tap_sensitivity",
                "tap_sens",
                0
            ],
            "obj-dial-sens-tilt-back": [
                "tilt_back_sensitivity",
                "tb_sens",
                0
            ],
            "obj-dial-sens-tilt-forward": [
                "tilt_forward_sensitivity",
                "tf_sens",
                0
            ],
            "obj-dial-sens-tilt-left": [
                "tilt_left_sensitivity",
                "tl_sens",
                0
            ],
            "obj-dial-sens-tilt-right": [
                "tilt_right_sensitivity",
                "tr_sens",
                0
            ],
            "obj-toggle-flip": [
                "flip_enable",
                "flip_en",
                0
            ],
            "obj-toggle-shake": [
                "shake_enable",
                "shake_en",
                0
            ],
            "obj-toggle-tap": [
                "tap_enable",
                "tap_en",
                0
            ],
            "obj-toggle-tilt-back": [
                "tilt_back_enable",
                "tb_en",
                0
            ],
            "obj-toggle-tilt-forward": [
                "tilt_forward_enable",
                "tf_en",
                0
            ],
            "obj-toggle-tilt-left": [
                "tilt_left_enable",
                "tl_en",
                0
            ],
            "obj-toggle-tilt-right": [
                "tilt_right_enable",
                "tr_en",
                0
            ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [
                        "shake_enable",
                        "shake_sensitivity",
                        "shake_cooldown",
                        "tap_enable",
                        "tap_sensitivity",
                        "tap_cooldown",
                        "flip_enable",
                        "flip_sensitivity"
                    ],
                    "buttons": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ]
                }
            },
            "inherited_shortname": 1,
            "obj-dtw-slot1-toggle": [
                "dtw_enable_1",
                "dtw_en1",
                0
            ],
            "obj-dtw-slot1-thresh": [
                "dtw_threshold_1",
                "dtw_th1",
                0
            ],
            "obj-dtw-slot1-cooldown": [
                "dtw_cooldown_1",
                "dtw_cd1",
                0
            ],
            "obj-dtw-slot2-toggle": [
                "dtw_enable_2",
                "dtw_en2",
                0
            ],
            "obj-dtw-slot2-thresh": [
                "dtw_threshold_2",
                "dtw_th2",
                0
            ],
            "obj-dtw-slot2-cooldown": [
                "dtw_cooldown_2",
                "dtw_cd2",
                0
            ],
            "obj-dtw-slot3-toggle": [
                "dtw_enable_3",
                "dtw_en3",
                0
            ],
            "obj-dtw-slot3-thresh": [
                "dtw_threshold_3",
                "dtw_th3",
                0
            ],
            "obj-dtw-slot3-cooldown": [
                "dtw_cooldown_3",
                "dtw_cd3",
                0
            ],
            "obj-dtw-slot4-toggle": [
                "dtw_enable_4",
                "dtw_en4",
                0
            ],
            "obj-dtw-slot4-thresh": [
                "dtw_threshold_4",
                "dtw_th4",
                0
            ],
            "obj-dtw-slot4-cooldown": [
                "dtw_cooldown_4",
                "dtw_cd4",
                0
            ],
            "obj-dtw-mode-menu": [
                "dtw_record_mode",
                "dtw_mode",
                0
            ],
            "obj-dtw-matchmode-menu": [
                "dtw_match_mode",
                "dtw_mm",
                0
            ],
            "obj-dtw-continuous-toggle": [
                "dtw_continuous",
                "dtw_cont",
                0
            ]
        },
        "autosave": 0
    }
}