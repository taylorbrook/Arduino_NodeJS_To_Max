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
            50,
            50,
            1400,
            1350
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-inlet-ctrl",
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        20,
                        30,
                        30
                    ],
                    "outlettype": [
                        ""
                    ],
                    "comment": "control messages: smoothing, threshold, transport, calibrate, orient_reset, orient_restore, mapping, connect, disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-patcherargs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        50,
                        60,
                        450,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
                    ],
                    "text": "patcherargs @smooth 0.3 @transport usb @ip 192.168.1.50 @udpport 8889"
                }
            },
            {
                "box": {
                    "id": "obj-route-attrs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        520,
                        60,
                        280,
                        22
                    ],
                    "outlettype": [
                        "",
                        "",
                        "",
                        "",
                        ""
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
                    "patching_rect": [
                        520,
                        100,
                        130,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        660,
                        100,
                        110,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        780,
                        100,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        870,
                        100,
                        110,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "prepend udpport"
                }
            },
            {
                "box": {
                    "id": "obj-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        50,
                        60,
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
                    "id": "obj-deferlow-init",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        50,
                        100,
                        55,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-msg-auto-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        50,
                        130,
                        55,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "id": "obj-route-ctrl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "patching_rect": [
                        300,
                        180,
                        680,
                        22
                    ],
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
                    "text": "route smoothing threshold transport calibrate orient_reset orient_restore mapping connect disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-route-smooth",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 14,
                    "patching_rect": [
                        300,
                        210,
                        700,
                        22
                    ],
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
                    "text": "route global accel_group gyro_group orient_group ax ay az gx gy gz pitch roll yaw"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-smooth-global",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        380,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        460,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        540,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        620,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        700,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        780,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        860,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        940,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1020,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1100,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1180,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1260,
                        240,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        680,
                        270,
                        110,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        800,
                        270,
                        120,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        930,
                        270,
                        110,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1050,
                        270,
                        120,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1180,
                        270,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1290,
                        270,
                        110,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        560,
                        270,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        420,
                        270,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        300,
                        220,
                        300,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
                    ],
                    "text": "node.script serial-bridge.js @autostart 1",
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 0
                    }
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-attrs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        520,
                        130,
                        55,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-attrs2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        660,
                        130,
                        55,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-attrs3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        780,
                        130,
                        55,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-deferlow-attrs4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        870,
                        130,
                        55,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-route-node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 15,
                    "patching_rect": [
                        300,
                        290,
                        900,
                        22
                    ],
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
                        ""
                    ],
                    "text": "route accel gyro orientation status cal_accel cal_gyro cal_orientation cal_status cal_progress cal_bias cal_toggle smooth_accel smooth_gyro smooth_orientation"
                }
            },
            {
                "box": {
                    "id": "obj-thru-raw-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        300,
                        330,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        400,
                        330,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        500,
                        330,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        300,
                        370,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        400,
                        370,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        500,
                        370,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        300,
                        440,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        400,
                        440,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        500,
                        440,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        50,
                        380,
                        100,
                        22
                    ],
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "parameter_enable": 0,
                    "items": [
                        "usb",
                        "wifi",
                        "auto"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-sel-transport",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [
                        50,
                        410,
                        120,
                        22
                    ],
                    "outlettype": [
                        "bang",
                        "bang",
                        "bang",
                        ""
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
                    "patching_rect": [
                        50,
                        440,
                        90,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        150,
                        440,
                        90,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        250,
                        440,
                        95,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "transport auto"
                }
            },
            {
                "box": {
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
                    "text": "=== QUATERNION ===",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-unpack-orient-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        300,
                        900,
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
                    "id": "obj-pack-euler-raw",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        930,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        300,
                        960,
                        90,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                    "patching_rect": [
                        300,
                        990,
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
                    "id": "obj-pack-quat-out",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        1020,
                        100,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        500,
                        900,
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
                    "id": "obj-pack-euler-smooth",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        500,
                        930,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        500,
                        960,
                        90,
                        22
                    ],
                    "outlettype": [
                        "",
                        ""
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
                        120,
                        22
                    ],
                    "text": "s #0_quat_smooth"
                }
            },
            {
                "box": {
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
                    "text": "=== RANGE MAPPING ===",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-unpack-smooth-accel-map",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        300,
                        1000,
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
                    "id": "obj-unpack-smooth-gyro-map",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        500,
                        1000,
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
                    "id": "obj-unpack-smooth-orient-map",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        700,
                        1000,
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
                    "id": "obj-join-mapped",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        1100,
                        40,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        300,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_ax",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-ax-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-inmin",
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
                                    "id": "obj-ax-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-ax-comment-inmax",
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
                                    "id": "obj-ax-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-ax-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-ax-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "-2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-ax-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -2.0 2.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -2.0 2.0 0.0 1.0 3.0"
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
                                    "id": "obj-ax-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-ax-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain -2.0 2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-outmin",
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
                                    "id": "obj-ax-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-ax-comment-outmax",
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
                                    "id": "obj-ax-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-ax-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-comment-mapped",
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
                                    "id": "obj-ax-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-ax-send-mapped",
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
                                    "id": "obj-ax-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped ax"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ax-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-ax-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-ax-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-ax-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-ax-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ax-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ax-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-ax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        410,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_ay",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-ay-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-inmin",
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
                                    "id": "obj-ay-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-ay-comment-inmax",
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
                                    "id": "obj-ay-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-ay-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-ay-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "-2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-ay-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -2.0 2.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -2.0 2.0 0.0 1.0 3.0"
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
                                    "id": "obj-ay-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-ay-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain -2.0 2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-outmin",
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
                                    "id": "obj-ay-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-ay-comment-outmax",
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
                                    "id": "obj-ay-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-ay-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-comment-mapped",
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
                                    "id": "obj-ay-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-ay-send-mapped",
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
                                    "id": "obj-ay-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped ay"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ay-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-ay-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-ay-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-ay-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-ay-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-ay-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-ay-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-ay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        410,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        520,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_az",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-az-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-inmin",
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
                                    "id": "obj-az-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-az-comment-inmax",
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
                                    "id": "obj-az-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-az-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-az-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "-2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-az-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -2.0 2.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -2.0 2.0 0.0 1.0 3.0"
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
                                    "id": "obj-az-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-az-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain -2.0 2.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-outmin",
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
                                    "id": "obj-az-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-az-comment-outmax",
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
                                    "id": "obj-az-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-az-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-comment-mapped",
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
                                    "id": "obj-az-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-az-send-mapped",
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
                                    "id": "obj-az-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped az"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-az-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-az-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-az-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-az-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-az-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-az-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-az-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-az",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        520,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        630,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_gx",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-gx-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-inmin",
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
                                    "id": "obj-gx-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-gx-comment-inmax",
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
                                    "id": "obj-gx-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-gx-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-gx-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "-250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-gx-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -250.0 250.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -250.0 250.0 0.0 1.0 3.0"
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
                                    "id": "obj-gx-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-gx-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain -250.0 250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-outmin",
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
                                    "id": "obj-gx-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-gx-comment-outmax",
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
                                    "id": "obj-gx-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-gx-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-comment-mapped",
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
                                    "id": "obj-gx-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-gx-send-mapped",
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
                                    "id": "obj-gx-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped gx"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gx-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gx-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gx-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-gx-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gx-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gx-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gx-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-gx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        630,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        740,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_gy",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-gy-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-inmin",
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
                                    "id": "obj-gy-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-gy-comment-inmax",
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
                                    "id": "obj-gy-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-gy-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-gy-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "-250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-gy-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -250.0 250.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -250.0 250.0 0.0 1.0 3.0"
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
                                    "id": "obj-gy-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-gy-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain -250.0 250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-outmin",
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
                                    "id": "obj-gy-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-gy-comment-outmax",
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
                                    "id": "obj-gy-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-gy-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-comment-mapped",
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
                                    "id": "obj-gy-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-gy-send-mapped",
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
                                    "id": "obj-gy-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped gy"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gy-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gy-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gy-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-gy-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gy-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gy-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gy-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-gy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        740,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        850,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_gz",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-gz-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-inmin",
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
                                    "id": "obj-gz-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-gz-comment-inmax",
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
                                    "id": "obj-gz-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-gz-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-gz-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "-250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-gz-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -250.0 250.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale -250.0 250.0 0.0 1.0 3.0"
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
                                    "id": "obj-gz-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-gz-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain -250.0 250.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-outmin",
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
                                    "id": "obj-gz-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-gz-comment-outmax",
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
                                    "id": "obj-gz-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-gz-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-comment-mapped",
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
                                    "id": "obj-gz-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-gz-send-mapped",
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
                                    "id": "obj-gz-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped gz"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-gz-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gz-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gz-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-gz-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-gz-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-gz-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-gz-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-gz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        850,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        960,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_pitch",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-pitch-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-inmin",
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
                                    "id": "obj-pitch-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-pitch-comment-inmax",
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
                                    "id": "obj-pitch-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-pitch-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-pitch-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "90.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-pitch-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale 0.0 90.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale 0.0 90.0 0.0 1.0 3.0"
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
                                    "id": "obj-pitch-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-pitch-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain 0.0 90.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-outmin",
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
                                    "id": "obj-pitch-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-pitch-comment-outmax",
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
                                    "id": "obj-pitch-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-pitch-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-comment-mapped",
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
                                    "id": "obj-pitch-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-pitch-send-mapped",
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
                                    "id": "obj-pitch-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped pitch"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pitch-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-pitch-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-pitch-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-pitch-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-pitch-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-pitch-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        960,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1070,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_roll",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-roll-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-inmin",
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
                                    "id": "obj-roll-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-roll-comment-inmax",
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
                                    "id": "obj-roll-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-roll-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-roll-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "90.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-roll-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale 0.0 90.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale 0.0 90.0 0.0 1.0 3.0"
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
                                    "id": "obj-roll-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-roll-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain 0.0 90.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-outmin",
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
                                    "id": "obj-roll-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-roll-comment-outmax",
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
                                    "id": "obj-roll-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-roll-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-comment-mapped",
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
                                    "id": "obj-roll-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-roll-send-mapped",
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
                                    "id": "obj-roll-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped roll"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-roll-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-roll-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-roll-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-roll-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-roll-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-roll-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-roll-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-roll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        1070,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
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
                    "patching_rect": [
                        1180,
                        1040,
                        100,
                        22
                    ],
                    "text": "p map_yaw",
                    "patcher": {
                        "default": 0,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-yaw-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        30,
                                        30,
                                        30
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "comment": "sensor value"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-learn-btn",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        80,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Learn",
                                    "parameter_enable": 0,
                                    "mode": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-sel-learn",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        110,
                                        64,
                                        22
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
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
                                    "patching_rect": [
                                        30,
                                        140,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        80,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-maximum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "maximum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-minimum",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        110,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "minimum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-inmin",
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
                                    "id": "obj-yaw-flonum-inmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        280,
                                        160,
                                        60,
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
                                    "id": "obj-yaw-comment-inmax",
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
                                    "id": "obj-yaw-flonum-inmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        160,
                                        60,
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
                                    "id": "obj-yaw-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        30,
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
                                    "id": "obj-yaw-default-inmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-inmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        60,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "90.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-outmin",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-default-outmax",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        460,
                                        90,
                                        50,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "1.0"
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
                                    "id": "obj-yaw-umenu-curve",
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        210,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        "int",
                                        "",
                                        ""
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "linear",
                                        "exponential",
                                        "custom"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-plus1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        30,
                                        240,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
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
                                    "patching_rect": [
                                        200,
                                        210,
                                        180,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        250,
                                        200,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale 0.0 90.0 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-scale-exp",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        280,
                                        220,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "scale 0.0 90.0 0.0 1.0 3.0"
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
                                    "id": "obj-yaw-flonum-exp",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        500,
                                        280,
                                        50,
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
                                    "id": "obj-yaw-default-exp",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        500,
                                        60,
                                        40,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "3.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-function",
                                    "maxclass": "function",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        430,
                                        210,
                                        180,
                                        80
                                    ],
                                    "outlettype": [
                                        "float",
                                        "",
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-msg-setdomain",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        120,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "domain 0.0 90.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-msg-setrange",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        145,
                                        100,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "setrange 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-merge",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        320,
                                        30,
                                        22
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-outmin",
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
                                    "id": "obj-yaw-flonum-outmin",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        30,
                                        290,
                                        60,
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
                                    "id": "obj-yaw-comment-outmax",
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
                                    "id": "obj-yaw-flonum-outmax",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        100,
                                        290,
                                        60,
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
                                    "id": "obj-yaw-clip-toggle",
                                    "maxclass": "textbutton",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "patching_rect": [
                                        30,
                                        330,
                                        60,
                                        22
                                    ],
                                    "outlettype": [
                                        "",
                                        "",
                                        "int"
                                    ],
                                    "text": "Clip Off",
                                    "parameter_enable": 0,
                                    "mode": 1,
                                    "texton": "Clip On"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-gate-clip-on",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        200,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        280,
                                        360,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        200,
                                        390,
                                        70,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clip 0.0 1.0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-not-clip",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        280,
                                        330,
                                        35,
                                        22
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "== 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-comment-mapped",
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
                                    "id": "obj-yaw-flonum-mapped",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        200,
                                        440,
                                        60,
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
                                    "id": "obj-yaw-send-mapped",
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
                                    "id": "obj-yaw-outlet",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        200,
                                        500,
                                        30,
                                        30
                                    ],
                                    "comment": "mapped yaw"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-yaw-pak-setdomain",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        400,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        530,
                                        170,
                                        120,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
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
                                    "patching_rect": [
                                        520,
                                        60,
                                        25,
                                        22
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-yaw-gate-clip-on",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-clip-toggle",
                                        2
                                    ],
                                    "destination": [
                                        "obj-yaw-not-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-default-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-umenu-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-default-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-default-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-default-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-default-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-default-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-pak-setdomain",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-pak-setdomain",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-outlet",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-mapped",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-send-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-clip",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-pak-setrange",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-outmax",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-clip",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-pak-setrange",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-flonum-outmin",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-function",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-gate-clip-off",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-mapped",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-gate-clip-on",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-clip",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-gate-curve",
                                        2
                                    ],
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-gate-curve",
                                        1
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-gate-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-scale-linear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-gate-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-gate-curve",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-inlet",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-gate-learn",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-learn-btn",
                                        2
                                    ],
                                    "destination": [
                                        "obj-yaw-gate-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-learn-btn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-sel-learn",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-default-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-default-exp",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-default-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-default-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-default-outmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-default-outmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-msg-setdomain",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-loadbang",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-msg-setrange",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-maximum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-inmax",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-gate-clip-off",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-merge",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-gate-clip-on",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-minimum",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-flonum-inmin",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-maximum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-msg-clear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-minimum",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-msg-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-msg-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-not-clip",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-gate-clip-off",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-pak-setdomain",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-pak-setrange",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-function",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-plus1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-gate-curve",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-scale-exp",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-scale-linear",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-merge",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-sel-learn",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-msg-clear",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-yaw-umenu-curve",
                                        0
                                    ],
                                    "destination": [
                                        "obj-yaw-plus1",
                                        0
                                    ]
                                }
                            }
                        ],
                        "rect": [
                            0,
                            0,
                            700,
                            550
                        ]
                    }
                }
            },
            {
                "box": {
                    "id": "obj-prepend-mapped-yaw",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        1180,
                        1070,
                        80,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "prepend yaw"
                }
            },
            {
                "box": {
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
                    "text": "=== TRIGGERS (placeholder) ===",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-outlet-status",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        0,
                        1200,
                        30,
                        30
                    ],
                    "comment": "status: connected-usb, connected-wifi, switching, disconnected"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-raw-accel",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        100,
                        1200,
                        30,
                        30
                    ],
                    "comment": "raw accelerometer: aX aY aZ (g)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-raw-gyro",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        200,
                        1200,
                        30,
                        30
                    ],
                    "comment": "raw gyroscope: gX gY gZ (dps)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-raw-orient",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300,
                        1200,
                        30,
                        30
                    ],
                    "comment": "raw orientation: pitch roll yaw (degrees)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-cal-accel",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        400,
                        1200,
                        30,
                        30
                    ],
                    "comment": "calibrated accelerometer: aX aY aZ (g)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-cal-gyro",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        500,
                        1200,
                        30,
                        30
                    ],
                    "comment": "calibrated gyroscope: gX gY gZ (dps)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-cal-orient",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        600,
                        1200,
                        30,
                        30
                    ],
                    "comment": "calibrated orientation: pitch roll yaw (degrees)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-smooth-accel",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        700,
                        1200,
                        30,
                        30
                    ],
                    "comment": "smoothed accelerometer: aX aY aZ (g)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-smooth-gyro",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        800,
                        1200,
                        30,
                        30
                    ],
                    "comment": "smoothed gyroscope: gX gY gZ (dps)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-smooth-orient",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        900,
                        1200,
                        30,
                        30
                    ],
                    "comment": "smoothed orientation: pitch roll yaw (degrees)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-mapped",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1000,
                        1200,
                        30,
                        30
                    ],
                    "comment": "mapped values: axis_name value (normalized)"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-quaternion",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1100,
                        1200,
                        30,
                        30
                    ],
                    "comment": "quaternion: qX qY qZ qW"
                }
            },
            {
                "box": {
                    "id": "obj-outlet-triggers",
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1200,
                        1200,
                        30,
                        30
                    ],
                    "comment": "threshold triggers: axis_name bang/direction"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-cal-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        900,
                        330,
                        110,
                        22
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "prepend cal_status"
                }
            },
            {
                "box": {
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
                    "text": "imu-sensor abstraction",
                    "fontface": 1,
                    "fontsize": 14.0
                }
            },
            {
                "box": {
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
                    "text": "=== DATA ROUTING ===",
                    "fontface": 1
                }
            },
            {
                "box": {
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
                    "text": "=== OUTLETS (left=0 to right=12) ===",
                    "fontface": 1
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "obj-patcherargs",
                        1
                    ],
                    "destination": [
                        "obj-route-attrs",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-attrs",
                        0
                    ],
                    "destination": [
                        "obj-prepend-smooth-init",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-attrs",
                        1
                    ],
                    "destination": [
                        "obj-prepend-transport-init",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-attrs",
                        2
                    ],
                    "destination": [
                        "obj-prepend-ip-init",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-attrs",
                        3
                    ],
                    "destination": [
                        "obj-prepend-udpport-init",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-loadbang",
                        0
                    ],
                    "destination": [
                        "obj-deferlow-init",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-deferlow-init",
                        0
                    ],
                    "destination": [
                        "obj-msg-auto-connect",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-inlet-ctrl",
                        0
                    ],
                    "destination": [
                        "obj-route-ctrl",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-ctrl",
                        0
                    ],
                    "destination": [
                        "obj-route-smooth",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-smooth",
                        0
                    ],
                    "destination": [
                        "obj-prepend-smooth-global",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-global",
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
                        "obj-route-smooth",
                        1
                    ],
                    "destination": [
                        "obj-prepend-smooth-accel_group",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-accel_group",
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
                        "obj-route-smooth",
                        2
                    ],
                    "destination": [
                        "obj-prepend-smooth-gyro_group",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-gyro_group",
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
                        "obj-route-smooth",
                        3
                    ],
                    "destination": [
                        "obj-prepend-smooth-orient_group",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-orient_group",
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
                        "obj-route-smooth",
                        4
                    ],
                    "destination": [
                        "obj-prepend-smooth-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-ax",
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
                        "obj-route-smooth",
                        5
                    ],
                    "destination": [
                        "obj-prepend-smooth-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-ay",
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
                        "obj-route-smooth",
                        6
                    ],
                    "destination": [
                        "obj-prepend-smooth-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-az",
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
                        "obj-route-smooth",
                        7
                    ],
                    "destination": [
                        "obj-prepend-smooth-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-gx",
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
                        "obj-route-smooth",
                        8
                    ],
                    "destination": [
                        "obj-prepend-smooth-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-gy",
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
                        "obj-route-smooth",
                        9
                    ],
                    "destination": [
                        "obj-prepend-smooth-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-gz",
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
                        "obj-route-smooth",
                        10
                    ],
                    "destination": [
                        "obj-prepend-smooth-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-pitch",
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
                        "obj-route-smooth",
                        11
                    ],
                    "destination": [
                        "obj-prepend-smooth-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-roll",
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
                        "obj-route-smooth",
                        12
                    ],
                    "destination": [
                        "obj-prepend-smooth-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-smooth-yaw",
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
                        "obj-route-ctrl",
                        2
                    ],
                    "destination": [
                        "obj-prepend-transport",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-transport",
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
                        "obj-route-ctrl",
                        3
                    ],
                    "destination": [
                        "obj-prepend-calibrate",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-calibrate",
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
                        "obj-route-ctrl",
                        4
                    ],
                    "destination": [
                        "obj-prepend-orient-reset",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-orient-reset",
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
                        "obj-route-ctrl",
                        5
                    ],
                    "destination": [
                        "obj-prepend-orient-restore",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-orient-restore",
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
                        "obj-route-ctrl",
                        7
                    ],
                    "destination": [
                        "obj-prepend-connect",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-connect",
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
                        "obj-route-ctrl",
                        8
                    ],
                    "destination": [
                        "obj-prepend-disconnect",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-disconnect",
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
                        "obj-route-ctrl",
                        1
                    ],
                    "destination": [
                        "obj-prepend-threshold",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-threshold",
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
                        "obj-route-ctrl",
                        6
                    ],
                    "destination": [
                        "obj-prepend-mapping",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapping",
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
                        "obj-msg-auto-connect",
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
                        "obj-prepend-smooth-init",
                        0
                    ],
                    "destination": [
                        "obj-deferlow-attrs",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-deferlow-attrs",
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
                        "obj-prepend-transport-init",
                        0
                    ],
                    "destination": [
                        "obj-deferlow-attrs2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-deferlow-attrs2",
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
                        "obj-prepend-ip-init",
                        0
                    ],
                    "destination": [
                        "obj-deferlow-attrs3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-deferlow-attrs3",
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
                        "obj-prepend-udpport-init",
                        0
                    ],
                    "destination": [
                        "obj-deferlow-attrs4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-deferlow-attrs4",
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
                        "obj-nodescript",
                        0
                    ],
                    "destination": [
                        "obj-route-node",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        0
                    ],
                    "destination": [
                        "obj-thru-raw-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        1
                    ],
                    "destination": [
                        "obj-thru-raw-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        2
                    ],
                    "destination": [
                        "obj-thru-raw-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        4
                    ],
                    "destination": [
                        "obj-thru-cal-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        5
                    ],
                    "destination": [
                        "obj-thru-cal-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        6
                    ],
                    "destination": [
                        "obj-thru-cal-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        11
                    ],
                    "destination": [
                        "obj-thru-smooth-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        12
                    ],
                    "destination": [
                        "obj-thru-smooth-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        13
                    ],
                    "destination": [
                        "obj-thru-smooth-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-umenu-transport",
                        0
                    ],
                    "destination": [
                        "obj-sel-transport",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sel-transport",
                        0
                    ],
                    "destination": [
                        "obj-msg-transport-usb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sel-transport",
                        1
                    ],
                    "destination": [
                        "obj-msg-transport-wifi",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sel-transport",
                        2
                    ],
                    "destination": [
                        "obj-msg-transport-auto",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-msg-transport-usb",
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
                        "obj-msg-transport-wifi",
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
                        "obj-msg-transport-auto",
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
                        "obj-thru-raw-orient",
                        0
                    ],
                    "destination": [
                        "obj-unpack-orient-quat",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-orient-quat",
                        0
                    ],
                    "destination": [
                        "obj-pack-euler-raw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-orient-quat",
                        1
                    ],
                    "destination": [
                        "obj-pack-euler-raw",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-orient-quat",
                        2
                    ],
                    "destination": [
                        "obj-pack-euler-raw",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-pack-euler-raw",
                        0
                    ],
                    "destination": [
                        "obj-euler2quat-raw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-euler2quat-raw",
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
                        "obj-pack-quat-out",
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
                        "obj-pack-quat-out",
                        1
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
                        "obj-pack-quat-out",
                        2
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
                        "obj-pack-quat-out",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-smooth-orient",
                        0
                    ],
                    "destination": [
                        "obj-unpack-smooth-orient-quat",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-orient-quat",
                        0
                    ],
                    "destination": [
                        "obj-pack-euler-smooth",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-orient-quat",
                        1
                    ],
                    "destination": [
                        "obj-pack-euler-smooth",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-orient-quat",
                        2
                    ],
                    "destination": [
                        "obj-pack-euler-smooth",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-pack-euler-smooth",
                        0
                    ],
                    "destination": [
                        "obj-euler2quat-smooth",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-euler2quat-smooth",
                        0
                    ],
                    "destination": [
                        "obj-send-quat-smooth",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-smooth-accel",
                        0
                    ],
                    "destination": [
                        "obj-unpack-smooth-accel-map",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-smooth-gyro",
                        0
                    ],
                    "destination": [
                        "obj-unpack-smooth-gyro-map",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-smooth-orient",
                        1
                    ],
                    "destination": [
                        "obj-unpack-smooth-orient-map",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-accel-map",
                        0
                    ],
                    "destination": [
                        "obj-p-map-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-ax",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-ax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-ax",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-accel-map",
                        1
                    ],
                    "destination": [
                        "obj-p-map-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-ay",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-ay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-ay",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-accel-map",
                        2
                    ],
                    "destination": [
                        "obj-p-map-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-az",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-az",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-az",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-gyro-map",
                        0
                    ],
                    "destination": [
                        "obj-p-map-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-gx",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-gx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-gx",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-gyro-map",
                        1
                    ],
                    "destination": [
                        "obj-p-map-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-gy",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-gy",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-gy",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-gyro-map",
                        2
                    ],
                    "destination": [
                        "obj-p-map-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-gz",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-gz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-gz",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-orient-map",
                        0
                    ],
                    "destination": [
                        "obj-p-map-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-pitch",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-pitch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-pitch",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-orient-map",
                        1
                    ],
                    "destination": [
                        "obj-p-map-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-roll",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-roll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-roll",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-unpack-smooth-orient-map",
                        2
                    ],
                    "destination": [
                        "obj-p-map-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-map-yaw",
                        0
                    ],
                    "destination": [
                        "obj-prepend-mapped-yaw",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-mapped-yaw",
                        0
                    ],
                    "destination": [
                        "obj-join-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-node",
                        3
                    ],
                    "destination": [
                        "obj-outlet-status",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-raw-accel",
                        1
                    ],
                    "destination": [
                        "obj-outlet-raw-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-raw-gyro",
                        1
                    ],
                    "destination": [
                        "obj-outlet-raw-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-raw-orient",
                        1
                    ],
                    "destination": [
                        "obj-outlet-raw-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-cal-accel",
                        1
                    ],
                    "destination": [
                        "obj-outlet-cal-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-cal-gyro",
                        1
                    ],
                    "destination": [
                        "obj-outlet-cal-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-cal-orient",
                        1
                    ],
                    "destination": [
                        "obj-outlet-cal-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-smooth-accel",
                        1
                    ],
                    "destination": [
                        "obj-outlet-smooth-accel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-smooth-gyro",
                        1
                    ],
                    "destination": [
                        "obj-outlet-smooth-gyro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-thru-smooth-orient",
                        1
                    ],
                    "destination": [
                        "obj-outlet-smooth-orient",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-join-mapped",
                        0
                    ],
                    "destination": [
                        "obj-outlet-mapped",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-pack-quat-out",
                        0
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
                        "obj-route-node",
                        7
                    ],
                    "destination": [
                        "obj-prepend-cal-status",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-prepend-cal-status",
                        0
                    ],
                    "destination": [
                        "obj-outlet-status",
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