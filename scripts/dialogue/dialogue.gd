extends RichTextLabel
class_name Dialogue

var actor: String = "empty"
var content: String = "empty"

func display_text():
	text = actor + ": " + content

	
func set_content(new_content):
	content = new_content
	
func set_actor(new_actor):
	if actor == new_actor:
		return
	
	actor = new_actor
