class_name Map extends Entity

var _enabled: bool = false

func set_enabled(enabled: bool) -> void:
	if enabled == _enabled:
		return

	_enabled = enabled


func is_enabled() -> bool:
	return _enabled


func _add_extra_persistent_properties(
	persistent_properties: PackedStringArray
) -> void:
	persistent_properties.append_array(
		[
			"_enabled"
		]
	)
