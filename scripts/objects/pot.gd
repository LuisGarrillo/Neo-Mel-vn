extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var coffee_pour: Node2D = $CoffeePour

signal pot_temperature_change

var finished_rotation = false
var hot: bool = true
var switch_cooldown : float = 3

func _ready() -> void:
	coffee_pour.position = $Marker2D.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	switch_cooldown += delta
	global_position = get_global_mouse_position()
	check_input()

func check_input():
	if Input.is_action_pressed("LeftClick") and not finished_rotation:
		animation_player.play("pour")
		
	elif not Input.is_action_pressed("LeftClick") and finished_rotation:
		animation_player.play("return")
	
	if Input.is_action_just_pressed("RightClick") and switch_cooldown > 2.99:
		switch_cooldown = 0
		coffee_pour.area_2d.hot = !coffee_pour.area_2d.hot
		pot_temperature_change.emit(coffee_pour.area_2d.hot)
		print(coffee_pour.area_2d.hot)

func set_finished_rotation():
	finished_rotation = !finished_rotation
	
func toggle_pouring():
	coffee_pour.toggle()
