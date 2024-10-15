extends Node2D
@onready var bean_selection: BeanSelector = $BeanSelection

const COFFEE_POURING = preload("res://scenes/minigames/coffee_pouring.tscn")
var cup_recipe: Dictionary
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bean_selection.recipe.connect(get_recipe)

func get_recipe(selected_recipe: Dictionary):
	cup_recipe = selected_recipe
	print(cup_recipe)
