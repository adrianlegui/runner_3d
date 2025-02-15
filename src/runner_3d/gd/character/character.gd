class_name Character extends EnableableEntity

@export var _cell_ref: EntityReference

var _transform_3d: Transform3D = Transform3D.IDENTITY


func get_position() -> Vector3:
	return _transform_3d.origin


func set_position(position: Vector3) -> void:
	_transform_3d.origin = position


func get_cell() -> Cell:
	return _cell_ref.get_reference()


func set_cell(cell: Cell) -> void:
	if cell == get_cell():
		return

	_disconnect_cell_signals()

	if cell == null:
		_cell_ref.set_entity_id("")
	else:
		_cell_ref.set_entity(cell)
		_connect_cell_signals()


func set_transform_3d(transform_3d: Transform3D) -> void:
	_transform_3d = transform_3d


func get_transform_3d() -> Transform3D:
	return _transform_3d


func _add_extra_persistent_properties(persistent_properties: PackedStringArray) -> void:
	persistent_properties.append_array(["_transform_3d", "_cell_ref"])


func _connect_cell_signals() -> void:
	var cell: Cell = get_cell()
	if cell == null:
		return
	cell.enabled_changed.connect(_on_cell_enabled_changed)


func _disconnect_cell_signals() -> void:
	var cell: Cell = get_cell()
	if cell == null:
		return
	cell.enabled_changed.disconnect(_on_cell_enabled_changed)


func _on_cell_enabled_changed() -> void:
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


func _show() -> void:
	pass


func _hide() -> void:
	pass
