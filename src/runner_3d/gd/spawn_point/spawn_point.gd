class_name SpawnPoint extends Entity

@export var _location: Location


func get_cell() -> Cell:
	return _location.get_cell()


func set_cell(cell: Cell):
	_location.set_cell(cell)


func get_position() -> Vector3:
	return _location.get_position()


func set_position(position: Vector3) -> void:
	_location.set_position(position)


func get_forward() -> Vector3:
	return _location.get_forward()


func set_forward(forward: Vector3) -> void:
	_location.set_forward(forward)


func get_transform_3d() -> Transform3D:
	return _location.get_transform_3d()


func set_transform_3d(transform_3d: Transform3D) -> void:
	_location.set_transform_3d(transform_3d)


func _add_extra_persistent_properties(persistent_properties) -> void:
	persistent_properties.append("_location")
