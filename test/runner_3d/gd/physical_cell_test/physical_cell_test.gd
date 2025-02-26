# GdUnit generated TestSuite
class_name PhysicalCellTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

# TestSuite generated from
const __source = "res://src/runner_3d/gd/physical_cell/physical_cell.gd"
const VECTOR_APPROX: Vector3 = Vector3.ONE * 0.00001


func test_set_x() -> void:
	var physical_cell := spy(auto_free(PhysicalCell.new())) as PhysicalCell
	var x: int = 10
	physical_cell.set_x(x)
	verify(physical_cell, 1)._move()
	assert_int(physical_cell.x).is_equal(x)


func test_set_y() -> void:
	var physical_cell := spy(auto_free(PhysicalCell.new())) as PhysicalCell
	var y: int = 10
	physical_cell.set_y(y)
	verify(physical_cell, 1)._move()
	assert_int(physical_cell.y).is_equal(y)


func test_set_z() -> void:
	var physical_cell := spy(auto_free(PhysicalCell.new())) as PhysicalCell
	var z: int = 10
	physical_cell.set_z(z)
	verify(physical_cell, 1)._move()
	assert_int(physical_cell.z).is_equal(z)


func test_set_cell() -> void:
	var physical_cell := auto_free(PhysicalCell.new()) as PhysicalCell
	var cell := mock(Cell) as Cell
	var origin: Vector3i = Vector3i.ONE * 99
	do_return(origin.x).on(cell).get_grid_x()
	do_return(origin.y).on(cell).get_grid_y()
	do_return(origin.z).on(cell).get_grid_z()
	physical_cell.set_cell(cell)
	assert_int(physical_cell.x).is_equal(origin.x)
	assert_int(physical_cell.y).is_equal(origin.y)
	assert_int(physical_cell.z).is_equal(origin.z)


func test__move() -> void:
	var physical_cell := auto_free(PhysicalCell.new()) as PhysicalCell
	physical_cell._move()
	assert_vector(physical_cell.transform.origin).is_equal_approx(Vector3.ZERO, VECTOR_APPROX)


func test__connect_signals() -> void:
	var physical_cell := auto_free(PhysicalCell.new()) as PhysicalCell
	var area_3d := auto_free(Area3D.new()) as Area3D
	physical_cell._area_3d = area_3d
	physical_cell._connect_signals()
	assert_bool(area_3d.body_entered.is_connected(physical_cell._on_area_3d_body_entered)).is_true()
	assert_bool(area_3d.body_exited.is_connected(physical_cell._on_area_3d_body_exited))


func test__on_area_3d_body_entered() -> void:
	var physical_cell := auto_free(PhysicalCell.new()) as PhysicalCell
	var cell := mock(Cell) as Cell
	physical_cell._cell = cell
	var node_3d := auto_free(Node3D.new()) as Node3D
	physical_cell._on_area_3d_body_entered(node_3d)
	verify(cell, 1).emit_body_entered_cell(node_3d)


func test__on_area_3d_body_exited() -> void:
	var physical_cell := auto_free(PhysicalCell.new()) as PhysicalCell
	var cell := mock(Cell) as Cell
	physical_cell._cell = cell
	var node_3d := auto_free(Node3D.new()) as Node3D
	physical_cell._on_area_3d_body_exited(node_3d)
	verify(cell, 1).emit_body_exited_cell(node_3d)
