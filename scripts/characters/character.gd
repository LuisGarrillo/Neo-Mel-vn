extends Node2D
class_name Character
@export var id = ""
@export var state_manager: StateManager
@export var main_sprite: AnimatedSprite2D
@export var eyes_sprite: AnimatedSprite2D
@export var mouth_sprite: AnimatedSprite2D


var mood = ""
var is_talking = false

func _ready() -> void:
	main_sprite.play("default")
	eyes_sprite.play("default")

func change_emotion(emotion):
	set_mood(emotion)
	change_eyes_sprite(mood)
	
func set_mood(new_mood):
	if new_mood == mood:
		return
	
	mood = new_mood
	
func change_main_sprite(key):
	main_sprite.play(key)

func set_talking():
	is_talking = !is_talking
	if is_talking:
		change_mouth_sprite("talking")
	else:
		change_mouth_sprite("default")
	

func change_mouth_sprite(key):
	mouth_sprite.play(key)

func change_eyes_sprite(key):
	eyes_sprite.play(key)
	
func change_state(state, args):
	state_manager.change_state(state, args)
