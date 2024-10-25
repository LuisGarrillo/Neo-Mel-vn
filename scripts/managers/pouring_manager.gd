extends Node
@onready var filter: Node2D = $Filter

signal change_temperature

var pattern

func set_up(pouring_pattern, first_step_temp):
	filter.set_up(first_step_temp)
	pattern = pouring_pattern

func update(state):
	if state == "wait":
		filter.wait()
	else:
		filter.start(state)

func change_temperature_intermediary(hot: bool):
	var temperature = ""
	if hot:
		temperature = "hot"
	else:
		temperature = "cold"
	change_temperature.emit(temperature)
	filter.change_pot_temp(temperature)
		
		
