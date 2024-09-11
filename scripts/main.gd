extends Node2D
const FileHandler = preload("res://scripts/file_handle/file_handler.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fh = FileHandler.new()
	print(fh.load_from_file("res://assets//dialogues//test.txt"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
