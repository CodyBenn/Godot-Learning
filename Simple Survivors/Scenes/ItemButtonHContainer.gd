extends VBoxContainer

# Preload the item button scene
@export var item_button_scene: PackedScene = preload("res://Scenes/item_button.tscn")

# Function to create buttons based on the value of x
func create_buttons(x: int):
	# Ensure x is within the range of 1 to 3
	x = clamp(x, 1, 3)
	
	# Loop to create the buttons
	for i in range(x):
		# Instance the item button scene
		var button_instance = item_button_scene.instantiate()
		
		# Add the button instance to the VBoxContainer
		add_child(button_instance)

# Example function to call create_buttons with a specific value of x
func _ready():
	var x = 3  # Change this value to create a different number of buttons
	create_buttons(x)
