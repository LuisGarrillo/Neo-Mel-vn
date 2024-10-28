extends Control
class_name AddOnButton
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var button: Button = $Button
@onready var icon_sprite: Sprite2D = $Button/IconSprite

@export var ingredient_name: String
@export var icon: Texture2D

signal pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.text = ingredient_name
	icon_sprite.texture = icon
	
func select() -> void:
	animation_player.play("Select")
	
func deselect() -> void:
	animation_player.play("Deselect")
	
func button_pressed() -> void:
	pressed.emit(self)
	
