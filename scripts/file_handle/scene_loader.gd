extends Node
const FileHandler = preload("res://scripts/file_handle/file_handler.gd")
var fh: FileHandle

func get_scene_data(day, scene) -> Dictionary:
	fh = FileHandler.new()
	var content = fh.load_from_file("res://assets//dialogues//" + day + "//" + scene)
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
			scene_data["actors"][actor_data[0]] = {
				"name": actor_data[1],
				"file_name": actor_data[2],
				"position": actor_data[3],
				"depth": actor_data[4],
			}
			
	return scene_data
	
