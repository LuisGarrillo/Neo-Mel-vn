extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var methods: Dictionary

var SPEED = 1
const radius = 100
var delta_accumulator: float = 0
var is_pouring: bool = false
var pour_accumulator: float
var type : String
var state = "active"

func _ready() -> void:
	methods["active"] = update_area

func _physics_process(delta: float) -> void:
	methods["active"].call(delta)

func wait():
	SPEED = 0
	area_2d.monitoring = false
	area_2d.visible = false

func start(new_type):
	SPEED = 1
	type = new_type
	area_2d.monitoring = true
	area_2d.visible = true

func update_area(delta: float):
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
