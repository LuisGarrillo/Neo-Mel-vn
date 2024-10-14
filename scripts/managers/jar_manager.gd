extends Node
class_name JarManager

const BeanDataFile = preload("res://scripts/data/bean_data.gd")
var bean_data_inst: BeanData
var recipes_data: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bean_data_inst = BeanDataFile.new()
	recipes_data = bean_data_inst.recipes
	connect_jars()

func connect_jars():
	var jars = get_children()
	for jar: JarData in jars:
		jar.selected.connect(jar_selected)

func jar_selected(type, bean_name):
	print(recipes_data[type][bean_name])
