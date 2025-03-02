# GdUnit generated TestSuite
class_name LocationTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

# TestSuite generated from
const __source = "res://src/runner_3d/gd/location/location.gd"
const VECTOR_APPROX: Vector3 = Vector3(0.000001, 0.000001, 0.000001)


func test__add_extra_persistent_properties() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var props: PackedStringArray = []
	location._add_extra_persistent_properties(props)
	assert_array(props).contains(["_transform_3d", "_cell_ref"])


func test_set_transform_3d() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var t: Transform3D = Transform3D.IDENTITY
	location.set_transform_3d(t)
	assert_object(location.get_transform_3d()).is_same(t)


func test_get_transform_3d() -> void:
	var location: Location = auto_free(Location.new()) as Location
	assert_object(location.get_transform_3d()).is_same(location._transform_3d)


func test_get_cell() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var mock_cell_ref: EntityReference = mock(EntityReference)
	location._cell_ref = mock_cell_ref
	var cell: Cell = auto_free(Cell.new())
	var entity_id: String = ""
	do_return(entity_id).on(mock_cell_ref).get_entity_id()
	do_return(cell).on(mock_cell_ref).get_reference()
	assert_object(location.get_cell()).is_same(cell)


func test_set_cell() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var emitter := monitor_signals(location) as Location
	add_child(location)
	var cell: Cell = auto_free(Cell.new()) as Cell
	var cell_ref_spy := spy(auto_free(EntityReference.new())) as EntityReference
	location._cell_ref = cell_ref_spy
	emitter.set_cell(cell)
	verify(cell_ref_spy, 1).set_entity(cell)
	await assert_signal(emitter).is_emitted("cell_changed", [null, cell])


func test_set_position() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var position: Vector3 = Vector3(9.0, 8.0, 7.0)
	location.set_position(position)
	assert_vector(location.get_position()).is_equal_approx(position, VECTOR_APPROX)


func test_get_position() -> void:
	var location: Location = auto_free(Location.new()) as Location
	assert_vector(location.get_position()).is_equal_approx(Vector3.ZERO, VECTOR_APPROX)


func test_set_forward() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var right: Vector3 = Vector3.MODEL_RIGHT
	location.set_forward(right)
	assert_vector(location.get_forward()).is_equal_approx(right, VECTOR_APPROX)


func test_get_forward() -> void:
	var location: Location = auto_free(Location.new()) as Location
	assert_vector(location.get_forward()).is_equal_approx(Vector3.MODEL_FRONT, VECTOR_APPROX)


func test__on_game_event_all_entities_added() -> void:
	var spy_location := spy(auto_free(Location.new())) as Location
	var mock_cell_ref: EntityReference = mock(EntityReference)
	spy_location._cell_ref = mock_cell_ref
	var cell: Cell = auto_free(Cell.new())
	do_return(cell).on(mock_cell_ref).get_reference()
	spy_location._on_game_event_all_entities_added()
	verify(spy_location, 1)._connect_cell_signals(null)


func test__add_extra_groups() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var groups: PackedStringArray = []
	location._add_extra_groups(groups)
	assert_array(groups).contains([GameEvents.GROUP])


func test__on_cell_enabled_changed() -> void:
	var location: Location = auto_free(Location.new()) as Location
	add_child(location)
	var emitter := monitor_signals(location) as Location
	emitter._on_cell_enabled_changed()
	await assert_signal(emitter).is_emitted("cell_enabled_changed")


func test__disconnect_cell_signals() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var spy_cell := spy(auto_free(Cell.new())) as Cell
	location._disconnect_cell_signals(spy_cell)
	verify(spy_cell, 1).enabled_changed.disconnect(location._on_cell_enabled_changed)


func test__connect_cell_signals() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var spy_cell := spy(auto_free(Cell.new())) as Cell
	location._disconnect_cell_signals(spy_cell)
	verify(spy_cell, 1).enabled_changed.connect(location._on_cell_enabled_changed)


func test_add_cell() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var cell_ref := spy(auto_free(EntityReference.new())) as EntityReference
	location._cell_ref = cell_ref
	var cell := auto_free(Cell.new()) as Cell
	location.add_cell(cell)
	assert_array(location._cells).contains([cell])
	verify(cell_ref).set_entity(cell)


func test_remove_cell() -> void:
	var location: Location = auto_free(Location.new()) as Location
	var cell_ref := spy(auto_free(EntityReference.new())) as EntityReference
	location._cell_ref = cell_ref
	var cell := auto_free(Cell.new()) as Cell
	location._cells.append(cell)
	location.remove_cell(cell)
	assert_array(location._cells).not_contains([cell])
