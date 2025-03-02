class_name GameState extends Entity

@export var _player_ref: EntityReference
@export var _cell_ref: EntityReference


func get_current_map() -> Map:
	var current_cell := get_current_cell()
	return null if current_cell == null else current_cell.get_map()


func get_player() -> Character:
	return _player_ref.get_reference()


func set_player(player: Character) -> void:
	_player_ref.set_entity_id(player.name)


func get_current_cell() -> Cell:
	return null if _cell_ref.get_entity_id().is_empty() else _cell_ref.get_reference()


func set_current_cell(cell: Cell) -> void:
	var current_cell := get_current_cell()
	var current_map := get_current_map()
	if cell == null:
		if current_map != null:
			current_map.disable()
		_cell_ref.set_entity_id("")
	elif current_cell != cell:
		var map := cell.get_map()
		if current_map != null and map != current_map:
			current_map.disable()
			await get_tree().process_frame
		_cell_ref.set_entity(cell)
		map.enable()


func _add_extra_persistent_properties(persistent_properties: PackedStringArray) -> void:
	persistent_properties.append_array(["_cell_ref", "_player_ref"])
