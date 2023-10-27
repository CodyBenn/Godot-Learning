extends CanvasLayer

@onready var main = $MainMenu
@onready var controls = $ControlsMenu

@export_file("*.tscn") var nextScene

func _on_button_start_pressed():
	get_tree().change_scene_to_file(nextScene)

func _on_button_controls_pressed():
	main.visible = false
	controls.visible = true
	
func _on_button_quit_pressed():
	get_tree().quit()
	
func _on_button_return_pressed():
	main.visible = true
	controls.visible = false
