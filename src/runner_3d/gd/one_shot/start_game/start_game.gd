class_name StartGame extends OneShot

@export var _player_ref: EntityReference
@export var _start_spawn_point_ref: EntityReference
@export var _game_state_ref: EntityReference
@export var _camera_ref: EntityReference


func _on_first_start() -> void:
	var game_state: GameState = get_game_state()
	var player: Character = get_player()
	var start_spawn_point: SpawnPoint = get_start_spawn_point()

	var start_cell: Cell
	if start_spawn_point != null:
		start_cell = start_spawn_point.get_cell()
	else:
		push_error("%s: start_spawn_point es nulo" % name)

	if player != null:
		if start_spawn_point != null:
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
	else:
		push_error("%s: game_state es nulo." % name)

	await get_tree().process_frame
	var camera: Camera = get_camera()
	if camera == null:
		push_error("%s: camera es nula" % name)
	else:
		camera.set_follow_target(player)
		camera.enable()


func get_start_spawn_point() -> SpawnPoint:
	return _start_spawn_point_ref.get_reference()


func get_player() -> Character:
	return _player_ref.get_reference()


func get_game_state() -> GameState:
	return _game_state_ref.get_reference()


func get_camera() -> Camera:
	return _camera_ref.get_reference()
