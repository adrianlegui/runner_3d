# GdUnit generated TestSuite
class_name CellTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/runner_3d/gd/cell/cell.gd'
const CELL = preload("res://src/runner_3d/gd/cell/cell.tscn")

func test__add_extra_persistent_properties() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var props: PackedStringArray = []
	cell._add_extra_persistent_properties(props)
	assert_array(
		props
	).contains(
		[
			"_map_ref",
			"_enabled",
			"_grid_x",
			"_grid_y",
			"_grid_z"
		]
	)


func test_is_enabled() -> void:
	var c: Cell = auto_free(CELL.instantiate()) as Cell
	assert_bool(c.is_enabled()).is_false()


func test_set_enabled() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	cell.set_enabled(true)
	assert_bool(cell.is_enabled()).is_true()
	cell.set_enabled(false)
	assert_bool(cell.is_enabled()).is_false()


func test_get_map() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	assert_object(cell.get_map()).is_null()


func test_set_map() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var map: Entity = auto_free(Entity.new())
	ModManager.add_entity(map)
	cell.set_map(map)
	assert_object(cell.get_map()).is_same(map)


func test_get_grid_z() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	assert_int(cell.get_grid_z()).is_zero()


func test_get_grid_y() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	assert_int(cell.get_grid_y()).is_zero()


func test_get_grid_x() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	assert_int(cell.get_grid_x()).is_zero()


func test_set_grid_z() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var z: int = 9
	cell.set_grid_z(z)
	assert_int(cell.get_grid_z()).is_equal(z)


func test_set_grid_y() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var y: int = 9
	cell.set_grid_y(y)
	assert_int(cell.get_grid_y()).is_equal(y)


func test_set_grid_x() -> void:
	var cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var x: int = 9
	cell.set_grid_x(x)
	assert_int(cell.get_grid_x()).is_equal(x)
