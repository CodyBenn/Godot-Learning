extends CanvasLayer
class_name ItemSelector

@onready var item_select_screen = $"."

func _ready():
	item_select_screen.visible = false
	register_button()
		
func register_button():
	var buttons = get_tree().get_nodes_in_group("buttons")
	if buttons.size() >= 0:
		for button in buttons:
			if button is ItemButton:
				button.clicked.connect(_on_item_button_pressed)
				
func _on_item_button_pressed(button):
	print(button, " Selected")
	item_select_screen.visible = false
	get_tree().paused = false
	
