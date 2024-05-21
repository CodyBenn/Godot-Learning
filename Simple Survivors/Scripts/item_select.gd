extends CanvasLayer
class_name Item

@onready var item_select_screen = $ItemHContainer
@onready var player = preload("res://Scenes/player.tscn").instantiate()

func _ready():
	item_select_screen.visible = false
	register_button()
	
func _process(_delta):
		item_select()
		
func register_button():
	var buttons = get_tree().get_nodes_in_group("buttons")
	if buttons.size() >= 0:
		for button in buttons:
			if button is ItemButton:
				button.clicked.connect(_on_item_button_pressed)
				
func _on_item_button_pressed(button):
	print(button, " Selected")
	item_select_screen.visible = false
	
func item_select():
	pass
	#if player.leveled_up.connect():
		#print("Test for Screens_UI")
		#item_select_screen.visible = true
