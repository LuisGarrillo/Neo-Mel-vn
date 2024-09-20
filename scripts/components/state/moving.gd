extends State
var direction: int = 0
var goal: int = 0
var progress: float 
var velocity: float = 100

# Called when the node enters the scene tree for the first time.
func start(args):
	direction = args["direction"]
	goal = args["goal"]
	super.start(args)

func update(delta):
	progress += abs(velocity * direction * delta)
	root.position.x += velocity * direction * delta

	if progress >= goal:
		change.emit("default", {})
