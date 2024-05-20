extends CanvasLayer

var item_select = [0, 1, 2]

func register_button():
	var buttons = get_tree().get_nodes_in_group("buttons")
	if buttons.size() >= 0:
		for button in buttons:
			if button is ItemButton:
				button.clicked.connect(_on_button_pressed)

func _on_button_pressed(button):
	print("ItemButton: ", button, " Selected")
