extends Control
class_name PouringControl
@onready var times_container: VBoxContainer = $VBoxContainer/VBoxContainer/TimesContainer
@onready var coffee_pouring: Node2D = $CoffeePouring

const POURING_TIME = preload("res://scenes/ui/pouring_time.tscn")

func set_up(recipe):
	for step in recipe["steps"]:
		var timestamp: PouringTimestamp = POURING_TIME.instantiate()
		times_container.add_child(timestamp)
		timestamp.set_up(step["time"], step["type"])
