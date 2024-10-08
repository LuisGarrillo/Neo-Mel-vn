extends Control
class_name PauseMenu
@onready var grid_container: GridContainer = $GridContainer

signal load
signal status
signal resume
signal title

func _on_load_btn_pressed() -> void:
	load.emit("load")


func _on_status_btn_pressed() -> void:
	status.emit()


func _on_resume_btn_pressed() -> void:
	resume.emit()


func _on_back_title_btn_pressed() -> void:
	title.emit("pause", "title")
