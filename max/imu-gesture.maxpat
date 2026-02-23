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
        "rect": [ 100.0, 100.0, 830.0, 750.0 ],
        "gridsize": [ 15.0, 15.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-comment-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 10.0, 300.0, 20.0 ],
                    "text": "imu-gesture: Gesture Detection Abstraction",
                    "fontsize": 14.0,
                    "fontface": 1
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 35.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 600.0, 35.0, 61.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-deferlow",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 60.0, 55.0, 22.0 ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-comment-connection",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 72.0, 120.0, 20.0 ],
                    "text": "--- Connection ---",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 92.0, 55.0, 22.0 ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "id": "obj-msg-disconnect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 85.0, 92.0, 70.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-comment-status-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 170.0, 78.0, 50.0, 20.0 ],
                    "text": "status:"
                }
            },
            {
                "box": {
                    "id": "obj-status-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 92.0, 120.0, 22.0 ],
                    "text": "disconnected"
                }
            },
            {
                "box": {
                    "id": "obj-comment-activity-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 310.0, 78.0, 55.0, 20.0 ],
                    "text": "activity:"
                }
            },
            {
                "box": {
                    "id": "obj-activity-led",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 310.0, 92.0, 20.0, 20.0 ],
                    "oncolor": [ 0.0, 0.8, 0.0, 1.0 ],
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-sel-active",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 310.0, 142.0, 110.0, 22.0 ],
                    "text": "sel active idle"
                }
            },
            {
                "box": {
                    "id": "obj-msg-led-on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 310.0, 165.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-msg-led-off",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 355.0, 165.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-nodescript",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 130.0, 270.0, 22.0 ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
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
                    "maxclass": "newobj",
                    "numinlets": 17,
                    "numoutlets": 17,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 160.0, 790.0, 22.0 ],
                    "text": "route gesture gesture_led engine_status smooth_accel smooth_gyro smooth_orientation cal_accel cal_gyro cal_orientation norm_accel norm_gyro norm_orientation status cal_status cal_progress cal_bias cal_toggle"
                }
            },
            {
                "box": {
                    "id": "obj-sel-connected",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 440.0, 92.0, 110.0, 22.0 ],
                    "text": "sel connected-usb"
                }
            },
            {
                "box": {
                    "id": "obj-delay-autocal",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 440.0, 115.0, 63.0, 22.0 ],
                    "text": "delay 500"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calibrate",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 440.0, 138.0, 95.0, 22.0 ],
                    "text": "calibrate_start"
                }
            },
            {
                "box": {
                    "id": "obj-comment-gestures",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 192.0, 200.0, 20.0 ],
                    "text": "--- Gesture Configuration ---",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 210.0, 80.0, 20.0 ],
                    "text": "gesture"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-enable",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 105.0, 210.0, 50.0, 20.0 ],
                    "text": "enable"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-sensitivity",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 160.0, 210.0, 70.0, 20.0 ],
                    "text": "sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-cooldown",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 210.0, 90.0, 20.0 ],
                    "text": "cooldown (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-comment-hdr-fire",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 370.0, 210.0, 40.0, 20.0 ],
                    "text": "fire"
                }
            },
            {
                "box": {
                    "id": "obj-route-led",
                    "maxclass": "newobj",
                    "numinlets": 8,
                    "numoutlets": 8,
                    "outlettype": [ "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 420.0, 192.0, 390.0, 22.0 ],
                    "text": "route shake tap flip tilt-left tilt-right tilt-forward tilt-back"
                }
            },

            {
                "box": {
                    "id": "obj-comment-shake",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 235.0, 80.0, 20.0 ],
                    "text": "shake"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-shake",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 115.0, 233.0, 24.0, 24.0 ],
                    "int": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "shake_enable",
                            "parameter_shortname": "shake_en",
                            "parameter_type": 2,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 1 ]
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 260.0, 140.0, 22.0 ],
                    "text": "prepend gesture_enable shake"
                }
            },
            {
                "box": {
                    "id": "obj-dial-sens-shake",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 230.0, 32.0, 32.0 ],
                    "size": 1.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "shake_sensitivity",
                            "parameter_shortname": "shake_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 0.5 ]
                        }
                    },
                    "varname": "shake_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-shake",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 265.0, 180.0, 22.0 ],
                    "text": "prepend gesture_sensitivity shake"
                }
            },
            {
                "box": {
                    "id": "obj-dial-cool-shake",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 275.0, 230.0, 32.0, 32.0 ],
                    "size": 1000.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "shake_cooldown",
                            "parameter_shortname": "shake_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1000.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 300.0 ]
                        }
                    },
                    "varname": "shake_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-shake",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 275.0, 265.0, 170.0, 22.0 ],
                    "text": "prepend gesture_cooldown shake"
                }
            },
            {
                "box": {
                    "id": "obj-led-shake",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 375.0, 237.0, 20.0, 20.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },

            {
                "box": {
                    "id": "obj-comment-tap",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 290.0, 80.0, 20.0 ],
                    "text": "tap"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tap",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 115.0, 288.0, 24.0, 24.0 ],
                    "int": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tap_enable",
                            "parameter_shortname": "tap_en",
                            "parameter_type": 2,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 1 ]
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 315.0, 130.0, 22.0 ],
                    "text": "prepend gesture_enable tap"
                }
            },
            {
                "box": {
                    "id": "obj-dial-sens-tap",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 285.0, 32.0, 32.0 ],
                    "size": 1.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tap_sensitivity",
                            "parameter_shortname": "tap_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 0.5 ]
                        }
                    },
                    "varname": "tap_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 320.0, 170.0, 22.0 ],
                    "text": "prepend gesture_sensitivity tap"
                }
            },
            {
                "box": {
                    "id": "obj-dial-cool-tap",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 275.0, 285.0, 32.0, 32.0 ],
                    "size": 500.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tap_cooldown",
                            "parameter_shortname": "tap_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 500.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 200.0 ]
                        }
                    },
                    "varname": "tap_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 275.0, 320.0, 160.0, 22.0 ],
                    "text": "prepend gesture_cooldown tap"
                }
            },
            {
                "box": {
                    "id": "obj-led-tap",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 375.0, 292.0, 20.0, 20.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },

            {
                "box": {
                    "id": "obj-comment-flip",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 345.0, 80.0, 20.0 ],
                    "text": "flip"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-flip",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 115.0, 343.0, 24.0, 24.0 ],
                    "int": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "flip_enable",
                            "parameter_shortname": "flip_en",
                            "parameter_type": 2,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 1 ]
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 370.0, 135.0, 22.0 ],
                    "text": "prepend gesture_enable flip"
                }
            },
            {
                "box": {
                    "id": "obj-dial-sens-flip",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 340.0, 32.0, 32.0 ],
                    "size": 1.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "flip_sensitivity",
                            "parameter_shortname": "flip_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 0.5 ]
                        }
                    },
                    "varname": "flip_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-flip",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 375.0, 175.0, 22.0 ],
                    "text": "prepend gesture_sensitivity flip"
                }
            },
            {
                "box": {
                    "id": "obj-dial-cool-flip",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 275.0, 340.0, 32.0, 32.0 ],
                    "size": 2000.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "flip_cooldown",
                            "parameter_shortname": "flip_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 2000.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 800.0 ]
                        }
                    },
                    "varname": "flip_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-flip",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 275.0, 375.0, 165.0, 22.0 ],
                    "text": "prepend gesture_cooldown flip"
                }
            },
            {
                "box": {
                    "id": "obj-led-flip",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 375.0, 347.0, 20.0, 20.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },

            {
                "box": {
                    "id": "obj-comment-tilt-left",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 400.0, 80.0, 20.0 ],
                    "text": "tilt-left"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tilt-left",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 115.0, 398.0, 24.0, 24.0 ],
                    "int": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_left_enable",
                            "parameter_shortname": "tl_en",
                            "parameter_type": 2,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 1 ]
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 425.0, 155.0, 22.0 ],
                    "text": "prepend gesture_enable tilt-left"
                }
            },
            {
                "box": {
                    "id": "obj-dial-sens-tilt-left",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 395.0, 32.0, 32.0 ],
                    "size": 1.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_left_sensitivity",
                            "parameter_shortname": "tl_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 0.5 ]
                        }
                    },
                    "varname": "tilt_left_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tilt-left",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 430.0, 195.0, 22.0 ],
                    "text": "prepend gesture_sensitivity tilt-left"
                }
            },
            {
                "box": {
                    "id": "obj-dial-cool-tilt-left",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 275.0, 395.0, 32.0, 32.0 ],
                    "size": 1000.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_left_cooldown",
                            "parameter_shortname": "tl_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1000.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 400.0 ]
                        }
                    },
                    "varname": "tilt_left_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tilt-left",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 275.0, 430.0, 185.0, 22.0 ],
                    "text": "prepend gesture_cooldown tilt-left"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-left",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 375.0, 402.0, 20.0, 20.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },

            {
                "box": {
                    "id": "obj-comment-tilt-right",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 455.0, 80.0, 20.0 ],
                    "text": "tilt-right"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tilt-right",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 115.0, 453.0, 24.0, 24.0 ],
                    "int": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_right_enable",
                            "parameter_shortname": "tr_en",
                            "parameter_type": 2,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 1 ]
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 480.0, 160.0, 22.0 ],
                    "text": "prepend gesture_enable tilt-right"
                }
            },
            {
                "box": {
                    "id": "obj-dial-sens-tilt-right",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 450.0, 32.0, 32.0 ],
                    "size": 1.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_right_sensitivity",
                            "parameter_shortname": "tr_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 0.5 ]
                        }
                    },
                    "varname": "tilt_right_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tilt-right",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 485.0, 200.0, 22.0 ],
                    "text": "prepend gesture_sensitivity tilt-right"
                }
            },
            {
                "box": {
                    "id": "obj-dial-cool-tilt-right",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 275.0, 450.0, 32.0, 32.0 ],
                    "size": 1000.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_right_cooldown",
                            "parameter_shortname": "tr_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1000.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 400.0 ]
                        }
                    },
                    "varname": "tilt_right_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tilt-right",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 275.0, 485.0, 190.0, 22.0 ],
                    "text": "prepend gesture_cooldown tilt-right"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-right",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 375.0, 457.0, 20.0, 20.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },

            {
                "box": {
                    "id": "obj-comment-tilt-forward",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 510.0, 80.0, 20.0 ],
                    "text": "tilt-forward"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tilt-forward",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 115.0, 508.0, 24.0, 24.0 ],
                    "int": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_forward_enable",
                            "parameter_shortname": "tf_en",
                            "parameter_type": 2,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 1 ]
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 535.0, 175.0, 22.0 ],
                    "text": "prepend gesture_enable tilt-forward"
                }
            },
            {
                "box": {
                    "id": "obj-dial-sens-tilt-forward",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 505.0, 32.0, 32.0 ],
                    "size": 1.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_forward_sensitivity",
                            "parameter_shortname": "tf_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 0.5 ]
                        }
                    },
                    "varname": "tilt_forward_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tilt-forward",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 540.0, 215.0, 22.0 ],
                    "text": "prepend gesture_sensitivity tilt-forward"
                }
            },
            {
                "box": {
                    "id": "obj-dial-cool-tilt-forward",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 275.0, 505.0, 32.0, 32.0 ],
                    "size": 1000.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_forward_cooldown",
                            "parameter_shortname": "tf_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1000.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 400.0 ]
                        }
                    },
                    "varname": "tilt_forward_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tilt-forward",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 275.0, 540.0, 205.0, 22.0 ],
                    "text": "prepend gesture_cooldown tilt-forward"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-forward",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 375.0, 512.0, 20.0, 20.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },

            {
                "box": {
                    "id": "obj-comment-tilt-back",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 565.0, 80.0, 20.0 ],
                    "text": "tilt-back"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-tilt-back",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 115.0, 563.0, 24.0, 24.0 ],
                    "int": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_back_enable",
                            "parameter_shortname": "tb_en",
                            "parameter_type": 2,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 1 ]
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 590.0, 162.0, 22.0 ],
                    "text": "prepend gesture_enable tilt-back"
                }
            },
            {
                "box": {
                    "id": "obj-dial-sens-tilt-back",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 560.0, 32.0, 32.0 ],
                    "size": 1.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_back_sensitivity",
                            "parameter_shortname": "tb_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 0.5 ]
                        }
                    },
                    "varname": "tilt_back_sensitivity"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-sens-tilt-back",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 595.0, 202.0, 22.0 ],
                    "text": "prepend gesture_sensitivity tilt-back"
                }
            },
            {
                "box": {
                    "id": "obj-dial-cool-tilt-back",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 275.0, 560.0, 32.0, 32.0 ],
                    "size": 1000.0,
                    "floatoutput": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "tilt_back_cooldown",
                            "parameter_shortname": "tb_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1,
                            "parameter_mmax": 1000.0,
                            "parameter_initial_enable": 1,
                            "parameter_initial": [ 400.0 ]
                        }
                    },
                    "varname": "tilt_back_cooldown"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cool-tilt-back",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 275.0, 595.0, 192.0, 22.0 ],
                    "text": "prepend gesture_cooldown tilt-back"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-back",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 375.0, 567.0, 20.0, 20.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },

            {
                "box": {
                    "id": "obj-comment-outlets",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 630.0, 150.0, 20.0 ],
                    "text": "--- Outlets ---",
                    "fontface": 1
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
                    "patching_rect": [ 20.0, 660.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "engine status: active, idle",
                    "id": "obj-outlet-engine-status",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 660.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "smooth accel: ax ay az (3 floats)",
                    "id": "obj-outlet-smooth-accel",
                    "index": 2,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 240.0, 660.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "smooth gyro: gx gy gz (3 floats)",
                    "id": "obj-outlet-smooth-gyro",
                    "index": 3,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 660.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "smooth orientation: pitch roll yaw (3 floats)",
                    "id": "obj-outlet-smooth-orient",
                    "index": 4,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 460.0, 660.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "connection status: connected-usb, connected-wifi, scanning, disconnected",
                    "id": "obj-outlet-status",
                    "index": 5,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 570.0, 660.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "calibration status: idle, collecting, applied, too_few_samples",
                    "id": "obj-outlet-cal-status",
                    "index": 6,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 680.0, 660.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-thru-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 570.0, 192.0, 32.0, 22.0 ],
                    "text": "t l l"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-inlet-ctrl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-connect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-disconnect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-calibrate", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-route-main", 0 ],
                    "source": [ "obj-nodescript", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-outlet-gesture", 0 ],
                    "source": [ "obj-route-main", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-led", 0 ],
                    "source": [ "obj-route-main", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-active", 0 ],
                    "order": 1,
                    "source": [ "obj-route-main", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-engine-status", 0 ],
                    "order": 0,
                    "source": [ "obj-route-main", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-accel", 0 ],
                    "source": [ "obj-route-main", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-gyro", 0 ],
                    "source": [ "obj-route-main", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-orient", 0 ],
                    "source": [ "obj-route-main", 5 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-thru-status", 0 ],
                    "source": [ "obj-route-main", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-status", 0 ],
                    "order": 0,
                    "source": [ "obj-thru-status", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-status-display", 1 ],
                    "order": 1,
                    "source": [ "obj-thru-status", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-connected", 0 ],
                    "source": [ "obj-thru-status", 1 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-outlet-cal-status", 0 ],
                    "source": [ "obj-route-main", 13 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-delay-autocal", 0 ],
                    "source": [ "obj-sel-connected", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-calibrate", 0 ],
                    "source": [ "obj-delay-autocal", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-msg-led-on", 0 ],
                    "source": [ "obj-sel-active", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-led-off", 0 ],
                    "source": [ "obj-sel-active", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-activity-led", 0 ],
                    "source": [ "obj-msg-led-on", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-activity-led", 0 ],
                    "source": [ "obj-msg-led-off", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-led-shake", 0 ],
                    "source": [ "obj-route-led", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tap", 0 ],
                    "source": [ "obj-route-led", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-flip", 0 ],
                    "source": [ "obj-route-led", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tilt-left", 0 ],
                    "source": [ "obj-route-led", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tilt-right", 0 ],
                    "source": [ "obj-route-led", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tilt-forward", 0 ],
                    "source": [ "obj-route-led", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tilt-back", 0 ],
                    "source": [ "obj-route-led", 6 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-deferlow", 0 ],
                    "source": [ "obj-loadbang", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-toggle-shake", 0 ],
                    "order": 13,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-sens-shake", 0 ],
                    "order": 12,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-cool-shake", 0 ],
                    "order": 11,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-toggle-tap", 0 ],
                    "order": 10,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-sens-tap", 0 ],
                    "order": 9,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-cool-tap", 0 ],
                    "order": 8,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-toggle-flip", 0 ],
                    "order": 7,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-sens-flip", 0 ],
                    "order": 6,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-cool-flip", 0 ],
                    "order": 5,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-toggle-tilt-left", 0 ],
                    "order": 4,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-toggle-tilt-right", 0 ],
                    "order": 3,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-toggle-tilt-forward", 0 ],
                    "order": 2,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-toggle-tilt-back", 0 ],
                    "order": 1,
                    "source": [ "obj-deferlow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-connect", 0 ],
                    "order": 0,
                    "source": [ "obj-deferlow", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-shake", 0 ],
                    "source": [ "obj-toggle-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-enable-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-shake", 0 ],
                    "source": [ "obj-dial-sens-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-sens-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-shake", 0 ],
                    "source": [ "obj-dial-cool-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-cool-shake", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tap", 0 ],
                    "source": [ "obj-toggle-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-enable-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tap", 0 ],
                    "source": [ "obj-dial-sens-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-sens-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tap", 0 ],
                    "source": [ "obj-dial-cool-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-cool-tap", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-flip", 0 ],
                    "source": [ "obj-toggle-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-enable-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-flip", 0 ],
                    "source": [ "obj-dial-sens-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-sens-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-flip", 0 ],
                    "source": [ "obj-dial-cool-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-cool-flip", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tilt-left", 0 ],
                    "source": [ "obj-toggle-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-enable-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tilt-left", 0 ],
                    "source": [ "obj-dial-sens-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-sens-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tilt-left", 0 ],
                    "source": [ "obj-dial-cool-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-cool-tilt-left", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tilt-right", 0 ],
                    "source": [ "obj-toggle-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-enable-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tilt-right", 0 ],
                    "source": [ "obj-dial-sens-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-sens-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tilt-right", 0 ],
                    "source": [ "obj-dial-cool-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-cool-tilt-right", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tilt-forward", 0 ],
                    "source": [ "obj-toggle-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-enable-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tilt-forward", 0 ],
                    "source": [ "obj-dial-sens-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-sens-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tilt-forward", 0 ],
                    "source": [ "obj-dial-cool-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-cool-tilt-forward", 0 ]
                }
            },

            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tilt-back", 0 ],
                    "source": [ "obj-toggle-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-enable-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tilt-back", 0 ],
                    "source": [ "obj-dial-sens-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-sens-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tilt-back", 0 ],
                    "source": [ "obj-dial-cool-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-prepend-cool-tilt-back", 0 ]
                }
            }
        ],
        "parameters": {
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
                        "flip_sensitivity",
                        "flip_cooldown",
                        "tilt_left_enable",
                        "tilt_left_sensitivity",
                        "tilt_left_cooldown",
                        "tilt_right_enable",
                        "tilt_right_sensitivity",
                        "tilt_right_cooldown",
                        "tilt_forward_enable",
                        "tilt_forward_sensitivity",
                        "tilt_forward_cooldown",
                        "tilt_back_enable",
                        "tilt_back_sensitivity",
                        "tilt_back_cooldown"
                    ]
                }
            }
        },
        "dependency_cache": [],
        "autosave": 0
    }
}