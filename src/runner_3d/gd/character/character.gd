class_name Character extends EnableableEntity

@export var _location: Location
@export var _scene_physical_character_ref: EntityReference

var _physical_character: PhysicalCharacter


func get_physical_character() -> PhysicalCharacter:
	return _physical_character


func add_cell(cell: Cell) -> void:
	_location.add_cell(cell)


func remove_cell(cell: Cell) -> void:
	_location.remove_cell(cell)


func move_to_spawn_point(spawn_point: SpawnPoint) -> void:
	set_enabled(false)
	await get_tree().process_frame
	_location.clear_cells()
	set_transform_3d(spawn_point.get_transform_3d())
	var cell: Cell = spawn_point.get_cell()
	set_cell(cell)
	set_enabled(cell.is_enabled())


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
	if _physical_character != null:
		return
	_physical_character = _get_physical_character_instance()
	_physical_character.set_character(self)
	add_child(_physical_character)


func _hide() -> void:
	if _physical_character == null:
		return
	_physical_character.queue_free()


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


func _get_physical_character_instance() -> PhysicalCharacter:
	var scene: Scene = _scene_physical_character_ref.get_reference()
	return scene.get_scene_instance()
