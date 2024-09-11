extends Node

func valid_path(path):
	if not FileAccess.file_exists(path):
		print("file in " + path + "does not exist.")
		return false
	return true

func save_to_file(path, content):
	if not valid_path(path):
		return
	
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)

func load_from_file(path):
	if not valid_path(path):
		return
		
	var read_file = FileAccess.open(path, FileAccess.READ)
	var content = read_file.get_as_text()
	return content
	
