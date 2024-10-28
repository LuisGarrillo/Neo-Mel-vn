extends Control
@onready var v_box_container: VBoxContainer = $VBoxContainer/VBoxContainer
var selected_ingredient: AddOnButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var add_ons = v_box_container.get_children()
	for add_on: AddOnButton in add_ons:
		add_on.pressed.connect(select_ingredient)

func select_ingredient(ingredient: AddOnButton) -> void:
	if selected_ingredient:
		selected_ingredient.deselect()
	if selected_ingredient == ingredient:
		selected_ingredient = null
		return
		
	selected_ingredient = ingredient
	selected_ingredient.select()
		
