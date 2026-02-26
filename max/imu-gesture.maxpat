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
        "rect": [ 153.0, 113.0, 1206.0, 745.0 ],
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
                    "text": "connected-usb"
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
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 27,
                    "numoutlets": 27,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 158.5, 972.0, 49.0 ],
                    "text": "route gesture gesture_led engine_status smooth_accel smooth_gyro smooth_orientation cal_accel cal_gyro cal_orientation norm_accel norm_gyro norm_orientation status cal_status cal_progress cal_bias cal_toggle dtw_match dtw_confidence dtw_record_status dtw_record_progress dtw_status dtw_library_info dtw_slot_info dtw_axes_detected quaternion"
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
                            "parameter_initial": [ 300 ],
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
                            "parameter_initial": [ 200 ],
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
                            "parameter_initial": [ 800 ],
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
                            "parameter_initial": [ 400 ],
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
                            "parameter_initial": [ 400 ],
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
                            "parameter_initial": [ 400 ],
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
                            "parameter_initial": [ 400 ],
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
                    "patching_rect": [ 20.0, 1170.0, 150.0, 20.0 ],
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
                    "patching_rect": [ 20.0, 1200.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 130.0, 1200.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 240.0, 1200.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 350.0, 1200.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 460.0, 1200.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 570.0, 1200.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 680.0, 1200.0, 30.0, 30.0 ]
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
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-comment-dtw-header",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 626.0, 350.0, 22.0 ],
                    "text": "--- Custom DTW Gesture Recording ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-slot",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 690.0, 40.0, 20.0 ],
                    "text": "slot:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot-id",
                    "maxclass": "number",
                    "maximum": 99,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 690.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-mode",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 120.0, 690.0, 45.0, 20.0 ],
                    "text": "mode:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-mode-menu",
                    "items": [ "timed", ",", "toggle" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 165.0, 690.0, 80.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "0", "1" ],
                            "parameter_longname": "dtw_record_mode",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_mode",
                            "parameter_type": 2
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
                    "patching_rect": [ 255.0, 690.0, 40.0, 20.0 ],
                    "text": "dur:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-duration",
                    "maxclass": "number",
                    "maximum": 10000,
                    "minimum": 500,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 690.0, 55.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-dur-default",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 295.0, 670.0, 40.0, 22.0 ],
                    "text": "2000"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-dur-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 295.0, 650.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot-default",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 670.0, 22.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 60.0, 650.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-record",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 370.0, 690.0, 55.0, 20.0 ],
                    "text": "Record"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-record-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 425.0, 690.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-stop",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 460.0, 690.0, 35.0, 20.0 ],
                    "text": "Stop"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-stop-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 495.0, 690.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-rec-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 370.0, 720.0, 140.0, 22.0 ],
                    "text": "pack i s i"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-rec-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 370.0, 745.0, 155.0, 22.0 ],
                    "text": "prepend dtw_record_start"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-stop-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 530.0, 720.0, 105.0, 22.0 ],
                    "text": "dtw_record_stop"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-recstatus",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 690.0, 50.0, 20.0 ],
                    "text": "status:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-rec-status-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 610.0, 690.0, 120.0, 22.0 ],
                    "text": "captured 1 130"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-progress",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 740.0, 690.0, 55.0, 20.0 ],
                    "text": "frames:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-rec-progress",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 795.0, 690.0, 55.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 860.0, 690.0, 45.0, 20.0 ],
                    "text": "name:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-name-input",
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 905.0, 690.0, 100.0, 22.0 ],
                    "text": "circle\n"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-name-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 905.0, 728.0, 130.0, 22.0 ],
                    "text": "prepend dtw_name"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-name-pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 905.0, 753.0, 130.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 780.0, 350.0, 20.0 ],
                    "text": "--- DTW Gesture Slots ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-en",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 800.0, 40.0, 20.0 ],
                    "text": "en"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-slot",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 50.0, 800.0, 50.0, 20.0 ],
                    "text": "slot"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 800.0, 80.0, 20.0 ],
                    "text": "name"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-thresh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 185.0, 800.0, 70.0, 20.0 ],
                    "text": "threshold"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-cd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 270.0, 800.0, 70.0, 20.0 ],
                    "text": "cd (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-ex",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 800.0, 60.0, 20.0 ],
                    "text": "examples"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-hdr-del",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 800.0, 40.0, 20.0 ],
                    "text": "del"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 24.0, 820.0, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 24.0, 845.0, 130.0, 22.0 ],
                    "text": "prepend dtw_enable 1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 50.0, 820.0, 40.0, 20.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 820.0, 80.0, 20.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 195.0, 817.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.6 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_threshold_1",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_th1",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
                    "varname": "dtw_threshold_1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-prepend-th",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 195.0, 845.0, 155.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 280.0, 817.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 500 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_cooldown_1",
                            "parameter_mmax": 5000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cd1",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 5000.0,
                    "varname": "dtw_cooldown_1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-prepend-cd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 845.0, 155.0, 22.0 ],
                    "text": "prepend dtw_cooldown 1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-examples",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 820.0, 40.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-del-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 425.0, 820.0, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot1-del-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 425.0, 845.0, 105.0, 22.0 ],
                    "text": "dtw_delete 1"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 24.0, 875.0, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 24.0, 900.0, 130.0, 22.0 ],
                    "text": "prepend dtw_enable 2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 50.0, 875.0, 40.0, 20.0 ],
                    "text": "2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 875.0, 80.0, 20.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 195.0, 872.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.6 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_threshold_2",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_th2",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
                    "varname": "dtw_threshold_2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-prepend-th",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 195.0, 900.0, 155.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 280.0, 872.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 500 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_cooldown_2",
                            "parameter_mmax": 5000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cd2",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 5000.0,
                    "varname": "dtw_cooldown_2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-prepend-cd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 900.0, 155.0, 22.0 ],
                    "text": "prepend dtw_cooldown 2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-examples",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 875.0, 40.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-del-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 425.0, 875.0, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot2-del-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 425.0, 900.0, 105.0, 22.0 ],
                    "text": "dtw_delete 2"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 24.0, 930.0, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 24.0, 955.0, 130.0, 22.0 ],
                    "text": "prepend dtw_enable 3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 50.0, 930.0, 40.0, 20.0 ],
                    "text": "3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 930.0, 80.0, 20.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 195.0, 927.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.6 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_threshold_3",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_th3",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
                    "varname": "dtw_threshold_3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-prepend-th",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 195.0, 955.0, 155.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 280.0, 927.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 500 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_cooldown_3",
                            "parameter_mmax": 5000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cd3",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 5000.0,
                    "varname": "dtw_cooldown_3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-prepend-cd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 955.0, 155.0, 22.0 ],
                    "text": "prepend dtw_cooldown 3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-examples",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 930.0, 40.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-del-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 425.0, 930.0, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot3-del-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 425.0, 955.0, 105.0, 22.0 ],
                    "text": "dtw_delete 3"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 24.0, 985.0, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 24.0, 1010.0, 130.0, 22.0 ],
                    "text": "prepend dtw_enable 4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 50.0, 985.0, 40.0, 20.0 ],
                    "text": "4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-name",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 985.0, 80.0, 20.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 195.0, 982.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.6 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_threshold_4",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_th4",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 1.0,
                    "varname": "dtw_threshold_4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-prepend-th",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 195.0, 1010.0, 155.0, 22.0 ],
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
                    "outlettype": [ "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 280.0, 982.0, 32.0, 32.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 500 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "dtw_cooldown_4",
                            "parameter_mmax": 5000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_cd4",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "size": 5000.0,
                    "varname": "dtw_cooldown_4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-prepend-cd",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 1010.0, 155.0, 22.0 ],
                    "text": "prepend dtw_cooldown 4"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-examples",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 985.0, 40.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-del-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 425.0, 985.0, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot4-del-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 425.0, 1010.0, 105.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 1060.0, 300.0, 20.0 ],
                    "text": "--- DTW Match Settings ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-matchmode",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1085.0, 78.0, 20.0 ],
                    "text": "match mode:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-matchmode-menu",
                    "items": [ "best", ",", "all" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 100.0, 1085.0, 70.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "0", "1" ],
                            "parameter_longname": "dtw_match_mode",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "dtw_mm",
                            "parameter_type": 2
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 1110.0, 151.0, 22.0 ],
                    "text": "prepend dtw_match_mode"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-continuous",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 1085.0, 75.0, 20.0 ],
                    "text": "continuous:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-continuous-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 340.0, 1085.0, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 0 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 340.0, 1110.0, 145.0, 22.0 ],
                    "text": "prepend dtw_continuous"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-libstatus",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 500.0, 1085.0, 55.0, 20.0 ],
                    "text": "lib info:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-lib-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 1085.0, 150.0, 22.0 ],
                    "text": "no library"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-lib-count",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 720.0, 1085.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-libcount",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 770.0, 1085.0, 60.0, 20.0 ],
                    "text": "gestures"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-axes",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 840.0, 1085.0, 45.0, 20.0 ],
                    "text": "axes:"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-axes-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 885.0, 1085.0, 120.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 1140.0, 300.0, 20.0 ],
                    "text": "--- DTW Library Save/Load ---"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-save",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1165.0, 80.0, 20.0 ],
                    "text": "Save Library"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-save-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 105.0, 1165.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-savedialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "bang" ],
                    "patching_rect": [ 105.0, 1195.0, 110.0, 22.0 ],
                    "text": "savedialog JSON"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-save-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 105.0, 1220.0, 115.0, 22.0 ],
                    "text": "prepend dtw_save"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-load",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 240.0, 1165.0, 80.0, 20.0 ],
                    "text": "Load Library"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-load-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 325.0, 1165.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-opendialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 325.0, 1195.0, 110.0, 22.0 ],
                    "text": "opendialog JSON"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-load-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 325.0, 1220.0, 115.0, 22.0 ],
                    "text": "prepend dtw_load"
                }
            },
            {
                "box": {
                    "id": "obj-comment-dtw-clear",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 460.0, 1165.0, 60.0, 20.0 ],
                    "text": "Clear All"
                }
            },
            {
                "box": {
                    "id": "obj-dtw-clear-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 525.0, 1165.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-clear-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 525.0, 1195.0, 85.0, 22.0 ],
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
                    "patching_rect": [ 790.0, 1200.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 900.0, 1200.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 1010.0, 1200.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dtw-slot-info-route",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 550.0, 820.0, 200.0, 22.0 ],
                    "text": "route 1 2 3 4"
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
                    "midpoints": [ 431.5, 258.0, 417.0, 258.0, 417.0, 222.0, 610.5, 222.0 ],
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
                    "midpoints": [ 179.5, 534.0, 102.0, 534.0, 102.0, 624.0, 312.0, 624.0, 312.0, 573.0, 402.0, 573.0, 402.0, 531.0, 425.5, 531.0 ],
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
                    "destination": [ "obj-dtw-clear-msg", 0 ],
                    "midpoints": [ 534.5, 1191.0, 534.5, 1191.0 ],
                    "source": [ "obj-dtw-clear-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 534.5, 1254.0, 6.0, 1254.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-clear-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 349.5, 1134.0, 336.0, 1134.0, 336.0, 1044.0, 6.0, 1044.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-continuous-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-continuous-prepend", 0 ],
                    "midpoints": [ 349.5, 1107.0, 349.5, 1107.0 ],
                    "source": [ "obj-dtw-continuous-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-duration", 0 ],
                    "midpoints": [ 304.5, 693.0, 304.5, 693.0 ],
                    "source": [ "obj-dtw-dur-default", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-dur-default", 0 ],
                    "midpoints": [ 304.5, 675.0, 304.5, 675.0 ],
                    "source": [ "obj-dtw-dur-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-rec-pack", 2 ],
                    "midpoints": [ 304.5, 723.0, 366.0, 723.0, 366.0, 717.0, 500.5, 717.0 ],
                    "source": [ "obj-dtw-duration", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-opendialog", 0 ],
                    "midpoints": [ 334.5, 1191.0, 334.5, 1191.0 ],
                    "source": [ "obj-dtw-load-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 334.5, 1254.0, 6.0, 1254.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-load-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-matchmode-prepend", 0 ],
                    "midpoints": [ 135.0, 1107.0, 109.5, 1107.0 ],
                    "source": [ "obj-dtw-matchmode-menu", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 109.5, 1134.0, 87.0, 1134.0, 87.0, 1116.0, 6.0, 1116.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-matchmode-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-rec-pack", 1 ],
                    "midpoints": [ 205.0, 723.0, 366.0, 723.0, 366.0, 717.0, 440.0, 717.0 ],
                    "source": [ "obj-dtw-mode-menu", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-name-pack", 1 ],
                    "midpoints": [ 914.5, 714.0, 891.0, 714.0, 891.0, 774.0, 1035.0, 774.0, 1035.0, 735.0, 1025.5, 735.0 ],
                    "source": [ "obj-dtw-name-input", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-name-prepend", 0 ],
                    "midpoints": [ 914.5, 778.0, 891.0, 778.0, 891.0, 724.0, 914.5, 724.0 ],
                    "source": [ "obj-dtw-name-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 914.5, 738.0, 732.0, 738.0, 732.0, 624.0, 6.0, 624.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-name-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-load-prepend", 0 ],
                    "midpoints": [ 334.5, 1218.0, 334.5, 1218.0 ],
                    "source": [ "obj-dtw-opendialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-rec-prepend", 0 ],
                    "midpoints": [ 379.5, 744.0, 379.5, 744.0 ],
                    "source": [ "obj-dtw-rec-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 379.5, 768.0, 357.0, 768.0, 357.0, 723.0, 6.0, 723.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-rec-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-rec-pack", 0 ],
                    "midpoints": [ 434.5, 717.0, 379.5, 717.0 ],
                    "source": [ "obj-dtw-record-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-savedialog", 0 ],
                    "midpoints": [ 114.5, 1191.0, 114.5, 1191.0 ],
                    "source": [ "obj-dtw-save-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 114.5, 1245.0, 6.0, 1245.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-save-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-save-prepend", 0 ],
                    "midpoints": [ 114.5, 1218.0, 114.5, 1218.0 ],
                    "source": [ "obj-dtw-savedialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot-id", 0 ],
                    "midpoints": [ 69.5, 693.0, 69.5, 693.0 ],
                    "source": [ "obj-dtw-slot-default", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-name-pack", 0 ],
                    "midpoints": [ 69.5, 765.0, 366.0, 765.0, 366.0, 777.0, 891.0, 777.0, 891.0, 735.0, 914.5, 735.0 ],
                    "order": 0,
                    "source": [ "obj-dtw-slot-id", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-rec-pack", 0 ],
                    "midpoints": [ 69.5, 723.0, 366.0, 723.0, 366.0, 717.0, 379.5, 717.0 ],
                    "order": 1,
                    "source": [ "obj-dtw-slot-id", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot1-examples", 0 ],
                    "midpoints": [ 559.5, 843.0, 537.0, 843.0, 537.0, 786.0, 372.0, 786.0, 372.0, 816.0, 369.5, 816.0 ],
                    "source": [ "obj-dtw-slot-info-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot2-examples", 0 ],
                    "midpoints": [ 604.75, 879.0, 447.0, 879.0, 447.0, 870.0, 369.5, 870.0 ],
                    "source": [ "obj-dtw-slot-info-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot3-examples", 0 ],
                    "midpoints": [ 650.0, 933.0, 447.0, 933.0, 447.0, 927.0, 369.5, 927.0 ],
                    "source": [ "obj-dtw-slot-info-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot4-examples", 0 ],
                    "midpoints": [ 695.25, 987.0, 447.0, 987.0, 447.0, 981.0, 369.5, 981.0 ],
                    "source": [ "obj-dtw-slot-info-route", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot-default", 0 ],
                    "midpoints": [ 69.5, 675.0, 69.5, 675.0 ],
                    "source": [ "obj-dtw-slot-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot1-prepend-cd", 0 ],
                    "midpoints": [ 289.5, 852.0, 289.5, 852.0 ],
                    "source": [ "obj-dtw-slot1-cooldown", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot1-del-msg", 0 ],
                    "midpoints": [ 434.5, 843.0, 434.5, 843.0 ],
                    "source": [ "obj-dtw-slot1-del-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 434.5, 870.0, 456.0, 870.0, 456.0, 879.0, 540.0, 879.0, 540.0, 831.0, 471.0, 831.0, 471.0, 777.0, 357.0, 777.0, 357.0, 723.0, 6.0, 723.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot1-del-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 289.5, 867.0, 6.0, 867.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot1-prepend-cd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 33.5, 870.0, 6.0, 870.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot1-prepend-en", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 204.5, 867.0, 6.0, 867.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot1-prepend-th", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot1-prepend-th", 0 ],
                    "midpoints": [ 204.5, 852.0, 204.5, 852.0 ],
                    "source": [ "obj-dtw-slot1-thresh", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot1-prepend-en", 0 ],
                    "midpoints": [ 33.5, 843.0, 33.5, 843.0 ],
                    "source": [ "obj-dtw-slot1-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot2-prepend-cd", 0 ],
                    "midpoints": [ 289.5, 906.0, 289.5, 906.0 ],
                    "source": [ "obj-dtw-slot2-cooldown", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot2-del-msg", 0 ],
                    "midpoints": [ 434.5, 897.0, 434.5, 897.0 ],
                    "source": [ "obj-dtw-slot2-del-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 434.5, 924.0, 456.0, 924.0, 456.0, 933.0, 540.0, 933.0, 540.0, 831.0, 471.0, 831.0, 471.0, 777.0, 357.0, 777.0, 357.0, 723.0, 6.0, 723.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot2-del-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 289.5, 924.0, 6.0, 924.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot2-prepend-cd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 33.5, 924.0, 6.0, 924.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot2-prepend-en", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 204.5, 924.0, 6.0, 924.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot2-prepend-th", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot2-prepend-th", 0 ],
                    "midpoints": [ 204.5, 906.0, 204.5, 906.0 ],
                    "source": [ "obj-dtw-slot2-thresh", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot2-prepend-en", 0 ],
                    "midpoints": [ 33.5, 897.0, 33.5, 897.0 ],
                    "source": [ "obj-dtw-slot2-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot3-prepend-cd", 0 ],
                    "midpoints": [ 289.5, 960.0, 289.5, 960.0 ],
                    "source": [ "obj-dtw-slot3-cooldown", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot3-del-msg", 0 ],
                    "midpoints": [ 434.5, 951.0, 434.5, 951.0 ],
                    "source": [ "obj-dtw-slot3-del-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 434.5, 978.0, 456.0, 978.0, 456.0, 987.0, 540.0, 987.0, 540.0, 831.0, 471.0, 831.0, 471.0, 777.0, 357.0, 777.0, 357.0, 723.0, 6.0, 723.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot3-del-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 289.5, 978.0, 6.0, 978.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot3-prepend-cd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 33.5, 978.0, 6.0, 978.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot3-prepend-en", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 204.5, 978.0, 6.0, 978.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot3-prepend-th", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot3-prepend-th", 0 ],
                    "midpoints": [ 204.5, 960.0, 204.5, 960.0 ],
                    "source": [ "obj-dtw-slot3-thresh", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot3-prepend-en", 0 ],
                    "midpoints": [ 33.5, 951.0, 33.5, 951.0 ],
                    "source": [ "obj-dtw-slot3-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot4-prepend-cd", 0 ],
                    "midpoints": [ 289.5, 1017.0, 289.5, 1017.0 ],
                    "source": [ "obj-dtw-slot4-cooldown", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot4-del-msg", 0 ],
                    "midpoints": [ 434.5, 1008.0, 434.5, 1008.0 ],
                    "source": [ "obj-dtw-slot4-del-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 434.5, 1044.0, 6.0, 1044.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot4-del-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 289.5, 1044.0, 6.0, 1044.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot4-prepend-cd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 33.5, 1035.0, 6.0, 1035.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot4-prepend-en", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 204.5, 1044.0, 6.0, 1044.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-slot4-prepend-th", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot4-prepend-th", 0 ],
                    "midpoints": [ 204.5, 1017.0, 204.5, 1017.0 ],
                    "source": [ "obj-dtw-slot4-thresh", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot4-prepend-en", 0 ],
                    "midpoints": [ 33.5, 1008.0, 33.5, 1008.0 ],
                    "source": [ "obj-dtw-slot4-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-stop-msg", 0 ],
                    "midpoints": [ 504.5, 717.0, 539.5, 717.0 ],
                    "source": [ "obj-dtw-stop-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 539.5, 744.0, 525.0, 744.0, 525.0, 624.0, 6.0, 624.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-dtw-stop-msg", 0 ]
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
                    "midpoints": [ 610.5, 624.0, 6.0, 624.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-cool-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 610.5, 576.0, 531.0, 576.0, 531.0, 624.0, 6.0, 624.0, 6.0, 126.0, 29.5, 126.0 ],
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
                    "midpoints": [ 326.5, 624.0, 6.0, 624.0, 6.0, 126.0, 29.5, 126.0 ],
                    "source": [ "obj-prepend-sens-tilt-back", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 425.5, 558.0, 324.0, 558.0, 324.0, 576.0, 300.0, 576.0, 300.0, 624.0, 6.0, 624.0, 6.0, 126.0, 29.5, 126.0 ],
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
                    "destination": [ "obj-dtw-axes-display", 1 ],
                    "midpoints": [ 909.1923076923077, 210.0, 1002.0, 210.0, 1002.0, 201.0, 1125.0, 201.0, 1125.0, 1071.0, 995.5, 1071.0 ],
                    "source": [ "obj-route-main", 24 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-lib-count", 0 ],
                    "midpoints": [ 835.8846153846154, 210.0, 675.0, 210.0, 675.0, 255.0, 852.0, 255.0, 852.0, 1071.0, 729.5, 1071.0 ],
                    "source": [ "obj-route-main", 22 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-lib-status", 1 ],
                    "midpoints": [ 799.2307692307693, 210.0, 675.0, 210.0, 675.0, 255.0, 852.0, 255.0, 852.0, 1071.0, 700.5, 1071.0 ],
                    "source": [ "obj-route-main", 21 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-rec-progress", 0 ],
                    "midpoints": [ 762.5769230769231, 210.0, 675.0, 210.0, 675.0, 252.0, 825.0, 252.0, 825.0, 675.0, 804.5, 675.0 ],
                    "source": [ "obj-route-main", 20 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-rec-status-display", 1 ],
                    "midpoints": [ 725.9230769230769, 210.0, 675.0, 210.0, 675.0, 255.0, 825.0, 255.0, 825.0, 675.0, 720.5, 675.0 ],
                    "source": [ "obj-route-main", 19 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dtw-slot-info-route", 0 ],
                    "midpoints": [ 872.5384615384615, 210.0, 1002.0, 210.0, 1002.0, 201.0, 1125.0, 201.0, 1125.0, 807.0, 559.5, 807.0 ],
                    "source": [ "obj-route-main", 23 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-cal-status", 0 ],
                    "midpoints": [ 506.0, 246.0, 588.0, 246.0, 588.0, 519.0, 687.0, 519.0, 687.0, 528.0, 732.0, 528.0, 732.0, 522.0, 852.0, 522.0, 852.0, 1071.0, 711.0, 1071.0, 711.0, 1185.0, 689.5, 1185.0 ],
                    "source": [ "obj-route-main", 13 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-dtw-confidence", 0 ],
                    "midpoints": [ 689.2692307692307, 210.0, 675.0, 210.0, 675.0, 252.0, 852.0, 252.0, 852.0, 1071.0, 837.0, 1071.0, 837.0, 1185.0, 909.5, 1185.0 ],
                    "source": [ "obj-route-main", 18 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-dtw-match", 0 ],
                    "midpoints": [ 652.6153846153846, 246.0, 696.0, 246.0, 696.0, 255.0, 852.0, 255.0, 852.0, 1071.0, 831.0, 1071.0, 831.0, 1185.0, 799.5, 1185.0 ],
                    "source": [ "obj-route-main", 17 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-engine-status", 0 ],
                    "midpoints": [ 102.8076923076923, 276.0, 6.0, 276.0, 6.0, 1191.0, 139.5, 1191.0 ],
                    "order": 1,
                    "source": [ "obj-route-main", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-gesture", 0 ],
                    "midpoints": [ 29.5, 210.0, 6.0, 210.0, 6.0, 1197.0, 29.5, 1197.0 ],
                    "source": [ "obj-route-main", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-quaternion", 0 ],
                    "midpoints": [ 945.8461538461538, 210.0, 1017.0, 210.0, 1017.0, 201.0, 1125.0, 201.0, 1125.0, 1185.0, 1019.5, 1185.0 ],
                    "source": [ "obj-route-main", 25 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-accel", 0 ],
                    "midpoints": [ 139.46153846153845, 210.0, 102.0, 210.0, 102.0, 276.0, 6.0, 276.0, 6.0, 1254.0, 237.0, 1254.0, 237.0, 1197.0, 249.5, 1197.0 ],
                    "source": [ "obj-route-main", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-gyro", 0 ],
                    "midpoints": [ 176.1153846153846, 210.0, 156.0, 210.0, 156.0, 246.0, 141.0, 246.0, 141.0, 282.0, 102.0, 282.0, 102.0, 276.0, 6.0, 276.0, 6.0, 1047.0, 336.0, 1047.0, 336.0, 1152.0, 360.0, 1152.0, 360.0, 1197.0, 359.5, 1197.0 ],
                    "source": [ "obj-route-main", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outlet-smooth-orient", 0 ],
                    "midpoints": [ 212.76923076923077, 210.0, 222.0, 210.0, 222.0, 207.0, 240.0, 207.0, 240.0, 246.0, 303.0, 246.0, 303.0, 525.0, 324.0, 525.0, 324.0, 576.0, 312.0, 576.0, 312.0, 636.0, 531.0, 636.0, 531.0, 717.0, 525.0, 717.0, 525.0, 831.0, 540.0, 831.0, 540.0, 1071.0, 486.0, 1071.0, 486.0, 1152.0, 447.0, 1152.0, 447.0, 1197.0, 469.5, 1197.0 ],
                    "source": [ "obj-route-main", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-led", 0 ],
                    "midpoints": [ 66.15384615384616, 231.0, 102.0, 231.0, 102.0, 282.0, 303.0, 282.0, 303.0, 240.0, 417.0, 240.0, 417.0, 222.0, 675.0, 222.0, 675.0, 213.0, 732.5, 213.0 ],
                    "source": [ "obj-route-main", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-active", 0 ],
                    "midpoints": [ 102.8076923076923, 231.0, 6.0, 231.0, 6.0, 126.0, 319.5, 126.0 ],
                    "order": 0,
                    "source": [ "obj-route-main", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thru-status", 0 ],
                    "midpoints": [ 469.34615384615387, 219.0, 675.0, 219.0, 675.0, 213.0, 689.4999999999998, 213.0 ],
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
                    "midpoints": [ 689.4999999999998, 255.0, 852.0, 255.0, 852.0, 1071.0, 711.0, 1071.0, 711.0, 1182.0, 579.5, 1182.0 ],
                    "order": 0,
                    "source": [ "obj-thru-status", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-connected", 0 ],
                    "midpoints": [ 702.4999999999998, 240.0, 696.0, 240.0, 696.0, 252.0, 1125.0, 252.0, 1125.0, 24.0, 379.5, 24.0 ],
                    "source": [ "obj-thru-status", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-status-display", 1 ],
                    "midpoints": [ 689.4999999999998, 252.0, 1125.0, 252.0, 1125.0, 123.0, 291.0, 123.0, 291.0, 87.0, 280.5, 87.0 ],
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
            "obj-dtw-continuous-toggle": [ "dtw_continuous", "dtw_cont", 0 ],
            "obj-dtw-matchmode-menu": [ "dtw_match_mode", "dtw_mm", 0 ],
            "obj-dtw-mode-menu": [ "dtw_record_mode", "dtw_mode", 0 ],
            "obj-dtw-slot1-cooldown": [ "dtw_cooldown_1", "dtw_cd1", 0 ],
            "obj-dtw-slot1-thresh": [ "dtw_threshold_1", "dtw_th1", 0 ],
            "obj-dtw-slot1-toggle": [ "dtw_enable_1", "dtw_en1", 0 ],
            "obj-dtw-slot2-cooldown": [ "dtw_cooldown_2", "dtw_cd2", 0 ],
            "obj-dtw-slot2-thresh": [ "dtw_threshold_2", "dtw_th2", 0 ],
            "obj-dtw-slot2-toggle": [ "dtw_enable_2", "dtw_en2", 0 ],
            "obj-dtw-slot3-cooldown": [ "dtw_cooldown_3", "dtw_cd3", 0 ],
            "obj-dtw-slot3-thresh": [ "dtw_threshold_3", "dtw_th3", 0 ],
            "obj-dtw-slot3-toggle": [ "dtw_enable_3", "dtw_en3", 0 ],
            "obj-dtw-slot4-cooldown": [ "dtw_cooldown_4", "dtw_cd4", 0 ],
            "obj-dtw-slot4-thresh": [ "dtw_threshold_4", "dtw_th4", 0 ],
            "obj-dtw-slot4-toggle": [ "dtw_enable_4", "dtw_en4", 0 ],
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