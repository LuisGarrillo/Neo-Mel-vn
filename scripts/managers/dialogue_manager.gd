extends Node
const SceneLoader = preload("res://scripts/file_handle/scene_loader.gd")
@onready var text_box: Control = $"../TextBox"
@onready var characters: CharactersContainer = $"../characters"


@onready var data : Dictionary

var day: int = 1
var scene: int = 1
var scene_index: int = 0
var scene_lenght: int = 0

var event

var dialogue_finished: bool = false
var dialogue_index: int = 0
var dialogue_lenght: int = 0
var dialogue_delta_counter: float = 0
var dialogue_content : String  = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sl = SceneLoader.new()
	data = sl.get_scene_data(day, scene)
	scene_lenght = len(data["sequence"])
	characters.preload_characters()
	for actor in data["actors"]:
		characters.load_character(
			data["actors"][actor]["file_name"], 
			data["actors"][actor]["position"],
			data["actors"][actor]["depth"],
			)
	manage_scene()

func _process(_delta: float) -> void:
	get_input()
	manage_dialogue_text()

func get_input():
	if Input.is_action_just_pressed("accept") and dialogue_finished:
		dialogue_content = ""
		dialogue_index = 0
		scene_index += 1
		dialogue_finished = false
		manage_scene()

func keep_going():
	scene_index +=1
	manage_scene()

func manage_scene():
	if scene_index == scene_lenght:
		get_tree().quit()
		return
	
	event = data["sequence"][scene_index]
	if event["action"] == "d":
			text_box.set_actor(data["actors"][event["actor"]]["name"])
			dialogue_lenght = len(event["content"])
			characters.set_talking(data["actors"][event["actor"]]["file_name"])
	elif event["action"] == "e":
		characters.change_emotion(data["actors"][event["actor"]]["file_name"], event["content"])
		keep_going()
	elif event["action"] == "io":
		characters.character_in_out(data["actors"][event["actor"]]["file_name"])
		keep_going()
		
func manage_dialogue_text():
	if dialogue_finished:
		return
		
	dialogue_content += event["content"][dialogue_index]
	dialogue_index += 1
	
	if dialogue_index == dialogue_lenght:
		dialogue_finished = true
		characters.set_talking(data["actors"][event["actor"]]["file_name"])
		
	text_box.set_content(dialogue_content)
	text_box.display_text()
	
