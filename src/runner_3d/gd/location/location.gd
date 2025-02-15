class_name Location extends Data

@export var _transform_3d: Transform3D = Transform3D.IDENTITY
@export var _cell_ref: EntityReference


func _add_extra_persistent_properties(persistent_properties: PackedStringArray) -> void:
	persistent_properties.append_array(["_transform_3d", "_cell_ref"])


func set_transform_3d(transform_3d: Transform3D) -> void:
	_transform_3d = transform_3d


func get_transform_3d() -> Transform3D:
	return _transform_3d


func get_cell() -> Cell:
	return _cell_ref.get_reference()


func set_cell(cell: Cell) -> void:
	_cell_ref.set_entity(cell)


func set_position(position: Vector3) -> void:
	_transform_3d.origin = position


func get_position() -> Vector3:
	return _transform_3d.origin


func set_forward(forward: Vector3, up: Vector3 = Vector3.UP) -> void:
	var use_model_front: bool = true
	_transform_3d = _transform_3d.looking_at(
		_transform_3d.origin + forward,
		up,
		use_model_front
	)


func get_forward() -> Vector3:
	return _transform_3d.basis.z
