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
            600,
            480
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        10,
                        280,
                        27
                    ],
                    "text": "IMU Sensor 3D Visualization",
                    "fontface": 1,
                    "fontsize": 18.0
                }
            },
            {
                "box": {
                    "id": "obj-comment-inst1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        40,
                        400,
                        20
                    ],
                    "text": "Connect inlet 0 to imu-sensor smooth_orientation outlet (outlet 9)"
                }
            },
            {
                "box": {
                    "id": "obj-comment-inst2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        58,
                        400,
                        20
                    ],
                    "text": "Connect inlet 1 to imu-sensor quaternion outlet (outlet 11, optional)"
                }
            },
            {
                "box": {
                    "id": "obj-comment-inst3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        76,
                        250,
                        20
                    ],
                    "text": "Toggle to start/stop 3D rendering"
                }
            },
            {
                "box": {
                    "id": "obj-inlet-euler",
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        120,
                        110,
                        30,
                        30
                    ],
                    "outlettype": [
                        ""
                    ],
                    "comment": "orientation: pitch roll yaw (3 floats)"
                }
            },
            {
                "box": {
                    "id": "obj-inlet-quat",
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        110,
                        30,
                        30
                    ],
                    "outlettype": [
                        ""
                    ],
                    "comment": "quaternion: qX qY qZ qW (4 floats, optional)"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-euler",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        120,
                        160,
                        100,
                        22
                    ],
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-pak-rotate",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "patching_rect": [
                        120,
                        200,
                        160,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "pak rotatexyz 0. 0. 0."
                }
            },
            {
                "box": {
                    "id": "obj-jit-world",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        120,
                        400,
                        280,
                        22
                    ],
                    "outlettype": [
                        "jit_matrix",
                        ""
                    ],
                    "text": "jit.world viz @visible 1 @size 400 300"
                }
            },
            {
                "box": {
                    "id": "obj-jit-render",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        120,
                        350,
                        320,
                        22
                    ],
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "text": "jit.gl.render viz @erase_color 0.2 0.2 0.2 1."
                }
            },
            {
                "box": {
                    "id": "obj-gridshape",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        120,
                        260,
                        450,
                        22
                    ],
                    "outlettype": [
                        "jit_matrix",
                        ""
                    ],
                    "text": "jit.gl.gridshape viz @shape cube @scale 2.0 0.3 1.5 @color 0.3 0.6 1.0 1.0"
                }
            },
            {
                "box": {
                    "id": "obj-comment-toggle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        300,
                        90,
                        20
                    ],
                    "text": "Enable 3D View"
                }
            },
            {
                "box": {
                    "id": "obj-toggle-render",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        320,
                        24,
                        24
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        350,
                        60,
                        22
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "text": "metro 16"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [
                        300,
                        160,
                        120,
                        22
                    ],
                    "outlettype": [
                        "float",
                        "float",
                        "float",
                        "float"
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
                        300,
                        190,
                        25,
                        20
                    ],
                    "text": "qX"
                }
            },
            {
                "box": {
                    "id": "obj-flonum-qx",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        300,
                        210,
                        55,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "format": 6
                }
            },
            {
                "box": {
                    "id": "obj-comment-qy",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        365,
                        190,
                        25,
                        20
                    ],
                    "text": "qY"
                }
            },
            {
                "box": {
                    "id": "obj-flonum-qy",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        365,
                        210,
                        55,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "format": 6
                }
            },
            {
                "box": {
                    "id": "obj-comment-qz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        430,
                        190,
                        25,
                        20
                    ],
                    "text": "qZ"
                }
            },
            {
                "box": {
                    "id": "obj-flonum-qz",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        430,
                        210,
                        55,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "format": 6
                }
            },
            {
                "box": {
                    "id": "obj-comment-qw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        495,
                        190,
                        25,
                        20
                    ],
                    "text": "qW"
                }
            },
            {
                "box": {
                    "id": "obj-flonum-qw",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        495,
                        210,
                        55,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "format": 6
                }
            },
            {
                "box": {
                    "id": "obj-comment-pitch",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        120,
                        230,
                        40,
                        20
                    ],
                    "text": "Pitch"
                }
            },
            {
                "box": {
                    "id": "obj-comment-roll",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        180,
                        230,
                        30,
                        20
                    ],
                    "text": "Roll"
                }
            },
            {
                "box": {
                    "id": "obj-comment-yaw",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        240,
                        230,
                        30,
                        20
                    ],
                    "text": "Yaw"
                }
            },
            {
                "box": {
                    "id": "obj-loadbang-viz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        290,
                        55,
                        22
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-msg-toggle-on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        20,
                        290,
                        25,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "1"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "obj-inlet-euler",
                        0
                    ],
                    "destination": [
                        "obj-unpack-euler",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-euler",
                        0
                    ],
                    "destination": [
                        "obj-pak-rotate",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-euler",
                        2
                    ],
                    "destination": [
                        "obj-pak-rotate",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-euler",
                        1
                    ],
                    "destination": [
                        "obj-pak-rotate",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-pak-rotate",
                        0
                    ],
                    "destination": [
                        "obj-gridshape",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-toggle-render",
                        0
                    ],
                    "destination": [
                        "obj-metro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-metro",
                        0
                    ],
                    "destination": [
                        "obj-jit-render",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-jit-render",
                        0
                    ],
                    "destination": [
                        "obj-jit-world",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-inlet-quat",
                        0
                    ],
                    "destination": [
                        "obj-unpack-quat",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-quat",
                        0
                    ],
                    "destination": [
                        "obj-flonum-qx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-quat",
                        1
                    ],
                    "destination": [
                        "obj-flonum-qy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-quat",
                        2
                    ],
                    "destination": [
                        "obj-flonum-qz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-quat",
                        3
                    ],
                    "destination": [
                        "obj-flonum-qw",
                        0
                    ]
                }
            }
        ],
        "parameters": {},
        "dependency_cache": [],
        "autosave": 0
    }
}