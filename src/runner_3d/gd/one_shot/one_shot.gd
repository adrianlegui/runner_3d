class_name OneShot extends Entity

var _first_start: bool = true

func _on_game_event_started() -> void:
	if _first_start:
		_first_start = false
		_on_first_start()


func _add_extra_persistent_properties(
	persistent_properties: PackedStringArray
) -> void:
	persistent_properties.append("_first_start")


func _on_first_start() -> void:
	pass
