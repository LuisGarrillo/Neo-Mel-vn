extends Node2D
const TestSceneHandle = preload("res://scripts/tests/test_scene_handle.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sl = TestSceneHandle.new()
	sl.scene_display(1, 1)