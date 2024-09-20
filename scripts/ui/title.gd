extends Control
signal start
signal load
signal exit


func start_game() -> void:
	start.emit()

func load_game() -> void:
	load.emit()

func exit_game() -> void:
	exit.emit()
