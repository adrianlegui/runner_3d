# GdUnit generated TestSuite
class_name CellTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

# TestSuite generated from
const __source = "res://src/runner_3d/gd/cell/cell.gd"
const PHYSICAL_CELL_FILE_PATH: String = "res://src/runner_3d/gd/physical_cell/physical_cell.tscn"
const CELL = preload("res://src/runner_3d/gd/cell/cell.tscn")
var cell: Cell


func before_test() -> void:
	cell = auto_free(CELL.instantiate()) as Cell
	add_child(cell)


func test__add_extra_persistent_properties() -> void:
	var props: PackedStringArray = []
	cell._add_extra_persistent_properties(props)
	assert_array(props).contains(
		["_map_ref", "_grid_x", "_grid_y", "_grid_z", "_physical_cell_file_path"]
	)


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


func test_emit_body_entered_cell() -> void:
	var body: Node3D = auto_free(Node3D.new())
	var monitor_cell := monitor_signals(cell) as Cell
	monitor_cell.emit_body_entered_cell(body)
	await assert_signal(monitor_cell).wait_until(10).is_emitted("body_entered_cell")


func test_emit_body_exited_cell() -> void:
	var body: Node3D = auto_free(Node3D.new())
	var monitor_cell := monitor_signals(cell) as Cell
	monitor_cell.emit_body_exited_cell(body)
	await assert_signal(monitor_cell).wait_until(10).is_emitted("body_exited_cell")


func test__on_enabled_changed() -> void:
	var spy_cell := spy(cell) as Cell
	spy_cell._on_enabled_changed()

	verify(spy_cell)._update_physical_cell()


func test__update_physical_cell_enabled_true() -> void:
	var spy_cell := spy(cell) as Cell
	spy_cell._enabled = false
	spy_cell.set_enabled(true)
	verify(spy_cell).is_enabled()
	verify(spy_cell)._add_physical_cell()


func test__update_physical_cell_enabled_false() -> void:
	var spy_cell := spy(cell) as Cell
	spy_cell._enabled = true
	spy_cell.set_enabled(false)
	verify(spy_cell).is_enabled()
	verify(spy_cell)._remove_physical_cell()


func test__get_physical_cell() -> void:
	assert_object(cell._get_physical_cell()).is_null()
	cell._physical_cell_file_path = PHYSICAL_CELL_FILE_PATH
	var result: PhysicalCell = auto_free(cell._get_physical_cell())
	assert_object(result).is_not_null()


func test__add_physical_cell() -> void:
	cell._physical_cell_file_path = PHYSICAL_CELL_FILE_PATH
	cell._add_physical_cell()
	assert_object(cell._physical_cell).is_not_null()
	assert_array(cell.get_children()).contains([cell._physical_cell])
	assert_object(cell._physical_cell._cell).is_same(cell)


func test__remove_physical_cell() -> void:
	var physical_cell := auto_free(PhysicalCell.new()) as PhysicalCell
	cell._physical_cell = physical_cell
	cell._remove_physical_cell()
	assert_object(cell._physical_cell).is_null()


func test__on_game_event_all_entities_added() -> void:
	var spy_cell := spy(cell) as Cell
	spy_cell._on_game_event_all_entities_added()
	verify(spy_cell)._update_physical_cell()
