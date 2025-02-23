class_name StartGame extends OneShot

@export var _player_ref: EntityReference
@export var _start_spawn_point_ref: EntityReference
@export var _game_state_ref: EntityReference


func _on_first_start() -> void:
	var game_state: GameState = get_game_state()
	var player: Character = get_player()
	var start_spawn_point: SpawnPoint = get_start_spawn_point()

	var start_cell: Cell
	var start_map: Map
	if start_spawn_point != null:
		start_cell = start_spawn_point.get_cell()
		start_map = start_cell.get_map()
	else:
		push_error("%s: start_spawn_point es nulo" % name)

	if player != null:
		player.move_to_spawn_point(start_spawn_point)
	else:
		push_error("%s: player es nulo" % name)

	if game_state != null:
		if player != null:
			game_state.set_player(player)
		if start_cell != null:
			game_state.set_current_cell(start_cell)
		else:
			push_error("%s: start_cell es nulo" % name)
		if start_map != null:
			game_state.set_current_map(start_map)
		else:
			push_error("%s: start_map es nulo" % name)
	else:
		push_error("%s: game_state es nulo." % name)


func get_start_spawn_point() -> SpawnPoint:
	return _start_spawn_point_ref.get_reference()


func get_player() -> Character:
	return _player_ref.get_reference()


func get_game_state() -> GameState:
	return _game_state_ref.get_reference()
