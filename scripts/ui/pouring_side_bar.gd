extends Control
const POURING_TIME = preload("res://scenes/ui/pouring_time.tscn")
@onready var times_container: VBoxContainer = $VBoxContainer/VBoxContainer/TimesContainer

func set_up(actions):
	for action in actions:
		var timestamp: PouringTimestamp = POURING_TIME.instantiate()
		timestamp.set_up(action["time"], action["type"])
		times_container.add_child(timestamp)
