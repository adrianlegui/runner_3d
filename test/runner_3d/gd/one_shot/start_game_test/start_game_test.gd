# GdUnit generated TestSuite
class_name StartGameTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

# TestSuite generated from
const __source = "res://src/runner_3d/gd/one_shot/start_game/start_game.gd"


func test__on_first_start() -> void:
	var start_game: StartGame = auto_free(StartGame.new()) as StartGame
	var start_spawn_point_ref: EntityReference = mock(EntityReference) as EntityReference
	start_game._start_spawn_point_ref = start_spawn_point_ref
	var player_ref: EntityReference = mock(EntityReference) as EntityReference
	start_game._player_ref = player_ref
	var game_state_ref: EntityReference = mock(EntityReference) as EntityReference
	start_game._game_state_ref = game_state_ref

	var character: Character = mock(Character) as Character
	do_return(character).on(player_ref).get_reference()

	var spawn_point: SpawnPoint = mock(SpawnPoint) as SpawnPoint
	do_return(spawn_point).on(start_spawn_point_ref).get_reference()
	var cell: Cell = mock(Cell) as Cell
	do_return(cell).on(spawn_point).get_cell()
	var map: Map = auto_free(Map.new())
	do_return(map).on(cell).get_map()

	var game_state: GameState = spy(auto_free(GameState.new())) as GameState
	game_state._cell_ref = mock(EntityReference)
	game_state._map_ref = mock(EntityReference)
	game_state._player_ref = mock(EntityReference)
	do_return(game_state).on(game_state_ref).get_reference()

	start_game._on_first_start()

	verify(character, 1).move_to_spawn_point(spawn_point)
	verify(game_state, 1).set_player(character)
	verify(game_state, 1).set_current_cell(cell)
	verify(game_state, 1).set_current_map(map)


func test_get_start_spawn_point() -> void:
	var start_game: StartGame = auto_free(StartGame.new()) as StartGame
	var start_spawn_point_ref: EntityReference = mock(EntityReference) as EntityReference
	start_game._start_spawn_point_ref = start_spawn_point_ref
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new())
	do_return(spawn_point).on(start_spawn_point_ref).get_reference()
	assert_object(start_game.get_start_spawn_point()).is_same(spawn_point)


func test_get_player() -> void:
	var start_game: StartGame = auto_free(StartGame.new()) as StartGame
	var player_ref: EntityReference = mock(EntityReference) as EntityReference
	start_game._player_ref = player_ref
	var character: Character = auto_free(Character.new()) as Character
	do_return(character).on(player_ref).get_reference()
	assert_object(start_game.get_player()).is_same(character)


func test_get_game_state() -> void:
	var start_game: StartGame = auto_free(StartGame.new()) as StartGame
	var game_state_ref: EntityReference = mock(EntityReference) as EntityReference
	start_game._game_state_ref = game_state_ref
	var game_state: GameState = auto_free(GameState.new()) as GameState
	do_return(game_state).on(game_state_ref).get_reference()
	assert_object(start_game.get_game_state()).is_same(game_state)
