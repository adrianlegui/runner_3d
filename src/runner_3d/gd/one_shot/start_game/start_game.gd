class_name StartGame extends OneShot

@export var _player_ref: EntityReference
@export var _start_spawn_point_ref: EntityReference
@export var _game_state_ref: EntityReference


func _on_first_start() -> void:
	var game_state: GameState = get_game_state()
	var player: Character = get_player()
	var start_spawn_point: SpawnPoint = get_start_spawn_point()
	var start_cell: Cell = start_spawn_point.get_cell()
	var start_map: Map = start_cell.get_map()

	player.move_to_spawn_point(start_spawn_point)
	game_state.set_player(player)
	game_state.set_current_cell(start_cell)
	game_state.set_current_map(start_map)


func get_start_spawn_point() -> SpawnPoint:
	return _start_spawn_point_ref.get_reference()


func get_player() -> Character:
	return _player_ref.get_reference()


func get_game_state() -> GameState:
	return _game_state_ref.get_reference()
