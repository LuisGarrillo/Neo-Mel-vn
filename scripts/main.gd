extends Node2D
@onready var title: Control = $Title

const SCENE_FRAME = preload("res://scenes/frames/scene_frame.tscn")
var game


func game_start() -> void:
	game = SCENE_FRAME.instantiate()
	remove_child(title)
	add_child(game)


func game_exit() -> void:
	get_tree().quit()
