class_name UIFullScreenPrompt extends PanelContainer

@export var label : Label
@export var yes_button : Button
@export var no_button : Button

var on_yes_callback
var on_no_callback

func _enter_tree():
	yes_button.pressed.connect(_on_yes_pressed)
	no_button.pressed.connect(_on_no_pressed)
	pass
	
func _exit_tree():
	yes_button.pressed.disconnect(_on_yes_pressed)
	no_button.pressed.disconnect(_on_no_pressed)
	pass

func setup(text, on_yes, on_no):
	label.set_text(tr(text))
	on_yes_callback = on_yes
	on_no_callback = on_no
	pass
	
func _on_yes_pressed():
	if(on_yes_callback != null): on_yes_callback.call()
	self.queue_free()
	pass

func _on_no_pressed():
	if(on_no_callback != null): on_no_callback.call()
	self.queue_free()
	pass
