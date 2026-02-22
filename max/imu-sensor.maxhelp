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
            95,
            1200,
            932
        ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        20,
                        800,
                        29
                    ],
                    "text": "imu-sensor -- IMU Sensor Pipeline for Arduino LSM6DS3"
                }
            },
            {
                "box": {
                    "fontsize": 13,
                    "id": "obj-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        55,
                        900,
                        21
                    ],
                    "text": "Reads accelerometer + gyroscope data via USB or WiFi, with calibration, smoothing, mapping, quaternion output, threshold triggers, and normalization"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-args-info",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        80,
                        700,
                        19
                    ],
                    "text": "Arguments: port_name (optional, e.g. /dev/tty.usbmodem1234) | Attributes: @smooth, @transport, @ip, @udpport | Messages: normalize, smoothing, threshold, transport, calibrate, mapping, connect, disconnect",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16,
                    "id": "obj-section-basic",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        120,
                        300,
                        24
                    ],
                    "text": "Basic Usage"
                }
            },
            {
                "box": {
                    "id": "obj-inlet-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        148,
                        526,
                        20
                    ],
                    "text": "Inlet: control messages (normalize, smoothing, threshold, transport, calibrate, mapping, connect, disconnect)",
                    "textcolor": [
                        0.2,
                        0.2,
                        0.6,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-imu-basic",
                    "maxclass": "newobj",
                    "numinlets": 1,
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
                        20,
                        175,
                        1100,
                        22
                    ],
                    "text": "imu-sensor"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet0-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        230,
                        80,
                        18
                    ],
                    "text": "0: status"
                }
            },
            {
                "box": {
                    "id": "obj-print-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        210,
                        75,
                        22
                    ],
                    "text": "print status"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet0-desc",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        248,
                        80,
                        47
                    ],
                    "text": "connected-usb\nconnected-wifi\nswitching\ndisconnected"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet1-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        105,
                        230,
                        80,
                        18
                    ],
                    "text": "1: raw_accel"
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        105,
                        210,
                        89,
                        22
                    ],
                    "text": "print raw_accel"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet1-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        105,
                        248,
                        80,
                        27
                    ],
                    "text": "3 floats: aX aY aZ\nrange -2..2 g"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet2-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        195,
                        230,
                        80,
                        18
                    ],
                    "text": "2: raw_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        195,
                        210,
                        85,
                        22
                    ],
                    "text": "print raw_gyro"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet2-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        195,
                        248,
                        90,
                        27
                    ],
                    "text": "3 floats: gX gY gZ\nrange -250..250 dps"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet3-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        290,
                        230,
                        90,
                        18
                    ],
                    "text": "3: raw_orient"
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        290,
                        210,
                        91,
                        22
                    ],
                    "text": "print raw_orient"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet3-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        290,
                        248,
                        96,
                        27
                    ],
                    "text": "3 floats: pitch roll yaw\ndegrees"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet4-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        385,
                        230,
                        80,
                        18
                    ],
                    "text": "4: cal_accel"
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        385,
                        210,
                        85,
                        22
                    ],
                    "text": "print cal_accel"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet4-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        385,
                        248,
                        90,
                        27
                    ],
                    "text": "3 floats: calibrated\naX aY aZ (g)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet5-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        475,
                        230,
                        80,
                        18
                    ],
                    "text": "5: cal_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        475,
                        210,
                        82,
                        22
                    ],
                    "text": "print cal_gyro"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet5-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        475,
                        248,
                        90,
                        27
                    ],
                    "text": "3 floats: calibrated\ngX gY gZ (dps)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet6-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        565,
                        230,
                        90,
                        18
                    ],
                    "text": "6: cal_orient"
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        565,
                        210,
                        90,
                        22
                    ],
                    "text": "print cal_orient"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet6-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        565,
                        248,
                        90,
                        27
                    ],
                    "text": "3 floats: calibrated\npitch roll yaw (deg)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet7-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        660,
                        230,
                        90,
                        18
                    ],
                    "text": "7: smooth_accel"
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        660,
                        210,
                        109,
                        22
                    ],
                    "text": "print smooth_accel"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet7-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        660,
                        248,
                        90,
                        27
                    ],
                    "text": "3 floats: smoothed\naX aY aZ (g)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet8-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        755,
                        230,
                        90,
                        18
                    ],
                    "text": "8: smooth_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        755,
                        210,
                        105,
                        22
                    ],
                    "text": "print smooth_gyro"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet8-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        755,
                        248,
                        90,
                        27
                    ],
                    "text": "3 floats: smoothed\ngX gY gZ (dps)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet9-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        230,
                        95,
                        18
                    ],
                    "text": "9: smooth_orient"
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        210,
                        111,
                        22
                    ],
                    "text": "print smooth_orient"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet9-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        248,
                        95,
                        27
                    ],
                    "text": "3 floats: smoothed\npitch roll yaw (deg)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet10-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        950,
                        230,
                        70,
                        18
                    ],
                    "text": "10: mapped"
                }
            },
            {
                "box": {
                    "id": "obj-print-mapped",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        950,
                        210,
                        82,
                        22
                    ],
                    "text": "print mapped"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet10-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        950,
                        248,
                        75,
                        27
                    ],
                    "text": "tagged: axis val\ne.g. pitch 0.72"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet11-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1030,
                        230,
                        80,
                        18
                    ],
                    "text": "11: quaternion"
                }
            },
            {
                "box": {
                    "id": "obj-print-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1030,
                        210,
                        92,
                        22
                    ],
                    "text": "print quaternion"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet11-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1030,
                        248,
                        80,
                        27
                    ],
                    "text": "4 floats:\nqX qY qZ qW"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet12-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1115,
                        230,
                        75,
                        18
                    ],
                    "text": "12: triggers"
                }
            },
            {
                "box": {
                    "id": "obj-print-triggers",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1115,
                        210,
                        80,
                        22
                    ],
                    "text": "print triggers"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet12-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1115,
                        248,
                        86,
                        27
                    ],
                    "text": "axis direction\ne.g. pitch up"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet13-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        308,
                        100,
                        18
                    ],
                    "text": "13: norm_accel"
                }
            },
            {
                "box": {
                    "id": "obj-print-norm-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        290,
                        105,
                        22
                    ],
                    "text": "print norm_accel"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet13-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        326,
                        100,
                        27
                    ],
                    "text": "3 floats: aX aY aZ\nnormalized 0.0-1.0"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet14-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        130,
                        308,
                        100,
                        18
                    ],
                    "text": "14: norm_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-print-norm-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        130,
                        290,
                        100,
                        22
                    ],
                    "text": "print norm_gyro"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet14-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        130,
                        326,
                        100,
                        27
                    ],
                    "text": "3 floats: gX gY gZ\nnormalized 0.0-1.0"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-outlet15-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        240,
                        308,
                        100,
                        18
                    ],
                    "text": "15: norm_orient"
                }
            },
            {
                "box": {
                    "id": "obj-print-norm-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        240,
                        290,
                        107,
                        22
                    ],
                    "text": "print norm_orient"
                }
            },
            {
                "box": {
                    "fontsize": 9,
                    "id": "obj-outlet15-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        240,
                        326,
                        115,
                        27
                    ],
                    "text": "3 floats: pitch roll yaw\nnormalized 0.0-1.0"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16,
                    "id": "obj-section-messages",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        380,
                        300,
                        24
                    ],
                    "text": "Message Reference"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-transport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        408,
                        200,
                        20
                    ],
                    "text": "-- Transport --"
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
                        20,
                        430,
                        100,
                        22
                    ],
                    "text": "transport usb"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-transport-usb-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        125,
                        430,
                        200,
                        19
                    ],
                    "text": "Switch to USB serial (default)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
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
                        20,
                        455,
                        100,
                        22
                    ],
                    "text": "transport wifi"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-transport-wifi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        125,
                        455,
                        200,
                        19
                    ],
                    "text": "Switch to WiFi UDP",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
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
                        20,
                        480,
                        100,
                        22
                    ],
                    "text": "transport auto"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-transport-auto-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        125,
                        480,
                        250,
                        19
                    ],
                    "text": "Try USB first, fall back to WiFi after 5s",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-connection",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        510,
                        200,
                        20
                    ],
                    "text": "-- Connection --"
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
                        532,
                        55,
                        22
                    ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-connect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        80,
                        532,
                        250,
                        19
                    ],
                    "text": "Auto-scan for Arduino on USB ports",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect-port",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        557,
                        181,
                        22
                    ],
                    "text": "connect /dev/tty.usbmodem1234"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-connect-port-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        210,
                        557,
                        200,
                        19
                    ],
                    "text": "Connect to specific serial port",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
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
                        20,
                        582,
                        72,
                        22
                    ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-disconnect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        100,
                        582,
                        250,
                        19
                    ],
                    "text": "Stop all transports (USB + WiFi)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-calibration",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        400,
                        408,
                        200,
                        20
                    ],
                    "text": "-- Calibration --"
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
                        400,
                        430,
                        60,
                        22
                    ],
                    "text": "calibrate"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-calibrate-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        468,
                        430,
                        300,
                        19
                    ],
                    "text": "Start calibration (hold board still for ~2 sec)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-orient-reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400,
                        455,
                        78,
                        22
                    ],
                    "text": "orient_reset"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-orient-reset-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        484,
                        455,
                        250,
                        19
                    ],
                    "text": "Zero current orientation as reference",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-orient-restore",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400,
                        480,
                        92,
                        22
                    ],
                    "text": "orient_restore"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-orient-restore-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        498,
                        480,
                        250,
                        19
                    ],
                    "text": "Restore original orientation reference",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-smoothing",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        400,
                        510,
                        225,
                        20
                    ],
                    "text": "-- Smoothing (0.0 = none, 1.0 = max) --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-global",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400,
                        532,
                        130,
                        22
                    ],
                    "text": "smoothing global 0.5"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-smooth-global-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        540,
                        532,
                        250,
                        19
                    ],
                    "text": "Set smoothing for all axes at once",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-group",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400,
                        557,
                        165,
                        22
                    ],
                    "text": "smoothing accel_group 0.3"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-smooth-group-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        575,
                        557,
                        250,
                        19
                    ],
                    "text": "Set smoothing for a sensor group",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-axis",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400,
                        582,
                        135,
                        22
                    ],
                    "text": "smoothing pitch 0.7"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-smooth-axis-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        545,
                        582,
                        250,
                        19
                    ],
                    "text": "Set smoothing for one axis (highest tier wins)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-normalize",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        400,
                        610,
                        200,
                        20
                    ],
                    "text": "-- Normalization --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-normalize-on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400,
                        632,
                        84,
                        22
                    ],
                    "text": "normalize 1"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-normalize-on-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        490,
                        632,
                        300,
                        19
                    ],
                    "text": "Enable normalized 0-1 output on outlets 13-15",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-normalize-off",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400,
                        657,
                        84,
                        22
                    ],
                    "text": "normalize 0"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-normalize-off-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        490,
                        657,
                        300,
                        19
                    ],
                    "text": "Disable normalization (outlets 13-15 go silent)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-threshold",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        800,
                        408,
                        200,
                        20
                    ],
                    "text": "-- Thresholds --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-threshold-basic",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        430,
                        125,
                        22
                    ],
                    "text": "threshold pitch 45"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-threshold-basic-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        932,
                        430,
                        250,
                        19
                    ],
                    "text": "Fire trigger when pitch crosses 45 degrees",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-threshold-hyst",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        455,
                        150,
                        22
                    ],
                    "text": "threshold pitch 45 5"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-threshold-hyst-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        958,
                        455,
                        240,
                        19
                    ],
                    "text": "With 5-degree hysteresis band (positional)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-mapping",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        800,
                        490,
                        200,
                        20
                    ],
                    "text": "-- Mapping --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-inrange",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        512,
                        160,
                        22
                    ],
                    "text": "mapping pitch inrange 0 90"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-map-inrange-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        968,
                        512,
                        200,
                        19
                    ],
                    "text": "Set input range for pitch mapping",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-outrange",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        537,
                        165,
                        22
                    ],
                    "text": "mapping pitch outrange 0 1"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-map-outrange-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        973,
                        537,
                        200,
                        19
                    ],
                    "text": "Set output range (0-1 normalized)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-curve",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        562,
                        195,
                        22
                    ],
                    "text": "mapping pitch curve exponential"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-map-curve-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1003,
                        562,
                        200,
                        19
                    ],
                    "text": "Curve: linear, exponential, logarithmic",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-wifi",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        800,
                        590,
                        200,
                        20
                    ],
                    "text": "-- WiFi Configuration --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-ip",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        612,
                        115,
                        22
                    ],
                    "text": "ip 192.168.1.50"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-ip-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        923,
                        612,
                        250,
                        19
                    ],
                    "text": "Set Arduino IP address for WiFi UDP",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-udpport",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        637,
                        90,
                        22
                    ],
                    "text": "udpport 8889"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-msg-udpport-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        898,
                        637,
                        250,
                        19
                    ],
                    "text": "Set UDP listen port (default 8889)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16,
                    "id": "obj-section-testsignal",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        680,
                        500,
                        24
                    ],
                    "text": "Test Signal Generator -- No Hardware Required"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        708,
                        700,
                        19
                    ],
                    "text": "Generates simulated sensor data matching real Arduino ranges. Toggle on to see what live data looks like without connecting hardware.",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        20,
                        735,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-toggle-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50,
                        737,
                        150,
                        20
                    ],
                    "text": "Simulate Sensor Data"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        20,
                        765,
                        55,
                        22
                    ],
                    "text": "metro 9"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-metro-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        80,
                        765,
                        200,
                        19
                    ],
                    "text": "~111 Hz (close to real 114 Hz rate)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-counter",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [
                        "int",
                        "",
                        "",
                        "int"
                    ],
                    "patching_rect": [
                        20,
                        792,
                        105,
                        22
                    ],
                    "text": "counter 0 0 36000"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-todeg",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        20,
                        819,
                        42,
                        22
                    ],
                    "text": "* 0.1"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-todeg-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        68,
                        819,
                        200,
                        19
                    ],
                    "text": "slow counter in degrees (0-3600)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-torad",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        20,
                        846,
                        72,
                        22
                    ],
                    "text": "* 0.017453"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-torad-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        98,
                        846,
                        200,
                        19
                    ],
                    "text": "degrees to radians (pi/180)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11,
                    "id": "obj-testsig-header-accel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        880,
                        300,
                        19
                    ],
                    "text": "Accelerometer (range: -2..2 g)"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-ax-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        902,
                        175,
                        22
                    ],
                    "text": "expr sin($f1 * 0.05) * 1.5"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-ax-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        200,
                        902,
                        200,
                        19
                    ],
                    "text": "aX: slow gentle tilt",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-ay-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        927,
                        175,
                        22
                    ],
                    "text": "expr cos($f1 * 0.03) * 0.5"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-ay-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        200,
                        927,
                        200,
                        19
                    ],
                    "text": "aY: cross-axis sway",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-az-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        952,
                        215,
                        22
                    ],
                    "text": "expr 1. + sin($f1 * 0.02) * 0.3"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-az-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        240,
                        952,
                        200,
                        19
                    ],
                    "text": "aZ: gravity + small variation",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-accel-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        980,
                        70,
                        22
                    ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-accel-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1005,
                        121,
                        22
                    ],
                    "text": "print [sim]_raw_accel"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11,
                    "id": "obj-testsig-header-gyro",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        350,
                        880,
                        300,
                        19
                    ],
                    "text": "Gyroscope (range: -250..250 dps)"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gx-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        350,
                        902,
                        170,
                        22
                    ],
                    "text": "expr sin($f1 * 0.08) * 50."
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-gx-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        525,
                        902,
                        200,
                        19
                    ],
                    "text": "gX: moderate rotation rate",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gy-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        350,
                        927,
                        170,
                        22
                    ],
                    "text": "expr cos($f1 * 0.06) * 30."
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-gy-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        525,
                        927,
                        200,
                        19
                    ],
                    "text": "gY: gentle rotation",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gz-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        350,
                        952,
                        170,
                        22
                    ],
                    "text": "expr sin($f1 * 0.04) * 20."
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-gz-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        525,
                        952,
                        200,
                        19
                    ],
                    "text": "gZ: slow rotation",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gyro-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        350,
                        980,
                        70,
                        22
                    ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gyro-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        350,
                        1005,
                        117,
                        22
                    ],
                    "text": "print [sim]_raw_gyro"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11,
                    "id": "obj-testsig-header-orient",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        680,
                        880,
                        300,
                        19
                    ],
                    "text": "Orientation (degrees)"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-pitch-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        680,
                        902,
                        220,
                        22
                    ],
                    "text": "expr sin($f1 * 0.03) * 45. + 45."
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-pitch-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        905,
                        902,
                        200,
                        19
                    ],
                    "text": "pitch: 0-90 degree sweep",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-roll-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        680,
                        927,
                        220,
                        22
                    ],
                    "text": "expr cos($f1 * 0.02) * 45. + 45."
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-roll-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        905,
                        927,
                        200,
                        19
                    ],
                    "text": "roll: 0-90 degree sweep",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-yaw-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        680,
                        952,
                        190,
                        22
                    ],
                    "text": "expr fmod($f1 * 0.5\\, 360.)"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-testsig-yaw-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        875,
                        952,
                        200,
                        19
                    ],
                    "text": "yaw: 0-360 slow rotation",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-orient-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        680,
                        980,
                        70,
                        22
                    ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-orient-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        680,
                        1005,
                        127,
                        22
                    ],
                    "text": "print [sim]_raw_orient"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16,
                    "id": "obj-section-recipe1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1050,
                        600,
                        24
                    ],
                    "text": "Recipe 1: Tilt-to-Filter (Continuous Control)"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-recipe1-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1078,
                        700,
                        19
                    ],
                    "text": "Map board tilt to filter parameters -- pitch controls cutoff frequency, roll controls resonance. Great for live performance filtering.",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "bgcolor": [
                        0.9,
                        0.9,
                        0.9,
                        1
                    ],
                    "fontface": 1,
                    "id": "obj-recipe1-imu",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1105,
                        1100,
                        20
                    ],
                    "text": "[imu-sensor @smooth 0.5]",
                    "textcolor": [
                        0.2,
                        0.2,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe1-outlet-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        1130,
                        200,
                        18
                    ],
                    "text": "outlet 9: smooth_orientation",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        850,
                        1150,
                        85,
                        22
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-recipe1-pitch-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        1175,
                        50,
                        20
                    ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-recipe1-roll-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        920,
                        1175,
                        40,
                        20
                    ],
                    "text": "roll"
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-scale-cutoff",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        850,
                        1198,
                        140,
                        22
                    ],
                    "text": "scale 0. 90. 200. 5000."
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe1-cutoff-label",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        1223,
                        200,
                        40
                    ],
                    "text": "Filter cutoff (200-5000 Hz)\nTilting forward/back sweeps the frequency.\nConnect to svf~ cutoff inlet.",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-scale-q",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        920,
                        1198,
                        125,
                        22
                    ],
                    "text": "scale 0. 90. 0.1 10."
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe1-q-label",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        920,
                        1223,
                        200,
                        40
                    ],
                    "text": "Filter resonance Q (0.1-10)\nTilting left/right controls resonance.\nConnect to svf~ Q inlet.",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-recipe1-num-cutoff",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        850,
                        1265,
                        65,
                        22
                    ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-recipe1-num-q",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        920,
                        1265,
                        55,
                        22
                    ]
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe1-tips",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1130,
                        400,
                        51
                    ],
                    "text": "Tips:\n- Adjust scale ranges to taste for your filter and audio material\n- Works with any MAX filter: svf~, lores~, biquad~, onepole~\n- Higher @smooth values (0.5-0.8) give smoother filter sweeps",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16,
                    "id": "obj-section-recipe2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1310,
                        600,
                        24
                    ],
                    "text": "Recipe 2: Gesture Triggers (Discrete Events)"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-recipe2-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1338,
                        700,
                        19
                    ],
                    "text": "Use threshold crossings to trigger discrete musical events -- MIDI notes, samples, effects toggles. Output on outlet 12.",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11,
                    "id": "obj-recipe2-header-thresh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1365,
                        500,
                        19
                    ],
                    "text": "Step 1: Configure thresholds (click a message to send to imu-sensor above)"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-threshold-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        1390,
                        125,
                        22
                    ],
                    "text": "threshold pitch 45"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-threshold-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        150,
                        1390,
                        350,
                        18
                    ],
                    "text": "Fire trigger when pitch crosses 45 degrees (default hysteresis 5)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-threshold-hyst-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        1420,
                        150,
                        22
                    ],
                    "text": "threshold pitch 45 10"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-threshold-hyst-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        175,
                        1420,
                        450,
                        18
                    ],
                    "text": "With 10-degree hysteresis -- prevents trigger oscillation near the boundary",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-threshold-ax-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        1450,
                        130,
                        22
                    ],
                    "text": "threshold ax 1."
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-threshold-ax-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        155,
                        1450,
                        350,
                        18
                    ],
                    "text": "Accelerometer X threshold at 1.0g (detect tilt or shake)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11,
                    "id": "obj-recipe2-header-output",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1480,
                        500,
                        19
                    ],
                    "text": "Step 2: Route trigger output from outlet 12"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-recipe2-trigger-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        660,
                        1390,
                        200,
                        18
                    ],
                    "text": "outlet 12: threshold triggers"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-trigger-format",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        660,
                        1408,
                        300,
                        18
                    ],
                    "text": "Output format: axis_name direction (e.g. pitch up, roll down)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-route-trigger",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        660,
                        1430,
                        100,
                        22
                    ],
                    "text": "route pitch roll"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-route-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        766,
                        1430,
                        300,
                        18
                    ],
                    "text": "Separate triggers by axis (add more axes as needed)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-recipe2-pitch-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        660,
                        1455,
                        60,
                        18
                    ],
                    "text": "pitch:"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-pitch-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        660,
                        1475,
                        80,
                        22
                    ],
                    "text": "sel up down"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-pitch-up-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        660,
                        1500,
                        130,
                        18
                    ],
                    "text": "Tilt past 45 degrees",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-pitch-up-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        660,
                        1520,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-pitch-down-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        720,
                        1500,
                        130,
                        18
                    ],
                    "text": "Return below threshold",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-pitch-down-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        720,
                        1520,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-midi-note",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        660,
                        1550,
                        85,
                        22
                    ],
                    "text": "note 60 127"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-midi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        750,
                        1550,
                        250,
                        18
                    ],
                    "text": "Tilt past 45 deg triggers a note-on",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe2-tips",
                    "linecount": 6,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1500,
                        500,
                        74
                    ],
                    "text": "How thresholds work:\n- Send 'threshold <axis> <value> [hysteresis]' to set a crossing point\n- Outlet 12 outputs '<axis> up' when value rises above threshold\n- Outlet 12 outputs '<axis> down' when value falls below (threshold - hysteresis)\n- Hysteresis prevents rapid on/off flickering near the boundary\n- Axes: pitch, roll, yaw (degrees), ax, ay, az (g-force)",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16,
                    "id": "obj-section-recipe3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1590,
                        600,
                        24
                    ],
                    "text": "Recipe 3: Spatial Panning (3D Audio)"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-recipe3-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1618,
                        700,
                        19
                    ],
                    "text": "Map yaw rotation to stereo pan position. Higher smoothing (0.7) reduces jitter for smooth, continuous panning.",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "bgcolor": [
                        0.9,
                        0.9,
                        0.9,
                        1
                    ],
                    "fontface": 1,
                    "id": "obj-recipe3-imu",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1645,
                        1100,
                        20
                    ],
                    "text": "[imu-sensor @smooth 0.7]",
                    "textcolor": [
                        0.2,
                        0.2,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-recipe3-orient-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        1670,
                        200,
                        18
                    ],
                    "text": "outlet 9: smooth_orientation"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        850,
                        1692,
                        85,
                        22
                    ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe3-pitch-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        1717,
                        40,
                        18
                    ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe3-roll-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        890,
                        1717,
                        30,
                        18
                    ],
                    "text": "roll"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-recipe3-yaw-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        930,
                        1717,
                        30,
                        18
                    ],
                    "text": "yaw"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-scale-pan",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        930,
                        1740,
                        140,
                        22
                    ],
                    "text": "scale 0. 360. -1. 1."
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe3-pan-desc",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        930,
                        1765,
                        250,
                        40
                    ],
                    "text": "Yaw to pan position (-1 = left, 1 = right)\nRotating left/right maps naturally to stereo pan.\nConnect to pan~ or M4L panning device.",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-recipe3-pan-num",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        930,
                        1805,
                        65,
                        22
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11,
                    "id": "obj-recipe3-quat-header",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1680,
                        400,
                        19
                    ],
                    "text": "OR use quaternion output for rotation-aware spatialization:"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10,
                    "id": "obj-recipe3-quat-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1030,
                        1670,
                        107,
                        18
                    ],
                    "text": "outlet 11: quaternion"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-unpack-quat",
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
                        1030,
                        1692,
                        85,
                        22
                    ],
                    "text": "unpack f f f f"
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe3-quat-desc",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1030,
                        1717,
                        200,
                        40
                    ],
                    "text": "qX qY qZ qW\nUse for ambisonics (IRCAM Spat~)\nor VBAP spatialization.",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontsize": 10,
                    "id": "obj-recipe3-tips",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1705,
                        450,
                        62
                    ],
                    "text": "Tips:\n- Yaw (rotation left/right) maps naturally to stereo pan\n- For full 3D spatialization, use quaternion outlet with ambisonics tools\n- Higher smoothing (0.7) reduces gyro jitter for smooth panning\n- Use imu-sensor-3dviz.maxpat to visualize board orientation in 3D",
                    "textcolor": [
                        0.2,
                        0.5,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16,
                    "id": "obj-section-config",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1850,
                        400,
                        24
                    ],
                    "text": "Configuration Examples"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-config-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1878,
                        500,
                        19
                    ],
                    "text": "Click any message box to send it to the imu-sensor object above. Common starting configurations:",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "bgcolor": [
                        0.9,
                        0.9,
                        0.9,
                        1
                    ],
                    "fontface": 1,
                    "id": "obj-config-imu",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        1905,
                        1100,
                        20
                    ],
                    "text": "[imu-sensor]",
                    "textcolor": [
                        0.2,
                        0.2,
                        0.2,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-config-transport-usb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        1940,
                        100,
                        22
                    ],
                    "text": "transport usb"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-config-transport-usb-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        125,
                        1940,
                        150,
                        19
                    ],
                    "text": "USB mode (default)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-config-transport-wifi",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        1965,
                        100,
                        22
                    ],
                    "text": "transport wifi"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-config-transport-wifi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        125,
                        1965,
                        200,
                        19
                    ],
                    "text": "WiFi mode (wireless, ~3-5ms latency)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-config-smooth",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        1990,
                        145,
                        22
                    ],
                    "text": "smoothing global 0.5"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-config-smooth-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        170,
                        1990,
                        250,
                        19
                    ],
                    "text": "Medium smoothing (good starting point)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-config-calibrate",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        2015,
                        60,
                        22
                    ],
                    "text": "calibrate"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-config-calibrate-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        85,
                        2015,
                        300,
                        19
                    ],
                    "text": "Start calibration (hold board still on flat surface)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-config-orient-reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        2040,
                        78,
                        22
                    ],
                    "text": "orient_reset"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-config-orient-reset-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        105,
                        2040,
                        300,
                        19
                    ],
                    "text": "Zero current orientation (like tare on a scale)",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-config-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        20,
                        2065,
                        55,
                        22
                    ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "fontsize": 11,
                    "id": "obj-config-connect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        80,
                        2065,
                        300,
                        19
                    ],
                    "text": "Auto-scan and connect to Arduino",
                    "textcolor": [
                        0.4,
                        0.4,
                        0.4,
                        1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-config-print-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        2100,
                        106,
                        22
                    ],
                    "text": "print config_status"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-print-cal-accel",
                        0
                    ],
                    "midpoints": [
                        389.8333333333333,
                        204,
                        394.5,
                        204
                    ],
                    "source": [
                        "obj-imu-basic",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-cal-gyro",
                        0
                    ],
                    "midpoints": [
                        479.9166666666667,
                        204,
                        484.5,
                        204
                    ],
                    "source": [
                        "obj-imu-basic",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-cal-orient",
                        0
                    ],
                    "midpoints": [
                        570,
                        207,
                        574.5,
                        207
                    ],
                    "source": [
                        "obj-imu-basic",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-mapped",
                        0
                    ],
                    "midpoints": [
                        930.3333333333334,
                        207,
                        959.5,
                        207
                    ],
                    "source": [
                        "obj-imu-basic",
                        10
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-quat",
                        0
                    ],
                    "midpoints": [
                        1020.4166666666666,
                        204,
                        1039.5,
                        204
                    ],
                    "source": [
                        "obj-imu-basic",
                        11
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-raw-accel",
                        0
                    ],
                    "midpoints": [
                        119.58333333333333,
                        207,
                        114.5,
                        207
                    ],
                    "source": [
                        "obj-imu-basic",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-raw-gyro",
                        0
                    ],
                    "midpoints": [
                        209.66666666666666,
                        207,
                        204.5,
                        207
                    ],
                    "source": [
                        "obj-imu-basic",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-raw-orient",
                        0
                    ],
                    "midpoints": [
                        299.75,
                        198,
                        299.5,
                        198
                    ],
                    "source": [
                        "obj-imu-basic",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-smooth-accel",
                        0
                    ],
                    "midpoints": [
                        660.0833333333334,
                        207,
                        669.5,
                        207
                    ],
                    "source": [
                        "obj-imu-basic",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-smooth-gyro",
                        0
                    ],
                    "midpoints": [
                        750.1666666666666,
                        204,
                        764.5,
                        204
                    ],
                    "source": [
                        "obj-imu-basic",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-smooth-orient",
                        0
                    ],
                    "midpoints": [
                        840.25,
                        204,
                        859.5,
                        204
                    ],
                    "source": [
                        "obj-imu-basic",
                        9
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-status",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        198,
                        29.5,
                        198
                    ],
                    "source": [
                        "obj-imu-basic",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-triggers",
                        0
                    ],
                    "midpoints": [
                        1110.5,
                        204,
                        1124.5,
                        204
                    ],
                    "order": 0,
                    "source": [
                        "obj-imu-basic",
                        12
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe2-route-trigger",
                        0
                    ],
                    "midpoints": [
                        1110.5,
                        1385,
                        645,
                        1385,
                        645,
                        1427,
                        669.5,
                        1427
                    ],
                    "order": 1,
                    "source": [
                        "obj-imu-basic",
                        12
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        452,
                        336,
                        452,
                        336,
                        285,
                        102,
                        285,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
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
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        554,
                        6,
                        554,
                        6,
                        171,
                        29.5,
                        171
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
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        581,
                        6,
                        581,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-connect-port",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        605,
                        6,
                        605,
                        6,
                        171,
                        29.5,
                        171
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
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        809.5,
                        635,
                        6,
                        635,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-ip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        809.5,
                        587,
                        795,
                        587,
                        795,
                        611,
                        6,
                        611,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-map-curve",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        809.5,
                        536,
                        792,
                        536,
                        792,
                        518,
                        780,
                        518,
                        780,
                        285,
                        102,
                        285,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-map-inrange",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        809.5,
                        560,
                        795,
                        560,
                        795,
                        518,
                        780,
                        518,
                        780,
                        285,
                        102,
                        285,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-map-outrange",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        479,
                        387,
                        479,
                        387,
                        285,
                        102,
                        285,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-orient-reset",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        503,
                        387,
                        503,
                        387,
                        285,
                        102,
                        285,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-orient-restore",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        614,
                        6,
                        614,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-smooth-axis",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        554,
                        387,
                        554,
                        387,
                        285,
                        102,
                        285,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-smooth-global",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        581,
                        360,
                        581,
                        360,
                        614,
                        6,
                        614,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-smooth-group",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        809.5,
                        452,
                        780,
                        452,
                        780,
                        285,
                        102,
                        285,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-threshold-basic",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        809.5,
                        479,
                        780,
                        479,
                        780,
                        285,
                        102,
                        285,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-threshold-hyst",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        503,
                        6,
                        503,
                        6,
                        171,
                        29.5,
                        171
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
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        452,
                        6,
                        452,
                        6,
                        171,
                        29.5,
                        171
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
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        479,
                        6,
                        479,
                        6,
                        171,
                        29.5,
                        171
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
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        809.5,
                        662,
                        6,
                        662,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-udpport",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe1-num-cutoff",
                        0
                    ],
                    "midpoints": [
                        859.5,
                        1220,
                        837,
                        1220,
                        837,
                        1262,
                        859.5,
                        1262
                    ],
                    "source": [
                        "obj-recipe1-scale-cutoff",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe1-num-q",
                        0
                    ],
                    "midpoints": [
                        929.5,
                        1220,
                        837,
                        1220,
                        837,
                        1298,
                        915,
                        1298,
                        915,
                        1265,
                        929.5,
                        1265
                    ],
                    "source": [
                        "obj-recipe1-scale-q",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe1-scale-cutoff",
                        0
                    ],
                    "midpoints": [
                        859.5,
                        1172,
                        846,
                        1172,
                        846,
                        1193,
                        859.5,
                        1193
                    ],
                    "source": [
                        "obj-recipe1-unpack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe1-scale-q",
                        0
                    ],
                    "midpoints": [
                        892.5,
                        1172,
                        915,
                        1172,
                        915,
                        1193,
                        929.5,
                        1193
                    ],
                    "source": [
                        "obj-recipe1-unpack",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe2-pitch-down-button",
                        0
                    ],
                    "midpoints": [
                        700,
                        1500,
                        729.5,
                        1517
                    ],
                    "source": [
                        "obj-recipe2-pitch-sel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe2-pitch-up-button",
                        0
                    ],
                    "midpoints": [
                        669.5,
                        1500,
                        669.5,
                        1517
                    ],
                    "source": [
                        "obj-recipe2-pitch-sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe2-midi-note",
                        0
                    ],
                    "midpoints": [
                        669.5,
                        1544,
                        669.5,
                        1547
                    ],
                    "source": [
                        "obj-recipe2-pitch-up-button",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe2-pitch-sel",
                        0
                    ],
                    "midpoints": [
                        669.5,
                        1455,
                        669.5,
                        1472
                    ],
                    "source": [
                        "obj-recipe2-route-trigger",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        1475,
                        6,
                        1475,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-recipe2-threshold-ax-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        1445,
                        6,
                        1445,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-recipe2-threshold-hyst-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        1415,
                        6,
                        1415,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-recipe2-threshold-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe3-pan-num",
                        0
                    ],
                    "midpoints": [
                        939.5,
                        1763,
                        927,
                        1763,
                        927,
                        1802,
                        939.5,
                        1802
                    ],
                    "source": [
                        "obj-recipe3-scale-pan",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-recipe3-scale-pan",
                        0
                    ],
                    "midpoints": [
                        925.5,
                        1736,
                        939.5,
                        1736
                    ],
                    "source": [
                        "obj-recipe3-unpack",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-accel-display",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        1004,
                        29.5,
                        1004
                    ],
                    "source": [
                        "obj-testsig-accel-pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-accel-pack",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        926,
                        6,
                        926,
                        6,
                        977,
                        29.5,
                        977
                    ],
                    "source": [
                        "obj-testsig-ax-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-accel-pack",
                        1
                    ],
                    "midpoints": [
                        29.5,
                        950,
                        15,
                        950,
                        15,
                        977,
                        55,
                        977
                    ],
                    "source": [
                        "obj-testsig-ay-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-accel-pack",
                        2
                    ],
                    "midpoints": [
                        29.5,
                        977,
                        80.5,
                        977
                    ],
                    "source": [
                        "obj-testsig-az-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-todeg",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        815,
                        29.5,
                        815
                    ],
                    "source": [
                        "obj-testsig-counter",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-gyro-pack",
                        0
                    ],
                    "midpoints": [
                        359.5,
                        926,
                        345,
                        926,
                        345,
                        923,
                        195,
                        923,
                        195,
                        947,
                        237,
                        947,
                        237,
                        986,
                        345,
                        986,
                        345,
                        977,
                        359.5,
                        977
                    ],
                    "source": [
                        "obj-testsig-gx-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-gyro-pack",
                        1
                    ],
                    "midpoints": [
                        359.5,
                        977,
                        385,
                        977
                    ],
                    "source": [
                        "obj-testsig-gy-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-gyro-display",
                        0
                    ],
                    "midpoints": [
                        359.5,
                        1004,
                        359.5,
                        1004
                    ],
                    "source": [
                        "obj-testsig-gyro-pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-gyro-pack",
                        2
                    ],
                    "midpoints": [
                        359.5,
                        977,
                        410.5,
                        977
                    ],
                    "source": [
                        "obj-testsig-gz-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-counter",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        788,
                        29.5,
                        788
                    ],
                    "source": [
                        "obj-testsig-metro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-orient-display",
                        0
                    ],
                    "midpoints": [
                        689.5,
                        1004,
                        689.5,
                        1004
                    ],
                    "source": [
                        "obj-testsig-orient-pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-orient-pack",
                        0
                    ],
                    "midpoints": [
                        689.5,
                        926,
                        675,
                        926,
                        675,
                        923,
                        522,
                        923,
                        522,
                        986,
                        675,
                        986,
                        675,
                        977,
                        689.5,
                        977
                    ],
                    "source": [
                        "obj-testsig-pitch-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-orient-pack",
                        1
                    ],
                    "midpoints": [
                        689.5,
                        977,
                        715,
                        977
                    ],
                    "source": [
                        "obj-testsig-roll-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-torad",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        842,
                        29.5,
                        842
                    ],
                    "source": [
                        "obj-testsig-todeg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-metro",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        761,
                        29.5,
                        761
                    ],
                    "source": [
                        "obj-testsig-toggle",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-ax-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        6,
                        869,
                        6,
                        899,
                        29.5,
                        899
                    ],
                    "order": 8,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-ay-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        6,
                        869,
                        6,
                        923,
                        29.5,
                        923
                    ],
                    "order": 7,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-az-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        6,
                        869,
                        6,
                        947,
                        29.5,
                        947
                    ],
                    "order": 6,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-gx-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        336,
                        869,
                        336,
                        899,
                        359.5,
                        899
                    ],
                    "order": 5,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-gy-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        6,
                        869,
                        6,
                        899,
                        195,
                        899,
                        195,
                        923,
                        359.5,
                        923
                    ],
                    "order": 4,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-gz-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        6,
                        869,
                        6,
                        1037,
                        237,
                        1037,
                        237,
                        947,
                        359.5,
                        947
                    ],
                    "order": 3,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-pitch-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        6,
                        869,
                        6,
                        1037,
                        522,
                        1037,
                        522,
                        899,
                        689.5,
                        899
                    ],
                    "order": 2,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-roll-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        6,
                        869,
                        6,
                        1037,
                        522,
                        1037,
                        522,
                        923,
                        689.5,
                        923
                    ],
                    "order": 1,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-yaw-expr",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        869,
                        6,
                        869,
                        6,
                        1037,
                        522,
                        1037,
                        522,
                        947,
                        689.5,
                        947
                    ],
                    "order": 0,
                    "source": [
                        "obj-testsig-torad",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-testsig-orient-pack",
                        2
                    ],
                    "midpoints": [
                        689.5,
                        977,
                        740.5,
                        977
                    ],
                    "source": [
                        "obj-testsig-yaw-expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-norm-accel",
                        0
                    ],
                    "midpoints": [
                        29.5,
                        285,
                        29.5,
                        285
                    ],
                    "source": [
                        "obj-imu-basic",
                        13
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-norm-gyro",
                        0
                    ],
                    "midpoints": [
                        119.5,
                        285,
                        139.5,
                        285
                    ],
                    "source": [
                        "obj-imu-basic",
                        14
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print-norm-orient",
                        0
                    ],
                    "midpoints": [
                        209.5,
                        285,
                        249.5,
                        285
                    ],
                    "source": [
                        "obj-imu-basic",
                        15
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        654,
                        387,
                        654,
                        387,
                        365,
                        102,
                        365,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-normalize-on",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-imu-basic",
                        0
                    ],
                    "midpoints": [
                        409.5,
                        679,
                        387,
                        679,
                        387,
                        365,
                        102,
                        365,
                        102,
                        377,
                        6,
                        377,
                        6,
                        171,
                        29.5,
                        171
                    ],
                    "source": [
                        "obj-msg-normalize-off",
                        0
                    ]
                }
            }
        ],
        "autosave": 0
    }
}
