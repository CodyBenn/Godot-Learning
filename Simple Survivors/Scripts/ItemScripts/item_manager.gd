extends Node2D
class_name ItemManager

# Preload the item button scene
@export var item_button_scene: PackedScene = preload("res://Scenes/item_button.tscn")
@onready var item_select_screen = get_node("/root/Main/ItemSelectScreens")
@onready var item_buttom_container = get_node("/root/Main/ItemSelectScreens/ItemButtonUI/ItemButtonContainer/ItemButtonMargin/ItemButtonHContainer")
@onready var player = get_node("/root/Main/Player")
@export var garlic:PackedScene = preload("res://Scenes/garlic.tscn")

# Change this value to create a different number of buttons
var available_items = ItemDictionary.items_in_dictionary.keys()

var selected_weapons = []
var selected_upgrades = []
var selected_items = []
var upgrade_options = []

func _ready():
	var garlic_instance = garlic.instantiate()
	player.add_child.call_deferred(garlic_instance)
	
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
			item_buttom_container.add_child(button_instance)

func _on_player_leveled_up():
	upgrade_options.clear()
	create_buttons(3)
	print("remaining upgrades: ", upgrade_options)
	print("selected upgrades: ", selected_upgrades)
	print("selected items: ", selected_items)

func _on_item_button_clicked(button):
	var selected_item = button.item
	
	if ItemDictionary.items_in_dictionary[selected_item]["type"] == "upgrade":
		selected_upgrades.append(selected_item)
	elif ItemDictionary.items_in_dictionary[selected_item]["type"] == "item":
		selected_items.append(selected_item)
	
	item_select_screen.visible = false
	get_tree().paused = false
	
	#Checks for children on the HContainer, if there are any it kills it, then generates 3 new buttons
	for n in item_buttom_container.get_children():
		item_buttom_container.remove_child(n)
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
