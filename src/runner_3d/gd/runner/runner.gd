extends StaticBody3D


const KEY_POSITION: String = "position"
const KEY_VELOCITY: String = "velocity"

@export var jump_impulse: float = 100.0
@export var gravity_factor: float = 1.0
@export var _character_body_3d: CharacterBody3D

var _gravity: float = ProjectSettings.get("physics/3d/default_gravity")
var _gravity_vector: Vector3 = ProjectSettings.get("physics/3d/default_gravity_vector")
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var _dead: bool = false


func _physics_process(_delta: float) -> void:
	var ch: CharacterBody3D = _character_body_3d
	if not ch.is_on_floor():
		ch.velocity += _gravity * _gravity_vector * gravity_factor

	if ch.is_on_floor() and Input.is_action_just_pressed("Jump"):
		ch.velocity += Vector3.UP * jump_impulse * _rng.randf_range(0.95, 1.05)

	ch.move_and_slide()


func _on_obstacle_detector_area_entered(_area: Area3D) -> void:
	_dead = true
	_delete_savegame()
	get_tree().paused = true


func _on_obstacle_destroyer_area_entered(area: Area3D) -> void:
	area.queue_free()


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		if not _dead:
			_save_game()
		get_tree().quit()


func _save_game() -> void:
	EnteModManager.save_game(Runner3DConst.SAVEGAME_NAME)


func _delete_savegame() -> void:
	var path: String = ProjectSettings.globalize_path(
		EnteModManager.get_path_to_savegame(Runner3DConst.SAVEGAME_NAME)
	)
	if FileAccess.file_exists(path):
		OS.move_to_trash(path)


func ente_get_data() -> Dictionary:
	var data: = {}
	var ch: CharacterBody3D = _character_body_3d
	data[KEY_POSITION] = ch.position
	data[KEY_VELOCITY] = ch.velocity
	return data


func ente_set_data(data: Dictionary) -> void:
	var ch: CharacterBody3D = _character_body_3d
	ch.position = data.get(KEY_POSITION, Vector3.ZERO)
	ch.velocity = data.get(KEY_VELOCITY, Vector3.ZERO)
