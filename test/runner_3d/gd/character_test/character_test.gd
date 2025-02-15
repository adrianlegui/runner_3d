# GdUnit generated TestSuite
class_name CharacterTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/runner_3d/gd/character/character.gd'
const CHARACTER = preload("res://src/runner_3d/gd/character/Character.tscn")
const CELL = preload("res://src/runner_3d/gd/cell/cell.tscn")
const V_APPROX: Vector3 = Vector3(0.00001, 0.00001, 0.00001)


func test_get_position() -> void:
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	assert_vector(character.get_position()).is_equal_approx(Vector3.ZERO, V_APPROX)


func test_set_position() -> void:
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	var position: Vector3 = Vector3(1.0, 1.0, 1.0)
	character.set_position(position)
	assert_vector(character.get_position()).is_equal_approx(position, V_APPROX)


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
	assert_array(props).contains(["_transform_3d", "_cell_ref"])


func test__connect_cell_signals() -> void:
	var cell: Cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	ModManager.add_entity(character)
	character.set_cell(cell)
	assert_bool(cell.enabled_changed.is_connected(character._on_cell_enabled_changed)).is_true()


func test__disconnect_cell_signals() -> void:
	var cell: Cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	ModManager.add_entity(character)
	character.set_cell(cell)
	character.set_cell(null)
	assert_bool(cell.enabled_changed.is_connected(character._on_cell_enabled_changed)).is_false()


func test__on_enabled_changed_show() -> void:
	var mock_cell_ref: = mock(EntityReference) as EntityReference
	var cell: Cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	cell.set_enabled(true)
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	ModManager.add_entity(character)
	character.set_cell(cell)
	var c_spy: = spy(character) as Character
	c_spy._cell_ref = mock_cell_ref
	do_return(cell).on(mock_cell_ref).get_reference()
	c_spy._on_enabled_changed()
	verify(c_spy, 1)._show()


func test__on_enabled_changed_hide() -> void:
	var mock_cell_ref: = mock(EntityReference) as EntityReference
	var cell: Cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	cell.set_enabled(false)
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	ModManager.add_entity(character)
	character.set_cell(cell)
	var c_spy: = spy(character) as Character
	c_spy._cell_ref = mock_cell_ref
	do_return(cell).on(mock_cell_ref).get_reference()
	c_spy._on_enabled_changed()
	verify(c_spy, 1)._hide()


func test__on_cell_enabled_changed() -> void:
	var cell: Cell = auto_free(CELL.instantiate()) as Cell
	ModManager.add_entity(cell)
	var character: Character = auto_free(CHARACTER.instantiate()) as Character
	ModManager.add_entity(character)
	character.set_cell(cell)
	cell.set_enabled(true)
	assert_bool(character.is_enabled()).is_true()
