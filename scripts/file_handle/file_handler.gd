extends Node

func save_to_file(path, content):
	var file = FileAccess.open("user://" + path, FileAccess.WRITE)
	file.store_string(content)

func load_from_file(path):
	var file = FileAccess.open("user://" + path, FileAccess.READ)
	var content = file.get_as_text()
	return content
