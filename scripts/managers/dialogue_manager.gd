extends Node
class_name DialogueManager

@onready var text_box: Control = $"../TextBox"
@onready var characters: CharactersContainer = $"../characters"
@onready var data : Dictionary
const SceneLoader = preload("res://scripts/file_handle/scene_loader.gd")

signal scene_finished

var scene_index: int = 0
var scene_lenght: int = 0

var event

var dialogue_finished: bool = false
var dialogue_index: int = 0
var dialogue_lenght: int = 0
var dialogue_finished_counter: int = 0
var dialogue_content : String  = ""
	

func _process(_delta: float) -> void:
	get_input()
	manage_dialogue_text()

func load_characters():
	characters.preload_characters()
	for actor in data["actors"]:
		print(actor)
		characters.load_character(
			data["actors"][actor]["file_name"], 
			data["actors"][actor]["position"],
			data["actors"][actor]["depth"],
			)

func set_up_scene(scene_data):
	data = scene_data
	scene_lenght = len(data["sequence"])
	load_characters()
	manage_scene()

func clear_scene():
	characters.clear_characters()
	clear_variables()

func finish_scene():
	scene_finished.emit()
	
func clear_variables():
	scene_index = 0
	scene_lenght = 0
	dialogue_finished = false
	dialogue_index = 0
	dialogue_lenght = 0
	dialogue_finished_counter = 0
	dialogue_content = ""
	
func get_input():
	if Input.is_action_pressed("accept") and dialogue_finished_counter > 5:
		dialogue_content = ""
		dialogue_index = 0
		scene_index += 1
		dialogue_finished = false
		dialogue_finished_counter = 0
		manage_scene()

func keep_going():
	scene_index +=1
	manage_scene()

func manage_scene():
	if scene_index == scene_lenght:
		clear_scene()
		finish_scene()
	
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
	elif event["action"] == "m":
		var splitted_content = event["content"].split(",")
		characters.change_state(
			data["actors"][event["actor"]]["file_name"],
			"moving",
			{
				"direction": int(splitted_content[0]),
				"goal": int(splitted_content[1]),
			}
		)
		keep_going()

func manage_dialogue_text():
	if dialogue_finished:
		dialogue_finished_counter += 1
		return
		
	dialogue_content += event["content"][dialogue_index]
	dialogue_index += 1   
	
	if Input.is_action_pressed("accept") and dialogue_index > 10:
		dialogue_content = event["content"]
		dialogue_index = dialogue_lenght
	
	if dialogue_index == dialogue_lenght:
		dialogue_finished = true
		characters.set_talking(data["actors"][event["actor"]]["file_name"])
		
	text_box.set_content(dialogue_content)
	text_box.display_text()
