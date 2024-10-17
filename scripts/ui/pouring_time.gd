extends Control
@onready var type_sprite: AnimatedSprite2D = $HBoxContainer/Control/AnimatedSprite2D
@onready var label: Label = $HBoxContainer/Label

func set_up(time: String, type: String) -> void:
	label.text = "00:" + time
	type_sprite.play(type)
	
