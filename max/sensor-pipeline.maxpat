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
        "rect": [ 688.0, 156.0, 900.0, 1050.0 ],
        "boxes": [
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
                    "patching_rect": [ 787.0, 64.0, 400.0, 220.0 ],
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
                    "numinlets": 1,
                    "numoutlets": 11,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 250.0, 200.0, 560.0, 22.0 ],
                    "text": "route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias"
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
                    "id": "obj-btn-calreset",
                    "maxclass": "textbutton",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 450.0, 100.0, 30.0 ],
                    "text": "Reset Cal"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calreset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 490.0, 100.0, 22.0 ],
                    "text": "calibrate_reset"
                }
            },
            {
                "box": {
                    "id": "obj-btn-orient",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 450.0, 130.0, 30.0 ],
                    "text": "Reset Orient",
                    "texton": "Restore Frame"
                }
            },
            {
                "box": {
                    "id": "obj-sel-orient",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 320.0, 490.0, 100.0, 22.0 ],
                    "text": "select 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-msg-orientreset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 520.0, 80.0, 22.0 ],
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
                    "patching_rect": [ 420.0, 520.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 500.0, 420.0, 170.0, 21.0 ],
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
                    "patching_rect": [ 500.0, 456.0, 100.0, 22.0 ],
                    "text": "unpack i i"
                }
            },
            {
                "box": {
                    "id": "obj-slider-progress",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 500.0, 486.0, 200.0, 20.0 ],
                    "size": 201.0,
                    "orientation": 1
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
                    "patching_rect": [ 500.0, 520.0, 100.0, 21.0 ],
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
                    "patching_rect": [ 500.0, 546.0, 150.0, 22.0 ],
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
                    "text": ""
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
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-3", 0 ]
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
                    "source": [ "obj-msg-listports", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-reset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-nodescript", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route", 0 ],
                    "source": [ "obj-nodescript", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-status-display", 1 ],
                    "source": [ "obj-route", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-accel", 0 ],
                    "source": [ "obj-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-gyro", 0 ],
                    "source": [ "obj-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-orient", 0 ],
                    "source": [ "obj-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-ax", 0 ],
                    "source": [ "obj-unpack-accel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-ay", 0 ],
                    "source": [ "obj-unpack-accel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-az", 0 ],
                    "source": [ "obj-unpack-accel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-gx", 0 ],
                    "source": [ "obj-unpack-gyro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-gy", 0 ],
                    "source": [ "obj-unpack-gyro", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-gz", 0 ],
                    "source": [ "obj-unpack-gyro", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-pitch", 0 ],
                    "source": [ "obj-unpack-orient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-roll", 0 ],
                    "source": [ "obj-unpack-orient", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-yaw", 0 ],
                    "source": [ "obj-unpack-orient", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-cal", 0 ],
                    "source": [ "obj-btn-calibrate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-calstart", 0 ],
                    "source": [ "obj-sel-cal", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-calstop", 0 ],
                    "source": [ "obj-sel-cal", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-calstart", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-calstop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-calreset", 0 ],
                    "source": [ "obj-btn-calreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-calreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel-orient", 0 ],
                    "source": [ "obj-btn-orient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-orientreset", 0 ],
                    "source": [ "obj-sel-orient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-msg-orientrestore", 0 ],
                    "source": [ "obj-sel-orient", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-orientreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-nodescript", 0 ],
                    "source": [ "obj-msg-orientrestore", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-progress", 0 ],
                    "source": [ "obj-route", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-slider-progress", 0 ],
                    "source": [ "obj-unpack-progress", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cal-status-display", 1 ],
                    "source": [ "obj-route", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-bias", 0 ],
                    "source": [ "obj-route", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 0 ],
                    "source": [ "obj-unpack-bias", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 1 ],
                    "source": [ "obj-unpack-bias", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 2 ],
                    "source": [ "obj-unpack-bias", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 3 ],
                    "source": [ "obj-unpack-bias", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 4 ],
                    "source": [ "obj-unpack-bias", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-bias", 5 ],
                    "source": [ "obj-unpack-bias", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bias-display", 1 ],
                    "source": [ "obj-sprintf-bias", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-calaccel", 0 ],
                    "source": [ "obj-route", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-ax", 0 ],
                    "source": [ "obj-unpack-calaccel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-ay", 0 ],
                    "source": [ "obj-unpack-calaccel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-az", 0 ],
                    "source": [ "obj-unpack-calaccel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-calgyro", 0 ],
                    "source": [ "obj-route", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-gx", 0 ],
                    "source": [ "obj-unpack-calgyro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-gy", 0 ],
                    "source": [ "obj-unpack-calgyro", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-gz", 0 ],
                    "source": [ "obj-unpack-calgyro", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unpack-calorient", 0 ],
                    "source": [ "obj-route", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-pitch", 0 ],
                    "source": [ "obj-unpack-calorient", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-roll", 0 ],
                    "source": [ "obj-unpack-calorient", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-flonum-cal-yaw", 0 ],
                    "source": [ "obj-unpack-calorient", 2 ]
                }
            }
        ],
        "autosave": 0
    }
}