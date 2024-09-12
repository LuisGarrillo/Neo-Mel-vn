extends Node2D
class_name Character
@export var id = ""
var mood = ""
var is_talking = false

func set_mood(new_mood):
	if new_mood == mood:
		return
	
	mood = new_mood
