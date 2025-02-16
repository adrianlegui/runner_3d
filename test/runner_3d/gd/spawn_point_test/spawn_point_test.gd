# GdUnit generated TestSuite
class_name SpawnPointTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/runner_3d/gd/spawn_point/spawn_point.gd'
const VECTOR_APPROX: Vector3 = Vector3(0.00001, 0.00001, 0.00001)


func test_get_cell() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var location_mock: Location = mock(Location) as Location
	spawn_point._location = location_mock
	var cell: Cell = auto_free(Cell.new()) as Cell
	do_return(cell).on(location_mock).get_cell()
	assert_object(spawn_point.get_cell()).is_same(cell)


func test_set_cell() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var location_spy = spy(auto_free(Location.new())) as Location
	var cell_ref: EntityReference = spy(auto_free(EntityReference.new()))
	location_spy._cell_ref = cell_ref
	spawn_point._location = location_spy
	var cell: Cell = auto_free(Cell.new()) as Cell
	spawn_point.set_cell(cell)
	verify(location_spy, 1).set_cell(cell)


func test_get_position() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var location_mock: Location = mock(Location) as Location
	spawn_point._location = location_mock
	var p: Vector3 = Vector3.MODEL_REAR
	do_return(p).on(location_mock).get_position()
	assert_vector(spawn_point.get_position()).is_equal_approx(p, VECTOR_APPROX)


func test_set_position() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var location_spy: Location = spy(auto_free(Location.new())) as Location
	spawn_point._location = location_spy
	var p: Vector3 = Vector3.MODEL_REAR
	spawn_point.set_position(p)
	verify(location_spy, 1).set_position(p)


func test_get_forward() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var location_mock: Location = mock(Location) as Location
	spawn_point._location = location_mock
	var f: Vector3 = Vector3.MODEL_REAR
	do_return(f).on(location_mock).get_forward()
	assert_vector(spawn_point.get_forward()).is_equal_approx(f, VECTOR_APPROX)


func test_set_forward() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var location_spy: Location = spy(auto_free(Location.new())) as Location
	spawn_point._location = location_spy
	var f: Vector3 = Vector3.MODEL_REAR
	spawn_point.set_forward(f)
	verify(location_spy, 1).set_forward(f)


func test_get_transform_3d() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var location_mock: Location = mock(Location)
	spawn_point._location = location_mock
	var t: Transform3D = Transform3D.IDENTITY
	do_return(t).on(location_mock).get_transform_3d()
	assert_object(spawn_point.get_transform_3d()).is_same(t)


func test_set_transform_3d() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var location_spy: Location = spy(auto_free(Location.new())) as Location
	spawn_point._location = location_spy
	var t: Transform3D = Transform3D.IDENTITY
	spawn_point.set_transform_3d(t)
	verify(location_spy, 1).set_transform_3d(t)


func test__add_extra_persistent_properties() -> void:
	var spawn_point: SpawnPoint = auto_free(SpawnPoint.new()) as SpawnPoint
	var props: PackedStringArray = []
	spawn_point._add_extra_persistent_properties(props)
	assert_array(props).contains(["_location"])
