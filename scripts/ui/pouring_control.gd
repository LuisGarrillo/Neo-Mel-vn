extends Control
class_name PouringSideBar
@onready var times_container: VBoxContainer = $VBoxContainer/VBoxContainer/TimesContainer
@onready var coffee_pouring: Node2D = $CoffeePouring

const POURING_TIME = preload("res://scenes/ui/pouring_time.tscn")

func set_up(steps):
	for step in steps:
		var timestamp: PouringTimestamp = POURING_TIME.instantiate()
		timestamp.set_up(step["time"], step["type"])
		times_container.add_child(timestamp)
