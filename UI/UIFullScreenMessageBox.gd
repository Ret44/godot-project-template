class_name UIFullScreenMessageBox extends PanelContainer

@export var label : Label
@export var ok_button : Button

var on_ok_callback

func _enter_tree():
	ok_button.pressed.connect(_on_ok_pressed)
	pass
	
func _exit_tree():
	ok_button.pressed.disconnect(_on_ok_pressed)
	pass

func setup(text, on_ok):
	label.set_text(tr(text))
	on_ok_callback = on_ok
	pass
	
func _on_ok_pressed():
	if(on_ok_callback != null): on_ok_callback.call()
	self.queue_free()
	pass
