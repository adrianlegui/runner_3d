#!/usr/bin/env -S godot --headless -s
extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug("MarcoFazioRandom/Virtual-Joystick-Godot")
	plug(
		"adrianlegui/ente",
		{"exclude": ["addons/ente/test", "addons/ente/schema"]}
	)
