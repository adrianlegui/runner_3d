class_name EnableableEntity extends Entity

signal enabled_changed

var _enabled: bool = false

func enable() -> void:
	set_enabled(true)


func disable() -> void:
	set_enabled(false)


func set_enabled(enabled: bool) -> void:
	if enabled == _enabled:
		return

	_enabled = enabled
	_on_enabled_changed()
	enabled_changed.emit()


func is_enabled() -> bool:
	return _enabled


func _on_enabled_changed() -> void:
	pass


func _add_extra_persistent_properties(
	persistent_properties: PackedStringArray
) -> void:
	persistent_properties.append("_enabled")


func _on_game_event_all_entities_added() -> void:
	_on_enabled_changed()
