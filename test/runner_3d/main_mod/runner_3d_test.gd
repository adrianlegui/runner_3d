class_name Runner3DCfgTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

const RUNNER_3D_PATH = "res://src/runner_3d/main_mod/runner_3d.cfg"


func test_runner_3d_cfg_is_valid() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	var state: int = cfg.load(RUNNER_3D_PATH)
	assert_int(state).is_equal(OK)


func test_runner_3d_cfg_has_the_entities() -> void:
	var entities: Dictionary = {
		"GameState": "res://src/runner_3d/entities/game_state.tscn",
		"StartGame": "res://src/runner_3d/entities/start_game.tscn",
		"MapSmokeTests": "res://src/runner_3d/entities/map_smoke_tests.tscn",
		"SceneCamera3DWithHost": "res://src/runner_3d/entities/scene_camera_3d_with_host.tscn",
		"Camera": "res://src/runner_3d/entities/camera.tscn",
		"ScenePhanthomCamera3D": "res://src/runner_3d/entities/scene_phantom_camera_3d.tscn"
	}
	var cfg: ConfigFile = ConfigFile.new()
	var state: int = cfg.load(RUNNER_3D_PATH)
	assert_int(state).is_equal(OK)
	var mod: Mod = Mod.new(cfg)
	for key: String in entities:
		var path: String = entities[key]
		var ent: Dictionary = mod.get_entities().get(key)
		assert_object(ent).is_not_null()
		var scene_path: String = ent.get(Entity.KEY_SCENE_FILE_PATH, "")
		assert_str(scene_path).is_not_empty()
		assert_str(scene_path).is_equal(path)
		var scene: PackedScene = load(scene_path)
		assert_object(scene).is_not_null()
