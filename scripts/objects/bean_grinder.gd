extends Node2D
@onready var area_2d: Area2D = $Area2D

var angle : float = 0
var SPEED : float
var radius : int 
var in_area : bool
var moving : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	radius = area_2d.position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not moving:
		return
		
	angle -= delta * SPEED
	area_2d.position = Vector2(
		cos(angle) * radius,
		sin(angle) * radius 
	)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("LeftClick") and event is InputEventMouseMotion and in_area:
		
		SPEED = sqrt((event.velocity.x ** 2) / 35 + (event.velocity.y ** 2) / 35) / 30
		print(SPEED)
		moving = true
	else:
		moving = false


func _on_area_2d_mouse_entered() -> void:
	in_area = true


func _on_area_2d_mouse_exited() -> void:
	in_area = false
