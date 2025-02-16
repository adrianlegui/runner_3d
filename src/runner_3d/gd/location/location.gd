class_name Location extends Data

signal cell_changed(previous: Cell, new: Cell)
signal cell_enabled_changed

@export var _transform_3d: Transform3D = Transform3D.IDENTITY
@export var _cell_ref: EntityReference


func set_transform_3d(transform_3d: Transform3D) -> void:
	_transform_3d = transform_3d


func get_transform_3d() -> Transform3D:
	return _transform_3d


func get_cell() -> Cell:
	return _cell_ref.get_reference()


func set_cell(cell: Cell) -> void:
	if cell == get_cell():
		return

	var previous: Cell = get_cell()
	var new: Cell = cell

	if cell == null:
		_cell_ref.set_entity_id("")
	else:
		_cell_ref.set_entity(cell)

	_disconnect_cell_signals(previous)
	_connect_cell_signals(new)

	cell_changed.emit(previous, new)


func set_position(position: Vector3) -> void:
	_transform_3d.origin = position


func get_position() -> Vector3:
	return _transform_3d.origin


func set_forward(forward: Vector3, up: Vector3 = Vector3.UP) -> void:
	var use_model_front: bool = true
	_transform_3d = _transform_3d.looking_at(_transform_3d.origin + forward, up, use_model_front)


func get_forward() -> Vector3:
	return _transform_3d.basis.z


func _add_extra_persistent_properties(persistent_properties: PackedStringArray) -> void:
	persistent_properties.append_array(["_transform_3d", "_cell_ref"])


func _connect_cell_signals(cell: Cell) -> void:
	if cell == null:
		return
	cell.enabled_changed.connect(_on_cell_enabled_changed)


func _disconnect_cell_signals(cell: Cell) -> void:
	if cell == null:
		return
	cell.enabled_changed.disconnect(_on_cell_enabled_changed)


func _on_cell_enabled_changed() -> void:
	cell_enabled_changed.emit()


func _add_extra_groups(groups: PackedStringArray) -> void:
	groups.append(GameEvents.GROUP)


func _on_game_event_all_entities_added() -> void:
	_connect_cell_signals(get_cell())
