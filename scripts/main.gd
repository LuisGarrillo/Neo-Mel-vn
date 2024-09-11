extends Node2D
const SceneLoader = preload("res://scripts/file_handle/scene_loader.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sl = SceneLoader.new()
	print(sl.get_scene_data(1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
