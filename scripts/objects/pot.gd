extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var coffee_pour: Node2D = $CoffeePour

var finished_rotation = false

func _ready() -> void:
	coffee_pour.position = $Marker2D.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	check_input()

func check_input():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not finished_rotation:
		animation_player.play("pour")
		
	elif not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and finished_rotation:
		animation_player.play("return")

func set_finished_rotation():
	finished_rotation = !finished_rotation
	
func toggle_pouring():
	coffee_pour.toggle()
