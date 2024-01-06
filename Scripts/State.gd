class_name State extends Node

func process_state_enter(args):
	Log.print("STATE", "Entering state : " + name)
	Log.print("STATE", "Entry arguments:")
	for argKey in args:
		var argValue = args[argKey]
		Log.print("STATE", " " + str(argKey) + " : " + str(argValue))
		pass
	pass

func process_state_exit():
	Log.print("STATE", "Exiting state :" + name)
	pass
	
func process_input(delta):
	pass
