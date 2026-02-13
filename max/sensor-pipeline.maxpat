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
        "rect": [ 688.0, 156.0, 711.0, 800.0 ],
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
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 250.0, 200.0, 280.0, 22.0 ],
                    "text": "route accel gyro orientation status"
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
            }
        ],
        "autosave": 0
    }
}