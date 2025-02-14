class_name Cell extends Entity

@export var _map_ref: EntityReference
@export var _grid_x: int = 0
@export var _grid_y: int = 0
@export var _grid_z: int = 0

var _enabled: bool = false

func set_grid_x(x: int) -> void:
	_grid_x = x


func set_grid_y(y: int) -> void:
	_grid_y = y


func set_grid_z(z: int) -> void:
	_grid_z = z


func get_grid_x() -> int:
	return _grid_x


func get_grid_y() -> int:
	return _grid_y


func get_grid_z() -> int:
	return _grid_z


func set_map(map: Entity) -> void:
	_map_ref.set_entity_id(map.name)


func get_map() -> Entity:
	return _map_ref.get_reference()


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
			"_map_ref",
			"_enabled",
			"_grid_x",
			"_grid_y",
			"_grid_z"
		]
	)
