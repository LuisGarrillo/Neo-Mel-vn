extends Node
class_name CharactersContainer
var characters: Dictionary = {} 
var loaded_characters: Dictionary = {}

func preload_characters():
	for file in DirAccess.get_files_at("res://scenes/characters/"):
		var file_split = file.split(".")
		print(file)
		characters[file_split[0]] = load("res://scenes/characters/" + file)
		
func load_character(id):
	if not id in characters.keys():
		print("CHARACTER LOADER:\nThe character that you're trying to load doesn't exist\n")
		return
	
	var character_instance = characters[id].instantiate()
	add_child(character_instance)
	loaded_characters[id] = character_instance

func unload_character(id):
	if not id in characters.keys():
		print("CHARACTER LOADER:\nThe character that you're trying to unload doesn't exist\n")
		return
	
	remove_child(loaded_characters[id])
	loaded_characters.erase(id)
	
