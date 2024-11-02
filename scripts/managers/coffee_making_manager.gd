extends Control
@onready var bean_selection: BeanSelector = $BeanSelection

const POURING_CONTROL = preload("res://scenes/ui/pouring_control.tscn")
const CUP_PREPARATION = preload("res://scenes/ui/cup_preparation.tscn")

var pouring : PouringControl
var preparation : CupPreparation
var pouring_score: int = 0
var preparation_data: Dictionary = {}
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
	elif to == "preparation":
		set_up_preparation()

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
	switch("pouring", "preparation")

func get_recipe(selected_recipe: Dictionary):
	cup_recipe = selected_recipe
	switch("selection", "pouring")
	
func set_up_preparation():
	preparation = CUP_PREPARATION.instantiate()
	add_child(preparation)
	preparation.serve_cup.connect(get_preparation_data)

func get_preparation_data(cup_data: Dictionary):
	preparation_data = cup_data
	print(preparation_data)
	
