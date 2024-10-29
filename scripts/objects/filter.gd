extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var whole_area: Area2D = $WholeArea
@onready var methods: Dictionary


var SPEED = 1
const radius = 100
var delta_accumulator: float = 0
var wait_accumulator: float = 0
var is_pouring: bool = false
var pour_accumulator: float
var pot_temperature: String = "hot"
var step_temperature: String = ""
var state: String = "active"

func _ready() -> void:
	methods["active"] = update_area
	methods["wait"] = update_wait

func _physics_process(delta: float) -> void:
	methods[state].call(delta)

func set_up(first_temperature):
	step_temperature = first_temperature

func wait():
	SPEED = 0
	area_2d.monitoring = false
	area_2d.visible = false
	whole_area.monitoring = true
	state = "wait"

func start(new_type):
	SPEED = 1
	step_temperature = new_type
	area_2d.monitoring = true
	area_2d.visible = true
	whole_area.monitoring = false
	state = "active"

func update_wait(delta: float):
	if is_pouring:
		wait_accumulator += delta

func update_area(delta: float):
	delta_accumulator -= delta
	area_2d.position = Vector2(
		cos(delta_accumulator * SPEED) * radius,
		sin(delta_accumulator * SPEED) * (radius - 50) 
	)
	if is_pouring and step_temperature == pot_temperature:
		pour_accumulator += delta
		print(pour_accumulator)

func get_score() -> Dictionary:
	return {
		"pouring-time" : pour_accumulator,
		"pouring-time-waiting": wait_accumulator,
		"score": pour_accumulator - wait_accumulator
	}

func change_pot_temp(temperature):
	pot_temperature = temperature

func pouring(_area: Area2D) -> void:
	is_pouring = true

func not_pouring(_area: Area2D) -> void:
	is_pouring = false
