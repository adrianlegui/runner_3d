class_name Character extends EnableableEntity

@export var _location: Location


func set_forward(forward: Vector3) -> void:
	_location.set_forward(forward)


func get_forward() -> Vector3:
	return _location.get_forward()


func get_position() -> Vector3:
	return _location.get_position()


func set_position(position: Vector3) -> void:
	_location.set_position(position)


func get_cell() -> Cell:
	return _location.get_cell()


func set_cell(cell: Cell) -> void:
	_location.set_cell(cell)


func set_transform_3d(transform_3d: Transform3D) -> void:
	_location.set_transform_3d(transform_3d)


func get_transform_3d() -> Transform3D:
	return _location.get_transform_3d()


func _add_extra_persistent_properties(persistent_properties: PackedStringArray) -> void:
	persistent_properties.append_array(["_location"])


func _show() -> void:
	pass


func _hide() -> void:
	pass


func _on_location_cell_enabled_changed() -> void:
	var cell: Cell = get_cell()
	if cell == null:
		return
	set_enabled(cell.is_enabled())


func _on_enabled_changed() -> void:
	var cell: Cell = get_cell()
	if cell == null:
		return
	if cell.is_enabled():
		_show()
	else:
		_hide()
