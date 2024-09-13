extends Control
class_name TextBox
@onready var margin_container: MarginContainer = $MarginContainer
@onready var dialogue_label: Dialogue = $MarginContainer/DialogueLabel


@export var margin_value: int = 10
@export var position_x : int = 0
@export var position_y : int = 0

@export var width : int = 750
@export var height : int = 250

@export var position_mode = "custom"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	margin_container.add_theme_constant_override("margin_top", margin_value)
	margin_container.add_theme_constant_override("margin_left", margin_value)
	margin_container.add_theme_constant_override("margin_bottom", margin_value)
	margin_container.add_theme_constant_override("margin_reight", margin_value)
	
	if (position_mode == "custom"):
		position_box()
	elif (position_mode == "lower_third"):
		position_on_lower_third()

func position_box():
	margin_container.position = Vector2(position_x, position_y)
	margin_container.size = Vector2(width, height)

func position_on_lower_third():
	position_x = 0
	position_y = get_viewport().size.y - round(get_viewport().size.y / 3)

	width= get_viewport().size.x
	height = round(get_viewport().size.y / 3)
	
	position_box()
	
func set_actor(actor_name):
	dialogue_label.set_actor(actor_name)
	
func set_content(content):
	dialogue_label.set_content(content)
	
func display_text():
	dialogue_label.display_text()
