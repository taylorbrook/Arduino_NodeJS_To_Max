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
        "rect": [50, 50, 1200, 2800],
        "openinpresentation": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 20, 800, 30],
                    "text": "imu-sensor -- IMU Sensor Pipeline for Arduino Uno WiFi R2",
                    "fontsize": 20,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 55, 900, 22],
                    "text": "Reads accelerometer + gyroscope data via USB or WiFi, with calibration, smoothing, mapping, quaternion output, and threshold triggers",
                    "fontsize": 13
                }
            },
            {
                "box": {
                    "id": "obj-args-info",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 80, 700, 20],
                    "text": "Arguments: port_name (optional, e.g. /dev/tty.usbmodem1234) | Attributes: @smooth, @transport, @ip, @udpport",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-section-basic",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 120, 300, 24],
                    "text": "Basic Usage",
                    "fontsize": 16,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-inlet-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 148, 500, 20],
                    "text": "Inlet: control messages (smoothing, threshold, transport, calibrate, mapping, connect, disconnect)",
                    "textcolor": [0.2, 0.2, 0.6, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-imu-basic",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 13,
                    "patching_rect": [20, 175, 1100, 22],
                    "outlettype": ["", "", "", "", "", "", "", "", "", "", "", "", ""],
                    "text": "imu-sensor"
                }
            },
            {
                "box": {
                    "id": "obj-outlet0-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 230, 80, 18],
                    "text": "0: status",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 210, 75, 22],
                    "text": "print status"
                }
            },
            {
                "box": {
                    "id": "obj-outlet0-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 248, 80, 32],
                    "text": "connected-usb\nconnected-wifi\nswitching\ndisconnected",
                    "fontsize": 9,
                    "linecount": 4
                }
            },
            {
                "box": {
                    "id": "obj-outlet1-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [105, 230, 80, 18],
                    "text": "1: raw_accel",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [105, 210, 85, 22],
                    "text": "print raw_accel"
                }
            },
            {
                "box": {
                    "id": "obj-outlet1-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [105, 248, 80, 20],
                    "text": "3 floats: aX aY aZ\nrange -2..2 g",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet2-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [195, 230, 80, 18],
                    "text": "2: raw_gyro",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [195, 210, 82, 22],
                    "text": "print raw_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-outlet2-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [195, 248, 90, 20],
                    "text": "3 floats: gX gY gZ\nrange -250..250 dps",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet3-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [290, 230, 90, 18],
                    "text": "3: raw_orient",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [290, 210, 90, 22],
                    "text": "print raw_orient"
                }
            },
            {
                "box": {
                    "id": "obj-outlet3-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [290, 248, 90, 20],
                    "text": "3 floats: pitch roll yaw\ndegrees",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet4-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [385, 230, 80, 18],
                    "text": "4: cal_accel",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [385, 210, 85, 22],
                    "text": "print cal_accel"
                }
            },
            {
                "box": {
                    "id": "obj-outlet4-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [385, 248, 90, 20],
                    "text": "3 floats: calibrated\naX aY aZ (g)",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet5-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [475, 230, 80, 18],
                    "text": "5: cal_gyro",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [475, 210, 82, 22],
                    "text": "print cal_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-outlet5-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [475, 248, 90, 20],
                    "text": "3 floats: calibrated\ngX gY gZ (dps)",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet6-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [565, 230, 90, 18],
                    "text": "6: cal_orient",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [565, 210, 90, 22],
                    "text": "print cal_orient"
                }
            },
            {
                "box": {
                    "id": "obj-outlet6-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [565, 248, 90, 20],
                    "text": "3 floats: calibrated\npitch roll yaw (deg)",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet7-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [660, 230, 90, 18],
                    "text": "7: smooth_accel",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [660, 210, 100, 22],
                    "text": "print smooth_accel"
                }
            },
            {
                "box": {
                    "id": "obj-outlet7-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [660, 248, 90, 20],
                    "text": "3 floats: smoothed\naX aY aZ (g)",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet8-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [755, 230, 90, 18],
                    "text": "8: smooth_gyro",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [755, 210, 98, 22],
                    "text": "print smooth_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-outlet8-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [755, 248, 90, 20],
                    "text": "3 floats: smoothed\ngX gY gZ (dps)",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet9-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [850, 230, 95, 18],
                    "text": "9: smooth_orient",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [850, 210, 100, 22],
                    "text": "print smooth_orient"
                }
            },
            {
                "box": {
                    "id": "obj-outlet9-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [850, 248, 95, 20],
                    "text": "3 floats: smoothed\npitch roll yaw (deg)",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet10-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [950, 230, 70, 18],
                    "text": "10: mapped",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-mapped",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [950, 210, 82, 22],
                    "text": "print mapped"
                }
            },
            {
                "box": {
                    "id": "obj-outlet10-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [950, 248, 75, 20],
                    "text": "tagged: axis val\ne.g. pitch 0.72",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet11-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1030, 230, 80, 18],
                    "text": "11: quaternion",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1030, 210, 85, 22],
                    "text": "print quaternion"
                }
            },
            {
                "box": {
                    "id": "obj-outlet11-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1030, 248, 80, 20],
                    "text": "4 floats:\nqX qY qZ qW",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-outlet12-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1115, 230, 75, 18],
                    "text": "12: triggers",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-print-triggers",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1115, 210, 80, 22],
                    "text": "print triggers"
                }
            },
            {
                "box": {
                    "id": "obj-outlet12-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1115, 248, 80, 20],
                    "text": "tagged: axis_name\nbang/direction",
                    "fontsize": 9,
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-section-messages",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 300, 300, 24],
                    "text": "Message Reference",
                    "fontsize": 16,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-header-transport",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 328, 200, 20],
                    "text": "-- Transport --",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-usb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 350, 100, 22],
                    "outlettype": [""],
                    "text": "transport usb"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-usb-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [125, 350, 200, 20],
                    "text": "Switch to USB serial (default)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-wifi",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 375, 100, 22],
                    "outlettype": [""],
                    "text": "transport wifi"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-wifi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [125, 375, 200, 20],
                    "text": "Switch to WiFi UDP",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-auto",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 400, 100, 22],
                    "outlettype": [""],
                    "text": "transport auto"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-auto-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [125, 400, 250, 20],
                    "text": "Try USB first, fall back to WiFi after 5s",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-header-connection",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 430, 200, 20],
                    "text": "-- Connection --",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 452, 55, 22],
                    "outlettype": [""],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [80, 452, 250, 20],
                    "text": "Auto-scan for Arduino on USB ports",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect-port",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 477, 180, 22],
                    "outlettype": [""],
                    "text": "connect /dev/tty.usbmodem1234"
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect-port-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [210, 477, 200, 20],
                    "text": "Connect to specific serial port",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-disconnect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 502, 72, 22],
                    "outlettype": [""],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "obj-msg-disconnect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [100, 502, 250, 20],
                    "text": "Stop all transports (USB + WiFi)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-header-calibration",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [400, 328, 200, 20],
                    "text": "-- Calibration --",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-calibrate",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [400, 350, 60, 22],
                    "outlettype": [""],
                    "text": "calibrate"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calibrate-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [468, 350, 300, 20],
                    "text": "Start calibration (hold board still for ~2 sec)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-orient-reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [400, 375, 78, 22],
                    "outlettype": [""],
                    "text": "orient_reset"
                }
            },
            {
                "box": {
                    "id": "obj-msg-orient-reset-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [484, 375, 250, 20],
                    "text": "Zero current orientation as reference",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-orient-restore",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [400, 400, 92, 22],
                    "outlettype": [""],
                    "text": "orient_restore"
                }
            },
            {
                "box": {
                    "id": "obj-msg-orient-restore-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [498, 400, 250, 20],
                    "text": "Restore original orientation reference",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-header-smoothing",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [400, 430, 200, 20],
                    "text": "-- Smoothing (0.0 = none, 1.0 = max) --",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-global",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [400, 452, 130, 22],
                    "outlettype": [""],
                    "text": "smoothing global 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-global-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [540, 452, 250, 20],
                    "text": "Set smoothing for all axes at once",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-group",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [400, 477, 165, 22],
                    "outlettype": [""],
                    "text": "smoothing accel_group 0.3"
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-group-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [575, 477, 250, 20],
                    "text": "Set smoothing for a sensor group",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-axis",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [400, 502, 135, 22],
                    "outlettype": [""],
                    "text": "smoothing pitch 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-axis-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [545, 502, 250, 20],
                    "text": "Set smoothing for one axis (highest tier wins)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-header-threshold",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [800, 328, 200, 20],
                    "text": "-- Thresholds --",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-threshold-basic",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [800, 350, 125, 22],
                    "outlettype": [""],
                    "text": "threshold pitch 45"
                }
            },
            {
                "box": {
                    "id": "obj-msg-threshold-basic-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [932, 350, 250, 20],
                    "text": "Fire trigger when pitch crosses 45 degrees",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-threshold-hyst",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [800, 375, 200, 22],
                    "outlettype": [""],
                    "text": "threshold pitch 45 hysteresis 5"
                }
            },
            {
                "box": {
                    "id": "obj-msg-threshold-hyst-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1008, 375, 200, 20],
                    "text": "With 5-degree hysteresis band",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-header-mapping",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [800, 410, 200, 20],
                    "text": "-- Mapping --",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-inrange",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [800, 432, 160, 22],
                    "outlettype": [""],
                    "text": "mapping pitch inrange 0 90"
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-inrange-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [968, 432, 200, 20],
                    "text": "Set input range for pitch mapping",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-outrange",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [800, 457, 165, 22],
                    "outlettype": [""],
                    "text": "mapping pitch outrange 0 1"
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-outrange-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [973, 457, 200, 20],
                    "text": "Set output range (0-1 normalized)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-curve",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [800, 482, 195, 22],
                    "outlettype": [""],
                    "text": "mapping pitch curve exponential"
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-curve-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1003, 482, 200, 20],
                    "text": "Curve: linear, exponential, logarithmic",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-header-wifi",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [800, 510, 200, 20],
                    "text": "-- WiFi Configuration --",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-msg-ip",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [800, 532, 115, 22],
                    "outlettype": [""],
                    "text": "ip 192.168.1.50"
                }
            },
            {
                "box": {
                    "id": "obj-msg-ip-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [923, 532, 250, 20],
                    "text": "Set Arduino IP address for WiFi UDP",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-msg-udpport",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [800, 557, 90, 22],
                    "outlettype": [""],
                    "text": "udpport 8889"
                }
            },
            {
                "box": {
                    "id": "obj-msg-udpport-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [898, 557, 250, 20],
                    "text": "Set UDP listen port (default 8889)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-section-testsignal",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 600, 500, 24],
                    "text": "Test Signal Generator -- No Hardware Required",
                    "fontsize": 16,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-testsig-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 628, 700, 20],
                    "text": "Generates simulated sensor data matching real Arduino ranges. Toggle on to see what live data looks like without connecting hardware.",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [20, 655, 24, 24],
                    "outlettype": ["int"]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-toggle-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [50, 657, 150, 20],
                    "text": "Simulate Sensor Data"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 685, 55, 22],
                    "outlettype": ["bang"],
                    "text": "metro 9"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-metro-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [80, 685, 200, 20],
                    "text": "~111 Hz (close to real 114 Hz rate)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-counter",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "patching_rect": [20, 712, 105, 22],
                    "outlettype": ["int", "", "", "int"],
                    "text": "counter 0 0 36000"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-todeg",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 739, 42, 22],
                    "outlettype": ["float"],
                    "text": "* 0.1"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-todeg-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [68, 739, 200, 20],
                    "text": "slow counter in degrees (0-3600)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-torad",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 766, 72, 22],
                    "outlettype": ["float"],
                    "text": "* 0.017453"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-torad-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [98, 766, 200, 20],
                    "text": "degrees to radians (pi/180)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-header-accel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 800, 300, 20],
                    "text": "Accelerometer (range: -2..2 g)",
                    "fontface": 1,
                    "fontsize": 11
                }
            },
            {
                "box": {
                    "id": "obj-testsig-ax-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [20, 822, 175, 22],
                    "outlettype": ["float"],
                    "text": "expr sin($f1 * 0.05) * 1.5"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-ax-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [200, 822, 200, 20],
                    "text": "aX: slow gentle tilt",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-ay-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [20, 847, 175, 22],
                    "outlettype": ["float"],
                    "text": "expr cos($f1 * 0.03) * 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-ay-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [200, 847, 200, 20],
                    "text": "aY: cross-axis sway",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-az-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [20, 872, 215, 22],
                    "outlettype": ["float"],
                    "text": "expr 1.0 + sin($f1 * 0.02) * 0.3"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-az-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [240, 872, 200, 20],
                    "text": "aZ: gravity + small variation",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-accel-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [20, 900, 70, 22],
                    "outlettype": [""],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-accel-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 925, 118, 22],
                    "text": "print [sim]_raw_accel"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-header-gyro",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [350, 800, 300, 20],
                    "text": "Gyroscope (range: -250..250 dps)",
                    "fontface": 1,
                    "fontsize": 11
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gx-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [350, 822, 170, 22],
                    "outlettype": ["float"],
                    "text": "expr sin($f1 * 0.08) * 50."
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gx-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [525, 822, 200, 20],
                    "text": "gX: moderate rotation rate",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gy-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [350, 847, 170, 22],
                    "outlettype": ["float"],
                    "text": "expr cos($f1 * 0.06) * 30."
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gy-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [525, 847, 200, 20],
                    "text": "gY: gentle rotation",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gz-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [350, 872, 170, 22],
                    "outlettype": ["float"],
                    "text": "expr sin($f1 * 0.04) * 20."
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gz-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [525, 872, 200, 20],
                    "text": "gZ: slow rotation",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gyro-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [350, 900, 70, 22],
                    "outlettype": [""],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gyro-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [350, 925, 115, 22],
                    "text": "print [sim]_raw_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-header-orient",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [680, 800, 300, 20],
                    "text": "Orientation (degrees)",
                    "fontface": 1,
                    "fontsize": 11
                }
            },
            {
                "box": {
                    "id": "obj-testsig-pitch-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [680, 822, 220, 22],
                    "outlettype": ["float"],
                    "text": "expr sin($f1 * 0.03) * 45. + 45."
                }
            },
            {
                "box": {
                    "id": "obj-testsig-pitch-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [905, 822, 200, 20],
                    "text": "pitch: 0-90 degree sweep",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-roll-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [680, 847, 220, 22],
                    "outlettype": ["float"],
                    "text": "expr cos($f1 * 0.02) * 45. + 45."
                }
            },
            {
                "box": {
                    "id": "obj-testsig-roll-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [905, 847, 200, 20],
                    "text": "roll: 0-90 degree sweep",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-yaw-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [680, 872, 190, 22],
                    "outlettype": ["float"],
                    "text": "expr fmod($f1 * 0.5, 360.)"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-yaw-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [875, 872, 200, 20],
                    "text": "yaw: 0-360 slow rotation",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-orient-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [680, 900, 70, 22],
                    "outlettype": [""],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-orient-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [680, 925, 127, 22],
                    "text": "print [sim]_raw_orient"
                }
            },
            {
                "box": {
                    "id": "obj-section-recipe1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 970, 600, 24],
                    "text": "Recipe 1: Tilt-to-Filter (Continuous Control)",
                    "fontsize": 16,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 998, 700, 20],
                    "text": "Map board tilt to filter parameters -- pitch controls cutoff frequency, roll controls resonance. Great for live performance filtering.",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-imu",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 13,
                    "patching_rect": [20, 1025, 1100, 22],
                    "outlettype": ["", "", "", "", "", "", "", "", "", "", "", "", ""],
                    "text": "imu-sensor @smooth 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-outlet-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [850, 1050, 200, 20],
                    "text": "outlet 9: smooth_orientation",
                    "fontsize": 10,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [850, 1070, 85, 22],
                    "outlettype": ["float", "float", "float"],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-pitch-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [850, 1095, 50, 20],
                    "text": "pitch",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-roll-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [920, 1095, 40, 20],
                    "text": "roll",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-scale-cutoff",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "patching_rect": [850, 1118, 140, 22],
                    "outlettype": [""],
                    "text": "scale 0. 90. 200. 5000."
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-cutoff-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [850, 1143, 200, 34],
                    "text": "Filter cutoff (200-5000 Hz)\nTilting forward/back sweeps the frequency.\nConnect to svf~ cutoff inlet.",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0],
                    "linecount": 3
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-scale-q",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "patching_rect": [920, 1118, 125, 22],
                    "outlettype": [""],
                    "text": "scale 0. 90. 0.1 10."
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-q-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [920, 1143, 200, 34],
                    "text": "Filter resonance Q (0.1-10)\nTilting left/right controls resonance.\nConnect to svf~ Q inlet.",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0],
                    "linecount": 3
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-num-cutoff",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [850, 1185, 65, 22],
                    "outlettype": ["", "bang"]
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-num-q",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [920, 1185, 55, 22],
                    "outlettype": ["", "bang"]
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-tips",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1050, 400, 45],
                    "text": "Tips:\n- Adjust scale ranges to taste for your filter and audio material\n- Works with any MAX filter: svf~, lores~, biquad~, onepole~\n- Higher @smooth values (0.5-0.8) give smoother filter sweeps",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0],
                    "linecount": 4
                }
            },
            {
                "box": {
                    "id": "obj-section-recipe2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1230, 600, 24],
                    "text": "Recipe 2: Gesture Triggers (Discrete Events)",
                    "fontsize": 16,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1258, 700, 20],
                    "text": "Use threshold crossings and acceleration spikes to trigger discrete musical events -- MIDI notes, samples, effects toggles.",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-imu",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 13,
                    "patching_rect": [20, 1285, 1100, 22],
                    "outlettype": ["", "", "", "", "", "", "", "", "", "", "", "", ""],
                    "text": "imu-sensor @smooth 0.3"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-threshold-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 1310, 125, 22],
                    "outlettype": [""],
                    "text": "threshold pitch 45"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-threshold-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [150, 1310, 300, 20],
                    "text": "Set pitch threshold at 45 degrees (fires on outlet 12)",
                    "fontsize": 10,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-trigger-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1115, 1310, 80, 20],
                    "text": "outlet 12:",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-route-trigger",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [1115, 1335, 80, 22],
                    "outlettype": ["", "", ""],
                    "text": "route pitch ax"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-trigger-pitch-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1115, 1360, 200, 20],
                    "text": "Fires when pitch crosses 45 deg",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-midi-note",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [1115, 1383, 85, 22],
                    "outlettype": [""],
                    "text": "note 60 127"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-midi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1115, 1408, 200, 20],
                    "text": "Connect to noteout or synth",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-shake-header",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1340, 300, 20],
                    "text": "Shake Detection (from smoothed accel, outlet 7):",
                    "fontface": 1,
                    "fontsize": 11
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-smooth-accel-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [660, 1310, 120, 20],
                    "text": "outlet 7: smooth_accel",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-unpack-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [660, 1340, 85, 22],
                    "outlettype": ["float", "float", "float"],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-abs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [660, 1367, 32, 22],
                    "outlettype": ["int"],
                    "text": "abs"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-abs-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [698, 1367, 200, 20],
                    "text": "absolute value of aX",
                    "fontsize": 10,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-thresh-compare",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [660, 1392, 42, 22],
                    "outlettype": ["int"],
                    "text": "> 1.5"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-thresh-compare-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [708, 1392, 250, 20],
                    "text": "threshold: acceleration exceeds 1.5g (sharp movement)",
                    "fontsize": 10,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-change",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [660, 1417, 48, 22],
                    "outlettype": [""],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-change-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [714, 1417, 250, 20],
                    "text": "only trigger on state change (prevents repeats)",
                    "fontsize": 10,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-sel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [660, 1442, 38, 22],
                    "outlettype": ["bang", ""],
                    "text": "sel 1"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-sel-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [704, 1442, 250, 20],
                    "text": "bang on shake onset -- connect to sample trigger, MIDI, etc.",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-shake-bang",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [660, 1467, 24, 24],
                    "outlettype": ["bang"]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-tips",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1365, 450, 45],
                    "text": "Tips:\n- threshold message sets the crossing point for orientation triggers (outlet 12)\n- For acceleration-based triggers, use abs + comparison in MAX (as shown right)\n- change object prevents repeated triggers while threshold is held",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0],
                    "linecount": 4
                }
            },
            {
                "box": {
                    "id": "obj-section-recipe3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1510, 600, 24],
                    "text": "Recipe 3: Spatial Panning (3D Audio)",
                    "fontsize": 16,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1538, 700, 20],
                    "text": "Map yaw rotation to stereo pan position. Higher smoothing (0.7) reduces jitter for smooth, continuous panning.",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-imu",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 13,
                    "patching_rect": [20, 1565, 1100, 22],
                    "outlettype": ["", "", "", "", "", "", "", "", "", "", "", "", ""],
                    "text": "imu-sensor @smooth 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-orient-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [850, 1590, 200, 20],
                    "text": "outlet 9: smooth_orientation",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [850, 1612, 85, 22],
                    "outlettype": ["float", "float", "float"],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-pitch-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [850, 1637, 40, 20],
                    "text": "pitch",
                    "fontsize": 10
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-roll-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [890, 1637, 30, 20],
                    "text": "roll",
                    "fontsize": 10
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-yaw-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [930, 1637, 30, 20],
                    "text": "yaw",
                    "fontface": 1,
                    "fontsize": 10
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-scale-pan",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "patching_rect": [930, 1660, 140, 22],
                    "outlettype": [""],
                    "text": "scale 0. 360. -1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-pan-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [930, 1685, 250, 34],
                    "text": "Yaw to pan position (-1 = left, 1 = right)\nRotating left/right maps naturally to stereo pan.\nConnect to pan~ or M4L panning device.",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0],
                    "linecount": 3
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-pan-num",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [930, 1725, 65, 22],
                    "outlettype": ["", "bang"]
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-quat-header",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1600, 400, 20],
                    "text": "OR use quaternion output for rotation-aware spatialization:",
                    "fontface": 1,
                    "fontsize": 11
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-quat-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1030, 1590, 100, 20],
                    "text": "outlet 11: quaternion",
                    "fontsize": 10,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-unpack-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [1030, 1612, 85, 22],
                    "outlettype": ["float", "float", "float", "float"],
                    "text": "unpack f f f f"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-quat-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [1030, 1637, 200, 34],
                    "text": "qX qY qZ qW\nUse for ambisonics (IRCAM Spat~)\nor VBAP spatialization.",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0],
                    "linecount": 3
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-tips",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1625, 450, 45],
                    "text": "Tips:\n- Yaw (rotation left/right) maps naturally to stereo pan\n- For full 3D spatialization, use quaternion outlet with ambisonics tools\n- Higher smoothing (0.7) reduces gyro jitter for smooth panning\n- Use imu-sensor-3dviz.maxpat to visualize board orientation in 3D",
                    "fontsize": 10,
                    "textcolor": [0.2, 0.5, 0.2, 1.0],
                    "linecount": 5
                }
            },
            {
                "box": {
                    "id": "obj-section-config",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1770, 400, 24],
                    "text": "Configuration Examples",
                    "fontsize": 16,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-config-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 1798, 500, 20],
                    "text": "Click any message box to send it to the imu-sensor object above. Common starting configurations:",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-config-imu",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 13,
                    "patching_rect": [20, 1825, 1100, 22],
                    "outlettype": ["", "", "", "", "", "", "", "", "", "", "", "", ""],
                    "text": "imu-sensor"
                }
            },
            {
                "box": {
                    "id": "obj-config-transport-usb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 1860, 100, 22],
                    "outlettype": [""],
                    "text": "transport usb"
                }
            },
            {
                "box": {
                    "id": "obj-config-transport-usb-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [125, 1860, 150, 20],
                    "text": "USB mode (default)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-config-transport-wifi",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 1885, 100, 22],
                    "outlettype": [""],
                    "text": "transport wifi"
                }
            },
            {
                "box": {
                    "id": "obj-config-transport-wifi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [125, 1885, 200, 20],
                    "text": "WiFi mode (wireless, ~3-5ms latency)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-config-smooth",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 1910, 145, 22],
                    "outlettype": [""],
                    "text": "smoothing global 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-config-smooth-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [170, 1910, 250, 20],
                    "text": "Medium smoothing (good starting point)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-config-calibrate",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 1935, 60, 22],
                    "outlettype": [""],
                    "text": "calibrate"
                }
            },
            {
                "box": {
                    "id": "obj-config-calibrate-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [85, 1935, 300, 20],
                    "text": "Start calibration (hold board still on flat surface)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-config-orient-reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 1960, 78, 22],
                    "outlettype": [""],
                    "text": "orient_reset"
                }
            },
            {
                "box": {
                    "id": "obj-config-orient-reset-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [105, 1960, 300, 20],
                    "text": "Zero current orientation (like tare on a scale)",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-config-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [20, 1985, 55, 22],
                    "outlettype": [""],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "id": "obj-config-connect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [80, 1985, 300, 20],
                    "text": "Auto-scan and connect to Arduino",
                    "fontsize": 11,
                    "textcolor": [0.4, 0.4, 0.4, 1.0]
                }
            },
            {
                "box": {
                    "id": "obj-config-print-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20, 2020, 105, 22],
                    "text": "print config_status"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": ["obj-imu-basic", 0],
                    "destination": ["obj-print-status", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 1],
                    "destination": ["obj-print-raw-accel", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 2],
                    "destination": ["obj-print-raw-gyro", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 3],
                    "destination": ["obj-print-raw-orient", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 4],
                    "destination": ["obj-print-cal-accel", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 5],
                    "destination": ["obj-print-cal-gyro", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 6],
                    "destination": ["obj-print-cal-orient", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 7],
                    "destination": ["obj-print-smooth-accel", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 8],
                    "destination": ["obj-print-smooth-gyro", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 9],
                    "destination": ["obj-print-smooth-orient", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 10],
                    "destination": ["obj-print-mapped", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 11],
                    "destination": ["obj-print-quat", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-imu-basic", 12],
                    "destination": ["obj-print-triggers", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-toggle", 0],
                    "destination": ["obj-testsig-metro", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-metro", 0],
                    "destination": ["obj-testsig-counter", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-counter", 0],
                    "destination": ["obj-testsig-todeg", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-todeg", 0],
                    "destination": ["obj-testsig-torad", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-ax-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-ay-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-az-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-gx-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-gy-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-gz-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-pitch-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-roll-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-torad", 0],
                    "destination": ["obj-testsig-yaw-expr", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-ax-expr", 0],
                    "destination": ["obj-testsig-accel-pack", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-ay-expr", 0],
                    "destination": ["obj-testsig-accel-pack", 1]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-az-expr", 0],
                    "destination": ["obj-testsig-accel-pack", 2]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-accel-pack", 0],
                    "destination": ["obj-testsig-accel-display", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-gx-expr", 0],
                    "destination": ["obj-testsig-gyro-pack", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-gy-expr", 0],
                    "destination": ["obj-testsig-gyro-pack", 1]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-gz-expr", 0],
                    "destination": ["obj-testsig-gyro-pack", 2]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-gyro-pack", 0],
                    "destination": ["obj-testsig-gyro-display", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-pitch-expr", 0],
                    "destination": ["obj-testsig-orient-pack", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-roll-expr", 0],
                    "destination": ["obj-testsig-orient-pack", 1]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-yaw-expr", 0],
                    "destination": ["obj-testsig-orient-pack", 2]
                }
            },
            {
                "patchline": {
                    "source": ["obj-testsig-orient-pack", 0],
                    "destination": ["obj-testsig-orient-display", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe1-imu", 9],
                    "destination": ["obj-recipe1-unpack", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe1-unpack", 0],
                    "destination": ["obj-recipe1-scale-cutoff", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe1-unpack", 1],
                    "destination": ["obj-recipe1-scale-q", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe1-scale-cutoff", 0],
                    "destination": ["obj-recipe1-num-cutoff", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe1-scale-q", 0],
                    "destination": ["obj-recipe1-num-q", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-imu", 12],
                    "destination": ["obj-recipe2-route-trigger", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-route-trigger", 0],
                    "destination": ["obj-recipe2-midi-note", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-threshold-msg", 0],
                    "destination": ["obj-recipe2-imu", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-imu", 7],
                    "destination": ["obj-recipe2-unpack-accel", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-unpack-accel", 0],
                    "destination": ["obj-recipe2-abs", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-abs", 0],
                    "destination": ["obj-recipe2-thresh-compare", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-thresh-compare", 0],
                    "destination": ["obj-recipe2-change", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-change", 0],
                    "destination": ["obj-recipe2-sel", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe2-sel", 0],
                    "destination": ["obj-recipe2-shake-bang", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe3-imu", 9],
                    "destination": ["obj-recipe3-unpack", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe3-unpack", 2],
                    "destination": ["obj-recipe3-scale-pan", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe3-scale-pan", 0],
                    "destination": ["obj-recipe3-pan-num", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-recipe3-imu", 11],
                    "destination": ["obj-recipe3-unpack-quat", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-config-transport-usb", 0],
                    "destination": ["obj-config-imu", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-config-transport-wifi", 0],
                    "destination": ["obj-config-imu", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-config-smooth", 0],
                    "destination": ["obj-config-imu", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-config-calibrate", 0],
                    "destination": ["obj-config-imu", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-config-orient-reset", 0],
                    "destination": ["obj-config-imu", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-config-connect", 0],
                    "destination": ["obj-config-imu", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-config-imu", 0],
                    "destination": ["obj-config-print-status", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-transport-usb", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-transport-wifi", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-transport-auto", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-connect", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-connect-port", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-disconnect", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-calibrate", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-orient-reset", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-orient-restore", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-smooth-global", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-smooth-group", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-smooth-axis", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-threshold-basic", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-threshold-hyst", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-map-inrange", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-map-outrange", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-map-curve", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-ip", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            },
            {
                "patchline": {
                    "source": ["obj-msg-udpport", 0],
                    "destination": ["obj-imu-basic", 0]
                }
            }
        ]
    }
}