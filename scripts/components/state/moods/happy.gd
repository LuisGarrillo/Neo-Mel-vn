extends State
@onready var sprite_2d: Sprite2D = $Sprite2D

func update(_delta):
	counter += 1
	if counter == 120:
		change.emit("default")

func start(args):
	sprite_2d.position = root_position 
	sprite_2d.visible = true
	super.start(args)

func finish():
	counter = 0
	sprite_2d.visible = false
	super.finish()
