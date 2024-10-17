extends Node
@onready var timer: Timer = $Timer
@onready var filter: Node2D = $Filter

var pattern

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()

func set_up(pouring_pattern):
	pattern = pouring_pattern

func _on_timer_timeout() -> void:
	print(filter.pour_accumulator)
