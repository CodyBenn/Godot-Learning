extends CanvasLayer

@onready var main = $MainMenu

@export_file("*.tscn") var menuScene
@export_file("*.tscn") var restartScene

func _on_button_menu_pressed():
	get_tree().change_scene_to_file(menuScene)
	
func _on_button_restart_pressed():
	get_tree().change_scene_to_file(restartScene)
	
func _on_button_quit_pressed():
	get_tree().quit()
