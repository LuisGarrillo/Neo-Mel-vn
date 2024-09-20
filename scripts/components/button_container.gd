extends GridContainer
class_name ButtonContainer

@onready var buttons : Array
var index : int = 0
var selected_button : Button
var frame_counter: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	buttons = get_children()
	selected_button = buttons[0]
	selected_button.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_input()
	frame_counter += 1

func manage_focus():
	frame_counter = 0
	selected_button.release_focus()
	selected_button = buttons[index]
	selected_button.grab_focus()

func check_input():
	if Input.is_action_just_pressed("accept") and selected_button:
		selected_button.pressed.emit()
		return
	elif Input.is_action_pressed("down") and frame_counter > 10:
		index = (index + 1) % len(buttons)
		manage_focus()
	elif Input.is_action_pressed("up") and frame_counter > 10:
		index = (index - 1) % len(buttons)
		manage_focus()
