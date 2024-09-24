extends Node2D
@onready var title: Control = $Title
const PAUSE = preload("res://scenes/ui/pause.tscn")
const SCENE_FRAME = preload("res://scenes/frames/scene_frame.tscn")
const SAVE_LOAD = preload("res://scenes/ui/save_load.tscn")
var on_title : bool = true
var game
var save_load
var pause_menu : PauseMenu

func _process(_delta: float) -> void:
	check_input()

func connect_pause_signals():
	pause_menu.load.connect(load_game)
	pause_menu.status.connect(check_status)
	pause_menu.resume.connect(handle_pause)
	pause_menu.title.connect(back_to_title)

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

func load_game() -> void:
	if on_title:
		toggle_pause()
		remove_child(title)
	save_load = SAVE_LOAD.instantiate()
	save_load.set_up_mode("load")
	add_child(save_load)

func game_exit() -> void:
	get_tree().quit()

func check_status():
	pass
	
func back_to_title():
	on_title = true
	handle_pause()
	var children = get_children()
	for child in children:
		remove_child(child)
	
	add_child(title)
	
