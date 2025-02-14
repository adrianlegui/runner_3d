class_name GameState extends Entity

@export var _player_ref: EntityReference
@export var _map_ref: EntityReference
@export var _cell_ref: EntityReference

func get_current_map() -> Entity:
	return _map_ref.get_reference()


func set_current_map(map: Entity) -> void:
	_map_ref.set_entity_id(map.name)


func get_player() -> Entity:
	return _player_ref.get_reference()


func set_player(player: Entity) -> void:
	_player_ref.set_entity_id(player.name)


func get_current_cell() -> Entity:
	return _cell_ref.get_reference()


func set_current_cell(cell: Entity) -> void:
	_cell_ref.set_entity_id(cell.name)


func _add_extra_persistent_properties(
	persistent_properties: PackedStringArray
) -> void:
	persistent_properties.append_array(
		[
			"_cell_ref",
			"_map_ref",
			"_player_ref"
		]
	)
