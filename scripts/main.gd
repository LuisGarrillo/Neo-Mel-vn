extends Node2D
@onready var title: Control = $Title
const PAUSE = preload("res://scenes/ui/pause.tscn")
const SCENE_FRAME = preload("res://scenes/frames/scene_frame.tscn")
const SAVE_LOAD = preload("res://scenes/ui/save_load.tscn")
const FileHandler = preload("res://scripts/file_handle/file_handler.gd")

var on_title : bool = true
var day: int
var scene: int
var game
var save_load
var pause_menu : PauseMenu
var go_back_screens: Dictionary = {}

func _process(_delta: float) -> void:
	check_input()

func connect_pause_signals():
	pause_menu.load.connect(set_save_load_game)
	pause_menu.status.connect(check_status)
	pause_menu.resume.connect(handle_pause)
	pause_menu.title.connect(go_back)

func check_input():
	if Input.is_action_just_pressed("pause") and !on_title:
		handle_pause()

func toggle_pause():
	get_tree().paused = !get_tree().paused
	return get_tree().paused

func handle_pause():
	var is_paused = toggle_pause()
	
	if is_paused:
		pause_menu = PAUSE.instantiate()
		add_child(pause_menu)
		connect_pause_signals()
	else:
		remove_child(pause_menu)
		pause_menu = null

func game_start() -> void:
	on_title = false
	game = SCENE_FRAME.instantiate()
	remove_child(title)
	add_child(game)

func set_save_load_game(mode) -> void:
	if on_title:
		toggle_pause()
		remove_child(title)
	save_load = SAVE_LOAD.instantiate()
	save_load.set_up_mode(mode)
	save_load.previous_screen = "title"
	save_load.return_back.connect(go_back)
	save_load.save.connect(save_data)
	save_load.load.connect(load_data)
	go_back_screens["save_load"] = save_load
	add_child(save_load)

func game_exit() -> void:
	get_tree().quit()

func check_status():
	pass

func go_back(from, to):
	if from == "save_load":
		remove_child(save_load)
		toggle_pause()
		save_load = null
	elif from == "pause":
		handle_pause()
	
	if to == "title":
		back_to_title()

func back_to_title():
	on_title = true
	var children = get_children()
	for child in children:
		remove_child(child)
	
	add_child(title)
	
func save_data(index, content):
	print("saving")
	var fh = FileHandler.new()
	fh.save_to_file("user://sav" + String.num_int64(index) + ".json", JSON.stringify(content))
	fh = null
	
func load_data(content):
	if on_title:
		toggle_pause()
		remove_child(save_load)
		save_load = null
		game_start()
	else:
		pass
	game.clear_scene()
	game.set_day_and_scene(content["day"], content["scene"])
	game.set_up_scene()
		
	
