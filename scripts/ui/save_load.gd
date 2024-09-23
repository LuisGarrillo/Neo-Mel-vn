extends Control
const FileHandler = preload("res://scripts/file_handle/file_handler.gd")
var fh
var files
var save_data_list: Array = []
var empty_format: Dictionary = {
	"empty": true,
	"date": "",
	"day": 0,
	"scene": 0,
	"status": {},
}

func _ready():
	fh = FileHandler.new()
	files = fh.files_in_location("user://")
	check_if_files_exist()
	files = fh.files_in_location("user://")
	load_data()
	
func check_if_files_exist():
	for index in 48:
		var str_index = String.num_int64(index)
		var current_file = "sav" + str_index + ".json"
		if (current_file in files):
			continue
		fh.create_file("user://" + current_file, JSON.stringify(empty_format, "\t"))

func load_data():
	for file in files:
		save_data_list.append(JSON.parse_string(fh.load_from_file("user://" + file)))

func save_data(index, content: Dictionary):
	fh.save_to_file("user://" + files[index], JSON.stringify(content, "\t"))

func setup_screen():
	pass

func add_slots():
	pass

func connect_save_slots():
	pass

func connect_load_slots():
	pass

func move_page():
	pass

func populate_slots():
	pass
