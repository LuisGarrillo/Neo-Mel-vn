extends Control
@onready var button_container: ButtonContainer = $ButtonContainer

signal start
signal load
signal exit

func _ready():
	button_container.set_up()

func start_game() -> void:
	start.emit()

func load_game() -> void:
	load.emit()

func exit_game() -> void:
	exit.emit()
