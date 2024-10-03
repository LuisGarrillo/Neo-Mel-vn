extends Node2D
@onready var area_2d: Area2D = $Area2D


func _ready() -> void:
	toggle()

func toggle():
	visible = !visible
	area_2d.monitoring = !area_2d.monitoring
