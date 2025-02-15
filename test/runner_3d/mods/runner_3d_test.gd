class_name Runner3DCfgTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

const RUNNER_3D_PATH = "res://src/runner_3d/mods/runner_3d.cfg"


func test_runner_3d_cfg_is_valid() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	var state: int = cfg.load(RUNNER_3D_PATH)
	assert_int(state).is_equal(OK)
