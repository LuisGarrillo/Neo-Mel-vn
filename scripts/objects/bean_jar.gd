extends Node2D
@export var srpite : Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var outline_sprite: Sprite2D = $OutlineSprite

signal selected 

var mouse_in : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	outline_sprite.visible = false


func _on_mouse_entered() -> void:
	mouse_in = true
	animation_player.play("hovered")
	
func _on_mouse_exited() -> void:
	mouse_in = false
	animation_player.play("RESET")


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse_in:
		animation_player.play("clicked")
		selected.emit()
