{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 8,
			"minor": 6,
			"revision": 0,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [ 100, 100, 1000, 800 ],
		"gridsize": [ 15.0, 15.0 ],
		"boxes": [
			{
				"box": {
					"id": "obj-title",
					"maxclass": "comment",
					"text": "Arduino IMU Serial Bridge",
					"fontsize": 18.0,
					"fontface": 1,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 350.0, 15.0, 280.0, 27.0 ]
				}
			},
			{
				"box": {
					"id": "obj-msg-connect",
					"maxclass": "message",
					"text": "connect",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 50.0, 60.0, 65.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-msg-disconnect",
					"maxclass": "message",
					"text": "disconnect",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 130.0, 60.0, 80.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-msg-listports",
					"maxclass": "message",
					"text": "listports",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 225.0, 60.0, 68.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-msg-reset",
					"maxclass": "message",
					"text": "reset",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 310.0, 60.0, 50.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-nodescript",
					"maxclass": "newobj",
					"text": "node.script ../node/serial-bridge.js @autostart 1",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "" ],
					"patching_rect": [ 250.0, 120.0, 320.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-nodedebug",
					"maxclass": "newobj",
					"text": "node.debug",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 620.0, 170.0, 80.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-route",
					"maxclass": "newobj",
					"text": "route accel gyro orientation status",
					"numinlets": 1,
					"numoutlets": 5,
					"outlettype": [ "", "", "", "", "" ],
					"patching_rect": [ 250.0, 200.0, 280.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-accel",
					"maxclass": "comment",
					"text": "Accelerometer (g)",
					"fontsize": 13.0,
					"fontface": 1,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 60.0, 270.0, 140.0, 21.0 ]
				}
			},
			{
				"box": {
					"id": "obj-unpack-accel",
					"maxclass": "newobj",
					"text": "unpack f f f",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [ "float", "float", "float" ],
					"patching_rect": [ 60.0, 300.0, 140.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-ax",
					"maxclass": "comment",
					"text": "aX",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 60.0, 330.0, 30.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-ax",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 60.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-ay",
					"maxclass": "comment",
					"text": "aY",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 130.0, 330.0, 30.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-ay",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 130.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-az",
					"maxclass": "comment",
					"text": "aZ",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 200.0, 330.0, 30.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-az",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 200.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-gyro",
					"maxclass": "comment",
					"text": "Gyroscope (dps)",
					"fontsize": 13.0,
					"fontface": 1,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 310.0, 270.0, 130.0, 21.0 ]
				}
			},
			{
				"box": {
					"id": "obj-unpack-gyro",
					"maxclass": "newobj",
					"text": "unpack f f f",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [ "float", "float", "float" ],
					"patching_rect": [ 310.0, 300.0, 140.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-gx",
					"maxclass": "comment",
					"text": "gX",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 310.0, 330.0, 30.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-gx",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 310.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-gy",
					"maxclass": "comment",
					"text": "gY",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 380.0, 330.0, 30.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-gy",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 380.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-gz",
					"maxclass": "comment",
					"text": "gZ",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 450.0, 330.0, 30.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-gz",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 450.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-orient",
					"maxclass": "comment",
					"text": "Orientation (degrees)",
					"fontsize": 13.0,
					"fontface": 1,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 560.0, 270.0, 165.0, 21.0 ]
				}
			},
			{
				"box": {
					"id": "obj-unpack-orient",
					"maxclass": "newobj",
					"text": "unpack f f f",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [ "float", "float", "float" ],
					"patching_rect": [ 560.0, 300.0, 140.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-pitch",
					"maxclass": "comment",
					"text": "Pitch",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 560.0, 330.0, 40.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-pitch",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 560.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-roll",
					"maxclass": "comment",
					"text": "Roll",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 630.0, 330.0, 40.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-roll",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 630.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-yaw",
					"maxclass": "comment",
					"text": "Yaw",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 700.0, 330.0, 40.0, 20.0 ]
				}
			},
			{
				"box": {
					"id": "obj-flonum-yaw",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "", "bang" ],
					"patching_rect": [ 700.0, 350.0, 55.0, 22.0 ]
				}
			},
			{
				"box": {
					"id": "obj-comment-status",
					"maxclass": "comment",
					"text": "Connection Status",
					"fontsize": 13.0,
					"fontface": 1,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 60.0, 430.0, 140.0, 21.0 ]
				}
			},
			{
				"box": {
					"id": "obj-status-display",
					"maxclass": "message",
					"text": "",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 60.0, 460.0, 150.0, 22.0 ]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [ "obj-msg-connect", 0 ],
					"destination": [ "obj-nodescript", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-msg-disconnect", 0 ],
					"destination": [ "obj-nodescript", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-msg-listports", 0 ],
					"destination": [ "obj-nodescript", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-msg-reset", 0 ],
					"destination": [ "obj-nodescript", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-nodescript", 0 ],
					"destination": [ "obj-route", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-nodescript", 1 ],
					"destination": [ "obj-nodedebug", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-route", 0 ],
					"destination": [ "obj-unpack-accel", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-route", 1 ],
					"destination": [ "obj-unpack-gyro", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-route", 2 ],
					"destination": [ "obj-unpack-orient", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-route", 3 ],
					"destination": [ "obj-status-display", 1 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-accel", 0 ],
					"destination": [ "obj-flonum-ax", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-accel", 1 ],
					"destination": [ "obj-flonum-ay", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-accel", 2 ],
					"destination": [ "obj-flonum-az", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-gyro", 0 ],
					"destination": [ "obj-flonum-gx", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-gyro", 1 ],
					"destination": [ "obj-flonum-gy", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-gyro", 2 ],
					"destination": [ "obj-flonum-gz", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-orient", 0 ],
					"destination": [ "obj-flonum-pitch", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-orient", 1 ],
					"destination": [ "obj-flonum-roll", 0 ]
				}
			},
			{
				"patchline": {
					"source": [ "obj-unpack-orient", 2 ],
					"destination": [ "obj-flonum-yaw", 0 ]
				}
			}
		]
	}
}
