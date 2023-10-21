extends CanvasLayer

@onready var main = $MainMenu
@onready var controls = $ControlsMenu

@export_file("*.tscn") var nextScene

func _on_button_start_pressed():
	get_tree().change_scene_to_file(nextScene)

func _on_button_controls_pressed():
	pass # Replace with function body.

func _on_button_quit_button_up():
	pass # Replace with function body.

func _on_button_quit_pressed():
	pass # Replace with function body.
