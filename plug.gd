extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug(
		"MikeSchulze/gdUnit4",
		{"tag": "v4.5.0", "include": ["addons/gdUnit4"], "exclude": ["addons/gdUnit4/test"]}
	)
	plug(
		"ramokz/phantom-camera",
		{"tag": "v0.8.2.2", "exclude": ["addons/phantom_camera/examples"]},
	)
	plug("MarcoFazioRandom/Virtual-Joystick-Godot")
	plug(
		"adrianlegui/ente",
		{"exclude": ["addons/ente/test", "addons/ente/schema", "addons/ente/docs"], "tag": "0.12.0"}
	)
	plug("poingstudios/godot-admob-plugin", {"tag": "v3.1.1"})
