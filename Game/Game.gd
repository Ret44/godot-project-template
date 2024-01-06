## Game is an extended state machine that controls main game loop. It contains references
## to all nodes that represents game states.
extends StateMachine

##TODO: Declare game state references here.
## eg. @export_node_path var menu_state : NodePath

func queue_set_state(new_state_path, args={}, in_transition = null, out_transition = null):
	await get_tree().process_frame
	set_state(new_state_path, args, in_transition, out_transition)
	pass

func set_state(new_state_path, args = {}, in_transition = null, out_transition = null):
	var new_state = get_node(new_state_path)
	var func_exit = func (args):
		if(state!=null):
			state.process_state_exit()
			pass
		pass	
	var func_enter = func (args):
		if(new_state!=null):
			state = new_state
			state_path = new_state_path
			state.process_state_enter(args)
			pass	
	
	if in_transition == null:
		func_exit.call(args)
		func_enter.call(args)
		if out_transition != null:
			out_transition.enter(null,null)
	else:
		var lmbd = func (args):
			func_exit.call(args)
			func_enter.call(args)
			if out_transition != null:
				in_transition.reset()
				out_transition.enter(null, null)
		in_transition.exit(lmbd, args)
		pass
	pass
