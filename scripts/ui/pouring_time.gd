extends Control
class_name PouringTimestamp
@onready var type_sprite: AnimatedSprite2D = $HBoxContainer/Control/AnimatedSprite2D
@onready var label: Label = $HBoxContainer/Label

func set_up(time: int, type: String) -> void:
	label.text = "00:" + String.num_int64(time)
	type_sprite.play(type)
	
