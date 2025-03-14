class_name Camera extends EnableableEntity

@export var _scene_camera_3d_with_host_ref: EntityReference
@export var _scene_phantom_camera_3d_ref: EntityReference
@export var _follow_target_ref: EntityReference

var _camera_3d_with_host: Camera3DWithHost
var _phantom_camera_3d: PhantomCamera3D


func get_phantom_camera_3d() -> PhantomCamera3D:
	var scene: Scene = _scene_phantom_camera_3d_ref.get_reference()
	return scene.get_scene_instance()


func get_camera_3d_with_host() -> Camera3DWithHost:
	var scene: Scene = _scene_camera_3d_with_host_ref.get_reference()
	return scene.get_scene_instance()


func _add_blocker_to_scenes() -> void:
	var scene_camera: Scene = _scene_camera_3d_with_host_ref.get_reference()
	scene_camera.add_unload_blocker(self)
	var scene_phantom: Scene = _scene_phantom_camera_3d_ref.get_reference()
	scene_phantom.add_unload_blocker(self)


func _on_enabled_changed() -> void:
	if is_enabled():
		_add_cameras()
	else:
		_remove_cameras()


func _add_cameras() -> void:
	if _camera_3d_with_host == null:
		_camera_3d_with_host = get_camera_3d_with_host()
		add_child(_camera_3d_with_host)

	if _phantom_camera_3d == null:
		_phantom_camera_3d = get_phantom_camera_3d()
		_phantom_camera_3d.follow_mode = PhantomCamera3D.FollowMode.SIMPLE
		_phantom_camera_3d.follow_offset = Vector3(2.0, 2.0, 10.0)
		_update_target()
		add_child(_phantom_camera_3d)


func _remove_cameras() -> void:
	if _camera_3d_with_host != null:
		_camera_3d_with_host.queue_free()
		_camera_3d_with_host = null

	if _phantom_camera_3d != null:
		_phantom_camera_3d.queue_free()
		_phantom_camera_3d = null


func _on_game_event_all_entities_added() -> void:
	super._on_game_event_all_entities_added()
	_add_blocker_to_scenes()


func _update_target() -> void:
	if is_enabled():
		var c := _get_follow_target()
		if c == null:
			return

		_phantom_camera_3d.follow_target = c.get_physical_character()


func _on_game_event_before_starting() -> void:
	_update_target()


func _get_follow_target() -> Character:
	return _follow_target_ref.get_reference()


func set_follow_target(character: Character) -> void:
	_follow_target_ref.set_entity(character)
	_update_target()


func _add_extra_persistent_properties(persistent_properties: PackedStringArray) -> void:
	persistent_properties.append("_follow_target_ref")
