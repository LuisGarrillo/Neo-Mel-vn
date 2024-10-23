extends Node2D
@onready var area_2d: PouringArea = $Area2D


func _ready() -> void:
	toggle()

func toggle():
	visible = !visible
	area_2d.monitorable = !area_2d.monitorable
