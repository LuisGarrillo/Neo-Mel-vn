extends Node2D
class_name JarData

@export var type: String
@export var bean_name: String 

signal selected

func _ready():
	var jar_base = get_children()[0]
	jar_base.selected.connect(amplify_signal)

func amplify_signal() -> void:
	print("amplifying")
	selected.emit(type, bean_name)
