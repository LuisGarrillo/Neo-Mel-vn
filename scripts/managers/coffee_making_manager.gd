extends Control
@onready var bean_selection: BeanSelector = $BeanSelection

const POURING_CONTROL = preload("res://scenes/ui/pouring_control.tscn")
var pouring : PouringControl
var pouring_score = 0
var cup_recipe: Dictionary
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bean_selection.recipe.connect(get_recipe)

func switch(from, to):
	if from == "selection":
		remove_child(bean_selection)
	elif from == "pouring":
		remove_child(pouring)
		print("gone")
		
	if to == "pouring":
		set_up_pouring()

func set_up_pouring():
	pouring = POURING_CONTROL.instantiate()
	add_child(pouring)
	pouring.score.connect(get_pouring_score)
	pouring.set_up(cup_recipe["pour"])

func get_pouring_score(score):
	pouring_score = score["score"]
	print(score["pouring-time"])
	print(score["pouring-time-waiting"])
	print(pouring_score)
	switch("pouring", "")

func get_recipe(selected_recipe: Dictionary):
	cup_recipe = selected_recipe
	switch("selection", "pouring")
