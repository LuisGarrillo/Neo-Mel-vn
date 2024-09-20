extends Control
class_name PauseMenu
signal load
signal status
signal resume
signal title


func _on_load_btn_pressed() -> void:
	load.emit()


func _on_status_btn_pressed() -> void:
	status.emit()


func _on_resume_btn_pressed() -> void:
	resume.emit()


func _on_back_title_btn_pressed() -> void:
	title.emit()
