extends Control
class_name CoffeeButton

signal pressed

func button_pressed() -> void:
	pressed.emit()
