# GdUnit generated TestSuite
class_name EnableableEntityTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/runner_3d/gd/enableable_entity/enableable_entity.gd'


func test__add_extra_persistent_properties() -> void:
	var enableable_entity: EnableableEntity = (
		auto_free(EnableableEntity.new()) as EnableableEntity
	)
	var props: PackedStringArray = []
	enableable_entity._add_extra_persistent_properties(props)
	assert_array(props).contains(["_enabled"])


func test_is_enabled() -> void:
	var enableable_entity: EnableableEntity = (
		auto_free(EnableableEntity.new()) as EnableableEntity
	)
	assert_bool(enableable_entity.is_enabled()).is_false()


func test_set_enabled() -> void:
	var enableable_entity: EnableableEntity = (
		auto_free(EnableableEntity.new()) as EnableableEntity
	)
	add_child(enableable_entity)

	var spy_e: = spy(enableable_entity) as EnableableEntity
	spy_e.set_enabled(true)
	verify(spy_e, 1)._on_enabled_changed()

	await_signal_on(enableable_entity, "enabled_changed")


func test_enable() -> void:
	var enableable_entity: EnableableEntity = (
		auto_free(EnableableEntity.new()) as EnableableEntity
	)
	enableable_entity.set_enabled(false)
	enableable_entity.enable()
	assert_bool(enableable_entity.is_enabled()).is_true()


func test_disable() -> void:
	var enableable_entity: EnableableEntity = (
		auto_free(EnableableEntity.new()) as EnableableEntity
	)
	enableable_entity.set_enabled(true)
	enableable_entity.disable()
	assert_bool(enableable_entity.is_enabled()).is_false()


func test__on_game_event_all_entities_added() -> void:
	var enableable_entity: EnableableEntity = (
		auto_free(EnableableEntity.new()) as EnableableEntity
	)
	var spy_e: = spy(enableable_entity) as EnableableEntity
	spy_e._on_game_event_all_entities_added()
	verify(spy_e, 1)._on_enabled_changed()
