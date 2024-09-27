extends Button
class_name SaveLoadButton

signal trigger
var index: int
var data: Dictionary = {
	"empty": true,
	"date": "",
	"day": 0,
	"scene": 0,
	"status": {},
}

func _on_pressed() -> void:
	trigger.emit(index, data)
