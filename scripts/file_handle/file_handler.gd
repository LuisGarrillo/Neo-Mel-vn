extends Node
class_name FileHandle

func valid_path(path):
	if not FileAccess.file_exists(path):
		print("file in " + path + "does not exist.")
		return false
	return true
	
func valid_dir(path):
	if not DirAccess.dir_exists_absolute(path):
		print("directory in " + path + "does not exist.")
		return false
	return true

func directories_in_location(path: String):
	if not valid_dir(path):
		return
	
	return DirAccess.get_directories_at(path)
	
func files_in_location(path: String):
	if not valid_dir(path):
		return
	
	return DirAccess.get_files_at(path)

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
	
