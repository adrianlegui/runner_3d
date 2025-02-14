# GdUnit generated TestSuite
class_name StartGameTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/runner_3d/gd/one_shot/start_game/start_game.gd'
const START_GAME = preload("res://src/runner_3d/gd/one_shot/start_game/start_game.tscn")

func test__on_first_start() -> void:
	var spy_start_game: = spy(auto_free(START_GAME.instantiate())) as StartGame
	spy_start_game._on_game_event_started()
	verify(spy_start_game, 1)._on_first_start()
