extends Node
class_name State

@export var id: String = ""
@export var limit: int = 30
signal started
signal finished
signal change

var counter: int = 0
var root_position : Vector2
var root: Node2D

func start(args):
	started.emit()

func update(_delta):
	pass
	
func finish():
	finished.emit()
