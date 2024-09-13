extends Node2D
class_name Character
@export var id = ""
@onready var state_manager: StateManager = $StateManager

var mood = ""
var is_talking = false

func change_emotion(emotion):
	state_manager.change_state(emotion)
	set_mood(emotion)
	
func set_mood(new_mood):
	if new_mood == mood:
		return
	
	mood = new_mood
