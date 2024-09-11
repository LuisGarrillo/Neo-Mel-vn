extends Node
const SceneLoader = preload("res://scripts/file_handle/scene_loader.gd")

func scene_display(day, scene):
	var sl = SceneLoader.new()
	var data = sl.get_scene_data(day, scene)
	
	for event in data["sequence"]:
		if event["action"] == "d":
			print(data["actors"][event["actor"]] + ": " + event["content"])
		else:
			print("*" + data["actors"][event["actor"]] + "gets " + event["content"] + "*")
	
