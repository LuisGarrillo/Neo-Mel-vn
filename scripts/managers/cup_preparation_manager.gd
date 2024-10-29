extends Control
@onready var v_box_container: VBoxContainer = $VBoxContainer/AddOnContainer
@onready var animated_sprite_2d: AnimatedSprite2D = $Node2D/AnimatedSprite2D

var selected_ingredient: AddOnButton
var coffee_amount: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var add_ons = v_box_container.get_children()
	for add_on: AddOnButton in add_ons:
		add_on.pressed.connect(select_ingredient)

func add_coffee() -> void:
	coffee_amount = min(coffee_amount + 1, 3)
	update_cup()
	
func remove_coffee() -> void:
	coffee_amount = max(coffee_amount - 1, 0)
	update_cup()
	
func update_cup() -> void:
	var key = String.num_int64(coffee_amount)
	animated_sprite_2d.play(key)

func select_ingredient(ingredient: AddOnButton) -> void:
	if selected_ingredient:
		selected_ingredient.deselect()
	if selected_ingredient == ingredient:
		selected_ingredient = null
		return
		
	selected_ingredient = ingredient
	selected_ingredient.select()
		
