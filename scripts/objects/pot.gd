extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and rotation_degrees >= 0:
			rotation_degrees -= 30
		elif event.is_released() and event.button_index == MOUSE_BUTTON_LEFT and rotation_degrees < 0:
			rotation_degrees = 0
