extends Node
class_name State

@export var id: String = ""
@export var limit: int = 30
signal started
signal finished
signal change

var counter: int = 0
var root_position : Vector2

func start():
	started.emit()

func update():
	pass
	
func finish():
	finished.emit()
