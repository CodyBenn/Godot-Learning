extends VBoxContainer

# Preload the item button scene
@export var item_button_scene: PackedScene = preload("res://Scenes/item_button.tscn")

var available_items = ItemDictionary.items_in_dictionary.keys()

# Function to create buttons based on the value of x
func create_buttons(x: int):
	# Ensure x is within the range of 1 to 3
	x = clamp(x, 1, 3)
	
	for i in range(x):
		if available_items.size() == 0:
			print("No more items available to select.")
			return
			
		# Select a random item key from the available items
		var random_index = randi() % available_items.size()
		var item_key = available_items[random_index]
		
		# Remove the selected item from the available items list
		available_items.remove_at(random_index)
		
		# Instance the item button scene
		var button_instance = item_button_scene.instantiate()
		
		if button_instance:
			# Set the item key for the button
			button_instance.item = item_key
			# Connect the clicked signal if needed
			button_instance.connect("clicked", _on_item_button_clicked)
			 
			# Add the button instance to the VBoxContainer
			add_child(button_instance)
			
func _ready():
	randomize()
	var x = 3  # Change this value to create a different number of buttons
	create_buttons(x)
	
func _on_item_button_clicked(button):
	print("Button clicked:", button.item)
