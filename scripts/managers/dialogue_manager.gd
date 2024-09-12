extends Node
const SceneLoader = preload("res://scripts/file_handle/scene_loader.gd")
@onready var text_box: Control = $"../TextBox"

@onready var data : Dictionary
var day = 1
var scene = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sl = SceneLoader.new()
	data = sl.get_scene_data(day, scene)
	print("hola")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text_box.set_actor(data["actors"][data["sequence"][0]["actor"]])
	text_box.set_content(data["sequence"][0]["content"])
	text_box.display_text()
