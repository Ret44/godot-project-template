class_name StateMachine extends Node

@export var state : State
var state_path : NodePath

func set_state(new_state_path, args = {}):
	var new_state = get_node(new_state_path)
	if(state!=null): state.process_state_exit()
	state = new_state
	state_path = new_state_path
	state.process_state_enter(args)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(state!=null):
		state.process_input(delta)
		state.process_state(delta)
		pass
	pass
