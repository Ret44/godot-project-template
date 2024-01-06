extends Control

@export var ui_full_screen_prompt_path : String
@export var ui_full_screen_messagebox_path : String

var ui_full_screen_prompt_prefab : PackedScene
var ui_full_screen_messagebox_prefab : PackedScene

func _enter_tree():
	ui_full_screen_prompt_prefab = load(ui_full_screen_prompt_path)
	ui_full_screen_messagebox_prefab = load(ui_full_screen_messagebox_path)
	pass
	
func show_prompt(root, text, on_yes_callback, on_no_callback):
	var prompt = ui_full_screen_prompt_prefab.instantiate()
	prompt.setup(text, on_yes_callback, on_no_callback)
	root.add_child(prompt)
	pass

func show_messagebox(root, text, on_ok_callback):
	var messagebox = ui_full_screen_messagebox_prefab.instantiate()
	messagebox.setup(text, on_ok_callback)
	root.add_child(messagebox)
	pass
