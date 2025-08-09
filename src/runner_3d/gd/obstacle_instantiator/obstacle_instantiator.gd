extends Node


const OBSTACLE = preload("res://src/runner_3d/gd/obstacle/obstacle.tscn")
const KEY_TIME: String = "_time"
const KEY_NEXT_TIME: String = "_next_time"

@export var spot: Marker3D
@export var min_time: float = 5.0
@export var max_time: float = 10.0

var _time: float = 0.0
var _next_time: float = 0.0
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()

@onready var _scene_tree: SceneTree = get_tree()

func _process(delta: float) -> void:
	_time += delta
	if _time > _next_time:
		_time = 0.0
		_next_time = _rng.randf_range(min_time, max_time)
		_add_obstacle()


func _add_obstacle() -> void:
	var obstacle: Area3D = OBSTACLE.instantiate()
	obstacle.position = spot.global_position
	_scene_tree.root.call_deferred("add_child", obstacle, true)


func ente_set_data(data: Dictionary) -> void:
	_time = data.get(KEY_TIME, 0.0)
	_next_time = data.get(KEY_NEXT_TIME, 0.0)


func ente_get_data() -> Dictionary:
	var data: = {}
	data[KEY_NEXT_TIME] = _next_time
	data[KEY_TIME] = _time
	return data
