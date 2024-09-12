extends Node
const FileHandler = preload("res://scripts/file_handle/file_handler.gd")


func load_content(day, scene) -> String:
	var fh = FileHandler.new()
	day = String.num_int64(day)
	scene = String.num_int64(scene)
	return fh.load_from_file("res://assets//dialogues//day" + day + "//scene" + scene + ".txt")

func get_scene_data(day, scene) -> Dictionary:
	var content = load_content(day, scene)
	var content_list = content.split("\n")
	
	var scene_data: Dictionary = {
		"actors": {},
		"sequence": [],
	}
	var read_mode: String = "actors"
	
	for line in content_list:
		if (line == "-"):
			read_mode = "sequence"
			
		elif (read_mode == "sequence"):
			if (line.is_empty()):
				continue
			var sequence_data = line.split(":")
			scene_data["sequence"].append(
				{
					"action" : sequence_data[0],
					"actor" : sequence_data[1],
					"content" : sequence_data[2]
				}
			)
			
		elif (read_mode == "actors"):
			var actor_data = line.split(":")
			scene_data["actors"][actor_data[0]] = actor_data[1]
			
	return scene_data
	
