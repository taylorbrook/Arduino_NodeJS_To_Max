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
        "rect": [ 688.0, 95.0, 573.0, 932.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 941.0, 1130.0, 20.0, 140.0 ],
                    "setminmax": [ 0.0, 360.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 17.0, 59.0, 64.0, 22.0 ],
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
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 632.0, -3.0, 400.0, 220.0 ],
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
                    "patching_rect": [ 350.0, 15.0, 280.0, 27.0 ],
                    "text": "Arduino IMU Serial Bridge"
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 102.5, 59.0, 65.0, 22.0 ],
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
                    "patching_rect": [ 182.5, 59.0, 80.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-msg-listports",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 277.5, 59.0, 68.0, 22.0 ],
                    "text": "listports"
                }
            },
            {
                "box": {
                    "id": "obj-msg-reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.5, 59.0, 50.0, 22.0 ],
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
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 250.0, 120.0, 320.0, 49.0 ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
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
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 15,
                    "numoutlets": 15,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 250.0, 200.0, 620.0, 35.0 ],
                    "text": "route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias cal_toggle smooth_accel smooth_gyro smooth_orientation"
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
                    "patching_rect": [ 60.0, 270.0, 140.0, 21.0 ],
                    "text": "Accelerometer (g)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 60.0, 300.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-ax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 330.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 350.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-ay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 330.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 130.0, 350.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-az",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 330.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 350.0, 64.0, 22.0 ]
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
                    "patching_rect": [ 310.0, 270.0, 130.0, 21.0 ],
                    "text": "Gyroscope (dps)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 310.0, 300.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-gx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 310.0, 330.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 310.0, 350.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-gy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 330.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 380.0, 350.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-gz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 330.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 350.0, 64.0, 22.0 ]
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
                    "patching_rect": [ 597.0, 270.0, 165.0, 21.0 ],
                    "text": "Orientation (degrees)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 597.0, 300.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 597.0, 330.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 597.0, 350.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 667.0, 330.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 667.0, 350.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 737.0, 330.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 737.0, 350.0, 64.0, 22.0 ]
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
                    "patching_rect": [ 573.0, 200.5, 140.0, 21.0 ],
                    "text": "Connection Status"
                }
            },
            {
                "box": {
                    "id": "obj-status-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 494.0, 236.0, 150.0, 22.0 ],
                    "text": "connected"
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
                    "patching_rect": [ 60.0, 420.0, 180.0, 21.0 ],
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
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 450.0, 120.0, 30.0 ],
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
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 60.0, 490.0, 100.0, 22.0 ],
                    "text": "select 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calstart",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 520.0, 90.0, 22.0 ],
                    "text": "calibrate_start"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calstop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 160.0, 520.0, 90.0, 22.0 ],
                    "text": "calibrate_stop"
                }
            },
            {
                "box": {
                    "id": "obj-btn-orient",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 541.0, 452.0, 120.0, 30.0 ],
                    "text": "Reset Orient"
                }
            },
            {
                "box": {
                    "id": "obj-btn-orientrestore",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 671.0, 452.0, 120.0, 30.0 ],
                    "text": "Restore Orient"
                }
            },
            {
                "box": {
                    "id": "obj-msg-orientreset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 541.0, 492.0, 80.0, 22.0 ],
                    "text": "orient_reset"
                }
            },
            {
                "box": {
                    "id": "obj-msg-orientrestore",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 671.0, 492.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 327.0, 420.0, 170.0, 21.0 ],
                    "text": "Calibration Progress"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-progress",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 327.0, 456.0, 100.0, 22.0 ],
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
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 327.0, 486.0, 200.0, 20.0 ],
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
                    "patching_rect": [ 327.0, 520.0, 100.0, 21.0 ],
                    "text": "Cal Status"
                }
            },
            {
                "box": {
                    "id": "obj-cal-status-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 327.0, 546.0, 150.0, 22.0 ],
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
                    "patching_rect": [ 60.0, 560.0, 120.0, 21.0 ],
                    "text": "Bias Offsets"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-bias",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "float", "float" ],
                    "patching_rect": [ 60.0, 586.0, 200.0, 22.0 ],
                    "text": "unpack f f f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-sprintf-bias",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 616.0, 400.0, 22.0 ],
                    "text": "sprintf aX:%.2f aY:%.2f aZ:%.2f gX:%.2f gY:%.2f gZ:%.2f"
                }
            },
            {
                "box": {
                    "id": "obj-bias-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 646.0, 400.0, 22.0 ],
                    "text": "aX:0.05 aY:-0.36 aZ:-0.09 gX:-0.80 gY:-3.73 gZ:-3.60"
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
                    "patching_rect": [ 60.0, 670.0, 150.0, 21.0 ],
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
                    "patching_rect": [ 60.0, 700.0, 140.0, 21.0 ],
                    "text": "Cal Accel (g)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-calaccel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 60.0, 726.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-ax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 776.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-ay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 130.0, 776.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-az",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 776.0, 64.0, 22.0 ]
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
                    "patching_rect": [ 310.0, 700.0, 140.0, 21.0 ],
                    "text": "Cal Gyro (dps)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-calgyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 310.0, 726.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-gx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 310.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 310.0, 776.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-gy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 380.0, 776.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-gz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 776.0, 64.0, 22.0 ]
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
                    "patching_rect": [ 597.0, 700.0, 160.0, 21.0 ],
                    "text": "Cal Orient (deg)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-calorient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 597.0, 726.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 597.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 597.0, 776.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 667.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 667.0, 776.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-cal-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 737.0, 756.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 737.0, 776.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-set-cal-toggle",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 393.0, 45.0, 22.0 ],
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
                    "patching_rect": [ 60.0, 820.0, 300.0, 24.0 ],
                    "text": "=== SMOOTHING ==="
                }
            },
            {
                "box": {
                    "id": "obj-loadbang-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 60.0, 845.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 868.0, 52.0, 22.0 ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-int-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 60.0, 893.0, 29.0, 22.0 ],
                    "text": "f 0."
                }
            },
            {
                "box": {
                    "id": "obj-comment-global-dial",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 905.0, 50.0, 20.0 ],
                    "text": "Global"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-global",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 925.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-accel-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 160.0, 905.0, 80.0, 20.0 ],
                    "text": "Accel Group"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-accel-group",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 160.0, 925.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-ax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 1005.0, 30.0, 20.0 ],
                    "text": "aX"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-ax",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 130.0, 1025.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-ay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 190.0, 1005.0, 30.0, 20.0 ],
                    "text": "aY"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-ay",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 190.0, 1025.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-az",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 1005.0, 30.0, 20.0 ],
                    "text": "aZ"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-az",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 250.0, 1025.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-gyro-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 905.0, 80.0, 20.0 ],
                    "text": "Gyro Group"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-gyro-group",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 400.0, 925.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-gx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 370.0, 1005.0, 30.0, 20.0 ],
                    "text": "gX"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-gx",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 370.0, 1025.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-gy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 1005.0, 30.0, 20.0 ],
                    "text": "gY"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-gy",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 430.0, 1025.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-gz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 490.0, 1005.0, 30.0, 20.0 ],
                    "text": "gZ"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-gz",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 490.0, 1025.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-orient-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 640.0, 905.0, 80.0, 20.0 ],
                    "text": "Orient Group"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-orient-group",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 640.0, 925.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 610.0, 1005.0, 40.0, 20.0 ],
                    "text": "Pitch"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-pitch",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 610.0, 1025.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1005.0, 40.0, 20.0 ],
                    "text": "Roll"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-roll",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 670.0, 1025.0, 40.0, 40.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-dial-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 730.0, 1005.0, 40.0, 20.0 ],
                    "text": "Yaw"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-dial-yaw",
                    "maxclass": "dial",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 730.0, 1029.0, 40.0, 40.0 ],
                    "size": 1.0
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
                    "patching_rect": [ 60.0, 1165.0, 200.0, 21.0 ],
                    "text": "Smoothed Output"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1240.0, 77.0, 22.0 ],
                    "text": "s smooth_ax"
                }
            },
            {
                "box": {
                    "id": "obj-comment-say",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 190.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 190.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 190.0, 1240.0, 77.0, 22.0 ],
                    "text": "s smooth_ay"
                }
            },
            {
                "box": {
                    "id": "obj-comment-saz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 1240.0, 77.0, 22.0 ],
                    "text": "s smooth_az"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sgx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 370.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 370.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-gx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 370.0, 1240.0, 77.0, 22.0 ],
                    "text": "s smooth_gx"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sgy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 430.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-gy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 430.0, 1240.0, 77.0, 22.0 ],
                    "text": "s smooth_gy"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sgz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 490.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 490.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-gz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 490.0, 1240.0, 77.0, 22.0 ],
                    "text": "s smooth_gz"
                }
            },
            {
                "box": {
                    "id": "obj-comment-spitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 610.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 610.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 610.0, 1240.0, 89.0, 22.0 ],
                    "text": "s smooth_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-comment-sroll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 670.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 670.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 710.0, 1240.0, 80.0, 22.0 ],
                    "text": "s smooth_roll"
                }
            },
            {
                "box": {
                    "id": "obj-comment-syaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 730.0, 1190.0, 40.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 730.0, 1210.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-send-smooth-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 809.0, 1240.0, 85.0, 22.0 ],
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
                    "patching_rect": [ 60.0, 1280.0, 300.0, 24.0 ],
                    "text": "=== QUATERNION ==="
                }
            },
            {
                "box": {
                    "id": "obj-pack-euler-raw",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 1309.0, 100.0, 22.0 ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-euler2quat-raw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "list", "" ],
                    "patching_rect": [ 60.0, 1339.0, 100.0, 22.0 ],
                    "text": "jit.euler2quat"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-quat-raw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "float", "float", "float" ],
                    "patching_rect": [ 60.0, 1380.0, 180.0, 22.0 ],
                    "text": "unpack f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-comment-qx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1410.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 1430.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-qy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 1410.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 130.0, 1430.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-qz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 1410.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 1430.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-comment-qw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 270.0, 1410.0, 30.0, 20.0 ],
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
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 270.0, 1430.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-r-smooth-pitch",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 451.5, 1281.0, 87.0, 22.0 ],
                    "text": "r smooth_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-r-smooth-roll",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 551.5, 1281.0, 80.0, 22.0 ],
                    "text": "r smooth_roll"
                }
            },
            {
                "box": {
                    "id": "obj-r-smooth-yaw",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 651.5, 1281.0, 83.0, 22.0 ],
                    "text": "r smooth_yaw"
                }
            },
            {
                "box": {
                    "id": "obj-pack-euler-smooth",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 451.5, 1311.0, 100.0, 22.0 ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-euler2quat-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "list", "" ],
                    "patching_rect": [ 451.5, 1341.0, 100.0, 22.0 ],
                    "text": "jit.euler2quat"
                }
            },
            {
                "box": {
                    "id": "obj-send-quat-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 1380.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 450.0, 1405.0, 200.0, 19.0 ],
                    "text": "Smoothed Quat (for 3D viz)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-comment-mapping-banner",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1460.0, 300.0, 24.0 ],
                    "text": "=== RANGE MAPPING ==="
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1490.0, 120.0, 19.0 ],
                    "text": "--- Pitch Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-pitch",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 1515.0, 90.0, 22.0 ],
                    "text": "r smooth_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 571.0, 196.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Pitch value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale 0. 90. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale 0. 90. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain 0. 90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 93.0, 22.0 ],
                                    "text": "s mapped_pitch"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Pitch output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 60.0, 1545.0, 120.0, 22.0 ],
                    "text": "p map_pitch"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-pitch",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 1575.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 340.0, 1490.0, 120.0, 19.0 ],
                    "text": "--- Roll Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-roll",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 340.0, 1515.0, 90.0, 22.0 ],
                    "text": "r smooth_roll"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 100.0, 100.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Roll value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale 0. 90. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale 0. 90. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain 0. 90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 90.0, 22.0 ],
                                    "text": "s mapped_roll"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Roll output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 340.0, 1545.0, 120.0, 22.0 ],
                    "text": "p map_roll"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-roll",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 340.0, 1575.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 1490.0, 120.0, 19.0 ],
                    "text": "--- Yaw Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-yaw",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 1515.0, 90.0, 22.0 ],
                    "text": "r smooth_yaw"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 100.0, 100.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Yaw value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale 0. 90. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale 0. 90. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain 0. 90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 90.0, 22.0 ],
                                    "text": "s mapped_yaw"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Yaw output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 620.0, 1545.0, 120.0, 22.0 ],
                    "text": "p map_yaw"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-yaw",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 620.0, 1575.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-accel-map-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1620.0, 200.0, 21.0 ],
                    "text": "Accelerometer Mapping"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-ax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1645.0, 124.0, 19.0 ],
                    "text": "--- Accel X Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-ax",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 1670.0, 80.0, 22.0 ],
                    "text": "r smooth_ax"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 100.0, 100.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Accel X value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "-2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale -2. 2. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale -2. 2. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain -2. 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 90.0, 22.0 ],
                                    "text": "s mapped_ax"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Accel X output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 60.0, 1700.0, 120.0, 22.0 ],
                    "text": "p map_ax"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-ax",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 1730.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-ay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 340.0, 1645.0, 124.0, 19.0 ],
                    "text": "--- Accel Y Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-ay",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 340.0, 1670.0, 80.0, 22.0 ],
                    "text": "r smooth_ay"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 100.0, 100.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Accel Y value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "-2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale -2. 2. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale -2. 2. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain -2. 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 90.0, 22.0 ],
                                    "text": "s mapped_ay"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Accel Y output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 340.0, 1700.0, 120.0, 22.0 ],
                    "text": "p map_ay"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-ay",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 340.0, 1730.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-az",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 1645.0, 124.0, 19.0 ],
                    "text": "--- Accel Z Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-az",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 1670.0, 80.0, 22.0 ],
                    "text": "r smooth_az"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 100.0, 100.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Accel Z value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "-2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale -2. 2. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale -2. 2. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain -2. 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 90.0, 22.0 ],
                                    "text": "s mapped_az"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Accel Z output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 620.0, 1700.0, 120.0, 22.0 ],
                    "text": "p map_az"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-az",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 620.0, 1730.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "obj-comment-gyro-map-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1780.0, 200.0, 21.0 ],
                    "text": "Gyroscope Mapping"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-gx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1805.0, 121.0, 19.0 ],
                    "text": "--- Gyro X Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-gx",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 1830.0, 80.0, 22.0 ],
                    "text": "r smooth_gx"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-gx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 100.0, 100.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Gyro X value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "-250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale -250. 250. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale -250. 250. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain -250. 250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 90.0, 22.0 ],
                                    "text": "s mapped_gx"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Gyro X output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 60.0, 1860.0, 120.0, 22.0 ],
                    "text": "p map_gx"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-gx",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 1890.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-gy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 340.0, 1805.0, 121.0, 19.0 ],
                    "text": "--- Gyro Y Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-gy",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 340.0, 1830.0, 80.0, 22.0 ],
                    "text": "r smooth_gy"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-gy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 100.0, 100.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Gyro Y value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "-250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale -250. 250. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale -250. 250. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain -250. 250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 90.0, 22.0 ],
                                    "text": "s mapped_gy"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Gyro Y output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 340.0, 1860.0, 120.0, 22.0 ],
                    "text": "p map_gy"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-gy",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 340.0, 1890.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-map-gz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 1805.0, 120.0, 19.0 ],
                    "text": "--- Gyro Z Mapping ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-map-gz",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 1830.0, 80.0, 22.0 ],
                    "text": "r smooth_gz"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-gz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 100.0, 100.0, 850.0, 750.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed Gyro Z value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-learn-btn",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 60.0, 80.0, 25.0 ],
                                    "text": "Learn",
                                    "texton": "Stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 30.0, 90.0, 80.0, 22.0 ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 40.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 90.0, 45.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 130.0, 110.0, 65.0, 22.0 ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 220.0, 110.0, 60.0, 22.0 ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 220.0, 142.0, 50.0, 20.0 ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-inmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 130.0, 142.0, 55.0, 20.0 ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 130.0, 160.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 550.0, 20.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 40.0, 22.0 ],
                                    "text": "-250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 50.0, 40.0, 22.0 ],
                                    "text": "250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.0, 50.0, 30.0, 22.0 ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 690.0, 50.0, 30.0, 22.0 ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 202.0, 80.0, 20.0 ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-umenu-curve",
                                    "items": [ "Linear", "Exponential", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 220.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 250.0, 32.0, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 170.0, 270.0, 200.0, 22.0 ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 310.0, 200.0, 22.0 ],
                                    "text": "scale -250. 250. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 355.0, 200.0, 22.0 ],
                                    "text": "scale -250. 250. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 330.0, 60.0, 20.0 ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 400.0, 352.0, 55.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 730.0, 50.0, 30.0, 22.0 ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-function",
                                    "maxclass": "function",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "float", "", "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 470.0, 310.0, 200.0, 100.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setdomain",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 280.0, 120.0, 22.0 ],
                                    "text": "domain -250. 250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 280.0, 120.0, 22.0 ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 420.0, 30.0, 22.0 ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmin",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 462.0, 55.0, 20.0 ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-outmax",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 462.0, 60.0, 20.0 ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 100.0, 480.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip-toggle",
                                    "maxclass": "textbutton",
                                    "mode": 1,
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 530.0, 70.0, 25.0 ],
                                    "text": "Clip Off",
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 570.0, 100.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 600.0, 100.0, 22.0 ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 300.0, 530.0, 33.0, 22.0 ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-comment-mapped",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 602.0, 80.0, 20.0 ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 620.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-send-mapped",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 660.0, 90.0, 22.0 ],
                                    "text": "s mapped_gz"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Mapped Gyro Z output",
                                    "id": "obj-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 700.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 255.0, 120.0, 22.0 ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 80.0, 20.0, 22.0 ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 0 ],
                                    "order": 1,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-not-clip", 0 ],
                                    "order": 0,
                                    "source": [ "obj-clip-toggle", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-umenu-curve", 0 ],
                                    "source": [ "obj-default-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-exp", 0 ],
                                    "source": [ "obj-default-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-default-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-default-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmax", 0 ],
                                    "source": [ "obj-default-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-outmin", 0 ],
                                    "source": [ "obj-default-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 5 ],
                                    "source": [ "obj-flonum-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 2 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 2 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setdomain", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 1 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 1 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-inmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-outlet", 0 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-send-mapped", 0 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-mapped", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 2 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 2 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 4 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 4 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmax", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 1 ],
                                    "order": 3,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pak-setrange", 1 ],
                                    "order": 0,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 3 ],
                                    "order": 1,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 3 ],
                                    "order": 2,
                                    "source": [ "obj-flonum-outmin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-function", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-mapped", 0 ],
                                    "source": [ "obj-gate-clip-off", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-clip", 0 ],
                                    "source": [ "obj-gate-clip-on", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-gate-curve", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-exp", 0 ],
                                    "source": [ "obj-gate-curve", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-scale-linear", 0 ],
                                    "source": [ "obj-gate-curve", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-gate-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 1 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 1 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-learn", 0 ],
                                    "source": [ "obj-learn-btn", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-learn", 0 ],
                                    "source": [ "obj-learn-btn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-curve", 0 ],
                                    "order": 5,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-exp", 0 ],
                                    "order": 0,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmax", 0 ],
                                    "order": 4,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-inmin", 0 ],
                                    "order": 6,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmax", 0 ],
                                    "order": 1,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-outmin", 0 ],
                                    "order": 2,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setdomain", 0 ],
                                    "order": 7,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-setrange", 0 ],
                                    "order": 3,
                                    "source": [ "obj-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmax", 0 ],
                                    "source": [ "obj-maximum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 1 ],
                                    "order": 0,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-on", 1 ],
                                    "order": 1,
                                    "source": [ "obj-merge", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-flonum-inmin", 0 ],
                                    "source": [ "obj-minimum", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-maximum", 0 ],
                                    "order": 1,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-minimum", 0 ],
                                    "order": 0,
                                    "source": [ "obj-msg-clear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-msg-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-clip-off", 0 ],
                                    "source": [ "obj-not-clip", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setdomain", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-function", 0 ],
                                    "source": [ "obj-pak-setrange", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gate-curve", 0 ],
                                    "source": [ "obj-plus1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-exp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-merge", 0 ],
                                    "source": [ "obj-scale-linear", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-clear", 0 ],
                                    "source": [ "obj-sel-learn", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-plus1", 0 ],
                                    "source": [ "obj-umenu-curve", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 620.0, 1860.0, 120.0, 22.0 ],
                    "text": "p map_gz"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-flonum-map-gz",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 620.0, 1890.0, 64.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-comment-thresh-banner",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1940.0, 300.0, 24.0 ],
                    "text": "=== THRESHOLDS ==="
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-comment-thresh-orient-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1975.0, 200.0, 20.0 ],
                    "text": "Orientation Thresholds"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-thresh-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1995.0, 150.0, 19.0 ],
                    "text": "--- Pitch Thresholds ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-thresh-pitch",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 2020.0, 100.0, 22.0 ],
                    "text": "r smooth_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-p-thresh-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
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
                        "rect": [ 694.0, 164.0, 850.0, 500.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed pitch value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 1"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 100.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 95.0, 50.0, 22.0 ],
                                    "text": "30."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 70.0, 80.0, 18.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 230.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 95.0, 40.0, 22.0 ],
                                    "text": "5."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 130.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 130.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 30.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 130.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 30.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 130.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t1",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 230.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 430.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 2"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 430.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 500.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 500.0, 95.0, 50.0, 22.0 ],
                                    "text": "60."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 570.0, 70.0, 80.0, 18.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 570.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 630.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 630.0, 95.0, 40.0, 22.0 ],
                                    "text": "5."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 570.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 430.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 530.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 430.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 530.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 430.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 530.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 430.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 530.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t2",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 630.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 430.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 530.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t1", 0 ],
                                    "source": [ "obj-change-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t2", 0 ],
                                    "source": [ "obj-change-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t1", 0 ],
                                    "source": [ "obj-change-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t2", 0 ],
                                    "source": [ "obj-change-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t1", 0 ],
                                    "source": [ "obj-default-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t2", 0 ],
                                    "source": [ "obj-default-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t1", 0 ],
                                    "source": [ "obj-default-thresh-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t2", 0 ],
                                    "source": [ "obj-default-thresh-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t1", 0 ],
                                    "source": [ "obj-gt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t2", 0 ],
                                    "source": [ "obj-gt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t1", 0 ],
                                    "source": [ "obj-hyst-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t2", 0 ],
                                    "source": [ "obj-hyst-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 0 ],
                                    "order": 3,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 0 ],
                                    "order": 2,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t1", 0 ],
                                    "source": [ "obj-loadbang-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t2", 0 ],
                                    "source": [ "obj-loadbang-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t1", 0 ],
                                    "source": [ "obj-loadbang-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t2", 0 ],
                                    "source": [ "obj-loadbang-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 1 ],
                                    "source": [ "obj-lower-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 1 ],
                                    "source": [ "obj-lower-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t1", 0 ],
                                    "source": [ "obj-lt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t2", 0 ],
                                    "source": [ "obj-lt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 1 ],
                                    "source": [ "obj-upper-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 1 ],
                                    "source": [ "obj-upper-t2", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 60.0, 2050.0, 130.0, 22.0 ],
                    "text": "p thresh_pitch"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-thresh-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 1995.0, 150.0, 19.0 ],
                    "text": "--- Roll Thresholds ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-thresh-roll",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 2020.0, 100.0, 22.0 ],
                    "text": "r smooth_roll"
                }
            },
            {
                "box": {
                    "id": "obj-p-thresh-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
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
                        "rect": [ 100.0, 100.0, 850.0, 500.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed roll value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 1"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 100.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 95.0, 50.0, 22.0 ],
                                    "text": "30."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 230.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 95.0, 40.0, 22.0 ],
                                    "text": "5."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 130.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 130.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 30.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 130.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 30.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 130.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t1",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 230.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 430.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 2"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 430.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 500.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 500.0, 95.0, 50.0, 22.0 ],
                                    "text": "60."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 570.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 570.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 630.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 630.0, 95.0, 40.0, 22.0 ],
                                    "text": "5."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 570.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 430.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 530.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 430.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 530.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 430.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 530.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 430.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 530.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t2",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 630.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 430.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 530.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t1", 0 ],
                                    "source": [ "obj-change-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t2", 0 ],
                                    "source": [ "obj-change-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t1", 0 ],
                                    "source": [ "obj-change-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t2", 0 ],
                                    "source": [ "obj-change-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t1", 0 ],
                                    "source": [ "obj-default-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t2", 0 ],
                                    "source": [ "obj-default-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t1", 0 ],
                                    "source": [ "obj-default-thresh-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t2", 0 ],
                                    "source": [ "obj-default-thresh-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t1", 0 ],
                                    "source": [ "obj-gt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t2", 0 ],
                                    "source": [ "obj-gt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t1", 0 ],
                                    "source": [ "obj-hyst-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t2", 0 ],
                                    "source": [ "obj-hyst-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 0 ],
                                    "order": 3,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 0 ],
                                    "order": 2,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t1", 0 ],
                                    "source": [ "obj-loadbang-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t2", 0 ],
                                    "source": [ "obj-loadbang-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t1", 0 ],
                                    "source": [ "obj-loadbang-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t2", 0 ],
                                    "source": [ "obj-loadbang-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 1 ],
                                    "source": [ "obj-lower-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 1 ],
                                    "source": [ "obj-lower-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t1", 0 ],
                                    "source": [ "obj-lt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t2", 0 ],
                                    "source": [ "obj-lt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 1 ],
                                    "source": [ "obj-upper-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 1 ],
                                    "source": [ "obj-upper-t2", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 260.0, 2050.0, 130.0, 22.0 ],
                    "text": "p thresh_roll"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-thresh-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 460.0, 1995.0, 150.0, 19.0 ],
                    "text": "--- Yaw Thresholds ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-thresh-yaw",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 460.0, 2020.0, 100.0, 22.0 ],
                    "text": "r smooth_yaw"
                }
            },
            {
                "box": {
                    "id": "obj-p-thresh-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
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
                        "rect": [ 100.0, 100.0, 850.0, 500.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed yaw value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 1"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 100.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 95.0, 50.0, 22.0 ],
                                    "text": "30."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 230.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 95.0, 40.0, 22.0 ],
                                    "text": "5."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 130.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 130.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 30.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 130.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 30.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 130.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t1",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 230.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 430.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 2"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 430.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 500.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 500.0, 95.0, 50.0, 22.0 ],
                                    "text": "60."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 570.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 570.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 630.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 630.0, 95.0, 40.0, 22.0 ],
                                    "text": "5."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 570.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 430.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 530.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 430.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 530.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 430.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 530.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 430.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 530.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t2",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 630.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 430.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 530.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t1", 0 ],
                                    "source": [ "obj-change-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t2", 0 ],
                                    "source": [ "obj-change-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t1", 0 ],
                                    "source": [ "obj-change-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t2", 0 ],
                                    "source": [ "obj-change-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t1", 0 ],
                                    "source": [ "obj-default-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t2", 0 ],
                                    "source": [ "obj-default-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t1", 0 ],
                                    "source": [ "obj-default-thresh-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t2", 0 ],
                                    "source": [ "obj-default-thresh-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t1", 0 ],
                                    "source": [ "obj-gt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t2", 0 ],
                                    "source": [ "obj-gt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t1", 0 ],
                                    "source": [ "obj-hyst-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t2", 0 ],
                                    "source": [ "obj-hyst-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 0 ],
                                    "order": 3,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 0 ],
                                    "order": 2,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t1", 0 ],
                                    "source": [ "obj-loadbang-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t2", 0 ],
                                    "source": [ "obj-loadbang-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t1", 0 ],
                                    "source": [ "obj-loadbang-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t2", 0 ],
                                    "source": [ "obj-loadbang-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 1 ],
                                    "source": [ "obj-lower-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 1 ],
                                    "source": [ "obj-lower-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t1", 0 ],
                                    "source": [ "obj-lt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t2", 0 ],
                                    "source": [ "obj-lt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 1 ],
                                    "source": [ "obj-upper-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 1 ],
                                    "source": [ "obj-upper-t2", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 460.0, 2050.0, 130.0, 22.0 ],
                    "text": "p thresh_yaw"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-comment-thresh-accel-group",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 2095.0, 200.0, 20.0 ],
                    "text": "Accelerometer Thresholds"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-thresh-ax",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 2115.0, 150.0, 19.0 ],
                    "text": "--- ax Thresholds ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-thresh-ax",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 2140.0, 100.0, 22.0 ],
                    "text": "r smooth_ax"
                }
            },
            {
                "box": {
                    "id": "obj-p-thresh-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
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
                        "rect": [ 100.0, 100.0, 850.0, 500.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed ax value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 1"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 100.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 95.0, 50.0, 22.0 ],
                                    "text": "0.5"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 230.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 95.0, 40.0, 22.0 ],
                                    "text": "0.2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 130.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 130.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 30.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 130.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 30.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 130.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t1",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 230.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 430.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 2"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 430.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 500.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 500.0, 95.0, 50.0, 22.0 ],
                                    "text": "1.5"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 570.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 570.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 630.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 630.0, 95.0, 40.0, 22.0 ],
                                    "text": "0.2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 570.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 430.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 530.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 430.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 530.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 430.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 530.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 430.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 530.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t2",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 630.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 430.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 530.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t1", 0 ],
                                    "source": [ "obj-change-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t2", 0 ],
                                    "source": [ "obj-change-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t1", 0 ],
                                    "source": [ "obj-change-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t2", 0 ],
                                    "source": [ "obj-change-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t1", 0 ],
                                    "source": [ "obj-default-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t2", 0 ],
                                    "source": [ "obj-default-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t1", 0 ],
                                    "source": [ "obj-default-thresh-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t2", 0 ],
                                    "source": [ "obj-default-thresh-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t1", 0 ],
                                    "source": [ "obj-gt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t2", 0 ],
                                    "source": [ "obj-gt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t1", 0 ],
                                    "source": [ "obj-hyst-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t2", 0 ],
                                    "source": [ "obj-hyst-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 0 ],
                                    "order": 3,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 0 ],
                                    "order": 2,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t1", 0 ],
                                    "source": [ "obj-loadbang-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t2", 0 ],
                                    "source": [ "obj-loadbang-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t1", 0 ],
                                    "source": [ "obj-loadbang-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t2", 0 ],
                                    "source": [ "obj-loadbang-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 1 ],
                                    "source": [ "obj-lower-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 1 ],
                                    "source": [ "obj-lower-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t1", 0 ],
                                    "source": [ "obj-lt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t2", 0 ],
                                    "source": [ "obj-lt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 1 ],
                                    "source": [ "obj-upper-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 1 ],
                                    "source": [ "obj-upper-t2", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 60.0, 2170.0, 130.0, 22.0 ],
                    "text": "p thresh_ax"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-thresh-ay",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 2115.0, 150.0, 19.0 ],
                    "text": "--- ay Thresholds ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-thresh-ay",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 2140.0, 100.0, 22.0 ],
                    "text": "r smooth_ay"
                }
            },
            {
                "box": {
                    "id": "obj-p-thresh-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
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
                        "rect": [ 100.0, 100.0, 850.0, 500.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed ay value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 1"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 100.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 95.0, 50.0, 22.0 ],
                                    "text": "0.5"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 230.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 95.0, 40.0, 22.0 ],
                                    "text": "0.2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 130.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 130.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 30.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 130.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 30.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 130.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t1",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 230.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 430.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 2"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 430.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 500.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 500.0, 95.0, 50.0, 22.0 ],
                                    "text": "1.5"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 570.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 570.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 630.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 630.0, 95.0, 40.0, 22.0 ],
                                    "text": "0.2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 570.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 430.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 530.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 430.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 530.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 430.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 530.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 430.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 530.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t2",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 630.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 430.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 530.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t1", 0 ],
                                    "source": [ "obj-change-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t2", 0 ],
                                    "source": [ "obj-change-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t1", 0 ],
                                    "source": [ "obj-change-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t2", 0 ],
                                    "source": [ "obj-change-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t1", 0 ],
                                    "source": [ "obj-default-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t2", 0 ],
                                    "source": [ "obj-default-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t1", 0 ],
                                    "source": [ "obj-default-thresh-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t2", 0 ],
                                    "source": [ "obj-default-thresh-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t1", 0 ],
                                    "source": [ "obj-gt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t2", 0 ],
                                    "source": [ "obj-gt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t1", 0 ],
                                    "source": [ "obj-hyst-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t2", 0 ],
                                    "source": [ "obj-hyst-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 0 ],
                                    "order": 3,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 0 ],
                                    "order": 2,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t1", 0 ],
                                    "source": [ "obj-loadbang-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t2", 0 ],
                                    "source": [ "obj-loadbang-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t1", 0 ],
                                    "source": [ "obj-loadbang-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t2", 0 ],
                                    "source": [ "obj-loadbang-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 1 ],
                                    "source": [ "obj-lower-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 1 ],
                                    "source": [ "obj-lower-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t1", 0 ],
                                    "source": [ "obj-lt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t2", 0 ],
                                    "source": [ "obj-lt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 1 ],
                                    "source": [ "obj-upper-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 1 ],
                                    "source": [ "obj-upper-t2", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 260.0, 2170.0, 130.0, 22.0 ],
                    "text": "p thresh_ay"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-comment-thresh-az",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 460.0, 2115.0, 150.0, 19.0 ],
                    "text": "--- az Thresholds ---"
                }
            },
            {
                "box": {
                    "id": "obj-r-thresh-az",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 460.0, 2140.0, 100.0, 22.0 ],
                    "text": "r smooth_az"
                }
            },
            {
                "box": {
                    "id": "obj-p-thresh-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
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
                        "rect": [ 100.0, 100.0, 850.0, 500.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "Smoothed az value",
                                    "id": "obj-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 1"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 30.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 100.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 95.0, 50.0, 22.0 ],
                                    "text": "0.5"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t1",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 170.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 230.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 95.0, 40.0, 22.0 ],
                                    "text": "0.2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 170.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 30.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 130.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 130.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 30.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 130.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 30.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 130.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t1",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 230.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t1",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 11.0,
                                    "id": "obj-label-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 430.0, 70.0, 150.0, 19.0 ],
                                    "text": "Threshold 2"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-thresh-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 430.0, 95.0, 64.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 500.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-thresh-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 500.0, 95.0, 50.0, 22.0 ],
                                    "text": "1.5"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 10.0,
                                    "id": "obj-label-hyst-t2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 570.0, 70.0, 80.0, 19.0 ],
                                    "text": "Hysteresis"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-hyst-val-t2",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 570.0, 95.0, 54.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-hyst-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 630.0, 75.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-default-hyst-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 630.0, 95.0, 40.0, 22.0 ],
                                    "text": "0.2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-div2-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 570.0, 125.0, 40.0, 22.0 ],
                                    "text": "/ 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-upper-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 430.0, 155.0, 40.0, 22.0 ],
                                    "text": "+ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lower-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 530.0, 155.0, 40.0, 22.0 ],
                                    "text": "- 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 430.0, 185.0, 40.0, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lt-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 530.0, 185.0, 40.0, 22.0 ],
                                    "text": "< 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 430.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-change-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "int", "int" ],
                                    "patching_rect": [ 530.0, 215.0, 55.0, 22.0 ],
                                    "text": "change"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-up-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 430.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sel-dn-t2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 530.0, 245.0, 55.0, 22.0 ],
                                    "text": "select 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-btn-flash-t2",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 630.0, 245.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-up-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 430.0, 280.0, 35.0, 22.0 ],
                                    "text": "up"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-dn-t2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 530.0, 280.0, 42.0, 22.0 ],
                                    "text": "down"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t1", 0 ],
                                    "source": [ "obj-change-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-dn-t2", 0 ],
                                    "source": [ "obj-change-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t1", 0 ],
                                    "source": [ "obj-change-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sel-up-t2", 0 ],
                                    "source": [ "obj-change-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t1", 0 ],
                                    "source": [ "obj-default-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-hyst-val-t2", 0 ],
                                    "source": [ "obj-default-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t1", 0 ],
                                    "source": [ "obj-default-thresh-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-thresh-val-t2", 0 ],
                                    "source": [ "obj-default-thresh-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 1 ],
                                    "order": 0,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 1 ],
                                    "order": 1,
                                    "source": [ "obj-div2-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t1", 0 ],
                                    "source": [ "obj-gt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-up-t2", 0 ],
                                    "source": [ "obj-gt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t1", 0 ],
                                    "source": [ "obj-hyst-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-div2-t2", 0 ],
                                    "source": [ "obj-hyst-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 0 ],
                                    "order": 3,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 0 ],
                                    "order": 2,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t1", 0 ],
                                    "source": [ "obj-loadbang-hyst-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-hyst-t2", 0 ],
                                    "source": [ "obj-loadbang-hyst-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t1", 0 ],
                                    "source": [ "obj-loadbang-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-default-thresh-t2", 0 ],
                                    "source": [ "obj-loadbang-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t1", 1 ],
                                    "source": [ "obj-lower-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lt-t2", 1 ],
                                    "source": [ "obj-lower-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t1", 0 ],
                                    "source": [ "obj-lt-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-change-dn-t2", 0 ],
                                    "source": [ "obj-lt-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-dn-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-dn-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-btn-flash-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-up-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-sel-up-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-lower-t2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-upper-t2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-thresh-val-t2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t1", 1 ],
                                    "source": [ "obj-upper-t1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-gt-t2", 1 ],
                                    "source": [ "obj-upper-t2", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 460.0, 2170.0, 130.0, 22.0 ],
                    "text": "p thresh_az"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-comment-3dviz-banner",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 2220.0, 300.0, 24.0 ],
                    "text": "=== 3D VISUALIZATION ==="
                }
            },
            {
                "box": {
                    "id": "obj-btn-3dviz",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 2255.0, 100.0, 30.0 ],
                    "text": "Show 3D",
                    "texton": "Hide 3D"
                }
            },
            {
                "box": {
                    "id": "obj-sel-3dviz",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 60.0, 2295.0, 80.0, 22.0 ],
                    "text": "select 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-msg-3dopen",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 2325.0, 40.0, 22.0 ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "id": "obj-msg-3dclose",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 2325.0, 40.0, 22.0 ],
                    "text": "close"
                }
            },
            {
                "box": {
                    "id": "obj-pcontrol-3d",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 2355.0, 60.0, 22.0 ],
                    "text": "pcontrol"
                }
            },
            {
                "box": {
                    "id": "obj-p-3dviz",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 100.0, 100.0, 650.0, 600.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-r-viz-pitch",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 30.0, 90.0, 22.0 ],
                                    "text": "r smooth_pitch"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-r-viz-roll",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 30.0, 85.0, 22.0 ],
                                    "text": "r smooth_roll"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-r-viz-yaw",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 30.0, 85.0, 22.0 ],
                                    "text": "r smooth_yaw"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pack-rot",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 70.0, 80.0, 22.0 ],
                                    "text": "pack 0. 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-prepend-rot",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 115.0, 22.0 ],
                                    "text": "prepend rotatexyz"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-t-rot",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 30.0, 150.0, 40.0, 22.0 ],
                                    "text": "t l l"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-cone",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 30.0, 200.0, 500.0, 22.0 ],
                                    "text": "jit.gl.gridshape myworld @shape cone @lighting_enable 1 @scale 0.3 0.3 0.5 @position 0. 0.5 0. @color 1. 0.3 0.2 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-cylinder",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 30.0, 240.0, 530.0, 22.0 ],
                                    "text": "jit.gl.gridshape myworld @shape cylinder @lighting_enable 1 @scale 0.15 0.15 0.7 @position 0. -0.1 0. @color 0.3 0.6 1. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ground",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 30.0, 290.0, 560.0, 22.0 ],
                                    "text": "jit.gl.gridshape myworld @shape plane @lighting_enable 1 @position 0. -1.2 0. @rotatexyz 90. 0. 0. @scale 3. 3. 1. @color 0.3 0.3 0.3 1. @poly_mode 1 1 @dim 10 10"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-sketch",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 30.0, 370.0, 220.0, 22.0 ],
                                    "text": "jit.gl.sketch myworld @lighting_enable 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-axes",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 30.0, 330.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-axes",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 330.0, 400.0, 35.0 ],
                                    "text": "reset, glcolor 1 0 0 1, moveto 0 0 0, lineto 2 0 0, glcolor 0 1 0 1, moveto 0 0 0, lineto 0 2 0, glcolor 0 0 1 1, moveto 0 0 0, lineto 0 0 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-camera",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "jit_gl_texture", "" ],
                                    "patching_rect": [ 30.0, 420.0, 310.0, 22.0 ],
                                    "text": "jit.gl.camera myworld @position 3. 2.5 3. @lookat 0. 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-world",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "jit_matrix", "bang", "" ],
                                    "patching_rect": [ 30.0, 500.0, 420.0, 22.0 ],
                                    "text": "jit.world myworld @enable 0 @fps 30 @size 400 400 @floating 1 @erase_color 0.15 0.15 0.15 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loadbang-enable",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 30.0, 450.0, 60.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-int-enable",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 30.0, 475.0, 30.0, 22.0 ],
                                    "text": "i 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-closebang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 200.0, 450.0, 65.0, 22.0 ],
                                    "text": "closebang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-int-disable",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 200.0, 475.0, 30.0, 22.0 ],
                                    "text": "i 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-msg-enable",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 475.0, 65.0, 22.0 ],
                                    "text": "enable $1"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-int-disable", 0 ],
                                    "source": [ "obj-closebang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-enable", 0 ],
                                    "source": [ "obj-int-disable", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-enable", 0 ],
                                    "source": [ "obj-int-enable", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-msg-axes", 0 ],
                                    "source": [ "obj-loadbang-axes", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-int-enable", 0 ],
                                    "source": [ "obj-loadbang-enable", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-sketch", 0 ],
                                    "source": [ "obj-msg-axes", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-world", 0 ],
                                    "source": [ "obj-msg-enable", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-prepend-rot", 0 ],
                                    "source": [ "obj-pack-rot", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-t-rot", 0 ],
                                    "source": [ "obj-prepend-rot", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pack-rot", 0 ],
                                    "source": [ "obj-r-viz-pitch", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pack-rot", 1 ],
                                    "source": [ "obj-r-viz-roll", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pack-rot", 2 ],
                                    "source": [ "obj-r-viz-yaw", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-cone", 0 ],
                                    "source": [ "obj-t-rot", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-cylinder", 0 ],
                                    "source": [ "obj-t-rot", 1 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 60.0, 2385.0, 120.0, 22.0 ],
                    "text": "p 3d_viz"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-smoothaccel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 60.0, 1130.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-smoothgyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 370.0, 1130.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-smoothorient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 610.0, 1130.0, 140.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-global",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 970.0, 145.0, 22.0 ],
                    "text": "prepend smooth_global"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-accel-group",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 160.0, 970.0, 167.0, 22.0 ],
                    "text": "prepend smooth_accel_group"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-gyro-group",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 970.0, 163.0, 22.0 ],
                    "text": "prepend smooth_gyro_group"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-orient-group",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640.0, 970.0, 169.0, 22.0 ],
                    "text": "prepend smooth_orient_group"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 130.0, 970.0, 115.0, 22.0 ],
                    "text": "prepend smooth_ax"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 970.0, 115.0, 22.0 ],
                    "text": "prepend smooth_ay"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 250.0, 970.0, 115.0, 22.0 ],
                    "text": "prepend smooth_az"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-gx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 370.0, 970.0, 115.0, 22.0 ],
                    "text": "prepend smooth_gx"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-gy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 970.0, 115.0, 22.0 ],
                    "text": "prepend smooth_gy"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-gz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 490.0, 970.0, 115.0, 22.0 ],
                    "text": "prepend smooth_gz"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 610.0, 970.0, 127.0, 22.0 ],
                    "text": "prepend smooth_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 670.0, 970.0, 120.0, 22.0 ],
                    "text": "prepend smooth_roll"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 730.0, 970.0, 123.0, 22.0 ],
                    "text": "prepend smooth_yaw"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 26.5, 105.0, 259.5, 105.0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-3dviz", 0 ],
                    "midpoints": [ 150.5, 2286.0, 72.0, 2286.0, 72.0, 2292.0, 69.5, 2292.0 ],
                    "source": [ "obj-btn-3dviz", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-cal", 0 ],
                    "midpoints": [ 69.5, 483.0, 69.5, 483.0 ],
                    "source": [ "obj-btn-calibrate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-orientreset", 0 ],
                    "midpoints": [ 550.5, 483.0, 550.5, 483.0 ],
                    "source": [ "obj-btn-orient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-orientrestore", 0 ],
                    "midpoints": [ 680.5, 483.0, 680.5, 483.0 ],
                    "source": [ "obj-btn-orientrestore", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-accel-group", 0 ],
                    "midpoints": [ 169.5, 966.0, 169.5, 966.0 ],
                    "source": [ "obj-dial-accel-group", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-ax", 0 ],
                    "midpoints": [ 139.5, 1068.0, 57.0, 1068.0, 57.0, 966.0, 139.5, 966.0 ],
                    "source": [ "obj-dial-ax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-ay", 0 ],
                    "midpoints": [ 199.5, 1077.0, 357.0, 1077.0, 357.0, 993.0, 366.0, 993.0, 366.0, 957.0, 201.0, 957.0, 201.0, 966.0, 199.5, 966.0 ],
                    "source": [ "obj-dial-ay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-az", 0 ],
                    "midpoints": [ 259.5, 1077.0, 357.0, 1077.0, 357.0, 993.0, 366.0, 993.0, 366.0, 957.0, 259.5, 957.0 ],
                    "source": [ "obj-dial-az", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-global", 0 ],
                    "midpoints": [ 69.5, 966.0, 69.5, 966.0 ],
                    "source": [ "obj-dial-global", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-gx", 0 ],
                    "midpoints": [ 379.5, 1068.0, 357.0, 1068.0, 357.0, 993.0, 366.0, 993.0, 366.0, 966.0, 379.5, 966.0 ],
                    "source": [ "obj-dial-gx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-gy", 0 ],
                    "midpoints": [ 439.5, 1077.0, 357.0, 1077.0, 357.0, 993.0, 366.0, 993.0, 366.0, 966.0, 439.5, 966.0 ],
                    "source": [ "obj-dial-gy", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-gyro-group", 0 ],
                    "midpoints": [ 409.5, 966.0, 409.5, 966.0 ],
                    "source": [ "obj-dial-gyro-group", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-gz", 0 ],
                    "midpoints": [ 499.5, 1077.0, 597.0, 1077.0, 597.0, 993.0, 606.0, 993.0, 606.0, 957.0, 499.5, 957.0 ],
                    "source": [ "obj-dial-gz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-orient-group", 0 ],
                    "midpoints": [ 649.5, 966.0, 649.5, 966.0 ],
                    "source": [ "obj-dial-orient-group", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-pitch", 0 ],
                    "midpoints": [ 619.5, 1068.0, 597.0, 1068.0, 597.0, 993.0, 606.0, 993.0, 606.0, 966.0, 619.5, 966.0 ],
                    "source": [ "obj-dial-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-roll", 0 ],
                    "midpoints": [ 679.5, 1077.0, 597.0, 1077.0, 597.0, 993.0, 606.0, 993.0, 606.0, 966.0, 679.5, 966.0 ],
                    "source": [ "obj-dial-roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-smooth-yaw", 0 ],
                    "midpoints": [ 739.5, 1080.0, 864.0, 1080.0, 864.0, 957.0, 739.5, 957.0 ],
                    "source": [ "obj-dial-yaw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-quat-raw", 0 ],
                    "midpoints": [ 69.5, 1362.0, 69.5, 1362.0 ],
                    "source": [ "obj-euler2quat-raw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-quat-smooth", 0 ],
                    "midpoints": [ 461.0, 1365.0, 459.5, 1365.0 ],
                    "source": [ "obj-euler2quat-smooth", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-ax", 0 ],
                    "midpoints": [ 69.5, 1233.0, 69.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-ax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-ay", 0 ],
                    "midpoints": [ 199.5, 1233.0, 199.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-ay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-az", 0 ],
                    "midpoints": [ 329.5, 1233.0, 329.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-az", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-gx", 0 ],
                    "midpoints": [ 379.5, 1233.0, 379.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-gx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-gy", 0 ],
                    "midpoints": [ 439.5, 1233.0, 439.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-gy", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-gz", 0 ],
                    "midpoints": [ 499.5, 1233.0, 499.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-gz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-pitch", 0 ],
                    "midpoints": [ 619.5, 1233.0, 619.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-roll", 0 ],
                    "midpoints": [ 679.5, 1233.0, 719.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-send-smooth-yaw", 0 ],
                    "midpoints": [ 739.5, 1233.0, 818.5, 1233.0 ],
                    "source": [ "obj-flonum-smooth-yaw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-accel-group", 0 ],
                    "midpoints": [ 69.5, 900.0, 147.0, 900.0, 147.0, 921.0, 169.5, 921.0 ],
                    "order": 10,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-ax", 0 ],
                    "midpoints": [ 69.5, 900.0, 45.0, 900.0, 45.0, 1020.0, 139.5, 1020.0 ],
                    "order": 11,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-ay", 0 ],
                    "midpoints": [ 69.5, 900.0, 45.0, 900.0, 45.0, 1002.0, 177.0, 1002.0, 177.0, 1020.0, 199.5, 1020.0 ],
                    "order": 9,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-az", 0 ],
                    "midpoints": [ 69.5, 900.0, 45.0, 900.0, 45.0, 1002.0, 237.0, 1002.0, 237.0, 1020.0, 259.5, 1020.0 ],
                    "order": 8,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-global", 0 ],
                    "midpoints": [ 69.5, 900.0, 57.0, 900.0, 57.0, 921.0, 69.5, 921.0 ],
                    "order": 12,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-gx", 0 ],
                    "midpoints": [ 69.5, 900.0, 147.0, 900.0, 147.0, 891.0, 366.0, 891.0, 366.0, 1020.0, 379.5, 1020.0 ],
                    "order": 7,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-gy", 0 ],
                    "midpoints": [ 69.5, 900.0, 147.0, 900.0, 147.0, 891.0, 366.0, 891.0, 366.0, 1002.0, 417.0, 1002.0, 417.0, 1020.0, 439.5, 1020.0 ],
                    "order": 5,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-gyro-group", 0 ],
                    "midpoints": [ 69.5, 900.0, 147.0, 900.0, 147.0, 891.0, 387.0, 891.0, 387.0, 921.0, 409.5, 921.0 ],
                    "order": 6,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-gz", 0 ],
                    "midpoints": [ 69.5, 900.0, 147.0, 900.0, 147.0, 891.0, 366.0, 891.0, 366.0, 1002.0, 477.0, 1002.0, 477.0, 1020.0, 499.5, 1020.0 ],
                    "order": 4,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-orient-group", 0 ],
                    "midpoints": [ 69.5, 900.0, 147.0, 900.0, 147.0, 891.0, 627.0, 891.0, 627.0, 921.0, 649.5, 921.0 ],
                    "order": 2,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-pitch", 0 ],
                    "midpoints": [ 69.5, 900.0, 147.0, 900.0, 147.0, 891.0, 606.0, 891.0, 606.0, 1020.0, 619.5, 1020.0 ],
                    "order": 3,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-roll", 0 ],
                    "midpoints": [ 69.5, 900.0, 147.0, 900.0, 147.0, 891.0, 606.0, 891.0, 606.0, 1002.0, 666.0, 1002.0, 666.0, 1020.0, 679.5, 1020.0 ],
                    "order": 1,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dial-yaw", 0 ],
                    "midpoints": [ 69.5, 900.0, 45.0, 900.0, 45.0, 1077.0, 726.0, 1077.0, 726.0, 1026.0, 739.5, 1026.0 ],
                    "order": 0,
                    "source": [ "obj-int-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-deferlow-smooth", 0 ],
                    "source": [ "obj-loadbang-smooth", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-int-1", 0 ],
                    "source": [ "obj-deferlow-smooth", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pcontrol-3d", 0 ],
                    "midpoints": [ 119.5, 2349.0, 69.5, 2349.0 ],
                    "source": [ "obj-msg-3dclose", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pcontrol-3d", 0 ],
                    "midpoints": [ 69.5, 2349.0, 69.5, 2349.0 ],
                    "source": [ "obj-msg-3dopen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 69.5, 543.0, 45.0, 543.0, 45.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-msg-calstart", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 169.5, 543.0, 276.0, 543.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-msg-calstop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 112.0, 105.0, 259.5, 105.0 ],
                    "source": [ "obj-msg-connect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 192.0, 105.0, 259.5, 105.0 ],
                    "source": [ "obj-msg-disconnect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 287.0, 105.0, 259.5, 105.0 ],
                    "source": [ "obj-msg-listports", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 550.5, 516.0, 528.0, 516.0, 528.0, 384.0, 276.0, 384.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-msg-orientreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 680.5, 525.0, 528.0, 525.0, 528.0, 384.0, 276.0, 384.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-msg-orientrestore", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 372.0, 105.0, 259.5, 105.0 ],
                    "source": [ "obj-msg-reset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-btn-calibrate", 0 ],
                    "midpoints": [ 69.5, 417.0, 57.0, 417.0, 57.0, 444.0, 69.5, 444.0 ],
                    "source": [ "obj-msg-set-cal-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 560.5, 171.0, 582.0, 171.0, 582.0, 93.0, 345.0, 93.0, 345.0, 0.0, 627.0, 0.0, 627.0, -3.0, 641.5, -3.0 ],
                    "source": [ "obj-nodescript", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route", 0 ],
                    "midpoints": [ 259.5, 171.0, 259.5, 171.0 ],
                    "source": [ "obj-nodescript", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-ax", 0 ],
                    "midpoints": [ 69.5, 1725.0, 69.5, 1725.0 ],
                    "source": [ "obj-p-map-ax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-ay", 0 ],
                    "midpoints": [ 349.5, 1725.0, 349.5, 1725.0 ],
                    "source": [ "obj-p-map-ay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-az", 0 ],
                    "midpoints": [ 629.5, 1725.0, 629.5, 1725.0 ],
                    "source": [ "obj-p-map-az", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-gx", 0 ],
                    "midpoints": [ 69.5, 1884.0, 69.5, 1884.0 ],
                    "source": [ "obj-p-map-gx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-gy", 0 ],
                    "midpoints": [ 349.5, 1884.0, 349.5, 1884.0 ],
                    "source": [ "obj-p-map-gy", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-gz", 0 ],
                    "midpoints": [ 629.5, 1884.0, 629.5, 1884.0 ],
                    "source": [ "obj-p-map-gz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-pitch", 0 ],
                    "midpoints": [ 69.5, 1569.0, 69.5, 1569.0 ],
                    "source": [ "obj-p-map-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-roll", 0 ],
                    "midpoints": [ 349.5, 1569.0, 349.5, 1569.0 ],
                    "source": [ "obj-p-map-roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-map-yaw", 0 ],
                    "midpoints": [ 629.5, 1569.0, 629.5, 1569.0 ],
                    "source": [ "obj-p-map-yaw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-euler2quat-raw", 0 ],
                    "midpoints": [ 69.5, 1332.0, 69.5, 1332.0 ],
                    "source": [ "obj-pack-euler-raw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-euler2quat-smooth", 0 ],
                    "midpoints": [ 461.0, 1335.0, 461.0, 1335.0 ],
                    "source": [ "obj-pack-euler-smooth", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 169.5, 993.0, 117.0, 993.0, 117.0, 1002.0, 45.0, 1002.0, 45.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-accel-group", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 139.5, 993.0, 117.0, 993.0, 117.0, 1002.0, 45.0, 1002.0, 45.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-ax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 199.5, 993.0, 177.0, 993.0, 177.0, 1002.0, 45.0, 1002.0, 45.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-ay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 259.5, 993.0, 237.0, 993.0, 237.0, 1002.0, 45.0, 1002.0, 45.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-az", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 69.5, 993.0, 45.0, 993.0, 45.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-global", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 379.5, 993.0, 366.0, 993.0, 366.0, 855.0, 447.0, 855.0, 447.0, 750.0, 462.0, 750.0, 462.0, 678.0, 471.0, 678.0, 471.0, 579.0, 276.0, 579.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-gx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 439.5, 993.0, 366.0, 993.0, 366.0, 855.0, 447.0, 855.0, 447.0, 750.0, 462.0, 750.0, 462.0, 678.0, 471.0, 678.0, 471.0, 579.0, 276.0, 579.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-gy", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 409.5, 993.0, 366.0, 993.0, 366.0, 855.0, 447.0, 855.0, 447.0, 750.0, 462.0, 750.0, 462.0, 678.0, 471.0, 678.0, 471.0, 579.0, 276.0, 579.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-gyro-group", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 499.5, 1002.0, 606.0, 1002.0, 606.0, 810.0, 525.0, 810.0, 525.0, 579.0, 276.0, 579.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-gz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 649.5, 993.0, 606.0, 993.0, 606.0, 810.0, 525.0, 810.0, 525.0, 579.0, 276.0, 579.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-orient-group", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 619.5, 993.0, 606.0, 993.0, 606.0, 810.0, 525.0, 810.0, 525.0, 579.0, 276.0, 579.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 679.5, 993.0, 606.0, 993.0, 606.0, 810.0, 525.0, 810.0, 525.0, 579.0, 276.0, 579.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "midpoints": [ 739.5, 993.0, 606.0, 993.0, 606.0, 810.0, 525.0, 810.0, 525.0, 579.0, 276.0, 579.0, 276.0, 246.0, 237.0, 246.0, 237.0, 117.0, 259.5, 117.0 ],
                    "source": [ "obj-prepend-smooth-yaw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-ax", 0 ],
                    "midpoints": [ 69.5, 1695.0, 69.5, 1695.0 ],
                    "source": [ "obj-r-map-ax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-ay", 0 ],
                    "midpoints": [ 349.5, 1695.0, 349.5, 1695.0 ],
                    "source": [ "obj-r-map-ay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-az", 0 ],
                    "midpoints": [ 629.5, 1695.0, 629.5, 1695.0 ],
                    "source": [ "obj-r-map-az", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-gx", 0 ],
                    "midpoints": [ 69.5, 1854.0, 69.5, 1854.0 ],
                    "source": [ "obj-r-map-gx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-gy", 0 ],
                    "midpoints": [ 349.5, 1854.0, 349.5, 1854.0 ],
                    "source": [ "obj-r-map-gy", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-gz", 0 ],
                    "midpoints": [ 629.5, 1854.0, 629.5, 1854.0 ],
                    "source": [ "obj-r-map-gz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-pitch", 0 ],
                    "midpoints": [ 69.5, 1539.0, 69.5, 1539.0 ],
                    "source": [ "obj-r-map-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-roll", 0 ],
                    "midpoints": [ 349.5, 1539.0, 349.5, 1539.0 ],
                    "source": [ "obj-r-map-roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-map-yaw", 0 ],
                    "midpoints": [ 629.5, 1539.0, 629.5, 1539.0 ],
                    "source": [ "obj-r-map-yaw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pack-euler-smooth", 0 ],
                    "midpoints": [ 461.0, 1305.0, 461.0, 1305.0 ],
                    "source": [ "obj-r-smooth-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pack-euler-smooth", 1 ],
                    "midpoints": [ 561.0, 1305.0, 501.5, 1305.0 ],
                    "source": [ "obj-r-smooth-roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pack-euler-smooth", 2 ],
                    "midpoints": [ 661.0, 1314.0, 552.0, 1314.0, 552.0, 1308.0, 542.0, 1308.0 ],
                    "source": [ "obj-r-smooth-yaw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-thresh-ax", 0 ],
                    "midpoints": [ 69.5, 2163.0, 69.5, 2163.0 ],
                    "source": [ "obj-r-thresh-ax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-thresh-ay", 0 ],
                    "midpoints": [ 269.5, 2163.0, 269.5, 2163.0 ],
                    "source": [ "obj-r-thresh-ay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-thresh-az", 0 ],
                    "midpoints": [ 469.5, 2163.0, 469.5, 2163.0 ],
                    "source": [ "obj-r-thresh-az", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-thresh-pitch", 0 ],
                    "midpoints": [ 69.5, 2043.0, 69.5, 2043.0 ],
                    "source": [ "obj-r-thresh-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-thresh-roll", 0 ],
                    "midpoints": [ 269.5, 2043.0, 269.5, 2043.0 ],
                    "source": [ "obj-r-thresh-roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-p-thresh-yaw", 0 ],
                    "midpoints": [ 469.5, 2043.0, 469.5, 2043.0 ],
                    "source": [ "obj-r-thresh-yaw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cal-status-display", 1 ],
                    "midpoints": [ 560.0, 438.0, 528.0, 438.0, 528.0, 531.0, 467.5, 531.0 ],
                    "source": [ "obj-route", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-set-cal-toggle", 0 ],
                    "midpoints": [ 688.7857142857142, 255.0, 645.0, 255.0, 645.0, 267.0, 582.0, 267.0, 582.0, 390.0, 69.5, 390.0 ],
                    "source": [ "obj-route", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-status-display", 1 ],
                    "midpoints": [ 388.2857142857143, 255.0, 480.0, 255.0, 480.0, 270.0, 594.0, 270.0, 594.0, 258.0, 645.0, 258.0, 645.0, 234.0, 634.5, 234.0 ],
                    "source": [ "obj-route", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-accel", 0 ],
                    "midpoints": [ 259.5, 255.0, 45.0, 255.0, 45.0, 297.0, 69.5, 297.0 ],
                    "source": [ "obj-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-bias", 0 ],
                    "midpoints": [ 645.8571428571429, 267.0, 582.0, 267.0, 582.0, 273.0, 450.0, 273.0, 450.0, 255.0, 45.0, 255.0, 45.0, 582.0, 69.5, 582.0 ],
                    "source": [ "obj-route", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-calaccel", 0 ],
                    "midpoints": [ 431.2142857142857, 255.0, 45.0, 255.0, 45.0, 723.0, 69.5, 723.0 ],
                    "source": [ "obj-route", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-calgyro", 0 ],
                    "midpoints": [ 474.1428571428571, 315.0, 528.0, 315.0, 528.0, 687.0, 297.0, 687.0, 297.0, 723.0, 319.5, 723.0 ],
                    "source": [ "obj-route", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-calorient", 0 ],
                    "midpoints": [ 517.0714285714286, 336.0, 528.0, 336.0, 528.0, 723.0, 606.5, 723.0 ],
                    "source": [ "obj-route", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-gyro", 0 ],
                    "midpoints": [ 302.42857142857144, 255.0, 306.0, 255.0, 306.0, 294.0, 319.5, 294.0 ],
                    "source": [ "obj-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-orient", 0 ],
                    "midpoints": [ 345.3571428571429, 255.0, 480.0, 255.0, 480.0, 297.0, 606.5, 297.0 ],
                    "source": [ "obj-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-progress", 0 ],
                    "midpoints": [ 602.9285714285714, 267.0, 582.0, 267.0, 582.0, 405.0, 312.0, 405.0, 312.0, 453.0, 336.5, 453.0 ],
                    "source": [ "obj-route", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-smoothaccel", 0 ],
                    "midpoints": [ 731.7142857142858, 255.0, 645.0, 255.0, 645.0, 267.0, 582.0, 267.0, 582.0, 273.0, 450.0, 273.0, 450.0, 255.0, 45.0, 255.0, 45.0, 1116.0, 69.5, 1116.0 ],
                    "source": [ "obj-route", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-smoothgyro", 0 ],
                    "midpoints": [ 774.6428571428571, 315.0, 813.0, 315.0, 813.0, 891.0, 606.0, 891.0, 606.0, 1002.0, 540.0, 1002.0, 540.0, 1116.0, 379.5, 1116.0 ],
                    "source": [ "obj-route", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-smoothorient", 0 ],
                    "midpoints": [ 817.5714285714286, 957.0, 864.0, 957.0, 864.0, 1116.0, 619.5, 1116.0 ],
                    "source": [ "obj-route", 13 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-3dclose", 0 ],
                    "midpoints": [ 100.0, 2319.0, 119.5, 2319.0 ],
                    "source": [ "obj-sel-3dviz", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-3dopen", 0 ],
                    "midpoints": [ 69.5, 2319.0, 69.5, 2319.0 ],
                    "source": [ "obj-sel-3dviz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-calstart", 0 ],
                    "midpoints": [ 69.5, 513.0, 69.5, 513.0 ],
                    "source": [ "obj-sel-cal", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-calstop", 0 ],
                    "midpoints": [ 110.0, 513.0, 169.5, 513.0 ],
                    "source": [ "obj-sel-cal", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bias-display", 1 ],
                    "midpoints": [ 69.5, 639.0, 450.5, 639.0 ],
                    "source": [ "obj-sprintf-bias", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-ax", 0 ],
                    "midpoints": [ 69.5, 324.0, 57.0, 324.0, 57.0, 345.0, 69.5, 345.0 ],
                    "source": [ "obj-unpack-accel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-ay", 0 ],
                    "midpoints": [ 130.0, 327.0, 126.0, 327.0, 126.0, 345.0, 139.5, 345.0 ],
                    "source": [ "obj-unpack-accel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-az", 0 ],
                    "midpoints": [ 190.5, 345.0, 209.5, 345.0 ],
                    "source": [ "obj-unpack-accel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 5 ],
                    "midpoints": [ 250.5, 609.0, 450.5, 609.0 ],
                    "source": [ "obj-unpack-bias", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 4 ],
                    "midpoints": [ 214.3, 609.0, 374.3, 609.0 ],
                    "source": [ "obj-unpack-bias", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 3 ],
                    "midpoints": [ 178.1, 609.0, 298.1, 609.0 ],
                    "source": [ "obj-unpack-bias", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 2 ],
                    "midpoints": [ 141.9, 609.0, 221.9, 609.0 ],
                    "source": [ "obj-unpack-bias", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 1 ],
                    "midpoints": [ 105.7, 609.0, 145.7, 609.0 ],
                    "source": [ "obj-unpack-bias", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 0 ],
                    "midpoints": [ 69.5, 609.0, 69.5, 609.0 ],
                    "source": [ "obj-unpack-bias", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-ax", 0 ],
                    "midpoints": [ 69.5, 750.0, 57.0, 750.0, 57.0, 771.0, 69.5, 771.0 ],
                    "source": [ "obj-unpack-calaccel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-ay", 0 ],
                    "midpoints": [ 130.0, 753.0, 126.0, 753.0, 126.0, 771.0, 139.5, 771.0 ],
                    "source": [ "obj-unpack-calaccel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-az", 0 ],
                    "midpoints": [ 190.5, 771.0, 209.5, 771.0 ],
                    "source": [ "obj-unpack-calaccel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-gx", 0 ],
                    "midpoints": [ 319.5, 750.0, 306.0, 750.0, 306.0, 771.0, 319.5, 771.0 ],
                    "source": [ "obj-unpack-calgyro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-gy", 0 ],
                    "midpoints": [ 380.0, 753.0, 375.0, 753.0, 375.0, 771.0, 389.5, 771.0 ],
                    "source": [ "obj-unpack-calgyro", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-gz", 0 ],
                    "midpoints": [ 440.5, 771.0, 459.5, 771.0 ],
                    "source": [ "obj-unpack-calgyro", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-pitch", 0 ],
                    "midpoints": [ 606.5, 750.0, 594.0, 750.0, 594.0, 771.0, 606.5, 771.0 ],
                    "source": [ "obj-unpack-calorient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-roll", 0 ],
                    "midpoints": [ 667.0, 753.0, 663.0, 753.0, 663.0, 771.0, 676.5, 771.0 ],
                    "source": [ "obj-unpack-calorient", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-yaw", 0 ],
                    "midpoints": [ 727.5, 771.0, 746.5, 771.0 ],
                    "source": [ "obj-unpack-calorient", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-gx", 0 ],
                    "midpoints": [ 319.5, 324.0, 306.0, 324.0, 306.0, 345.0, 319.5, 345.0 ],
                    "source": [ "obj-unpack-gyro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-gy", 0 ],
                    "midpoints": [ 380.0, 327.0, 375.0, 327.0, 375.0, 345.0, 389.5, 345.0 ],
                    "source": [ "obj-unpack-gyro", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-gz", 0 ],
                    "midpoints": [ 440.5, 345.0, 459.5, 345.0 ],
                    "source": [ "obj-unpack-gyro", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-pitch", 0 ],
                    "midpoints": [ 606.5, 324.0, 594.0, 324.0, 594.0, 345.0, 606.5, 345.0 ],
                    "order": 0,
                    "source": [ "obj-unpack-orient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-roll", 0 ],
                    "midpoints": [ 667.0, 327.0, 663.0, 327.0, 663.0, 345.0, 676.5, 345.0 ],
                    "order": 0,
                    "source": [ "obj-unpack-orient", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-yaw", 0 ],
                    "midpoints": [ 727.5, 345.0, 746.5, 345.0 ],
                    "order": 0,
                    "source": [ "obj-unpack-orient", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pack-euler-raw", 2 ],
                    "midpoints": [ 727.5, 815.5, 150.5, 815.5 ],
                    "order": 1,
                    "source": [ "obj-unpack-orient", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pack-euler-raw", 1 ],
                    "midpoints": [ 667.0, 324.0, 663.0, 324.0, 663.0, 390.0, 45.0, 390.0, 45.0, 1305.0, 110.0, 1305.0 ],
                    "order": 1,
                    "source": [ "obj-unpack-orient", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pack-euler-raw", 0 ],
                    "midpoints": [ 606.5, 324.0, 525.0, 324.0, 525.0, 390.0, 45.0, 390.0, 45.0, 1305.0, 69.5, 1305.0 ],
                    "order": 1,
                    "source": [ "obj-unpack-orient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-slider-progress", 0 ],
                    "midpoints": [ 336.5, 480.0, 336.5, 480.0 ],
                    "source": [ "obj-unpack-progress", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-qw", 0 ],
                    "midpoints": [ 230.5, 1404.0, 255.0, 1404.0, 255.0, 1425.0, 279.5, 1425.0 ],
                    "source": [ "obj-unpack-quat-raw", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-qx", 0 ],
                    "midpoints": [ 69.5, 1404.0, 57.0, 1404.0, 57.0, 1425.0, 69.5, 1425.0 ],
                    "source": [ "obj-unpack-quat-raw", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-qy", 0 ],
                    "midpoints": [ 123.16666666666666, 1425.0, 139.5, 1425.0 ],
                    "source": [ "obj-unpack-quat-raw", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-qz", 0 ],
                    "midpoints": [ 176.83333333333331, 1416.0, 195.0, 1416.0, 195.0, 1425.0, 209.5, 1425.0 ],
                    "source": [ "obj-unpack-quat-raw", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-ax", 0 ],
                    "midpoints": [ 69.5, 1155.0, 45.0, 1155.0, 45.0, 1206.0, 69.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothaccel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-ay", 0 ],
                    "midpoints": [ 130.0, 1155.0, 45.0, 1155.0, 45.0, 1233.0, 135.0, 1233.0, 135.0, 1206.0, 199.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothaccel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-az", 0 ],
                    "midpoints": [ 190.5, 1155.0, 306.0, 1155.0, 306.0, 1206.0, 329.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothaccel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-gx", 0 ],
                    "midpoints": [ 379.5, 1176.0, 366.0, 1176.0, 366.0, 1206.0, 379.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothgyro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-gy", 0 ],
                    "midpoints": [ 440.0, 1176.0, 426.0, 1176.0, 426.0, 1206.0, 439.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothgyro", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-gz", 0 ],
                    "midpoints": [ 500.5, 1176.0, 486.0, 1176.0, 486.0, 1206.0, 499.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothgyro", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-pitch", 0 ],
                    "midpoints": [ 619.5, 1176.0, 597.0, 1176.0, 597.0, 1206.0, 619.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothorient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-roll", 0 ],
                    "midpoints": [ 680.0, 1176.0, 666.0, 1176.0, 666.0, 1206.0, 679.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothorient", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-smooth-yaw", 0 ],
                    "midpoints": [ 740.5, 1176.0, 726.0, 1176.0, 726.0, 1206.0, 739.5, 1206.0 ],
                    "source": [ "obj-unpack-smoothorient", 2 ]
                }
            }
        ],
        "autosave": 0
    }
}