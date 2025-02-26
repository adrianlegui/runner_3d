class_name Cell extends EnableableEntity
## Unidad para los [Map].

## Se emite cuando un nodo físico entra en la [Cell].
signal body_entered_cell(body: Node3D)
## Se emite cuando un nodo físico sale de la [Cell].
signal body_exited_cell(body: Node3D)

const VAR_PHYSICAL_CELL_FILE_PATH: String = "_physical_cell_file_path"
const VAR_GRID_X: String = "_grid_x"
const VAR_GRID_Y: String = "_grid_y"
const VAR_GRID_Z: String = "_grid_z"
const VAR_MAP_REF: String = "_map_ref"

@export_file("*.tscn") var _physical_cell_file_path: String = ""
@export var _map_ref: EntityReference
@export var _grid_x: int = 0
@export var _grid_y: int = 0
@export var _grid_z: int = 0

var _physical_cell: PhysicalCell


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


func set_map(map: Map) -> void:
	_map_ref.set_entity(map)


func get_map() -> Map:
	return _map_ref.get_reference()


func emit_body_entered_cell(body: Node3D) -> void:
	body_entered_cell.emit(body)


func emit_body_exited_cell(body: Node3D) -> void:
	body_exited_cell.emit(body)


func _on_enabled_changed() -> void:
	_update_physical_cell()


func _update_physical_cell() -> void:
	if is_enabled():
		_add_physical_cell()
	else:
		_remove_physical_cell()


func _add_extra_persistent_properties(persistent_properties: PackedStringArray) -> void:
	persistent_properties.append_array(
		["_map_ref", "_grid_x", "_grid_y", "_grid_z", "_physical_cell_file_path"]
	)


func _get_physical_cell() -> PhysicalCell:
	if _physical_cell_file_path.is_empty():
		push_error("%s: _physical_cell_file_path esta vacia." % name)
		return null
	var pck: PackedScene = load(_physical_cell_file_path)
	return pck.instantiate()


func _add_physical_cell() -> void:
	_physical_cell = _get_physical_cell()
	if _physical_cell == null:
		push_error("%s: no se pudo agregar PhysicalCell")
		return
	_physical_cell.set_cell(self)
	add_child(_physical_cell)


func _remove_physical_cell() -> void:
	if _physical_cell != null:
		_physical_cell.queue_free()
		_physical_cell = null


func _on_game_event_all_entities_added() -> void:
	_update_physical_cell()
	_connect_signals()


func _on_map_enabled_changed() -> void:
	var map: Map = get_map()
	if map == null:
		return
	set_enabled(map.is_enabled())


func _connect_signals() -> void:
	var map: Map = get_map()
	if map == null:
		return
	map.enabled_changed.connect(_on_map_enabled_changed)
