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
            134,
            95,
            1400,
            932
        ],
        "boxes": [
            {
                "box": {
                    "comment": "control messages: smoothing, threshold, transport, calibrate, orient_reset, orient_restore, mapping, connect, disconnect",
                    "id": "obj-inlet-ctrl",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        20,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-patcherargs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        50,
                        60,
                        450,
                        22
                    ],
                    "text": "patcherargs @smooth 0.3 @transport usb @ip 192.168.1.50 @udpport 8889"
                }
            },
            {
                "box": {
                    "id": "obj-route-attrs",
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
                        520,
                        60,
                        280,
                        22
                    ],
                    "text": "route smooth transport ip udpport"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        520,
                        100,
                        134,
                        22
                    ],
                    "text": "prepend smooth_global"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-transport-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        660,
                        100,
                        110,
                        22
                    ],
                    "text": "prepend transport"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-ip-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        780,
                        100,
                        80,
                        22
                    ],
                    "text": "prepend ip"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-udpport-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        870,
                        100,
                        110,
                        22
                    ],
                    "text": "prepend udpport"
                }
            },
            {
                "box": {
                    "id": "obj-msg-auto-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        50,
                        130,
                        55,
                        22
                    ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "id": "obj-route-ctrl",
                    "maxclass": "newobj",
                    "numinlets": 10,
                    "numoutlets": 10,
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
                        ""
                    ],
                    "patching_rect": [
                        300,
                        163,
                        680,
                        22
                    ],
                    "text": "route smoothing threshold transport calibrate orient_reset orient_restore mapping connect disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-route-smooth",
                    "maxclass": "newobj",
                    "numinlets": 14,
                    "numoutlets": 14,
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
                        ""
                    ],
                    "patching_rect": [
                        300,
                        189,
                        700,
                        22
                    ],
                    "text": "route global accel_group gyro_group orient_group ax ay az gx gy gz pitch roll yaw"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-global",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        240,
                        134,
                        22
                    ],
                    "text": "prepend smooth_global"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-accel_group",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        380,
                        240,
                        167,
                        22
                    ],
                    "text": "prepend smooth_accel_group"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-gyro_group",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        460,
                        240,
                        163,
                        22
                    ],
                    "text": "prepend smooth_gyro_group"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-orient_group",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        540,
                        240,
                        169,
                        22
                    ],
                    "text": "prepend smooth_orient_group"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        620,
                        240,
                        115,
                        22
                    ],
                    "text": "prepend smooth_ax"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        700,
                        240,
                        115,
                        22
                    ],
                    "text": "prepend smooth_ay"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        780,
                        240,
                        115,
                        22
                    ],
                    "text": "prepend smooth_az"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-gx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        860,
                        240,
                        115,
                        22
                    ],
                    "text": "prepend smooth_gx"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-gy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        940,
                        240,
                        115,
                        22
                    ],
                    "text": "prepend smooth_gy"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-gz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1020,
                        240,
                        115,
                        22
                    ],
                    "text": "prepend smooth_gz"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1100,
                        240,
                        127,
                        22
                    ],
                    "text": "prepend smooth_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1180,
                        240,
                        118,
                        22
                    ],
                    "text": "prepend smooth_roll"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1260,
                        240,
                        123,
                        22
                    ],
                    "text": "prepend smooth_yaw"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-transport",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        680,
                        270,
                        110,
                        22
                    ],
                    "text": "prepend transport"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-calibrate",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        270,
                        131,
                        22
                    ],
                    "text": "prepend calibrate_start"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-orient-reset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        930,
                        270,
                        119,
                        22
                    ],
                    "text": "prepend orient_reset"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-orient-restore",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1050,
                        270,
                        130,
                        22
                    ],
                    "text": "prepend orient_restore"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-connect",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1180,
                        270,
                        100,
                        22
                    ],
                    "text": "prepend connect"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-disconnect",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1290,
                        270,
                        113,
                        22
                    ],
                    "text": "prepend disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-threshold",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        560,
                        270,
                        105,
                        22
                    ],
                    "text": "prepend threshold"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapping",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        420,
                        270,
                        102,
                        22
                    ],
                    "text": "prepend mapping"
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
                        300,
                        216,
                        300,
                        22
                    ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "watch": 0
                    },
                    "text": "node.script serial-bridge.js @autostart 1",
                    "textfile": {
                        "text": "",
                        "filename": "serial-bridge.js",
                        "flags": 0,
                        "embed": 1,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-attrs",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "int"
                    ],
                    "patching_rect": [
                        520,
                        130,
                        45,
                        22
                    ],
                    "text": "zl reg"
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-attrs2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "int"
                    ],
                    "patching_rect": [
                        660,
                        130,
                        45,
                        22
                    ],
                    "text": "zl reg"
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-attrs3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "int"
                    ],
                    "patching_rect": [
                        780,
                        130,
                        45,
                        22
                    ],
                    "text": "zl reg"
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-attrs4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "int"
                    ],
                    "patching_rect": [
                        870,
                        130,
                        45,
                        22
                    ],
                    "text": "zl reg"
                }
            },
            {
                "box": {
                    "id": "obj-route-node",
                    "maxclass": "newobj",
                    "numinlets": 16,
                    "numoutlets": 16,
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
                        ""
                    ],
                    "patching_rect": [
                        300,
                        290,
                        900,
                        22
                    ],
                    "text": "route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias cal_toggle smooth_accel smooth_gyro smooth_orientation ready"
                }
            },
            {
                "box": {
                    "id": "obj-thru-raw-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        300,
                        330,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-thru-raw-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        400,
                        330,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-thru-raw-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        500,
                        330,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-thru-cal-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        300,
                        370,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-thru-cal-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        400,
                        370,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-thru-cal-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        500,
                        370,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-thru-smooth-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        300,
                        440,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-thru-smooth-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        400,
                        440,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-thru-smooth-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        500,
                        440,
                        50,
                        22
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-comment-transport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50,
                        360,
                        70,
                        20
                    ],
                    "text": "Transport"
                }
            },
            {
                "box": {
                    "id": "obj-umenu-transport",
                    "items": [
                        "usb",
                        "wifi",
                        "auto"
                    ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        50,
                        380,
                        100,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-sel-transport",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [
                        "bang",
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        50,
                        410,
                        120,
                        22
                    ],
                    "text": "select 0 1 2"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-usb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        50,
                        440,
                        90,
                        22
                    ],
                    "text": "transport usb"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-wifi",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        150,
                        440,
                        90,
                        22
                    ],
                    "text": "transport wifi"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-auto",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        250,
                        440,
                        95,
                        22
                    ],
                    "text": "transport auto"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-quat",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300,
                        880,
                        150,
                        20
                    ],
                    "text": "=== QUATERNION ==="
                }
            },
            {
                "box": {
                    "id": "obj-unpack-orient-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        300,
                        900,
                        100,
                        22
                    ],
                    "text": "unpack f f f"
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
                        300,
                        930,
                        80,
                        22
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
                        "list",
                        ""
                    ],
                    "patching_rect": [
                        300,
                        960,
                        90,
                        22
                    ],
                    "text": "jit.euler2quat"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-quat",
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
                        300,
                        990,
                        120,
                        22
                    ],
                    "text": "unpack f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-pack-quat-out",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        1020,
                        100,
                        22
                    ],
                    "text": "pack f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-smooth-orient-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        500,
                        900,
                        100,
                        22
                    ],
                    "text": "unpack f f f"
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
                        500,
                        930,
                        80,
                        22
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
                        "list",
                        ""
                    ],
                    "patching_rect": [
                        500,
                        960,
                        90,
                        22
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
                        500,
                        990,
                        121,
                        22
                    ],
                    "text": "s #0_quat_smooth"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-mapping",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300,
                        970,
                        180,
                        20
                    ],
                    "text": "=== RANGE MAPPING ==="
                }
            },
            {
                "box": {
                    "id": "obj-unpack-smooth-accel-map",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        300,
                        1000,
                        100,
                        22
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-smooth-gyro-map",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        500,
                        1000,
                        100,
                        22
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-unpack-smooth-orient-map",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        700,
                        1000,
                        100,
                        22
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-join-mapped",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        1100,
                        40,
                        22
                    ],
                    "text": "t l"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-ax-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ax-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ax-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "-2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-ax-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale -2. 2. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale -2. 2. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ax-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-ax-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain -2. 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ax-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ax-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ax-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_ax"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped ax",
                                    "id": "obj-ax-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-ax-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ax-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ax-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ax-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-ax-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        300,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_ax"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        1070,
                        80,
                        22
                    ],
                    "text": "prepend ax"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-ay-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ay-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ay-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "-2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-ay-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale -2. 2. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale -2. 2. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ay-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-ay-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain -2. 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ay-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ay-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-ay-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_ay"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped ay",
                                    "id": "obj-ay-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-ay-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-ay-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-ay-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-ay-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-ay-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        410,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_ay"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        410,
                        1070,
                        80,
                        22
                    ],
                    "text": "prepend ay"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-az-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-az-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-az-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "-2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-az-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale -2. 2. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale -2. 2. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-az-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-az-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain -2. 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-az-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-az-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-az-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_az"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped az",
                                    "id": "obj-az-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-az-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-az-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-az-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-az-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-az-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        520,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_az"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        520,
                        1070,
                        80,
                        22
                    ],
                    "text": "prepend az"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-gx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-gx-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gx-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gx-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "-250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-gx-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale -250. 250. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale -250. 250. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gx-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-gx-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain -250. 250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gx-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gx-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gx-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_gx"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped gx",
                                    "id": "obj-gx-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-gx-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gx-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gx-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gx-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-gx-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        630,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_gx"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-gx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        630,
                        1070,
                        80,
                        22
                    ],
                    "text": "prepend gx"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-gy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-gy-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gy-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gy-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "-250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-gy-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale -250. 250. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale -250. 250. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gy-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-gy-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain -250. 250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gy-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gy-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gy-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_gy"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped gy",
                                    "id": "obj-gy-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-gy-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gy-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gy-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gy-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-gy-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        740,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_gy"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-gy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        740,
                        1070,
                        80,
                        22
                    ],
                    "text": "prepend gy"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-gz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-gz-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gz-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gz-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "-250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-gz-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale -250. 250. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale -250. 250. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gz-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-gz-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain -250. 250."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gz-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gz-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-gz-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_gz"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped gz",
                                    "id": "obj-gz-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-gz-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-gz-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-gz-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-gz-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-gz-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        850,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_gz"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-gz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        850,
                        1070,
                        80,
                        22
                    ],
                    "text": "prepend gz"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-pitch-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-pitch-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-pitch-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-pitch-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale 0. 90. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale 0. 90. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-pitch-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-pitch-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain 0. 90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-pitch-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-pitch-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-pitch-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_pitch"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped pitch",
                                    "id": "obj-pitch-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-pitch-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-pitch-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-pitch-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-pitch-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-pitch-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        960,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        960,
                        1070,
                        81,
                        22
                    ],
                    "text": "prepend pitch"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-roll-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-roll-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-roll-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-roll-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale 0. 90. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale 0. 90. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-roll-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-roll-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain 0. 90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-roll-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-roll-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-roll-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_roll"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped roll",
                                    "id": "obj-roll-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-roll-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-roll-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-roll-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-roll-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-roll-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        1070,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_roll"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1070,
                        1070,
                        80,
                        22
                    ],
                    "text": "prepend roll"
                }
            },
            {
                "box": {
                    "id": "obj-p-map-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
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
                            0,
                            0,
                            700,
                            550
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "sensor value",
                                    "id": "obj-yaw-inlet",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-learn-btn",
                                    "legacytextcolor": 1,
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
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "text": "Learn",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "text": "select 1 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-msg-clear",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-gate-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-maximum",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-inmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        280,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-yaw-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-inmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        140,
                                        40,
                                        20
                                    ],
                                    "text": "In Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-yaw-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-loadbang",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "patching_rect": [
                                        400,
                                        30,
                                        55,
                                        22
                                    ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "text": "90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "text": "1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-curve",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        190,
                                        70,
                                        20
                                    ],
                                    "text": "Curve Type"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "id": "obj-yaw-umenu-curve",
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-gate-curve",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "text": "gate 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-scale-linear",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "text": "scale 0. 90. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "text": "scale 0. 90. 0. 1. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-exp",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        430,
                                        280,
                                        60,
                                        20
                                    ],
                                    "text": "Exponent"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-yaw-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "text": "3."
                                }
                            },
                            {
                                "box": {
                                    "classic_curve": 1,
                                    "domain": 0.009999999776482582,
                                    "id": "obj-yaw-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "text": "domain 0. 90."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "text": "setrange 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "float"
                                    ],
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-outmin",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        30,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Min"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-yaw-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-outmax",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        100,
                                        270,
                                        50,
                                        20
                                    ],
                                    "text": "Out Max"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-yaw-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-clip-toggle",
                                    "legacytextcolor": 1,
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
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "text": "Clip Off",
                                    "texton": "Clip On",
                                    "usebgoncolor": 1,
                                    "usetextovercolor": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-gate-clip-off",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "text": "clip 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "int"
                                    ],
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-mapped",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        420,
                                        50,
                                        20
                                    ],
                                    "text": "Mapped"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-yaw-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
                                        22
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-send-mapped",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        470,
                                        100,
                                        22
                                    ],
                                    "text": "s #0_mapped_yaw"
                                }
                            },
                            {
                                "box": {
                                    "comment": "mapped yaw",
                                    "id": "obj-yaw-outlet",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak domain 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-pak-setrange",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "text": "pak setrange 0. 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-curve",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-gate-clip-on",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-not-clip",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-clip-toggle",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-umenu-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        5
                                    ],
                                    "source": [
                                        "obj-yaw-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-pak-setdomain",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        2
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        2
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-pak-setdomain",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        1
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-outlet",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-send-mapped",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-clip",
                                        2
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-pak-setrange",
                                        2
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        4
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        4
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-clip",
                                        1
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-pak-setrange",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        3
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        3
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-mapped",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-clip",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-gate-curve",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-gate-curve",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-gate-learn",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-inlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-gate-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-learn-btn",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-sel-learn",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-learn-btn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-default-curve",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-default-exp",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-default-inmax",
                                        0
                                    ],
                                    "order": 3,
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-default-inmin",
                                        0
                                    ],
                                    "order": 7,
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-default-outmax",
                                        0
                                    ],
                                    "order": 2,
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-default-outmin",
                                        0
                                    ],
                                    "order": 6,
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-msg-setdomain",
                                        0
                                    ],
                                    "order": 5,
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-msg-setrange",
                                        0
                                    ],
                                    "order": 4,
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-gate-clip-off",
                                        1
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-gate-clip-on",
                                        1
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-maximum",
                                        0
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-yaw-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-minimum",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-yaw-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-gate-clip-off",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-pak-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-pak-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-gate-curve",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-plus1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-merge",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-msg-clear",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-yaw-plus1",
                                        0
                                    ],
                                    "source": [
                                        "obj-yaw-umenu-curve",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        1180,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_yaw"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1180,
                        1070,
                        80,
                        22
                    ],
                    "text": "prepend yaw"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-triggers",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300,
                        1130,
                        200,
                        20
                    ],
                    "text": "=== TRIGGERS (placeholder) ==="
                }
            },
            {
                "box": {
                    "comment": "status: connected-usb, connected-wifi, switching, disconnected",
                    "id": "obj-outlet-status",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        0,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "raw accelerometer: aX aY aZ (g)",
                    "id": "obj-outlet-raw-accel",
                    "index": 2,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        100,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "raw gyroscope: gX gY gZ (dps)",
                    "id": "obj-outlet-raw-gyro",
                    "index": 3,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        200,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "raw orientation: pitch roll yaw (degrees)",
                    "id": "obj-outlet-raw-orient",
                    "index": 4,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "calibrated accelerometer: aX aY aZ (g)",
                    "id": "obj-outlet-cal-accel",
                    "index": 5,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        400,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "calibrated gyroscope: gX gY gZ (dps)",
                    "id": "obj-outlet-cal-gyro",
                    "index": 6,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        500,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "calibrated orientation: pitch roll yaw (degrees)",
                    "id": "obj-outlet-cal-orient",
                    "index": 7,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        600,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "smoothed accelerometer: aX aY aZ (g)",
                    "id": "obj-outlet-smooth-accel",
                    "index": 8,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        700,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "smoothed gyroscope: gX gY gZ (dps)",
                    "id": "obj-outlet-smooth-gyro",
                    "index": 9,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        800,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "smoothed orientation: pitch roll yaw (degrees)",
                    "id": "obj-outlet-smooth-orient",
                    "index": 10,
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
                    "comment": "mapped values: axis_name value (normalized)",
                    "id": "obj-outlet-mapped",
                    "index": 11,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1000,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "quaternion: qX qY qZ qW",
                    "id": "obj-outlet-quaternion",
                    "index": 12,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1100,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "comment": "threshold triggers: axis_name bang/direction",
                    "id": "obj-outlet-triggers",
                    "index": 13,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1200,
                        1200,
                        30,
                        30
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cal-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        900,
                        330,
                        110,
                        22
                    ],
                    "text": "prepend cal_status"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "obj-comment-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50,
                        0,
                        200,
                        22
                    ],
                    "text": "imu-sensor abstraction"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-comment-data-routing",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300,
                        270,
                        150,
                        20
                    ],
                    "text": "=== DATA ROUTING ==="
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
                        0,
                        1180,
                        250,
                        20
                    ],
                    "text": "=== OUTLETS (left=0 to right=12) ==="
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
                        529.5,
                        165,
                        285,
                        165,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-deferlow-attrs",
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
                        669.5,
                        165,
                        285,
                        165,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-deferlow-attrs2",
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
                        789.5,
                        165,
                        285,
                        165,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-deferlow-attrs3",
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
                        879.5,
                        165,
                        285,
                        165,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-deferlow-attrs4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-quat",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        984,
                        309.5,
                        984
                    ],
                    "source": [
                        "obj-euler2quat-raw",
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
                    "midpoints": [
                        509.5,
                        984,
                        509.5,
                        984
                    ],
                    "source": [
                        "obj-euler2quat-smooth",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route-ctrl",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        51,
                        342,
                        51,
                        342,
                        45,
                        501,
                        45,
                        501,
                        165,
                        309.5,
                        165
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
                        "obj-outlet-mapped",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        1125,
                        297,
                        1125,
                        297,
                        1185,
                        1009.5,
                        1185
                    ],
                    "source": [
                        "obj-join-mapped",
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
                        59.5,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-msg-auto-connect",
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
                        259.5,
                        465,
                        246,
                        465,
                        246,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-msg-transport-auto",
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
                        59.5,
                        465,
                        36,
                        465,
                        36,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-msg-transport-usb",
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
                        159.5,
                        474,
                        246,
                        474,
                        246,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-msg-transport-wifi",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route-node",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        243,
                        297,
                        243,
                        297,
                        285,
                        309.5,
                        285
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
                        "obj-prepend-mapped-ax",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        1065,
                        309.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapped-ay",
                        0
                    ],
                    "midpoints": [
                        419.5,
                        1065,
                        419.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapped-az",
                        0
                    ],
                    "midpoints": [
                        529.5,
                        1065,
                        529.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapped-gx",
                        0
                    ],
                    "midpoints": [
                        639.5,
                        1065,
                        639.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapped-gy",
                        0
                    ],
                    "midpoints": [
                        749.5,
                        1065,
                        749.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapped-gz",
                        0
                    ],
                    "midpoints": [
                        859.5,
                        1065,
                        859.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapped-pitch",
                        0
                    ],
                    "midpoints": [
                        969.5,
                        1065,
                        969.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapped-roll",
                        0
                    ],
                    "midpoints": [
                        1079.5,
                        1065,
                        1079.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapped-yaw",
                        0
                    ],
                    "midpoints": [
                        1189.5,
                        1065,
                        1189.5,
                        1065
                    ],
                    "source": [
                        "obj-p-map-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-euler2quat-raw",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        954,
                        309.5,
                        954
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
                        "obj-euler2quat-smooth",
                        0
                    ],
                    "midpoints": [
                        509.5,
                        954,
                        509.5,
                        954
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
                        "obj-outlet-quaternion",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        1044,
                        285,
                        1044,
                        285,
                        1185,
                        1109.5,
                        1185
                    ],
                    "source": [
                        "obj-pack-quat-out",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route-attrs",
                        0
                    ],
                    "midpoints": [
                        490.5,
                        84,
                        516,
                        84,
                        516,
                        57,
                        529.5,
                        57
                    ],
                    "source": [
                        "obj-patcherargs",
                        1
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
                        909.5,
                        776,
                        9.5,
                        776
                    ],
                    "source": [
                        "obj-prepend-cal-status",
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
                        809.5,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-calibrate",
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
                        1189.5,
                        294,
                        1200,
                        294,
                        1200,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-connect",
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
                        1299.5,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-disconnect",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-deferlow-attrs3",
                        1
                    ],
                    "midpoints": [
                        789.5,
                        123,
                        815.5,
                        123
                    ],
                    "source": [
                        "obj-prepend-ip-init",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        419.5,
                        1104,
                        342,
                        1104,
                        342,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        529.5,
                        1104,
                        342,
                        1104,
                        342,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        639.5,
                        1104,
                        342,
                        1104,
                        342,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        749.5,
                        1104,
                        342,
                        1104,
                        342,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        859.5,
                        1104,
                        342,
                        1104,
                        342,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        969.5,
                        1104,
                        342,
                        1104,
                        342,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        1079.5,
                        1104,
                        342,
                        1104,
                        342,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-join-mapped",
                        0
                    ],
                    "midpoints": [
                        1189.5,
                        1104,
                        342,
                        1104,
                        342,
                        1095,
                        309.5,
                        1095
                    ],
                    "source": [
                        "obj-prepend-mapped-yaw",
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
                        429.5,
                        312,
                        285,
                        312,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-mapping",
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
                        939.5,
                        324,
                        561,
                        324,
                        561,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-orient-reset",
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
                        1059.5,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-orient-restore",
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
                        389.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-accel_group",
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
                        629.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-ax",
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
                        709.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-ay",
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
                        789.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-az",
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
                        309.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-global",
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
                        869.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-gx",
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
                        949.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-gy",
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
                        469.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-gyro_group",
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
                        1029.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-deferlow-attrs",
                        1
                    ],
                    "midpoints": [
                        529.5,
                        123,
                        555.5,
                        123
                    ],
                    "source": [
                        "obj-prepend-smooth-init",
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
                        549.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-orient_group",
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
                        1109.5,
                        264,
                        285,
                        264,
                        285,
                        207,
                        309.5,
                        207
                    ],
                    "source": [
                        "obj-prepend-smooth-pitch",
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
                        1189.5,
                        264,
                        1281,
                        264,
                        1281,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-smooth-roll",
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
                        1269.5,
                        264,
                        1281,
                        264,
                        1281,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-smooth-yaw",
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
                        569.5,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-threshold",
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
                        689.5,
                        402,
                        285,
                        402,
                        285,
                        216,
                        309.5,
                        216
                    ],
                    "source": [
                        "obj-prepend-transport",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-deferlow-attrs2",
                        1
                    ],
                    "midpoints": [
                        669.5,
                        123,
                        695.5,
                        123
                    ],
                    "source": [
                        "obj-prepend-transport-init",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-deferlow-attrs4",
                        1
                    ],
                    "midpoints": [
                        879.5,
                        123,
                        905.5,
                        123
                    ],
                    "source": [
                        "obj-prepend-udpport-init",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-ip-init",
                        0
                    ],
                    "midpoints": [
                        660,
                        96,
                        789.5,
                        96
                    ],
                    "source": [
                        "obj-route-attrs",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-init",
                        0
                    ],
                    "midpoints": [
                        529.5,
                        84,
                        529.5,
                        84
                    ],
                    "source": [
                        "obj-route-attrs",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-transport-init",
                        0
                    ],
                    "midpoints": [
                        594.75,
                        96,
                        669.5,
                        96
                    ],
                    "source": [
                        "obj-route-attrs",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-udpport-init",
                        0
                    ],
                    "midpoints": [
                        725.25,
                        84,
                        879.5,
                        84
                    ],
                    "source": [
                        "obj-route-attrs",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-calibrate",
                        0
                    ],
                    "midpoints": [
                        529.8333333333334,
                        204,
                        285,
                        204,
                        285,
                        267,
                        809.5,
                        267
                    ],
                    "source": [
                        "obj-route-ctrl",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-connect",
                        0
                    ],
                    "midpoints": [
                        823.6111111111111,
                        204,
                        1383,
                        204,
                        1383,
                        267,
                        1189.5,
                        267
                    ],
                    "source": [
                        "obj-route-ctrl",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-disconnect",
                        0
                    ],
                    "midpoints": [
                        897.0555555555555,
                        204,
                        1383,
                        204,
                        1383,
                        264,
                        1299.5,
                        264
                    ],
                    "source": [
                        "obj-route-ctrl",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-mapping",
                        0
                    ],
                    "midpoints": [
                        750.1666666666667,
                        204,
                        285,
                        204,
                        285,
                        267,
                        429.5,
                        267
                    ],
                    "source": [
                        "obj-route-ctrl",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-orient-reset",
                        0
                    ],
                    "midpoints": [
                        603.2777777777778,
                        204,
                        285,
                        204,
                        285,
                        267,
                        939.5,
                        267
                    ],
                    "source": [
                        "obj-route-ctrl",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-orient-restore",
                        0
                    ],
                    "midpoints": [
                        676.7222222222222,
                        204,
                        1383,
                        204,
                        1383,
                        264,
                        1059.5,
                        264
                    ],
                    "source": [
                        "obj-route-ctrl",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-threshold",
                        0
                    ],
                    "midpoints": [
                        382.94444444444446,
                        204,
                        285,
                        204,
                        285,
                        267,
                        569.5,
                        267
                    ],
                    "source": [
                        "obj-route-ctrl",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-transport",
                        0
                    ],
                    "midpoints": [
                        456.3888888888889,
                        204,
                        285,
                        204,
                        285,
                        267,
                        689.5,
                        267
                    ],
                    "source": [
                        "obj-route-ctrl",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route-smooth",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        204,
                        309.5,
                        204
                    ],
                    "source": [
                        "obj-route-ctrl",
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
                        498.2857142857143,
                        315,
                        486,
                        315,
                        486,
                        867,
                        9.5,
                        867
                    ],
                    "source": [
                        "obj-route-node",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-cal-status",
                        0
                    ],
                    "midpoints": [
                        750,
                        327,
                        909.5,
                        327
                    ],
                    "source": [
                        "obj-route-node",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-cal-accel",
                        0
                    ],
                    "midpoints": [
                        561.2142857142858,
                        402,
                        360,
                        402,
                        360,
                        366,
                        309.5,
                        366
                    ],
                    "source": [
                        "obj-route-node",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-cal-gyro",
                        0
                    ],
                    "midpoints": [
                        624.1428571428571,
                        366,
                        409.5,
                        366
                    ],
                    "source": [
                        "obj-route-node",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-cal-orient",
                        0
                    ],
                    "midpoints": [
                        687.0714285714286,
                        366,
                        509.5,
                        366
                    ],
                    "source": [
                        "obj-route-node",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-raw-accel",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        315,
                        309.5,
                        315
                    ],
                    "source": [
                        "obj-route-node",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-raw-gyro",
                        0
                    ],
                    "midpoints": [
                        372.42857142857144,
                        327,
                        409.5,
                        327
                    ],
                    "source": [
                        "obj-route-node",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-raw-orient",
                        0
                    ],
                    "midpoints": [
                        435.3571428571429,
                        324,
                        509.5,
                        324
                    ],
                    "source": [
                        "obj-route-node",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-smooth-accel",
                        0
                    ],
                    "midpoints": [
                        1001.7142857142857,
                        327,
                        1020,
                        327,
                        1020,
                        426,
                        309.5,
                        426
                    ],
                    "source": [
                        "obj-route-node",
                        11
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-smooth-gyro",
                        0
                    ],
                    "midpoints": [
                        1064.642857142857,
                        426,
                        409.5,
                        426
                    ],
                    "source": [
                        "obj-route-node",
                        12
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-thru-smooth-orient",
                        0
                    ],
                    "midpoints": [
                        1127.5714285714284,
                        426,
                        509.5,
                        426
                    ],
                    "source": [
                        "obj-route-node",
                        13
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-accel_group",
                        0
                    ],
                    "midpoints": [
                        361.88461538461536,
                        234,
                        389.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-ax",
                        0
                    ],
                    "midpoints": [
                        519.0384615384615,
                        207,
                        629.5,
                        207
                    ],
                    "source": [
                        "obj-route-smooth",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-ay",
                        0
                    ],
                    "midpoints": [
                        571.4230769230769,
                        234,
                        709.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-az",
                        0
                    ],
                    "midpoints": [
                        623.8076923076924,
                        234,
                        789.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-global",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        234,
                        309.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-gx",
                        0
                    ],
                    "midpoints": [
                        676.1923076923076,
                        234,
                        869.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-gy",
                        0
                    ],
                    "midpoints": [
                        728.5769230769231,
                        234,
                        949.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-gyro_group",
                        0
                    ],
                    "midpoints": [
                        414.2692307692308,
                        234,
                        469.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-gz",
                        0
                    ],
                    "midpoints": [
                        780.9615384615385,
                        234,
                        1029.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        9
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-orient_group",
                        0
                    ],
                    "midpoints": [
                        466.6538461538462,
                        264,
                        549.5,
                        264
                    ],
                    "source": [
                        "obj-route-smooth",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-pitch",
                        0
                    ],
                    "midpoints": [
                        833.3461538461538,
                        234,
                        1109.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        10
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-roll",
                        0
                    ],
                    "midpoints": [
                        885.7307692307693,
                        234,
                        1189.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        11
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-smooth-yaw",
                        0
                    ],
                    "midpoints": [
                        938.1153846153846,
                        234,
                        1269.5,
                        234
                    ],
                    "source": [
                        "obj-route-smooth",
                        12
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-transport-auto",
                        0
                    ],
                    "midpoints": [
                        126.83333333333333,
                        435,
                        259.5,
                        435
                    ],
                    "source": [
                        "obj-sel-transport",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-transport-usb",
                        0
                    ],
                    "midpoints": [
                        59.5,
                        435,
                        59.5,
                        435
                    ],
                    "source": [
                        "obj-sel-transport",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-transport-wifi",
                        0
                    ],
                    "midpoints": [
                        93.16666666666666,
                        435,
                        159.5,
                        435
                    ],
                    "source": [
                        "obj-sel-transport",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-cal-accel",
                        0
                    ],
                    "midpoints": [
                        340.5,
                        426,
                        360,
                        426,
                        360,
                        867,
                        285,
                        867,
                        285,
                        1185,
                        409.5,
                        1185
                    ],
                    "source": [
                        "obj-thru-cal-accel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-cal-gyro",
                        0
                    ],
                    "midpoints": [
                        440.5,
                        426,
                        486,
                        426,
                        486,
                        1035,
                        510,
                        1035,
                        510,
                        1074,
                        509.5,
                        1074
                    ],
                    "source": [
                        "obj-thru-cal-gyro",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-cal-orient",
                        0
                    ],
                    "midpoints": [
                        540.5,
                        426,
                        633,
                        426,
                        633,
                        1026,
                        621,
                        1026,
                        621,
                        1074,
                        612,
                        1074,
                        612,
                        1197,
                        609.5,
                        1197
                    ],
                    "source": [
                        "obj-thru-cal-orient",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-raw-accel",
                        0
                    ],
                    "midpoints": [
                        340.5,
                        354,
                        360,
                        354,
                        360,
                        867,
                        261,
                        867,
                        261,
                        1242,
                        87,
                        1242,
                        87,
                        1200,
                        109.5,
                        1200
                    ],
                    "source": [
                        "obj-thru-raw-accel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-raw-gyro",
                        0
                    ],
                    "midpoints": [
                        440.5,
                        354,
                        360,
                        354,
                        360,
                        867,
                        261,
                        867,
                        261,
                        1242,
                        186,
                        1242,
                        186,
                        1200,
                        209.5,
                        1200
                    ],
                    "source": [
                        "obj-thru-raw-gyro",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-outlet-raw-orient",
                        0
                    ],
                    "midpoints": [
                        540.5,
                        354,
                        462,
                        354,
                        462,
                        867,
                        285,
                        867,
                        285,
                        1185,
                        309.5,
                        1185
                    ],
                    "source": [
                        "obj-thru-raw-orient",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-orient-quat",
                        0
                    ],
                    "midpoints": [
                        509.5,
                        354,
                        462,
                        354,
                        462,
                        867,
                        297,
                        867,
                        297,
                        897,
                        309.5,
                        897
                    ],
                    "source": [
                        "obj-thru-raw-orient",
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
                        340.5,
                        867,
                        633,
                        867,
                        633,
                        1026,
                        627,
                        1026,
                        627,
                        1185,
                        709.5,
                        1185
                    ],
                    "source": [
                        "obj-thru-smooth-accel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-smooth-accel-map",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        867,
                        285,
                        867,
                        285,
                        996,
                        309.5,
                        996
                    ],
                    "source": [
                        "obj-thru-smooth-accel",
                        0
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
                        440.5,
                        867,
                        633,
                        867,
                        633,
                        1026,
                        627,
                        1026,
                        627,
                        1185,
                        809.5,
                        1185
                    ],
                    "source": [
                        "obj-thru-smooth-gyro",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-smooth-gyro-map",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        867,
                        486,
                        867,
                        486,
                        996,
                        509.5,
                        996
                    ],
                    "source": [
                        "obj-thru-smooth-gyro",
                        0
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
                        540.5,
                        885,
                        846,
                        885,
                        846,
                        1185,
                        909.5,
                        1185
                    ],
                    "order": 0,
                    "source": [
                        "obj-thru-smooth-orient",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-smooth-orient-map",
                        0
                    ],
                    "midpoints": [
                        540.5,
                        885,
                        709.5,
                        885
                    ],
                    "order": 1,
                    "source": [
                        "obj-thru-smooth-orient",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-unpack-smooth-orient-quat",
                        0
                    ],
                    "midpoints": [
                        509.5,
                        465,
                        509.5,
                        465
                    ],
                    "source": [
                        "obj-thru-smooth-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sel-transport",
                        0
                    ],
                    "midpoints": [
                        59.5,
                        405,
                        59.5,
                        405
                    ],
                    "source": [
                        "obj-umenu-transport",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-raw",
                        2
                    ],
                    "midpoints": [
                        390.5,
                        924,
                        370.5,
                        924
                    ],
                    "source": [
                        "obj-unpack-orient-quat",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-raw",
                        1
                    ],
                    "midpoints": [
                        350,
                        924,
                        340,
                        924
                    ],
                    "source": [
                        "obj-unpack-orient-quat",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-raw",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        924,
                        309.5,
                        924
                    ],
                    "source": [
                        "obj-unpack-orient-quat",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-quat-out",
                        3
                    ],
                    "midpoints": [
                        410.5,
                        1014,
                        390.5,
                        1014
                    ],
                    "source": [
                        "obj-unpack-quat",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-quat-out",
                        2
                    ],
                    "midpoints": [
                        376.8333333333333,
                        1014,
                        363.5,
                        1014
                    ],
                    "source": [
                        "obj-unpack-quat",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-quat-out",
                        1
                    ],
                    "midpoints": [
                        343.1666666666667,
                        1014,
                        336.5,
                        1014
                    ],
                    "source": [
                        "obj-unpack-quat",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-quat-out",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        1014,
                        309.5,
                        1014
                    ],
                    "source": [
                        "obj-unpack-quat",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-ax",
                        0
                    ],
                    "midpoints": [
                        309.5,
                        1023,
                        309.5,
                        1023
                    ],
                    "source": [
                        "obj-unpack-smooth-accel-map",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-ay",
                        0
                    ],
                    "midpoints": [
                        350,
                        1062,
                        405,
                        1062,
                        405,
                        1035,
                        419.5,
                        1035
                    ],
                    "source": [
                        "obj-unpack-smooth-accel-map",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-az",
                        0
                    ],
                    "midpoints": [
                        390.5,
                        1023,
                        486,
                        1023,
                        486,
                        1032,
                        529.5,
                        1032
                    ],
                    "source": [
                        "obj-unpack-smooth-accel-map",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-gx",
                        0
                    ],
                    "midpoints": [
                        509.5,
                        1023,
                        639.5,
                        1023
                    ],
                    "source": [
                        "obj-unpack-smooth-gyro-map",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-gy",
                        0
                    ],
                    "midpoints": [
                        550,
                        1023,
                        687,
                        1023,
                        687,
                        1032,
                        749.5,
                        1032
                    ],
                    "source": [
                        "obj-unpack-smooth-gyro-map",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-gz",
                        0
                    ],
                    "midpoints": [
                        590.5,
                        1023,
                        687,
                        1023,
                        687,
                        987,
                        859.5,
                        987
                    ],
                    "source": [
                        "obj-unpack-smooth-gyro-map",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-pitch",
                        0
                    ],
                    "midpoints": [
                        709.5,
                        1023,
                        969.5,
                        1023
                    ],
                    "source": [
                        "obj-unpack-smooth-orient-map",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-roll",
                        0
                    ],
                    "midpoints": [
                        750,
                        1023,
                        1079.5,
                        1023
                    ],
                    "source": [
                        "obj-unpack-smooth-orient-map",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p-map-yaw",
                        0
                    ],
                    "midpoints": [
                        790.5,
                        1023,
                        1189.5,
                        1023
                    ],
                    "source": [
                        "obj-unpack-smooth-orient-map",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-smooth",
                        2
                    ],
                    "midpoints": [
                        590.5,
                        924,
                        570.5,
                        924
                    ],
                    "source": [
                        "obj-unpack-smooth-orient-quat",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-smooth",
                        1
                    ],
                    "midpoints": [
                        550,
                        924,
                        540,
                        924
                    ],
                    "source": [
                        "obj-unpack-smooth-orient-quat",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pack-euler-smooth",
                        0
                    ],
                    "midpoints": [
                        509.5,
                        924,
                        509.5,
                        924
                    ],
                    "source": [
                        "obj-unpack-smooth-orient-quat",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msg-auto-connect",
                        0
                    ],
                    "midpoints": [
                        1189.5,
                        312,
                        1200,
                        312,
                        1200,
                        126,
                        59.5,
                        126
                    ],
                    "source": [
                        "obj-route-node",
                        14
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-deferlow-attrs",
                        0
                    ],
                    "midpoints": [
                        1189.5,
                        312,
                        1200,
                        312,
                        1200,
                        126,
                        520.5,
                        126
                    ],
                    "source": [
                        "obj-route-node",
                        14
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-deferlow-attrs2",
                        0
                    ],
                    "midpoints": [
                        1189.5,
                        312,
                        1200,
                        312,
                        1200,
                        126,
                        660.5,
                        126
                    ],
                    "source": [
                        "obj-route-node",
                        14
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-deferlow-attrs3",
                        0
                    ],
                    "midpoints": [
                        1189.5,
                        312,
                        1200,
                        312,
                        1200,
                        126,
                        780.5,
                        126
                    ],
                    "source": [
                        "obj-route-node",
                        14
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-deferlow-attrs4",
                        0
                    ],
                    "midpoints": [
                        1189.5,
                        312,
                        1200,
                        312,
                        1200,
                        126,
                        870.5,
                        126
                    ],
                    "source": [
                        "obj-route-node",
                        14
                    ]
                }
            }
        ]
    }
}