extends Area3D


const KEY_POSITION: String = "position"

@export var speed: float = 1.0

func _process(delta: float) -> void:
	position += Vector3.LEFT * speed * delta


func ente_get_data() -> Dictionary:
	var data: = {}
	data[KEY_POSITION] = position
	return data


func ente_set_data(data: Dictionary) -> void:
	position = data.get(KEY_POSITION, Vector3.ZERO)
