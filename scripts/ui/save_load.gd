extends Control
@onready var button_container: ButtonContainer = $HSplitContainer/SlotContainer/VBoxContainer/Control/MarginContainer/ButtonContainer
@onready var page_label: Label = $HSplitContainer/SlotContainer/VBoxContainer/Control3/PageLabel

const FileHandler = preload("res://scripts/file_handle/file_handler.gd")
const SAVE_LOAD_BUTTON = preload("res://scenes/components/save_load_button.tscn")

signal return_back
signal load
signal save

var previous_screen = ""
var fh
var files
var save_data_list: Array = []
var page: int = 1
var slots : int = 0
var mode
var empty_format: Dictionary = {
	"empty": true,
	"date": "",
	"day": 0,
	"scene": 0,
	"status": {},
}

func _ready():
	manage_size()
	fh = FileHandler.new()
	files = fh.files_in_location("user://")
	check_if_files_exist()
	files = fh.files_in_location("user://")
	load_data_from_files()
	add_slots()
	button_container.set_up()
	set_screen()
	page_label.text = "Page #" + String.num_int64(page)

func manage_size():
	size = get_viewport_rect().size
	$HSplitContainer/TitleContainer.size = size * 0.33
	$HSplitContainer/SlotContainer.size = Vector2(int(size.x * 0.67), int(size.y * 0.67))
	print($HSplitContainer/SlotContainer.size)
	

func check_if_files_exist():
	for index in 48:
		var str_index = String.num_int64(index)
		var current_file = "sav" + str_index + ".json"
		if (current_file in files):
			continue
		fh.create_file("user://" + current_file, JSON.stringify(empty_format, "\t"))

func load_data_from_files():
	for file in files:
		save_data_list.append(JSON.parse_string(fh.load_from_file("user://" + file)))

func load_data(index, content):
	print(content)
	load.emit(content)

func save_data(index, content):
	save.emit(index, content)

func set_screen():
	if (mode == "save"):
		connect_save_slots()
	else:
		connect_load_slots()

func set_up_mode(new_mode):
	mode = new_mode

func add_slots():
	var width = (button_container.size.x - 50 * 3) / 4
	var height = (button_container.size.y - 50) / 2 
	var lower = slots
	var upper = slots + 8
	for index in range(lower, upper):
		slots += 1
		var new_button: SaveLoadButton = SAVE_LOAD_BUTTON.instantiate()
		new_button.data = save_data_list[index]
		new_button.index = index
		new_button.size = Vector2(width, height)
		button_container.add_child(new_button)
		

func connect_save_slots():
	for child : SaveLoadButton in button_container.get_children():
		child.trigger.connect(save_data)

func connect_load_slots():
	for child : SaveLoadButton in button_container.get_children():
		child.trigger.connect(load_data)

func move_page_forward():
	if slots == 48:
		slots = 0
		page = 0
		move_page_forward()
		return
	
	for child in button_container.get_children():
		button_container.remove_child(child)
	page += 1
	page_label.text = "Page #" + String.num_int64(page)
	add_slots()
	set_screen()
	
func move_page_backwards():
	if slots == 8:
		slots = 40
		page = 5
		move_page_forward()
		return
		
	slots -= 16
	for child in button_container.get_children():
		button_container.remove_child(child)
	page -= 1
	page_label.text = "Page #" + String.num_int64(page)
	add_slots()
	set_screen()

func go_back():
	return_back.emit("save_load", previous_screen)
