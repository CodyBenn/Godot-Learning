extends VBoxContainer
class_name ItemSelector

# Preload the item button scene
@export var item_button_scene: PackedScene = preload("res://Scenes/item_button.tscn")
@onready var item_select_screen = get_node("/root/Main/ItemSelectScreens")
@onready var player = get_node("/root/Main/Player")

# Change this value to create a different number of buttons
var available_items = ItemDictionary.items_in_dictionary.keys()

var selected_upgrades = []
var upgrade_options = []

func _ready():
	item_select_screen.visible = false
	
	if player:
		print("Player node found")
		player.connect("player_leveled_up", Callable(self, "_on_player_leveled_up"))
	else:
		print("Player node not found")

func create_buttons(x:int):
	# Ensure x is within the range of 1 to 3
	x = clamp(x, 1, 3)
	for i in range(x):
		var item_key = get_random_item()
		
		if item_key == null:
			item_key = "food"
		
		# Instance the item button scene
		var button_instance = item_button_scene.instantiate()
		
		if button_instance:
			# Set the item key for the button
			button_instance.item = item_key
			button_instance.connect("clicked", _on_item_button_clicked)
			 
			# Add the button instance to the VBoxContainer
			add_child(button_instance)

func _on_player_leveled_up():
	upgrade_options.clear()
	create_buttons(3)
	print("remaining upgrades: ", upgrade_options)
	print("selected upgrades: ", selected_upgrades)

func _on_item_button_clicked(button):
	var selected_item = button.item
	selected_upgrades.append(selected_item)
	item_select_screen.visible = false
	get_tree().paused = false
	
	#Checks for children on the HContainer, if there are any it kills it, then generates 3 new buttons
	for n in get_children():
		remove_child(n)
		n.queue_free()

func get_random_item():
	var item_list = []
	for i in ItemDictionary.items_in_dictionary:
		if i in selected_upgrades: #Finds already selected upgrades
			pass
		elif i in upgrade_options: #If the upgrade was already selected
			pass
		elif ItemDictionary.items_in_dictionary[i]["type"] == "item": #Dont pick item
			pass
		elif ItemDictionary.items_in_dictionary[i]["prerequisite"].size() > 0: #Check for prerequisites
			var to_add = true
			for n in ItemDictionary.items_in_dictionary[i]["prerequisite"]:
				if not n in selected_upgrades:
					to_add = false
			if to_add:
				item_list.append(i)
		else:
			item_list.append(i)
	if item_list.size() > 0:
		var random_item = item_list[randi() % item_list.size()]
		upgrade_options.append(random_item)
		return random_item
	else:
		return null
