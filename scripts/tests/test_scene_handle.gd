extends Node
const SceneLoader = preload("res://scripts/file_handle/scene_loader.gd")

func scene_display(scene_number):
	var sl = SceneLoader.new()
	var data = sl.get_scene_data(scene_number)
	
	for event in data["sequence"]:
		if event["action"] == "d":
			print(data["actors"][event["actor"]] + ": " + event["content"])
		else:
			print("*" + data["actors"][event["actor"]] + "gets " + event["content"] + "*")
	
