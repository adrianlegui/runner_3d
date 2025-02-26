@tool
class_name PhysicalCell extends NavigationRegion3D
## Escena física para ser utilizada por [Cell] cuando está es activada.

## Tamaño del lado de la celda.
const SIDE: float = 50.0

## Posición en x en la grilla
@export var x: int = 0:
	set = set_x
## Posición en y en la grilla
@export var y: int = 0:
	set = set_y
## Posición en z en la grilla
@export var z: int = 0:
	set = set_z
@export var _area_3d: Area3D

var _cell: Cell


func _ready() -> void:
	_connect_signals()


## Configura la posición en x en la grilla.
func set_x(value: int) -> void:
	x = value
	_move()


## Configura la posición en y en la grilla.
func set_y(value: int) -> void:
	y = value
	_move()


## Configura la posición en z en la grilla.
func set_z(value: int) -> void:
	z = value
	_move()


## Configura la [Cell] a la que pertenece la [PhysicalCell]
func set_cell(cell: Cell) -> void:
	_cell = cell
	x = _cell.get_grid_x()
	y = _cell.get_grid_y()
	z = _cell.get_grid_z()


# Mueve el nodo a la posición correcta.
func _move() -> void:
	transform.origin = Vector3(x, y, z) * SIDE


func _connect_signals() -> void:
	assert(_area_3d != null, "%s: _area_3d es nula" % self)

	_area_3d.body_entered.connect(_on_area_3d_body_entered)
	_area_3d.body_exited.connect(_on_area_3d_body_exited)


func _on_area_3d_body_entered(body: Node3D) -> void:
	_cell.emit_body_entered_cell(body)


func _on_area_3d_body_exited(body: Node3D) -> void:
	_cell.emit_body_exited_cell(body)
