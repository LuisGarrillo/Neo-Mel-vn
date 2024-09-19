extends Node

@onready var dialogue_manager: DialogueManager = $DialogueManager

const SceneLoader = preload("res://scripts/file_handle/scene_loader.gd")
const FileHandler:  = preload("res://scripts/file_handle/file_handler.gd")

signal story_finished

var fh: FileHandle
var sl
var day: int = 0
var scene: int = 0
var data_list: Array
var day_list: Array

func _ready() -> void:
	fh = FileHandler.new()
	sl = SceneLoader.new()
	dialogue_manager.scene_finished.connect(advance)
	var days = load_days()
	
	for i in len(days):
		day_list.append(0)
		var scenes = load_scenes(days[i])
		day_list[i] = len(scenes)
	
	set_up()

func set_up():
	var days = load_days()
	for day_index in len(days):
		var scenes = load_scenes(days[day_index])
		data_list.append([])
		for load_scene in scenes:
			data_list[day_index].append(sl.get_scene_data(days[day_index], load_scene))
	
	dialogue_manager.set_up_scene(data_list[day][scene])

func set_day_and_scene(new_day, new_scene):
	day = new_day
	scene = new_scene

func load_days():
	return fh.directories_in_location("res://assets//dialogues")

func load_scenes(load_day):
	return fh.files_in_location("res://assets//dialogues//" + load_day)

func advance():
	if day == len(day_list) - 1:
		story_finished.emit()
		return
	
	if scene == day_list[day] -1:
		day += 1
	else:
		scene += 1
		
	set_up()
