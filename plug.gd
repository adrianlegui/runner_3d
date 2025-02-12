extends "res://addons/gd-plug/plug.gd"

func _plugging():
	plug(
		"MikeSchulze/gdUnit4",
		{
			"tag": "v4.5.0",
			"include": ["addons/gdUnit4"],
			"exclude": ["addons/gdUnit4/test"]
		}
	)
	plug("ramokz/phantom-camera", {"tag": "v0.8.2.2"}	)
	plug("MarcoFazioRandom/Virtual-Joystick-Godot")
	plug(
		"git@gitlab.com:adrian.luis.leguizamon/mod_manager.git",
		{
			"exclude": ["addons/mod_manager/test", "addons/mod_manager/schema"],
			"tag": "v0.9.0"
		}
	)
	plug("poingstudios/godot-admob-plugin", {"tag": "v3.1.1"})
