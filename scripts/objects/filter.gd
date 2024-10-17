extends Node2D
@onready var area_2d: Area2D = $Area2D

const SPEED = 1
const radius = 100
var delta_accumulator: float = 0
var is_pouring: bool = false
var pour_accumulator: float

func _physics_process(delta: float) -> void:
	delta_accumulator -= delta
	area_2d.position = Vector2(
		cos(delta_accumulator * SPEED) * radius,
		sin(delta_accumulator * SPEED) * (radius - 50) 
	)
	if is_pouring:
		pour_accumulator += delta

func pouring(_area: Area2D) -> void:
	is_pouring = true

func not_pouring(_area: Area2D) -> void:
	is_pouring = false
