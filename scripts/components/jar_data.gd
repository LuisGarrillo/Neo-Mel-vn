extends Node2D
class_name JarData

@export var type: String
@export var bean_name: String 

signal selected

func amplify_signal() -> void:
	print("amplifying")
	selected.emit(type, bean_name)
