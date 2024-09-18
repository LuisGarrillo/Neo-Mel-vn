extends GridContainer
class_name ButtonContainer

@onready var buttons : Array
var index : int = 0
var selected_button : Button
# Called when the node enters the scene tree for the first time.
func _ready():
	buttons = get_children()
	selected_button = buttons[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_input()

func check_input():
	if Input.is_action_just_pressed("Accept") and selected_button:
		selected_button.pressed.emit()
		return
	elif Input.is_action_just_pressed("Down"):
		index = (index + 1) % len(buttons)
	elif Input.is_action_just_pressed("Up"):
		index = (index - 1) % len(buttons)
	
	if selected_button:
		selected_button.release_focus()
	
	selected_button = buttons[index]
	selected_button.grab_focus()
