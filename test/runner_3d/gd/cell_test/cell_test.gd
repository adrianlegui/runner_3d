# GdUnit generated TestSuite
class_name CellTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

# TestSuite generated from
const __source = "res://src/runner_3d/gd/cell/cell.gd"
const CELL = preload("res://src/runner_3d/gd/cell/cell.tscn")
var cell: Cell


func before_test() -> void:
	cell = auto_free(CELL.instantiate()) as Cell
	add_child(cell)


func test__add_extra_persistent_properties() -> void:
	var props: PackedStringArray = []
	cell._add_extra_persistent_properties(props)
	assert_array(props).contains(["_map_ref", "_grid_x", "_grid_y", "_grid_z"])


func test_get_map() -> void:
	assert_object(cell.get_map()).is_null()


func test_set_map() -> void:
	var map: Map = auto_free(Map.new()) as Map
	ModManager.add_entity(map)
	cell.set_map(map)
	assert_object(cell.get_map()).is_same(map)


func test_get_grid_z() -> void:
	assert_int(cell.get_grid_z()).is_zero()


func test_get_grid_y() -> void:
	assert_int(cell.get_grid_y()).is_zero()


func test_get_grid_x() -> void:
	assert_int(cell.get_grid_x()).is_zero()


func test_set_grid_z() -> void:
	var z: int = 9
	cell.set_grid_z(z)
	assert_int(cell.get_grid_z()).is_equal(z)


func test_set_grid_y() -> void:
	var y: int = 9
	cell.set_grid_y(y)
	assert_int(cell.get_grid_y()).is_equal(y)


func test_set_grid_x() -> void:
	var x: int = 9
	cell.set_grid_x(x)
	assert_int(cell.get_grid_x()).is_equal(x)


func test_emit_body_entered() -> void:
	var body: Node3D = auto_free(Node3D.new())
	var monitor_cell := monitor_signals(cell) as Cell
	monitor_cell.emit_body_entered_cell(body)
	await assert_signal(cell).wait_until(10).is_emitted("body_entered_cell")


func test_emit_body_exited() -> void:
	var body: Node3D = auto_free(Node3D.new())
	var monitor_cell := monitor_signals(cell) as Cell
	monitor_cell.emit_body_exited_cell(body)
	await assert_signal(cell).wait_until(10).is_emitted("body_exited_cell")
