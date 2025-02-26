@tool
class_name MapCreator extends Node

const PREFIX: String = "Map"
const CELL_SCENE_FILE_PATH: String = "res://src/runner_3d/gd/cell/cell.tscn"
const MAP = preload("res://src/runner_3d/gd/map/map.tscn")

@export var commit_changes: bool = false:
	set = set_commit_changes
@export_file("*.cfg") var cfg_path: String = ""
@export var map_name: String = ""
@export var clean_cfg: bool = false:
	set = set_clean_cfg

@warning_ignore("unused_parameter")
func set_commit_changes(value: bool) -> void:
	if _is_correct():
		_commit_changes()


@warning_ignore("unused_parameter")
func set_clean_cfg(value: bool) -> void:
	if _is_correct():
		_clean()


func _clean() -> void:
	var mod: Mod = Mod.new()
	mod.load_data_from_file(cfg_path)
	var k: PackedStringArray = []
	var entities: Dictionary = mod.get_entities()
	for key: String in entities:
		if key.begins_with(_get_map_id()):
			k.append(key)

	for key: String in k:
		entities.erase(key)

	mod.save_data(cfg_path)


func _commit_changes() -> void:
	_clean()
	var mod: Mod = Mod.new()
	mod.load_data_from_file(cfg_path)
	var entities: Dictionary = mod.get_entities()
	var map_id: String = _get_map_id()
	var map: Map = MAP.instantiate()
	entities[map_id] = map.get_data()

	var physical_cells: Array[PhysicalCell] = _get_physical_cells()
	for physical_cell: PhysicalCell in physical_cells:
		var cell_id: String = "%s%s" % [map_id, physical_cell.name.replace("Physical", "")]
		entities[cell_id] = _create_cell_data(
			CELL_SCENE_FILE_PATH,
			map_id,
			physical_cell.scene_file_path,
			physical_cell.x,
			physical_cell.y,
			physical_cell.z
		)

	map.queue_free()

	mod.save_data(cfg_path)


func _is_correct() -> bool:
	var correct: bool = true
	if cfg_path.is_empty():
		push_error("%s: cfg_path esta vacio")
		correct = false
	elif not FileAccess.file_exists(cfg_path):
		push_error("%s: no existe fichero %s" % [name, cfg_path])
		correct = false
	return correct


func _get_physical_cells() -> Array[PhysicalCell]:
	var physical_cells: Array[PhysicalCell] = []
	for child: Node in get_children():
		if child as PhysicalCell and not child.scene_file_path.is_empty():
			physical_cells.append(child)
	return physical_cells


func _create_cell_data(
	cell_scene_file_path: String,
	map_id: String,
	physical_cell_file_path: String,
	x: int,
	y: int,
	z: int
) -> Dictionary:
	var data: Dictionary = {
		Data.KEY_SCENE_FILE_PATH: cell_scene_file_path,
		Data.KEY_PROPERTIES:
		{
			Cell.VAR_PHYSICAL_CELL_FILE_PATH: physical_cell_file_path,
			Cell.VAR_GRID_X: x,
			Cell.VAR_GRID_Y: y,
			Cell.VAR_GRID_Z: z,
			Cell.VAR_MAP_REF: {Data.KEY_PROPERTIES: {"_entity_id": map_id}}
		}
	}
	return data


func _get_map_id() -> String:
	return "%s%s" % [PREFIX, map_name]
