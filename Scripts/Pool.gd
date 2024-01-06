class_name Pool extends Node

@export var prefab_path : String
var prefab : PackedScene

var available_pool = []

func _enter_tree():
	prefab = load(prefab_path)
	pass

func instantiate_new():
	var instance = prefab.instantiate()
	instance.visible = false
	add_child(instance)
	return instance

func get_instance():
	if available_pool.size() == 0:
		return instantiate_new()
	else:
		return available_pool.pop_front()
	
func return_instance(instance):
	instance.visible = false
	available_pool.push_back(instance)
	pass
