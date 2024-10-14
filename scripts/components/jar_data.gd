extends Node2D
class_name JarData

@export var type: String
@export var bean_name: String 

signal selected

func ready():
	var parent = get_parent()

func amplify_signal() -> void:
	selected.emit()
