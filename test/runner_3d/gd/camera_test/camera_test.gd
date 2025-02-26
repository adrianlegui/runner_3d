# GdUnit generated TestSuite
class_name CameraTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")

# TestSuite generated from
const __source = "res://src/runner_3d/gd/camera/camera.gd"


func test_get_phantom_camera_3d() -> void:
	var camera: Camera = auto_free(Camera.new()) as Camera
	var scene_phantom_camera_3d_ref: EntityReference = mock(EntityReference) as EntityReference
	camera._scene_phantom_camera_3d_ref = scene_phantom_camera_3d_ref
	var scene: Scene = mock(Scene) as Scene
	do_return(scene).on(scene_phantom_camera_3d_ref).get_reference()
	var phantom_camera_3d: PhantomCamera3D = auto_free(PhantomCamera3D.new()) as PhantomCamera3D
	do_return(phantom_camera_3d).on(scene).get_scene_instance()
	assert_object(camera.get_phantom_camera_3d()).is_same(phantom_camera_3d)


func test_get_camera_3d_with_host() -> void:
	var camera: Camera = auto_free(Camera.new()) as Camera
	var scene_camera_3d_with_host_ref: EntityReference = mock(EntityReference) as EntityReference
	camera._scene_camera_3d_with_host_ref = scene_camera_3d_with_host_ref
	var scene: Scene = mock(Scene) as Scene
	do_return(scene).on(scene_camera_3d_with_host_ref).get_reference()
	var camera_3d_with_host: Camera3DWithHost = (
		auto_free(Camera3DWithHost.new()) as Camera3DWithHost
	)
	do_return(camera_3d_with_host).on(scene).get_scene_instance()
	assert_object(camera.get_camera_3d_with_host()).is_same(camera_3d_with_host)


func test__add_blocker_to_scenes() -> void:
	var camera: Camera = auto_free(Camera.new()) as Camera

	var scene_camera_3d_with_host_ref: EntityReference = mock(EntityReference) as EntityReference
	camera._scene_camera_3d_with_host_ref = scene_camera_3d_with_host_ref
	var scene_camera: Scene = spy(auto_free(Scene.new())) as Scene
	var unloaded: BoolValue = mock(BoolValue)
	scene_camera._unloaded = unloaded
	do_return(scene_camera).on(scene_camera_3d_with_host_ref).get_reference()

	var scene_phantom_camera_3d_ref: EntityReference = mock(EntityReference) as EntityReference
	camera._scene_phantom_camera_3d_ref = scene_phantom_camera_3d_ref
	var scene_phantom: Scene = spy(auto_free(Scene.new())) as Scene
	scene_phantom._unloaded = unloaded
	do_return(scene_phantom).on(scene_phantom_camera_3d_ref).get_reference()

	camera._add_blocker_to_scenes()
	verify(scene_camera).add_unload_blocker(camera)
	verify(scene_phantom).add_unload_blocker(camera)


func test__on_enabled_changed_with_enabled_true() -> void:
	var camera: Camera = spy(auto_free(Camera.new())) as Camera
	camera._camera_3d_with_host = auto_free(Camera3DWithHost.new())
	camera._phantom_camera_3d = auto_free(PhantomCamera3D.new())
	camera._enabled = true
	camera._on_enabled_changed()
	verify(camera)._add_cameras()


func test__on_enabled_changed_with_enabled_false() -> void:
	var camera: Camera = spy(auto_free(Camera.new())) as Camera
	camera._enabled = false
	camera._on_enabled_changed()
	verify(camera)._remove_cameras()


func test__add_cameras() -> void:
	var camera: Camera = auto_free(Camera.new()) as Camera

	var scene_camera_3d_with_host: Scene = mock(Scene) as Scene
	var scene_camera_3d_with_host_ref: EntityReference = mock(EntityReference) as EntityReference
	camera._scene_camera_3d_with_host_ref = scene_camera_3d_with_host_ref
	do_return(scene_camera_3d_with_host).on(scene_camera_3d_with_host_ref).get_reference()
	var camera_3d_with_host: Camera3DWithHost = auto_free(Camera3DWithHost.new())
	do_return(camera_3d_with_host).on(scene_camera_3d_with_host).get_scene_instance()

	var scene_phantom_camera_3d: Scene = mock(Scene) as Scene
	var scene_phantom_camera_3d_ref: EntityReference = mock(EntityReference) as EntityReference
	camera._scene_phantom_camera_3d_ref = scene_phantom_camera_3d_ref
	do_return(scene_phantom_camera_3d).on(scene_phantom_camera_3d_ref).get_reference()
	var phantom_camera_3d: PhantomCamera3D = auto_free(PhantomCamera3D.new())
	do_return(phantom_camera_3d).on(scene_phantom_camera_3d).get_scene_instance()

	camera._add_cameras()
	assert_object(camera._camera_3d_with_host).is_same(camera_3d_with_host)
	assert_object(camera._phantom_camera_3d).is_same(phantom_camera_3d)


func test__remove_cameras() -> void:
	var camera: Camera = auto_free(Camera.new()) as Camera
	camera._camera_3d_with_host = auto_free(Camera3DWithHost.new())
	camera._phantom_camera_3d = auto_free(PhantomCamera3D.new())
	camera._remove_cameras()
	assert_object(camera._camera_3d_with_host).is_null()
	assert_object(camera._phantom_camera_3d).is_null()


func test__on_game_event_all_entities_added() -> void:
	var camera: Camera = spy(auto_free(Camera.new())) as Camera

	var scene_camera_3d_with_host_ref: EntityReference = mock(EntityReference) as EntityReference
	camera._scene_camera_3d_with_host_ref = scene_camera_3d_with_host_ref
	var scene_camera: Scene = spy(auto_free(Scene.new())) as Scene
	var unloaded: BoolValue = mock(BoolValue)
	scene_camera._unloaded = unloaded
	do_return(scene_camera).on(scene_camera_3d_with_host_ref).get_reference()

	var scene_phantom_camera_3d_ref: EntityReference = mock(EntityReference) as EntityReference
	camera._scene_phantom_camera_3d_ref = scene_phantom_camera_3d_ref
	var scene_phantom: Scene = spy(auto_free(Scene.new())) as Scene
	scene_phantom._unloaded = unloaded
	do_return(scene_phantom).on(scene_phantom_camera_3d_ref).get_reference()

	camera._on_game_event_all_entities_added()
	verify(camera)._add_blocker_to_scenes()
