## Save is a simple save system class that uses ConfigFile class to store
## settings and progress into persisdent data.
extends Node

var config : ConfigFile
var is_dirty : bool = false
var filename : String = "user://saved_data.cfg"

func _enter_tree():
	config = ConfigFile.new()
	if config.load(filename) != OK:
		return
	else:
		pass
	pass

func get_value(section, key, default):
	if not is_set(section, key):
		config.set_value(section, key, default)
		pass
	return config.get_value(section, key, default)
	
func set_value(section, key, variable):
	config.set_value(section, key, variable)
	is_dirty = true
	pass

func is_set(section, key):
	return config.has_section_key(section, key)

func _process(delta):
	if is_dirty:
		config.save(filename)
		is_dirty = false
		pass
	pass
