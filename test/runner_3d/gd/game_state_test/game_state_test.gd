# GdUnit generated TestSuite
class_name GameStateTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/runner_3d/gd/game_state/game_state.gd'
const GAME_STATE = preload("res://src/runner_3d/gd/game_state/game_state.tscn")
var entity: Entity

func before() -> void:
	entity = auto_free(Entity.new()) as Entity
	ModManager.add_entity(entity)


func test__add_extra_persistent_properties() -> void:
	var game_state: GameState = auto_free(GAME_STATE.instantiate()) as GameState
	var props: PackedStringArray = []
	game_state._add_extra_persistent_properties(props)
	assert_array(
		props
	).contains(
		[
			"_cell_ref",
			"_map_ref",
			"_player_ref"
		]
	)


func test_set_current_cell() -> void:
	var game_state: GameState = auto_free(GAME_STATE.instantiate()) as GameState
	game_state.set_current_cell(entity)
	assert_object(game_state.get_current_cell()).is_same(entity)


func test_get_current_cell() -> void:
	var game_state: GameState = auto_free(GAME_STATE.instantiate()) as GameState
	assert_object(game_state.get_current_cell()).is_null()


func test_set_player() -> void:
	var game_state: GameState = auto_free(GAME_STATE.instantiate()) as GameState
	game_state.set_player(entity)
	assert_object(game_state.get_player()).is_same(entity)


func test_get_player() -> void:
	var game_state: GameState = auto_free(GAME_STATE.instantiate()) as GameState
	assert_object(game_state.get_player()).is_null()


func test_set_current_map() -> void:
	var game_state: GameState = auto_free(GAME_STATE.instantiate()) as GameState
	game_state.set_current_map(entity)
	assert_object(game_state.get_current_map()).is_same(entity)


func test_get_current_map() -> void:
	var game_state: GameState = auto_free(GAME_STATE.instantiate()) as GameState
	assert_object(game_state.get_current_map()).is_null()
