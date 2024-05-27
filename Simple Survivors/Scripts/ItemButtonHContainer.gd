extends VBoxContainer

# Preload the item button scene
@export var item_button_scene: PackedScene = preload("res://Scenes/item_button.tscn")
@onready var item_select_screen = get_node("/root/Main/ScreensUI")
@onready var player = get_node("/root/Main/Player")

# Change this value to create a different number of buttons
var available_items = ItemDictionary.items_in_dictionary.keys()

func _ready():
	if player:
		print("Player node found")
		player.connect("player_leveled_up", Callable(self, "_on_player_leveled_up"))
	else:
		print("Player node not found")
	
func _on_player_leveled_up():
	#Checks for children on the HContainer, if there are any it kills it, then generates 3 new buttons
	for n in self.get_children():
		self.remove_child(n)
		n.queue_free()
		#print(get_child_count())
	create_buttons(3)
	#print(get_child_count())
		
func create_buttons(x:int):
	# Ensure x is within the range of 1 to 3
	x = clamp(x, 1, 3)
	for i in range(x):
		var random_index = randi() % available_items.size()
		var item_key = available_items[random_index]
		print(random_index)
		
		# Instance the item button scene
		var button_instance = item_button_scene.instantiate()
		
		if button_instance:
			# Set the item key for the button
			button_instance.item = item_key
			print(item_key)
			button_instance.connect("clicked", _on_item_button_clicked)
			 
			# Add the button instance to the VBoxContainer
			add_child(button_instance)
			
func _on_item_button_clicked(button):
	print(button, " Selected")
	item_select_screen.visible = false
	get_tree().paused = false
