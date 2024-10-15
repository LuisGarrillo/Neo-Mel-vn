extends Node
@onready var jars: JarManager = $Jars

signal recipe

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jars.bean_selected.connect(send_recipe)


func send_recipe(recipe_data):
	recipe.emit(recipe_data)
