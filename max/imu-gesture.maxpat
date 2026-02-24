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
        "rect": [ 100.0, 100.0, 1206.0, 745.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-comment-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 7.0, 300.0, 22.0 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 35.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-connection",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 72.0, 120.0, 20.0 ],
                    "text": "--- Connection ---"
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
                    "text": "scanning"
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
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ],
                    "oncolor": [ 0.0, 0.8, 0.0, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 310.0, 92.0, 20.0, 20.0 ]
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
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 18,
                    "numoutlets": 18,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 158.5, 953.9999999999998, 35.0 ],
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
                    "patching_rect": [ 370.0, 39.0, 110.0, 22.0 ],
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
                    "patching_rect": [ 370.0, 62.0, 63.0, 22.0 ],
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
                    "patching_rect": [ 370.0, 91.0, 95.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 192.0, 200.0, 20.0 ],
                    "text": "--- Gesture Configuration ---"
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
                    "patching_rect": [ 723.0, 216.0, 390.0, 22.0 ],
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
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 260.0, 174.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 230.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "shake_sensitivity",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "shake_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
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
                    "patching_rect": [ 317.0, 260.0, 190.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 422.0, 225.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 300.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "shake_cooldown",
                            "parameter_mmax": 1000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "shake_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000.0,
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
                    "patching_rect": [ 601.0, 260.0, 189.0, 22.0 ],
                    "text": "prepend gesture_cooldown shake"
                }
            },
            {
                "box": {
                    "id": "obj-led-shake",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 232.0, 20.0, 20.0 ]
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
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 315.0, 159.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 285.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tap_sensitivity",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tap_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
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
                    "patching_rect": [ 317.0, 315.0, 175.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 422.0, 280.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 200.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tap_cooldown",
                            "parameter_mmax": 500.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tap_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 500.0,
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
                    "patching_rect": [ 601.0, 315.0, 173.0, 22.0 ],
                    "text": "prepend gesture_cooldown tap"
                }
            },
            {
                "box": {
                    "id": "obj-led-tap",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 287.0, 20.0, 20.0 ]
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
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 370.0, 157.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 340.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "flip_sensitivity",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "flip_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
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
                    "patching_rect": [ 317.0, 370.0, 175.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 422.0, 335.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 800.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "flip_cooldown",
                            "parameter_mmax": 2000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "flip_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 2000.0,
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
                    "patching_rect": [ 601.0, 370.0, 172.0, 22.0 ],
                    "text": "prepend gesture_cooldown flip"
                }
            },
            {
                "box": {
                    "id": "obj-led-flip",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 342.0, 20.0, 20.0 ]
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
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 425.0, 174.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 395.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_left_sensitivity",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tl_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
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
                    "patching_rect": [ 317.0, 425.0, 195.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 422.0, 390.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 400.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_left_cooldown",
                            "parameter_mmax": 1000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tl_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000.0,
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
                    "patching_rect": [ 601.0, 425.0, 189.0, 22.0 ],
                    "text": "prepend gesture_cooldown tilt-left"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-left",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 397.0, 20.0, 20.0 ]
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
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 480.0, 181.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 450.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_right_sensitivity",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tr_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
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
                    "patching_rect": [ 317.0, 480.0, 200.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 422.0, 445.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 400.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_right_cooldown",
                            "parameter_mmax": 1000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tr_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000.0,
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
                    "patching_rect": [ 601.0, 480.0, 196.0, 22.0 ],
                    "text": "prepend gesture_cooldown tilt-right"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-right",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 452.0, 20.0, 20.0 ]
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
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 539.0, 198.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 505.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_forward_sensitivity",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tf_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
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
                    "patching_rect": [ 416.0, 534.0, 215.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 422.0, 500.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 400.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_forward_cooldown",
                            "parameter_mmax": 1000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tf_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000.0,
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
                    "patching_rect": [ 601.0, 535.0, 213.0, 22.0 ],
                    "text": "prepend gesture_cooldown tilt-forward"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-forward",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 507.0, 20.0, 20.0 ]
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
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 115.0, 590.0, 183.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 560.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_back_sensitivity",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tb_sens",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
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
                    "patching_rect": [ 317.0, 590.0, 202.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 422.0, 555.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 400.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "tilt_back_cooldown",
                            "parameter_mmax": 1000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "tb_cd",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1000.0,
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
                    "patching_rect": [ 601.0, 590.0, 198.0, 22.0 ],
                    "text": "prepend gesture_cooldown tilt-back"
                }
            },
            {
                "box": {
                    "id": "obj-led-tilt-back",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [ 0.4, 0.4, 0.4, 1.0 ],
                    "oncolor": [ 1.0, 0.5, 0.0, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 562.0, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-outlets",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 630.0, 150.0, 20.0 ],
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
                    "patching_rect": [ 20.0, 660.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 130.0, 660.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 240.0, 660.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 350.0, 660.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 460.0, 660.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 570.0, 660.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 679.9999999999998, 216.0, 32.0, 22.0 ],
                    "text": "t l l"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-msg-calibrate", 0 ],
                    "midpoints": [ 379.5, 87.0, 379.5, 87.0 ],
                    "source": [ "obj-delay-autocal", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-flip", 0 ],
                    "midpoints": [ 431.5, 369.0, 417.0, 369.0, 417.0, 357.0, 303.0, 357.0, 303.0, 300.0, 417.0, 300.0, 417.0, 312.0, 588.0, 312.0, 588.0, 357.0, 610.5, 357.0 ],
                    "source": [ "obj-dial-cool-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-shake", 0 ],
                    "midpoints": [ 431.5, 258.0, 417.0, 258.0, 417.0, 210.0, 610.5, 210.0 ],
                    "source": [ "obj-dial-cool-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tap", 0 ],
                    "midpoints": [ 431.5, 312.0, 610.5, 312.0 ],
                    "source": [ "obj-dial-cool-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tilt-back", 0 ],
                    "midpoints": [ 431.5, 588.0, 417.0, 588.0, 417.0, 576.0, 312.0, 576.0, 312.0, 624.0, 588.0, 624.0, 588.0, 585.0, 610.5, 585.0 ],
                    "source": [ "obj-dial-cool-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tilt-forward", 0 ],
                    "midpoints": [ 431.5, 534.0, 417.0, 534.0, 417.0, 531.0, 324.0, 531.0, 324.0, 513.0, 312.0, 513.0, 312.0, 465.0, 417.0, 465.0, 417.0, 477.0, 588.0, 477.0, 588.0, 519.0, 610.5, 519.0 ],
                    "source": [ "obj-dial-cool-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tilt-left", 0 ],
                    "midpoints": [ 431.5, 423.0, 417.0, 423.0, 417.0, 411.0, 303.0, 411.0, 303.0, 465.0, 417.0, 465.0, 417.0, 477.0, 465.0, 477.0, 465.0, 459.0, 588.0, 459.0, 588.0, 420.0, 610.5, 420.0 ],
                    "source": [ "obj-dial-cool-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-cool-tilt-right", 0 ],
                    "midpoints": [ 431.5, 477.0, 610.5, 477.0 ],
                    "source": [ "obj-dial-cool-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-flip", 0 ],
                    "midpoints": [ 179.5, 366.0, 156.0, 366.0, 156.0, 348.0, 141.0, 348.0, 141.0, 339.0, 111.0, 339.0, 111.0, 312.0, 156.0, 312.0, 156.0, 282.0, 213.0, 282.0, 213.0, 300.0, 303.0, 300.0, 303.0, 357.0, 326.5, 357.0 ],
                    "source": [ "obj-dial-sens-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-shake", 0 ],
                    "midpoints": [ 179.5, 282.0, 303.0, 282.0, 303.0, 255.0, 326.5, 255.0 ],
                    "source": [ "obj-dial-sens-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tap", 0 ],
                    "midpoints": [ 179.5, 312.0, 165.0, 312.0, 165.0, 282.0, 213.0, 282.0, 213.0, 300.0, 326.5, 300.0 ],
                    "source": [ "obj-dial-sens-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tilt-back", 0 ],
                    "midpoints": [ 179.5, 624.0, 312.0, 624.0, 312.0, 585.0, 326.5, 585.0 ],
                    "source": [ "obj-dial-sens-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tilt-forward", 0 ],
                    "midpoints": [ 179.5, 534.0, 111.0, 534.0, 111.0, 624.0, 312.0, 624.0, 312.0, 573.0, 402.0, 573.0, 402.0, 531.0, 425.5, 531.0 ],
                    "source": [ "obj-dial-sens-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tilt-left", 0 ],
                    "midpoints": [ 179.5, 447.0, 303.0, 447.0, 303.0, 420.0, 326.5, 420.0 ],
                    "source": [ "obj-dial-sens-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-sens-tilt-right", 0 ],
                    "midpoints": [ 179.5, 477.0, 165.0, 477.0, 165.0, 447.0, 213.0, 447.0, 213.0, 465.0, 326.5, 465.0 ],
                    "source": [ "obj-dial-sens-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 29.5, 66.0, 6.0, 66.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-inlet-ctrl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 379.5, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-msg-calibrate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 29.5, 117.0, 29.5, 117.0 ],
                    "source": [ "obj-msg-connect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 94.5, 117.0, 29.5, 117.0 ],
                    "source": [ "obj-msg-disconnect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-activity-led", 0 ],
                    "midpoints": [ 364.5, 189.0, 297.0, 189.0, 297.0, 129.0, 306.0, 129.0, 306.0, 87.0, 319.5, 87.0 ],
                    "source": [ "obj-msg-led-off", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-activity-led", 0 ],
                    "midpoints": [ 319.5, 189.0, 297.0, 189.0, 297.0, 129.0, 306.0, 129.0, 306.0, 87.0, 319.5, 87.0 ],
                    "source": [ "obj-msg-led-on", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-main", 0 ],
                    "midpoints": [ 29.5, 153.0, 29.5, 153.0 ],
                    "source": [ "obj-nodescript", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 610.5, 393.0, 504.0, 393.0, 504.0, 300.0, 456.0, 300.0, 456.0, 312.0, 408.0, 312.0, 408.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-cool-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 610.5, 300.0, 456.0, 300.0, 456.0, 312.0, 408.0, 312.0, 408.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-cool-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 610.5, 339.0, 504.0, 339.0, 504.0, 300.0, 456.0, 300.0, 456.0, 312.0, 408.0, 312.0, 408.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-cool-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 610.5, 624.0, 102.0, 624.0, 102.0, 597.0, 6.0, 597.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-cool-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 610.5, 576.0, 531.0, 576.0, 531.0, 624.0, 102.0, 624.0, 102.0, 597.0, 6.0, 597.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-cool-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 610.5, 450.0, 522.0, 450.0, 522.0, 312.0, 408.0, 312.0, 408.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-cool-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 610.5, 504.0, 528.0, 504.0, 528.0, 312.0, 408.0, 312.0, 408.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-cool-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 124.5, 393.0, 102.0, 393.0, 102.0, 375.0, 6.0, 375.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-enable-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 124.5, 285.0, 102.0, 285.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-enable-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 124.5, 339.0, 102.0, 339.0, 102.0, 321.0, 6.0, 321.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-enable-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 124.5, 615.0, 6.0, 615.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-enable-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 124.5, 564.0, 102.0, 564.0, 102.0, 540.0, 6.0, 540.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-enable-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 124.5, 450.0, 102.0, 450.0, 102.0, 432.0, 6.0, 432.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-enable-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 124.5, 504.0, 102.0, 504.0, 102.0, 486.0, 6.0, 486.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-enable-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 326.5, 393.0, 285.0, 393.0, 285.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-sens-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 326.5, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-sens-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 326.5, 339.0, 285.0, 339.0, 285.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-sens-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 326.5, 624.0, 102.0, 624.0, 102.0, 597.0, 6.0, 597.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-sens-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 425.5, 558.0, 324.0, 558.0, 324.0, 513.0, 300.0, 513.0, 300.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-sens-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 326.5, 450.0, 300.0, 450.0, 300.0, 294.0, 204.0, 294.0, 204.0, 282.0, 102.0, 282.0, 102.0, 267.0, 6.0, 267.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-sens-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 326.5, 504.0, 312.0, 504.0, 312.0, 459.0, 204.0, 459.0, 204.0, 447.0, 102.0, 447.0, 102.0, 432.0, 6.0, 432.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-sens-tilt-right", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-flip", 0 ],
                    "midpoints": [ 838.5, 348.0, 723.0, 348.0, 723.0, 339.0, 710.5, 339.0 ],
                    "source": [ "obj-route-led", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-shake", 0 ],
                    "midpoints": [ 732.5, 240.0, 723.0, 240.0, 723.0, 252.0, 675.0, 252.0, 675.0, 213.0, 711.0, 213.0, 711.0, 228.0, 710.5, 228.0 ],
                    "source": [ "obj-route-led", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tap", 0 ],
                    "midpoints": [ 785.5, 255.0, 801.0, 255.0, 801.0, 294.0, 723.0, 294.0, 723.0, 282.0, 710.5, 282.0 ],
                    "source": [ "obj-route-led", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tilt-back", 0 ],
                    "midpoints": [ 1050.5, 567.0, 723.0, 567.0, 723.0, 558.0, 710.5, 558.0 ],
                    "source": [ "obj-route-led", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tilt-forward", 0 ],
                    "midpoints": [ 997.5, 513.0, 723.0, 513.0, 723.0, 504.0, 710.5, 504.0 ],
                    "source": [ "obj-route-led", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tilt-left", 0 ],
                    "midpoints": [ 891.5, 402.0, 723.0, 402.0, 723.0, 393.0, 710.5, 393.0 ],
                    "source": [ "obj-route-led", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led-tilt-right", 0 ],
                    "midpoints": [ 944.5, 459.0, 723.0, 459.0, 723.0, 447.0, 710.5, 447.0 ],
                    "source": [ "obj-route-led", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-cal-status", 0 ],
                    "midpoints": [ 744.4999999999998, 195.0, 666.0, 195.0, 666.0, 255.0, 825.0, 255.0, 825.0, 645.0, 689.5, 645.0 ],
                    "source": [ "obj-route-main", 13 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-engine-status", 0 ],
                    "midpoints": [ 139.49999999999997, 153.0, 6.0, 153.0, 6.0, 702.0, 117.0, 702.0, 117.0, 657.0, 139.5, 657.0 ],
                    "order": 1,
                    "source": [ "obj-route-main", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-gesture", 0 ],
                    "midpoints": [ 29.5, 195.0, 6.0, 195.0, 6.0, 657.0, 29.5, 657.0 ],
                    "source": [ "obj-route-main", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-accel", 0 ],
                    "midpoints": [ 194.49999999999994, 195.0, 240.0, 195.0, 240.0, 246.0, 303.0, 246.0, 303.0, 525.0, 324.0, 525.0, 324.0, 576.0, 300.0, 576.0, 300.0, 645.0, 249.5, 645.0 ],
                    "source": [ "obj-route-main", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-gyro", 0 ],
                    "midpoints": [ 249.49999999999994, 246.0, 303.0, 246.0, 303.0, 525.0, 324.0, 525.0, 324.0, 576.0, 312.0, 576.0, 312.0, 645.0, 359.5, 645.0 ],
                    "source": [ "obj-route-main", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-orient", 0 ],
                    "midpoints": [ 304.49999999999994, 207.0, 246.0, 207.0, 246.0, 246.0, 303.0, 246.0, 303.0, 525.0, 324.0, 525.0, 324.0, 576.0, 312.0, 576.0, 312.0, 645.0, 469.5, 645.0 ],
                    "source": [ "obj-route-main", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-led", 0 ],
                    "midpoints": [ 84.49999999999999, 231.0, 102.0, 231.0, 102.0, 282.0, 303.0, 282.0, 303.0, 240.0, 417.0, 240.0, 417.0, 210.0, 732.5, 210.0 ],
                    "source": [ "obj-route-main", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-active", 0 ],
                    "midpoints": [ 139.49999999999997, 153.0, 306.0, 153.0, 306.0, 138.0, 319.5, 138.0 ],
                    "order": 0,
                    "source": [ "obj-route-main", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thru-status", 0 ],
                    "midpoints": [ 689.4999999999998, 195.0, 689.4999999999998, 195.0 ],
                    "source": [ "obj-route-main", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-led-off", 0 ],
                    "midpoints": [ 365.0, 165.0, 364.5, 165.0 ],
                    "source": [ "obj-sel-active", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-led-on", 0 ],
                    "midpoints": [ 319.5, 165.0, 319.5, 165.0 ],
                    "source": [ "obj-sel-active", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-delay-autocal", 0 ],
                    "midpoints": [ 379.5, 63.0, 379.5, 63.0 ],
                    "source": [ "obj-sel-connected", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-status", 0 ],
                    "midpoints": [ 689.4999999999998, 255.0, 825.0, 255.0, 825.0, 645.0, 579.5, 645.0 ],
                    "order": 0,
                    "source": [ "obj-thru-status", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-connected", 0 ],
                    "midpoints": [ 702.4999999999998, 240.0, 666.0, 240.0, 666.0, 195.0, 984.0, 195.0, 984.0, 24.0, 379.5, 24.0 ],
                    "source": [ "obj-thru-status", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-status-display", 1 ],
                    "midpoints": [ 689.4999999999998, 240.0, 666.0, 240.0, 666.0, 195.0, 984.0, 195.0, 984.0, 123.0, 291.0, 123.0, 291.0, 87.0, 280.5, 87.0 ],
                    "order": 1,
                    "source": [ "obj-thru-status", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-flip", 0 ],
                    "midpoints": [ 124.5, 369.0, 124.5, 369.0 ],
                    "source": [ "obj-toggle-flip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-shake", 0 ],
                    "midpoints": [ 124.5, 258.0, 124.5, 258.0 ],
                    "source": [ "obj-toggle-shake", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tap", 0 ],
                    "midpoints": [ 124.5, 315.0, 124.5, 315.0 ],
                    "source": [ "obj-toggle-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tilt-back", 0 ],
                    "midpoints": [ 124.5, 588.0, 124.5, 588.0 ],
                    "source": [ "obj-toggle-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tilt-forward", 0 ],
                    "midpoints": [ 124.5, 534.0, 124.5, 534.0 ],
                    "source": [ "obj-toggle-tilt-forward", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tilt-left", 0 ],
                    "midpoints": [ 124.5, 423.0, 124.5, 423.0 ],
                    "source": [ "obj-toggle-tilt-left", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-enable-tilt-right", 0 ],
                    "midpoints": [ 124.5, 480.0, 124.5, 480.0 ],
                    "source": [ "obj-toggle-tilt-right", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-dial-cool-flip": [ "flip_cooldown", "flip_cd", 0 ],
            "obj-dial-cool-shake": [ "shake_cooldown", "shake_cd", 0 ],
            "obj-dial-cool-tap": [ "tap_cooldown", "tap_cd", 0 ],
            "obj-dial-cool-tilt-back": [ "tilt_back_cooldown", "tb_cd", 0 ],
            "obj-dial-cool-tilt-forward": [ "tilt_forward_cooldown", "tf_cd", 0 ],
            "obj-dial-cool-tilt-left": [ "tilt_left_cooldown", "tl_cd", 0 ],
            "obj-dial-cool-tilt-right": [ "tilt_right_cooldown", "tr_cd", 0 ],
            "obj-dial-sens-flip": [ "flip_sensitivity", "flip_sens", 0 ],
            "obj-dial-sens-shake": [ "shake_sensitivity", "shake_sens", 0 ],
            "obj-dial-sens-tap": [ "tap_sensitivity", "tap_sens", 0 ],
            "obj-dial-sens-tilt-back": [ "tilt_back_sensitivity", "tb_sens", 0 ],
            "obj-dial-sens-tilt-forward": [ "tilt_forward_sensitivity", "tf_sens", 0 ],
            "obj-dial-sens-tilt-left": [ "tilt_left_sensitivity", "tl_sens", 0 ],
            "obj-dial-sens-tilt-right": [ "tilt_right_sensitivity", "tr_sens", 0 ],
            "obj-toggle-flip": [ "flip_enable", "flip_en", 0 ],
            "obj-toggle-shake": [ "shake_enable", "shake_en", 0 ],
            "obj-toggle-tap": [ "tap_enable", "tap_en", 0 ],
            "obj-toggle-tilt-back": [ "tilt_back_enable", "tb_en", 0 ],
            "obj-toggle-tilt-forward": [ "tilt_forward_enable", "tf_en", 0 ],
            "obj-toggle-tilt-left": [ "tilt_left_enable", "tl_en", 0 ],
            "obj-toggle-tilt-right": [ "tilt_right_enable", "tr_en", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "shake_enable", "shake_sensitivity", "shake_cooldown", "tap_enable", "tap_sensitivity", "tap_cooldown", "flip_enable", "flip_sensitivity" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}