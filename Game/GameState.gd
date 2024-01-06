
class_name GameState extends State

@export var scene_prefab : String
var scene
var arguments

func process_state_enter(args):
	Log.print("STATE", "Entering state : " + name)
	Log.print("STATE", "Entry arguments:")
	for argKey in args:
		var argValue = args[argKey]
		Log.print("STATE", " " + str(argKey) + " : " + str(argValue))
		pass
	super(args)
	if scene_prefab != "":
		Log.print("STATE", "Loading scene " + scene_prefab)
		scene = load(scene_prefab).instantiate()
		add_child(scene)
		pass
	arguments = args
	pass

func process_state_exit():
	super()
	if scene != null:
		Log.print("STATE", "Unloading scene " + scene_prefab)
		scene.free()
		pass
	pass
	
func process_input(delta):
	pass

func process_state(delta):
	pass
