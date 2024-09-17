extends Node
class_name CharactersContainer
var characters: Dictionary = {} 
var loaded_characters: Dictionary = {}
var positions: Dictionary = {
	"left": Vector2(275, 225),
	"right": Vector2(875, 225),
	"center": Vector2(576, 225),
}
var depths: Dictionary = {
	"back": 3,
	"front": 7,
}

func preload_characters():
	for file in DirAccess.get_files_at("res://scenes/characters/"):
		var file_split = file.split(".")
		print(file)
		characters[file_split[0]] = load("res://scenes/characters/" + file)
		
func load_character(id, position, depth):
	if not id in characters.keys():
		print("CHARACTER LOADER:\nThe character that you're trying to load doesn't exist\n")
		return
	
	if not position in positions.keys():
		print("CHARACTER LOADER:\nThe position that you're trying to load the character in doesn't exist\n")
		return
	
	var character_instance = characters[id].instantiate()
	character_instance.position = positions[position]
	character_instance.z_index = depths[depth]
	character_instance.visible = false
	add_child(character_instance)
	loaded_characters[id] = character_instance

func unload_character(id):
	if not id in characters.keys():
		print("CHARACTER LOADER:\nThe character that you're trying to unload doesn't exist\n")
		return
	
	remove_child(loaded_characters[id])
	loaded_characters.erase(id)
	
func character_in_out(id):
	if not id in characters.keys():
		print("CHARACTER LOADER:\nThe character \'" + id + "\' that is trying to appear doesn't exist\n")
		return
	
	loaded_characters[id].visible = !loaded_characters[id].visible
	
func change_emotion(id, emotion):
	loaded_characters[id].change_emotion(emotion)

func set_talking(id):
	loaded_characters[id].set_talking()

func change_state(id, state, args):
	loaded_characters[id].change_state(state, args)
