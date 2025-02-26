# GdUnit generated TestSuite
class_name CharacterTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

# TestSuite generated from
const __source = "res://src/runner_3d/gd/character/character.gd"
const CHARACTER = preload("res://src/runner_3d/gd/character/character.tscn")
const CELL = preload("res://src/runner_3d/gd/cell/cell.tscn")
const VECTOR_APPROX: Vector3 = Vector3(0.00001, 0.00001, 0.00001)


func test_get_position() -> void:
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	assert_vector(character.get_position()).is_equal_approx(Vector3.ZERO, VECTOR_APPROX)


func test_set_position() -> void:
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	var position: Vector3 = Vector3(1.0, 1.0, 1.0)
	character.set_position(position)
	assert_vector(character.get_position()).is_equal_approx(position, VECTOR_APPROX)


func test_get_cell() -> void:
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	ModManager.add_entity(character)
	assert_object(character.get_cell()).is_null()


func test_set_cell() -> void:
	var cell: Cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	ModManager.add_entity(character)
	character.set_cell(cell)
	assert_object(character.get_cell()).is_same(cell)


func test_set_transform_3d() -> void:
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	var t: Transform3D = Transform3D.FLIP_X
	character.set_transform_3d(t)
	assert_object(character.get_transform_3d()).is_same(t)


func test_get_transform_3d() -> void:
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	var t: Transform3D = character.get_transform_3d()
	assert_bool(t.is_equal_approx(Transform3D.IDENTITY)).is_true()


func test__add_extra_persistent_properties() -> void:
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	var props: PackedStringArray = []
	character._add_extra_persistent_properties(props)
	assert_array(props).contains(["_location"])


func test__on_enabled_changed_show() -> void:
	var character: Character = spy(auto_free(Character.new())) as Character
	var location: Location = mock(Location)
	character._location = location
	var cell: Cell = mock(Cell) as Cell
	do_return(cell).on(location).get_cell()
	do_return(true).on(cell).is_enabled()
	character._on_enabled_changed()
	verify(character, 1)._show()


func test__on_enabled_changed_hide() -> void:
	var character: Character = spy(auto_free(Character.new())) as Character
	var location: Location = mock(Location)
	character._location = location
	var cell: Cell = mock(Cell) as Cell
	do_return(cell).on(location).get_cell()
	do_return(false).on(cell).is_enabled()
	character._on_enabled_changed()
	verify(character, 1)._hide()


func test__on_cell_enabled_changed() -> void:
	var cell: Cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	ModManager.add_entity(character)
	character.set_cell(cell)
	cell.set_enabled(true)
	assert_bool(character.is_enabled()).is_true()


func test_set_forward() -> void:
	var character: Character = auto_free(Character.new()) as Character
	var location := mock(Location) as Location
	character._location = location
	var forward: Vector3 = Vector3.MODEL_RIGHT
	character.set_forward(forward)
	verify(location, 1).set_forward(forward)


func test_get_forward() -> void:
	var character: Character = auto_free(Character.new()) as Character
	var location: Location = mock(Location)
	character._location = location
	var forward: Vector3 = Vector3.FORWARD
	do_return(forward).on(location).get_forward()
	assert_vector(character.get_forward()).is_equal_approx(forward, VECTOR_APPROX)


func test__on_location_cell_enabled_changed() -> void:
	var character: Character = auto_free(Character.new()) as Character
	var location: Location = mock(Location)
	character._location = location
	var cell: Cell = mock(Cell) as Cell
	do_return(cell).on(location).get_cell()
	do_return(true).on(cell).is_enabled()
	character._on_location_cell_enabled_changed()
	assert_bool(character.is_enabled()).is_true()


func test_move_to_spawn_point() -> void:
	var spawn_point: SpawnPoint = mock(SpawnPoint) as SpawnPoint
	var location: Location = spy(auto_free(Location.new())) as Location
	var cell_ref: EntityReference = mock(EntityReference) as EntityReference
	location._cell_ref = cell_ref
	var character: Character = spy(auto_free(Character.new())) as Character
	character._location = location
	var t: Transform3D = Transform3D.IDENTITY
	var cell: Cell = mock(Cell) as Cell
	do_return(cell).on(spawn_point).get_cell()
	do_return(t).on(spawn_point).get_transform_3d()
	var enabled: bool = true
	do_return(enabled).on(cell).is_enabled()

	character.move_to_spawn_point(spawn_point)
	verify(character, 1).set_transform_3d(t)
	verify(character, 1).set_cell(cell)
	verify(character, 1).set_enabled(enabled)


func test__show() -> void:
	# remove this line and complete your test
	assert_not_yet_implemented()


func test__hide() -> void:
	# remove this line and complete your test
	assert_not_yet_implemented()


func test_add_cell() -> void:
	# remove this line and complete your test
	assert_not_yet_implemented()


func test_remove_cell() -> void:
	# remove this line and complete your test
	assert_not_yet_implemented()


func test__get_physical_character_instance() -> void:
	# remove this line and complete your test
	assert_not_yet_implemented()
