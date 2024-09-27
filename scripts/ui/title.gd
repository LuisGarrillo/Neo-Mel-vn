extends Control
@onready var button_container: ButtonContainer = $ButtonContainer

signal start
signal load
signal exit
signal save

func _ready():
	button_container.set_up()

func start_game() -> void:
	start.emit()

func load_game() -> void:
	load.emit("load")

func exit_game() -> void:
	exit.emit()
	
func save_game() -> void:
	var data: Dictionary = {
	"empty": false,
	"date": "",
	"day": 1,
	"scene": 0,
	"status": {},
}
	save.emit(0, data)
