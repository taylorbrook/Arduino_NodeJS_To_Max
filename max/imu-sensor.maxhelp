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
        "rect": [ 100.0, 95.0, 1200.0, 932.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 20.0, 800.0, 29.0 ],
                    "text": "imu-sensor -- IMU Sensor Pipeline for Arduino LSM6DS3"
                }
            },
            {
                "box": {
                    "fontsize": 13.0,
                    "id": "obj-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 55.0, 900.0, 21.0 ],
                    "text": "Reads accelerometer + gyroscope data via USB or WiFi, with calibration, smoothing, mapping, quaternion output, and threshold triggers"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-args-info",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 80.0, 700.0, 19.0 ],
                    "text": "Arguments: port_name (optional, e.g. /dev/tty.usbmodem1234) | Attributes: @smooth, @transport, @ip, @udpport",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-section-basic",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 120.0, 300.0, 24.0 ],
                    "text": "Basic Usage"
                }
            },
            {
                "box": {
                    "id": "obj-inlet-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 148.0, 526.0, 20.0 ],
                    "text": "Inlet: control messages (smoothing, threshold, transport, calibrate, mapping, connect, disconnect)",
                    "textcolor": [ 0.2, 0.2, 0.6, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-imu-basic",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 13,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 175.0, 1100.0, 22.0 ],
                    "text": "imu-sensor"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet0-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 230.0, 80.0, 18.0 ],
                    "text": "0: status"
                }
            },
            {
                "box": {
                    "id": "obj-print-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 210.0, 75.0, 22.0 ],
                    "text": "print status"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet0-desc",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 248.0, 80.0, 47.0 ],
                    "text": "connected-usb\nconnected-wifi\nswitching\ndisconnected"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet1-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 105.0, 230.0, 80.0, 18.0 ],
                    "text": "1: raw_accel"
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 105.0, 210.0, 89.0, 22.0 ],
                    "text": "print raw_accel"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet1-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 105.0, 248.0, 80.0, 27.0 ],
                    "text": "3 floats: aX aY aZ\nrange -2..2 g"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet2-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 195.0, 230.0, 80.0, 18.0 ],
                    "text": "2: raw_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 195.0, 210.0, 85.0, 22.0 ],
                    "text": "print raw_gyro"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet2-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 195.0, 248.0, 90.0, 27.0 ],
                    "text": "3 floats: gX gY gZ\nrange -250..250 dps"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet3-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 230.0, 90.0, 18.0 ],
                    "text": "3: raw_orient"
                }
            },
            {
                "box": {
                    "id": "obj-print-raw-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 210.0, 91.0, 22.0 ],
                    "text": "print raw_orient"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet3-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 248.0, 96.0, 27.0 ],
                    "text": "3 floats: pitch roll yaw\ndegrees"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet4-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 385.0, 230.0, 80.0, 18.0 ],
                    "text": "4: cal_accel"
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 385.0, 210.0, 85.0, 22.0 ],
                    "text": "print cal_accel"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet4-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 385.0, 248.0, 90.0, 27.0 ],
                    "text": "3 floats: calibrated\naX aY aZ (g)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet5-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 475.0, 230.0, 80.0, 18.0 ],
                    "text": "5: cal_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 475.0, 210.0, 82.0, 22.0 ],
                    "text": "print cal_gyro"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet5-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 475.0, 248.0, 90.0, 27.0 ],
                    "text": "3 floats: calibrated\ngX gY gZ (dps)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet6-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 565.0, 230.0, 90.0, 18.0 ],
                    "text": "6: cal_orient"
                }
            },
            {
                "box": {
                    "id": "obj-print-cal-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 565.0, 210.0, 90.0, 22.0 ],
                    "text": "print cal_orient"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet6-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 565.0, 248.0, 90.0, 27.0 ],
                    "text": "3 floats: calibrated\npitch roll yaw (deg)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet7-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 230.0, 90.0, 18.0 ],
                    "text": "7: smooth_accel"
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-accel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 210.0, 109.0, 22.0 ],
                    "text": "print smooth_accel"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet7-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 248.0, 90.0, 27.0 ],
                    "text": "3 floats: smoothed\naX aY aZ (g)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet8-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 755.0, 230.0, 90.0, 18.0 ],
                    "text": "8: smooth_gyro"
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-gyro",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 755.0, 210.0, 105.0, 22.0 ],
                    "text": "print smooth_gyro"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet8-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 755.0, 248.0, 90.0, 27.0 ],
                    "text": "3 floats: smoothed\ngX gY gZ (dps)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet9-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 230.0, 95.0, 18.0 ],
                    "text": "9: smooth_orient"
                }
            },
            {
                "box": {
                    "id": "obj-print-smooth-orient",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 210.0, 111.0, 22.0 ],
                    "text": "print smooth_orient"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet9-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 248.0, 95.0, 27.0 ],
                    "text": "3 floats: smoothed\npitch roll yaw (deg)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet10-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 950.0, 230.0, 70.0, 18.0 ],
                    "text": "10: mapped"
                }
            },
            {
                "box": {
                    "id": "obj-print-mapped",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 950.0, 210.0, 82.0, 22.0 ],
                    "text": "print mapped"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet10-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 950.0, 248.0, 75.0, 27.0 ],
                    "text": "tagged: axis val\ne.g. pitch 0.72"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet11-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1030.0, 230.0, 80.0, 18.0 ],
                    "text": "11: quaternion"
                }
            },
            {
                "box": {
                    "id": "obj-print-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1030.0, 210.0, 92.0, 22.0 ],
                    "text": "print quaternion"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet11-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1030.0, 248.0, 80.0, 27.0 ],
                    "text": "4 floats:\nqX qY qZ qW"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-outlet12-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1115.0, 230.0, 75.0, 18.0 ],
                    "text": "12: triggers"
                }
            },
            {
                "box": {
                    "id": "obj-print-triggers",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1115.0, 210.0, 80.0, 22.0 ],
                    "text": "print triggers"
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-outlet12-desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1115.0, 248.0, 86.0, 27.0 ],
                    "text": "axis direction\ne.g. pitch up"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-section-messages",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 300.0, 300.0, 24.0 ],
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
                    "patching_rect": [ 20.0, 328.0, 200.0, 20.0 ],
                    "text": "-- Transport --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-usb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 350.0, 100.0, 22.0 ],
                    "text": "transport usb"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-transport-usb-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 125.0, 350.0, 200.0, 19.0 ],
                    "text": "Switch to USB serial (default)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-wifi",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 375.0, 100.0, 22.0 ],
                    "text": "transport wifi"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-transport-wifi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 125.0, 375.0, 200.0, 19.0 ],
                    "text": "Switch to WiFi UDP",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-transport-auto",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 400.0, 100.0, 22.0 ],
                    "text": "transport auto"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-transport-auto-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 125.0, 400.0, 250.0, 19.0 ],
                    "text": "Try USB first, fall back to WiFi after 5s",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-connection",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 430.0, 200.0, 20.0 ],
                    "text": "-- Connection --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 452.0, 55.0, 22.0 ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-connect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 452.0, 250.0, 19.0 ],
                    "text": "Auto-scan for Arduino on USB ports",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-connect-port",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 477.0, 181.0, 22.0 ],
                    "text": "connect /dev/tty.usbmodem1234"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-connect-port-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 210.0, 477.0, 200.0, 19.0 ],
                    "text": "Connect to specific serial port",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-disconnect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 502.0, 72.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-disconnect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 502.0, 250.0, 19.0 ],
                    "text": "Stop all transports (USB + WiFi)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-calibration",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 328.0, 200.0, 20.0 ],
                    "text": "-- Calibration --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-calibrate",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 350.0, 60.0, 22.0 ],
                    "text": "calibrate"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-calibrate-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 468.0, 350.0, 300.0, 19.0 ],
                    "text": "Start calibration (hold board still for ~2 sec)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-orient-reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 375.0, 78.0, 22.0 ],
                    "text": "orient_reset"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-orient-reset-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 484.0, 375.0, 250.0, 19.0 ],
                    "text": "Zero current orientation as reference",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-orient-restore",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 400.0, 92.0, 22.0 ],
                    "text": "orient_restore"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-orient-restore-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 498.0, 400.0, 250.0, 19.0 ],
                    "text": "Restore original orientation reference",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-smoothing",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 430.0, 225.0, 20.0 ],
                    "text": "-- Smoothing (0.0 = none, 1.0 = max) --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-global",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 452.0, 130.0, 22.0 ],
                    "text": "smoothing global 0.5"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-smooth-global-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 452.0, 250.0, 19.0 ],
                    "text": "Set smoothing for all axes at once",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-group",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 477.0, 165.0, 22.0 ],
                    "text": "smoothing accel_group 0.3"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-smooth-group-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 575.0, 477.0, 250.0, 19.0 ],
                    "text": "Set smoothing for a sensor group",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-smooth-axis",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 502.0, 135.0, 22.0 ],
                    "text": "smoothing pitch 0.7"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-smooth-axis-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 545.0, 502.0, 250.0, 19.0 ],
                    "text": "Set smoothing for one axis (highest tier wins)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-threshold",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 800.0, 328.0, 200.0, 20.0 ],
                    "text": "-- Thresholds --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-threshold-basic",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 800.0, 350.0, 125.0, 22.0 ],
                    "text": "threshold pitch 45"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-threshold-basic-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 932.0, 350.0, 250.0, 19.0 ],
                    "text": "Fire trigger when pitch crosses 45 degrees",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-threshold-hyst",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 800.0, 375.0, 150.0, 22.0 ],
                    "text": "threshold pitch 45 5"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-threshold-hyst-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 958.0, 375.0, 240.0, 19.0 ],
                    "text": "With 5-degree hysteresis band (positional)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-mapping",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 800.0, 410.0, 200.0, 20.0 ],
                    "text": "-- Mapping --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-inrange",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 800.0, 432.0, 160.0, 22.0 ],
                    "text": "mapping pitch inrange 0 90"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-map-inrange-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 968.0, 432.0, 200.0, 19.0 ],
                    "text": "Set input range for pitch mapping",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-outrange",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 800.0, 457.0, 165.0, 22.0 ],
                    "text": "mapping pitch outrange 0 1"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-map-outrange-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 973.0, 457.0, 200.0, 19.0 ],
                    "text": "Set output range (0-1 normalized)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-map-curve",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 800.0, 482.0, 195.0, 22.0 ],
                    "text": "mapping pitch curve exponential"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-map-curve-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1003.0, 482.0, 200.0, 19.0 ],
                    "text": "Curve: linear, exponential, logarithmic",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-msg-header-wifi",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 800.0, 510.0, 200.0, 20.0 ],
                    "text": "-- WiFi Configuration --"
                }
            },
            {
                "box": {
                    "id": "obj-msg-ip",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 800.0, 532.0, 115.0, 22.0 ],
                    "text": "ip 192.168.1.50"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-ip-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 923.0, 532.0, 250.0, 19.0 ],
                    "text": "Set Arduino IP address for WiFi UDP",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-msg-udpport",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 800.0, 557.0, 90.0, 22.0 ],
                    "text": "udpport 8889"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-msg-udpport-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 898.0, 557.0, 250.0, 19.0 ],
                    "text": "Set UDP listen port (default 8889)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-section-testsignal",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 600.0, 500.0, 24.0 ],
                    "text": "Test Signal Generator -- No Hardware Required"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 628.0, 700.0, 19.0 ],
                    "text": "Generates simulated sensor data matching real Arduino ranges. Toggle on to see what live data looks like without connecting hardware.",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 655.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-toggle-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 50.0, 657.0, 150.0, 20.0 ],
                    "text": "Simulate Sensor Data"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 685.0, 55.0, 22.0 ],
                    "text": "metro 9"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-metro-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 685.0, 200.0, 19.0 ],
                    "text": "~111 Hz (close to real 114 Hz rate)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-counter",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 20.0, 712.0, 105.0, 22.0 ],
                    "text": "counter 0 0 36000"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-todeg",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 20.0, 739.0, 42.0, 22.0 ],
                    "text": "* 0.1"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-todeg-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 68.0, 739.0, 200.0, 19.0 ],
                    "text": "slow counter in degrees (0-3600)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-torad",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 20.0, 766.0, 72.0, 22.0 ],
                    "text": "* 0.017453"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-torad-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 98.0, 766.0, 200.0, 19.0 ],
                    "text": "degrees to radians (pi/180)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-testsig-header-accel",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 800.0, 300.0, 19.0 ],
                    "text": "Accelerometer (range: -2..2 g)"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-ax-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 822.0, 175.0, 22.0 ],
                    "text": "expr sin($f1 * 0.05) * 1.5"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-ax-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 822.0, 200.0, 19.0 ],
                    "text": "aX: slow gentle tilt",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-ay-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 847.0, 175.0, 22.0 ],
                    "text": "expr cos($f1 * 0.03) * 0.5"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-ay-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 847.0, 200.0, 19.0 ],
                    "text": "aY: cross-axis sway",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-az-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 872.0, 215.0, 22.0 ],
                    "text": "expr 1. + sin($f1 * 0.02) * 0.3"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-az-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 240.0, 872.0, 200.0, 19.0 ],
                    "text": "aZ: gravity + small variation",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-accel-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 900.0, 70.0, 22.0 ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-accel-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 925.0, 121.0, 22.0 ],
                    "text": "print [sim]_raw_accel"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-testsig-header-gyro",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 800.0, 300.0, 19.0 ],
                    "text": "Gyroscope (range: -250..250 dps)"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gx-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 822.0, 170.0, 22.0 ],
                    "text": "expr sin($f1 * 0.08) * 50."
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-gx-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 525.0, 822.0, 200.0, 19.0 ],
                    "text": "gX: moderate rotation rate",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gy-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 847.0, 170.0, 22.0 ],
                    "text": "expr cos($f1 * 0.06) * 30."
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-gy-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 525.0, 847.0, 200.0, 19.0 ],
                    "text": "gY: gentle rotation",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gz-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 872.0, 170.0, 22.0 ],
                    "text": "expr sin($f1 * 0.04) * 20."
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-gz-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 525.0, 872.0, 200.0, 19.0 ],
                    "text": "gZ: slow rotation",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gyro-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 900.0, 70.0, 22.0 ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-gyro-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 925.0, 117.0, 22.0 ],
                    "text": "print [sim]_raw_gyro"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-testsig-header-orient",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 680.0, 800.0, 300.0, 19.0 ],
                    "text": "Orientation (degrees)"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-pitch-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 680.0, 822.0, 220.0, 22.0 ],
                    "text": "expr sin($f1 * 0.03) * 45. + 45."
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-pitch-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 905.0, 822.0, 200.0, 19.0 ],
                    "text": "pitch: 0-90 degree sweep",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-roll-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 680.0, 847.0, 220.0, 22.0 ],
                    "text": "expr cos($f1 * 0.02) * 45. + 45."
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-roll-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 905.0, 847.0, 200.0, 19.0 ],
                    "text": "roll: 0-90 degree sweep",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-yaw-expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 680.0, 872.0, 190.0, 22.0 ],
                    "text": "expr fmod($f1 * 0.5\\, 360.)"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-testsig-yaw-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 875.0, 872.0, 200.0, 19.0 ],
                    "text": "yaw: 0-360 slow rotation",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-testsig-orient-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 680.0, 900.0, 70.0, 22.0 ],
                    "text": "pack f f f"
                }
            },
            {
                "box": {
                    "id": "obj-testsig-orient-display",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 680.0, 925.0, 127.0, 22.0 ],
                    "text": "print [sim]_raw_orient"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-section-recipe1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 970.0, 600.0, 24.0 ],
                    "text": "Recipe 1: Tilt-to-Filter (Continuous Control)"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-recipe1-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 998.0, 700.0, 19.0 ],
                    "text": "Map board tilt to filter parameters -- pitch controls cutoff frequency, roll controls resonance. Great for live performance filtering.",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9, 0.9, 0.9, 1.0 ],
                    "fontface": 1,
                    "id": "obj-recipe1-imu",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1025.0, 1100.0, 20.0 ],
                    "text": "[imu-sensor @smooth 0.5]",
                    "textcolor": [ 0.2, 0.2, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe1-outlet-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 1050.0, 200.0, 18.0 ],
                    "text": "outlet 9: smooth_orientation",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 850.0, 1070.0, 85.0, 22.0 ],
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
                    "patching_rect": [ 850.0, 1095.0, 50.0, 20.0 ],
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
                    "patching_rect": [ 920.0, 1095.0, 40.0, 20.0 ],
                    "text": "roll"
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-scale-cutoff",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 850.0, 1118.0, 140.0, 22.0 ],
                    "text": "scale 0. 90. 200. 5000."
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe1-cutoff-label",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 1143.0, 200.0, 40.0 ],
                    "text": "Filter cutoff (200-5000 Hz)\nTilting forward/back sweeps the frequency.\nConnect to svf~ cutoff inlet.",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe1-scale-q",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 920.0, 1118.0, 125.0, 22.0 ],
                    "text": "scale 0. 90. 0.1 10."
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe1-q-label",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 920.0, 1143.0, 200.0, 40.0 ],
                    "text": "Filter resonance Q (0.1-10)\nTilting left/right controls resonance.\nConnect to svf~ Q inlet.",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-recipe1-num-cutoff",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 850.0, 1185.0, 65.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-recipe1-num-q",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 920.0, 1185.0, 55.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe1-tips",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1050.0, 400.0, 51.0 ],
                    "text": "Tips:\n- Adjust scale ranges to taste for your filter and audio material\n- Works with any MAX filter: svf~, lores~, biquad~, onepole~\n- Higher @smooth values (0.5-0.8) give smoother filter sweeps",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-section-recipe2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1230.0, 600.0, 24.0 ],
                    "text": "Recipe 2: Gesture Triggers (Discrete Events)"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-recipe2-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1258.0, 700.0, 19.0 ],
                    "text": "Use threshold crossings to trigger discrete musical events -- MIDI notes, samples, effects toggles. Output on outlet 12.",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-recipe2-header-thresh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1285.0, 500.0, 19.0 ],
                    "text": "Step 1: Configure thresholds (click a message to send to imu-sensor above)"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-threshold-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1310.0, 125.0, 22.0 ],
                    "text": "threshold pitch 45"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-threshold-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 150.0, 1310.0, 350.0, 18.0 ],
                    "text": "Fire trigger when pitch crosses 45 degrees (default hysteresis 5)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-threshold-hyst-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1340.0, 150.0, 22.0 ],
                    "text": "threshold pitch 45 10"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-threshold-hyst-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 175.0, 1340.0, 450.0, 18.0 ],
                    "text": "With 10-degree hysteresis -- prevents trigger oscillation near the boundary",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-threshold-ax-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1370.0, 130.0, 22.0 ],
                    "text": "threshold ax 1.0"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-threshold-ax-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 155.0, 1370.0, 350.0, 18.0 ],
                    "text": "Accelerometer X threshold at 1.0g (detect tilt or shake)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-recipe2-header-output",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1400.0, 500.0, 19.0 ],
                    "text": "Step 2: Route trigger output from outlet 12"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-recipe2-trigger-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 1310.0, 200.0, 18.0 ],
                    "text": "outlet 12: threshold triggers"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-trigger-format",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 1328.0, 300.0, 18.0 ],
                    "text": "Output format: axis_name direction (e.g. pitch up, roll down)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-route-trigger",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 660.0, 1350.0, 100.0, 22.0 ],
                    "text": "route pitch roll"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-route-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 766.0, 1350.0, 300.0, 18.0 ],
                    "text": "Separate triggers by axis (add more axes as needed)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-recipe2-pitch-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 1375.0, 60.0, 18.0 ],
                    "text": "pitch:"
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-pitch-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 660.0, 1395.0, 80.0, 22.0 ],
                    "text": "sel up down"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-pitch-up-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 1420.0, 130.0, 18.0 ],
                    "text": "Tilt past 45 degrees",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-pitch-up-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 660.0, 1440.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-pitch-down-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 720.0, 1420.0, 130.0, 18.0 ],
                    "text": "Return below threshold",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-pitch-down-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 720.0, 1440.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recipe2-midi-note",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 660.0, 1470.0, 85.0, 22.0 ],
                    "text": "note 60 127"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-midi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 750.0, 1470.0, 250.0, 18.0 ],
                    "text": "Tilt past 45 deg triggers a note-on",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe2-tips",
                    "linecount": 6,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1420.0, 500.0, 73.0 ],
                    "text": "How thresholds work:\n- Send 'threshold <axis> <value> [hysteresis]' to set a crossing point\n- Outlet 12 outputs '<axis> up' when value rises above threshold\n- Outlet 12 outputs '<axis> down' when value falls below (threshold - hysteresis)\n- Hysteresis prevents rapid on/off flickering near the boundary\n- Axes: pitch, roll, yaw (degrees), ax, ay, az (g-force)",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-section-recipe3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1510.0, 600.0, 24.0 ],
                    "text": "Recipe 3: Spatial Panning (3D Audio)"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-recipe3-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1538.0, 700.0, 19.0 ],
                    "text": "Map yaw rotation to stereo pan position. Higher smoothing (0.7) reduces jitter for smooth, continuous panning.",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9, 0.9, 0.9, 1.0 ],
                    "fontface": 1,
                    "id": "obj-recipe3-imu",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1565.0, 1100.0, 20.0 ],
                    "text": "[imu-sensor @smooth 0.7]",
                    "textcolor": [ 0.2, 0.2, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-recipe3-orient-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 1590.0, 200.0, 18.0 ],
                    "text": "outlet 9: smooth_orientation"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "float" ],
                    "patching_rect": [ 850.0, 1612.0, 85.0, 22.0 ],
                    "text": "unpack f f f"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe3-pitch-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 1637.0, 40.0, 18.0 ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe3-roll-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 890.0, 1637.0, 30.0, 18.0 ],
                    "text": "roll"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-recipe3-yaw-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 930.0, 1637.0, 30.0, 18.0 ],
                    "text": "yaw"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-scale-pan",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 930.0, 1660.0, 140.0, 22.0 ],
                    "text": "scale 0. 360. -1. 1."
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe3-pan-desc",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 930.0, 1685.0, 250.0, 40.0 ],
                    "text": "Yaw to pan position (-1 = left, 1 = right)\nRotating left/right maps naturally to stereo pan.\nConnect to pan~ or M4L panning device.",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-recipe3-pan-num",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 930.0, 1725.0, 65.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "obj-recipe3-quat-header",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1600.0, 400.0, 19.0 ],
                    "text": "OR use quaternion output for rotation-aware spatialization:"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "obj-recipe3-quat-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1030.0, 1590.0, 107.0, 18.0 ],
                    "text": "outlet 11: quaternion"
                }
            },
            {
                "box": {
                    "id": "obj-recipe3-unpack-quat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "float", "float", "float" ],
                    "patching_rect": [ 1030.0, 1612.0, 85.0, 22.0 ],
                    "text": "unpack f f f f"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe3-quat-desc",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1030.0, 1637.0, 200.0, 40.0 ],
                    "text": "qX qY qZ qW\nUse for ambisonics (IRCAM Spat~)\nor VBAP spatialization.",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-recipe3-tips",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1625.0, 450.0, 62.0 ],
                    "text": "Tips:\n- Yaw (rotation left/right) maps naturally to stereo pan\n- For full 3D spatialization, use quaternion outlet with ambisonics tools\n- Higher smoothing (0.7) reduces gyro jitter for smooth panning\n- Use imu-sensor-3dviz.maxpat to visualize board orientation in 3D",
                    "textcolor": [ 0.2, 0.5, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-section-config",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1770.0, 400.0, 24.0 ],
                    "text": "Configuration Examples"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-config-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1798.0, 500.0, 19.0 ],
                    "text": "Click any message box to send it to the imu-sensor object above. Common starting configurations:",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9, 0.9, 0.9, 1.0 ],
                    "fontface": 1,
                    "id": "obj-config-imu",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1825.0, 1100.0, 20.0 ],
                    "text": "[imu-sensor]",
                    "textcolor": [ 0.2, 0.2, 0.2, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-config-transport-usb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1860.0, 100.0, 22.0 ],
                    "text": "transport usb"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-config-transport-usb-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 125.0, 1860.0, 150.0, 19.0 ],
                    "text": "USB mode (default)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-config-transport-wifi",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1885.0, 100.0, 22.0 ],
                    "text": "transport wifi"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-config-transport-wifi-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 125.0, 1885.0, 200.0, 19.0 ],
                    "text": "WiFi mode (wireless, ~3-5ms latency)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-config-smooth",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1910.0, 145.0, 22.0 ],
                    "text": "smoothing global 0.5"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-config-smooth-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 170.0, 1910.0, 250.0, 19.0 ],
                    "text": "Medium smoothing (good starting point)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-config-calibrate",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1935.0, 60.0, 22.0 ],
                    "text": "calibrate"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-config-calibrate-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 85.0, 1935.0, 300.0, 19.0 ],
                    "text": "Start calibration (hold board still on flat surface)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-config-orient-reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1960.0, 78.0, 22.0 ],
                    "text": "orient_reset"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-config-orient-reset-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 105.0, 1960.0, 300.0, 19.0 ],
                    "text": "Zero current orientation (like tare on a scale)",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-config-connect",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1985.0, 55.0, 22.0 ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-config-connect-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 1985.0, 300.0, 19.0 ],
                    "text": "Auto-scan and connect to Arduino",
                    "textcolor": [ 0.4, 0.4, 0.4, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-config-print-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 2020.0, 106.0, 22.0 ],
                    "text": "print config_status"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-print-cal-accel", 0 ],
                    "midpoints": [ 389.8333333333333, 204.0, 394.5, 204.0 ],
                    "source": [ "obj-imu-basic", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-cal-gyro", 0 ],
                    "midpoints": [ 479.9166666666667, 204.0, 484.5, 204.0 ],
                    "source": [ "obj-imu-basic", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-cal-orient", 0 ],
                    "midpoints": [ 570.0, 207.0, 574.5, 207.0 ],
                    "source": [ "obj-imu-basic", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-mapped", 0 ],
                    "midpoints": [ 930.3333333333334, 207.0, 959.5, 207.0 ],
                    "source": [ "obj-imu-basic", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-quat", 0 ],
                    "midpoints": [ 1020.4166666666666, 204.0, 1039.5, 204.0 ],
                    "source": [ "obj-imu-basic", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-raw-accel", 0 ],
                    "midpoints": [ 119.58333333333333, 207.0, 114.5, 207.0 ],
                    "source": [ "obj-imu-basic", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-raw-gyro", 0 ],
                    "midpoints": [ 209.66666666666666, 207.0, 204.5, 207.0 ],
                    "source": [ "obj-imu-basic", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-raw-orient", 0 ],
                    "midpoints": [ 299.75, 198.0, 299.5, 198.0 ],
                    "source": [ "obj-imu-basic", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-smooth-accel", 0 ],
                    "midpoints": [ 660.0833333333334, 207.0, 669.5, 207.0 ],
                    "source": [ "obj-imu-basic", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-smooth-gyro", 0 ],
                    "midpoints": [ 750.1666666666666, 204.0, 764.5, 204.0 ],
                    "source": [ "obj-imu-basic", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-smooth-orient", 0 ],
                    "midpoints": [ 840.25, 204.0, 859.5, 204.0 ],
                    "source": [ "obj-imu-basic", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-status", 0 ],
                    "midpoints": [ 29.5, 198.0, 29.5, 198.0 ],
                    "source": [ "obj-imu-basic", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print-triggers", 0 ],
                    "midpoints": [ 1110.5, 204.0, 1124.5, 204.0 ],
                    "source": [ "obj-imu-basic", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 409.5, 372.0, 336.0, 372.0, 336.0, 285.0, 102.0, 285.0, 102.0, 297.0, 6.0, 297.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-calibrate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 474.0, 6.0, 474.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-connect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 501.0, 6.0, 501.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-connect-port", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 525.0, 6.0, 525.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-disconnect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 809.5, 555.0, 6.0, 555.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-ip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 809.5, 507.0, 795.0, 507.0, 795.0, 531.0, 6.0, 531.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-map-curve", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 809.5, 456.0, 792.0, 456.0, 792.0, 438.0, 780.0, 438.0, 780.0, 285.0, 102.0, 285.0, 102.0, 297.0, 6.0, 297.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-map-inrange", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 809.5, 480.0, 795.0, 480.0, 795.0, 438.0, 780.0, 438.0, 780.0, 285.0, 102.0, 285.0, 102.0, 297.0, 6.0, 297.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-map-outrange", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 409.5, 399.0, 387.0, 399.0, 387.0, 285.0, 102.0, 285.0, 102.0, 297.0, 6.0, 297.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-orient-reset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 409.5, 423.0, 387.0, 423.0, 387.0, 285.0, 102.0, 285.0, 102.0, 297.0, 6.0, 297.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-orient-restore", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 409.5, 534.0, 6.0, 534.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-smooth-axis", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 409.5, 474.0, 387.0, 474.0, 387.0, 285.0, 102.0, 285.0, 102.0, 297.0, 6.0, 297.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-smooth-global", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 409.5, 501.0, 360.0, 501.0, 360.0, 534.0, 6.0, 534.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-smooth-group", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 809.5, 372.0, 780.0, 372.0, 780.0, 285.0, 102.0, 285.0, 102.0, 297.0, 6.0, 297.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-threshold-basic", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 809.5, 399.0, 780.0, 399.0, 780.0, 285.0, 102.0, 285.0, 102.0, 297.0, 6.0, 297.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-threshold-hyst", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 423.0, 6.0, 423.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-transport-auto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 372.0, 6.0, 372.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-transport-usb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 399.0, 6.0, 399.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-transport-wifi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 809.5, 582.0, 6.0, 582.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-msg-udpport", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe1-num-cutoff", 0 ],
                    "midpoints": [ 859.5, 1140.0, 837.0, 1140.0, 837.0, 1182.0, 859.5, 1182.0 ],
                    "source": [ "obj-recipe1-scale-cutoff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe1-num-q", 0 ],
                    "midpoints": [ 929.5, 1140.0, 837.0, 1140.0, 837.0, 1218.0, 915.0, 1218.0, 915.0, 1185.0, 929.5, 1185.0 ],
                    "source": [ "obj-recipe1-scale-q", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe1-scale-cutoff", 0 ],
                    "midpoints": [ 859.5, 1092.0, 846.0, 1092.0, 846.0, 1113.0, 859.5, 1113.0 ],
                    "source": [ "obj-recipe1-unpack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe1-scale-q", 0 ],
                    "midpoints": [ 892.5, 1092.0, 915.0, 1092.0, 915.0, 1113.0, 929.5, 1113.0 ],
                    "source": [ "obj-recipe1-unpack", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 1335.0, 6.0, 1335.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-recipe2-threshold-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 1365.0, 6.0, 1365.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-recipe2-threshold-hyst-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-imu-basic", 0 ],
                    "midpoints": [ 29.5, 1395.0, 6.0, 1395.0, 6.0, 171.0, 29.5, 171.0 ],
                    "source": [ "obj-recipe2-threshold-ax-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe2-route-trigger", 0 ],
                    "midpoints": [ 1110.5, 1305.0, 645.0, 1305.0, 645.0, 1347.0, 669.5, 1347.0 ],
                    "source": [ "obj-imu-basic", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe2-pitch-sel", 0 ],
                    "midpoints": [ 669.5, 1375.0, 669.5, 1392.0 ],
                    "source": [ "obj-recipe2-route-trigger", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe2-pitch-up-button", 0 ],
                    "midpoints": [ 669.5, 1420.0, 669.5, 1437.0 ],
                    "source": [ "obj-recipe2-pitch-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe2-pitch-down-button", 0 ],
                    "midpoints": [ 700.0, 1420.0, 729.5, 1437.0 ],
                    "source": [ "obj-recipe2-pitch-sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe2-midi-note", 0 ],
                    "midpoints": [ 669.5, 1464.0, 669.5, 1467.0 ],
                    "source": [ "obj-recipe2-pitch-up-button", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe3-pan-num", 0 ],
                    "midpoints": [ 939.5, 1683.0, 927.0, 1683.0, 927.0, 1722.0, 939.5, 1722.0 ],
                    "source": [ "obj-recipe3-scale-pan", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recipe3-scale-pan", 0 ],
                    "midpoints": [ 925.5, 1656.0, 939.5, 1656.0 ],
                    "source": [ "obj-recipe3-unpack", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-accel-display", 0 ],
                    "midpoints": [ 29.5, 924.0, 29.5, 924.0 ],
                    "source": [ "obj-testsig-accel-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-accel-pack", 0 ],
                    "midpoints": [ 29.5, 846.0, 6.0, 846.0, 6.0, 897.0, 29.5, 897.0 ],
                    "source": [ "obj-testsig-ax-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-accel-pack", 1 ],
                    "midpoints": [ 29.5, 870.0, 15.0, 870.0, 15.0, 897.0, 55.0, 897.0 ],
                    "source": [ "obj-testsig-ay-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-accel-pack", 2 ],
                    "midpoints": [ 29.5, 897.0, 80.5, 897.0 ],
                    "source": [ "obj-testsig-az-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-todeg", 0 ],
                    "midpoints": [ 29.5, 735.0, 29.5, 735.0 ],
                    "source": [ "obj-testsig-counter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-gyro-pack", 0 ],
                    "midpoints": [ 359.5, 846.0, 345.0, 846.0, 345.0, 843.0, 195.0, 843.0, 195.0, 867.0, 237.0, 867.0, 237.0, 906.0, 345.0, 906.0, 345.0, 897.0, 359.5, 897.0 ],
                    "source": [ "obj-testsig-gx-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-gyro-pack", 1 ],
                    "midpoints": [ 359.5, 897.0, 385.0, 897.0 ],
                    "source": [ "obj-testsig-gy-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-gyro-display", 0 ],
                    "midpoints": [ 359.5, 924.0, 359.5, 924.0 ],
                    "source": [ "obj-testsig-gyro-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-gyro-pack", 2 ],
                    "midpoints": [ 359.5, 897.0, 410.5, 897.0 ],
                    "source": [ "obj-testsig-gz-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-counter", 0 ],
                    "midpoints": [ 29.5, 708.0, 29.5, 708.0 ],
                    "source": [ "obj-testsig-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-orient-display", 0 ],
                    "midpoints": [ 689.5, 924.0, 689.5, 924.0 ],
                    "source": [ "obj-testsig-orient-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-orient-pack", 0 ],
                    "midpoints": [ 689.5, 846.0, 675.0, 846.0, 675.0, 843.0, 522.0, 843.0, 522.0, 906.0, 675.0, 906.0, 675.0, 897.0, 689.5, 897.0 ],
                    "source": [ "obj-testsig-pitch-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-orient-pack", 1 ],
                    "midpoints": [ 689.5, 897.0, 715.0, 897.0 ],
                    "source": [ "obj-testsig-roll-expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-torad", 0 ],
                    "midpoints": [ 29.5, 762.0, 29.5, 762.0 ],
                    "source": [ "obj-testsig-todeg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-metro", 0 ],
                    "midpoints": [ 29.5, 681.0, 29.5, 681.0 ],
                    "source": [ "obj-testsig-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-ax-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 6.0, 789.0, 6.0, 819.0, 29.5, 819.0 ],
                    "order": 8,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-ay-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 6.0, 789.0, 6.0, 843.0, 29.5, 843.0 ],
                    "order": 7,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-az-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 6.0, 789.0, 6.0, 867.0, 29.5, 867.0 ],
                    "order": 6,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-gx-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 336.0, 789.0, 336.0, 819.0, 359.5, 819.0 ],
                    "order": 5,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-gy-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 6.0, 789.0, 6.0, 819.0, 195.0, 819.0, 195.0, 843.0, 359.5, 843.0 ],
                    "order": 4,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-gz-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 6.0, 789.0, 6.0, 957.0, 237.0, 957.0, 237.0, 867.0, 359.5, 867.0 ],
                    "order": 3,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-pitch-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 6.0, 789.0, 6.0, 957.0, 522.0, 957.0, 522.0, 819.0, 689.5, 819.0 ],
                    "order": 2,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-roll-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 6.0, 789.0, 6.0, 957.0, 522.0, 957.0, 522.0, 843.0, 689.5, 843.0 ],
                    "order": 1,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-yaw-expr", 0 ],
                    "midpoints": [ 29.5, 789.0, 6.0, 789.0, 6.0, 957.0, 522.0, 957.0, 522.0, 867.0, 689.5, 867.0 ],
                    "order": 0,
                    "source": [ "obj-testsig-torad", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-testsig-orient-pack", 2 ],
                    "midpoints": [ 689.5, 897.0, 740.5, 897.0 ],
                    "source": [ "obj-testsig-yaw-expr", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}