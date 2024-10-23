extends Node
@onready var timer: Timer = $Timer
@onready var filter: Node2D = $Filter

signal change_temperature

var pattern

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()

func set_up(pouring_pattern):
	pattern = pouring_pattern

func update(state):
	if state == "wait":
		filter.wait()
	else:
		filter.start(state)

func change_temperature_intermediary(hot: bool):
	change_temperature.emit(hot)
		

func _on_timer_timeout() -> void:
	print(filter.pour_accumulator)
