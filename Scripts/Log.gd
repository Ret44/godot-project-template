extends Node

var global_verbosity : Global.Verbosity

func log_to_console(category, text, color, min_verbosity):
	var color_prefix = ("[color= %s ]" % color) if color != null else ""
	var color_suffix = "[/color]" if color != null else ""
	if global_verbosity >= min_verbosity:
		if Engine.is_editor_hint():
			print("[%s] %s")
			pass
		else:
			print_rich("%s[b][%s][/b] %s%s" % [color_prefix,category,text,color_suffix])
			pass
		pass
	pass

func print(category, text):
	log_to_console(category if category != null else "LOG", text, null, Global.Verbosity.ALL)
	pass

func print_warning(category, text):
	log_to_console(category if category != null else "LOG", "WARN: " + text, "yellow", Global.Verbosity.WARNINGS)
	pass

func print_error(category, text):
	log_to_console(category if category != null else "LOG", "ERR: " + text, "red", Global.Verbosity.ERRORS)
	pass
