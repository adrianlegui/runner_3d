# GdUnit generated TestSuite
class_name MapTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/runner_3d/gd/map/map.gd'

func test__add_extra_persistent_properties() -> void:
	var map: Map = auto_free(Map.new()) as Map
	var props: PackedStringArray = []
	map._add_extra_persistent_properties(props)
	assert_array(props).contains(["_enabled"])


func test_is_enabled() -> void:
	var map: Map = auto_free(Map.new()) as Map
	assert_bool(map.is_enabled()).is_false()


func test_set_enabled() -> void:
	var map: Map = auto_free(Map.new()) as Map
	map.set_enabled(true)
	assert_bool(map.is_enabled()).is_true()
