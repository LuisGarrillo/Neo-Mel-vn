extends Node
class_name StateManager

signal changed

var states: Dictionary = {}
var current_state : State
var next_state : State = null
var state_args : Dictionary
var finishing : bool = false
var starting : bool = false
var parent

func _ready() -> void:
	parent = get_parent()
	load_states()
	

func _process(delta: float) -> void:
	update_state(delta)
	
func load_states() -> void:
	for child: State in get_children():
		states[child.id] = child
		child.started.connect(started)
		child.finished.connect(finished)
		child.change.connect(change_state)
		child.root = parent
	current_state = states["default"]

func change_state(new_state: String, args) -> void:
	if not new_state in states.keys():
		print("STATE MANAGER:\nError loading changing to state \'" + new_state + "\'. It doesn't exists in states list.")
		return
		
	if new_state == current_state.id:
		return
	state_args = args
	finishing = true
	next_state = states[new_state]
	

func update_state(delta):
	if finishing:
		current_state.finish()
	elif starting:
		current_state.start(state_args)
	else:
		current_state.update(delta)

func finished():
	finishing = false
	current_state = next_state
	changed.emit(current_state.id)
	starting = true

func started():
	starting = false
	
