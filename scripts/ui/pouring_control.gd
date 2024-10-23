extends Control
class_name PouringControl
@onready var times_container: VBoxContainer = $VBoxContainer/VBoxContainer/TimesContainer
@onready var coffee_pouring: Node2D = $CoffeePouring
@onready var animated_sprite_2d: AnimatedSprite2D = $VBoxContainer/Container/AnimatedSprite2D

const POURING_TIME = preload("res://scenes/ui/pouring_time.tscn")
var time_elapased : float = 0
var current_step: int = 0
var timestamps: Array
var cup_recipe: Dictionary
var current_time: int

func _process(delta: float) -> void:
	time_elapased += delta
	check_time()

func set_up(recipe):
	cup_recipe = recipe
	for step in recipe["steps"]:
		var timestamp: PouringTimestamp = POURING_TIME.instantiate()
		times_container.add_child(timestamp)
		timestamp.set_up(step["time"], step["type"])
	
	timestamps = times_container.get_children()
	current_time = cup_recipe["steps"][0]["time"]

func update_state():
	coffee_pouring.update(cup_recipe["steps"][current_step]["type"])

func check_time():
	if time_elapased < 1:
		return
		
	time_elapased = 0
	current_time -= 1
	timestamps[current_step].update(current_time)
	
	if current_time > 0:
		return
	
	current_step += 1
	current_time = cup_recipe["steps"][current_step]["time"]
	update_state()
		

func switch_temperature(hot: bool):
	if hot:
		animated_sprite_2d.play("hot")
	else:
		animated_sprite_2d.play("cold")
