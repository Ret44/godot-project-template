## Simple FPS Counter intended as an extension for Label node
## To use it, just attach this script to the node
extends Label

func _process(delta):
	set_text("FPS "+str(Engine.get_frames_per_second()))
	pass
