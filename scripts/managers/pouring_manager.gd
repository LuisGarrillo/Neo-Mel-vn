extends Node
@onready var timer: Timer = $"../Timer"
@onready var filter: Node2D = $"../Filter"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()




func _on_timer_timeout() -> void:
	print(filter.pour_accumulator)
