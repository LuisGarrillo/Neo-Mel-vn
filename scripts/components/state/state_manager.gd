extends Node
class_name StateManager

signal changed

var states: Dictionary = {}
var current_state : State
var next_state : State = null
var finishing : bool = false
var starting : bool = false
var parent_pos : Vector2

func _ready() -> void:
	parent_pos = get_parent().position
	load_states()
	

func _process(_delta: float) -> void:
	update_state()
	
func load_states() -> void:
	for child: State in get_children():
		states[child.id] = child
		child.started.connect(started)
		child.finished.connect(finished)
		child.change.connect(change_state)
		child.root_position = parent_pos
	current_state = states["default"]

func change_state(new_state: String) -> void:
	if not new_state in states.keys():
		print("STATE MANAGER:\nError loading changing to state \'" + new_state + "\'. It doesn't exists in states list.")
		return
		
	if new_state == current_state.id:
		return
	
	finishing = true
	next_state = states[new_state]
	

func update_state():
	if finishing:
		current_state.finish()
	elif starting:
		current_state.start()
	else:
		current_state.update()

func finished():
	finishing = false
	current_state = next_state
	changed.emit(current_state.id)
	starting = true

func started():
	starting = false
	
