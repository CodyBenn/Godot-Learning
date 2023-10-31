extends CheckButton

@export var transitioner : Scene_Transition

func _on_toggled(button_pressed):
	transitioner.set_next_animation(button_pressed)
