extends Node2D
class_name ItemManager

# Preload the item button scene
@export var item_button_scene: PackedScene = preload("res://Scenes/item_button.tscn")
@onready var item_select_screen = get_node("/root/Main/ItemSelectScreens")
@onready var item_button_container = get_node("/root/Main/ItemSelectScreens/ItemButtonUI/ItemButtonContainer/ItemButtonMargin/ItemButtonHContainer")
@onready var item_manager = self
@onready var player = get_node("/root/Main/Player")
@export var garlic_scene = preload("res://Scenes/garlic.tscn")
@export var shield_scene = preload("res://Scenes/shield.tscn")

# Change this value to create a different number of buttons
var available_items = ItemDictionary.items_in_dictionary.keys()

var selected_upgrades = []
var selected_items = []
var upgrade_options = []
var garlic 
var shield

func _ready():
	if selected_upgrades == []:
		selected_upgrades.append("garlic1")
		upgrade_character("garlic1")
		print(selected_upgrades)
	
	item_select_screen.visible = false
	
	if player:
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
			item_button_container.add_child(button_instance)

func _on_player_leveled_up():
	upgrade_options.clear()
	create_buttons(3)
	print("remaining upgrades: ", upgrade_options)
	print("selected upgrades: ", selected_upgrades)
	print("selected items: ", selected_items)

func _on_item_button_clicked(button):
	var selected_item = button.item
	
	if ItemDictionary.items_in_dictionary[selected_item]["type"] == "upgrade":
		if selected_item in selected_upgrades:
			upgrade_existing(selected_item)
		else:
			selected_upgrades.append(selected_item)
			upgrade_character(selected_item)
	elif ItemDictionary.items_in_dictionary[selected_item]["type"] == "item":
		selected_items.append(selected_item)
		upgrade_character(selected_item)

func get_random_item():
	var item_list = []
	for i in ItemDictionary.items_in_dictionary:
		if i in selected_upgrades: # Finds already selected upgrades
			pass
		elif i in upgrade_options: # If the upgrade was already selected
			pass
		elif ItemDictionary.items_in_dictionary[i]["type"] == "item": # Don't pick item
			pass
		elif ItemDictionary.items_in_dictionary[i]["prerequisite"].size() > 0: # Check for prerequisites
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

# Weapon Details
func upgrade_character(upgrade):
	match upgrade:
		"garlic1":
			garlic = garlic_scene.instantiate()
			item_manager.add_child(garlic)
			garlic.upgrade(1)
		"garlic2":
			garlic.upgrade(2)
		"garlic3":
			garlic.upgrade(3)
		"garlic4":
			garlic.upgrade(4)
		"garlic5":
			garlic.upgrade(5)
		"garlic6":
			garlic.upgrade(6)
		"garlic7":
			garlic.upgrade(7)
		"garlic8":
			garlic.upgrade(8)
		"garlic9":
			garlic.upgrade(9)
		"shield1":
			shield = shield_scene.instantiate()
			item_manager.add_child(shield)
			shield.upgrade(1)
		"shield2":
			shield.upgrade(2)
		"shield3":
			shield.upgrade(3)
		"shield4":
			shield.upgrade(4)
		"shield5":
			shield.upgrade(5)
		"shield6":
			shield.upgrade(6)
		"shield7":
			shield.upgrade(7)
		"shield8":
			shield.upgrade(8)
		"shield9":
			shield.upgrade(9)
			
		"shoes1", "shoes2", "shoes3", "shoes4":
			player.movespeed += 25
		"food":
			player.current_health += 20
			player.current_health = clamp(player.current_health, 0, player.max_health)
	
	adjust_gui_collection(upgrade)
	
	# Close item select screen and unpause the game
	var option_children = item_button_container.get_children()
	for i in option_children:
		i.queue_free() #Kill the children
	upgrade_options.clear()
	item_select_screen.visible = false
	get_tree().paused = false

func upgrade_existing(item):
	var current_level = int(item.substr(-1))
	var next_level = current_level + 1
	var next_item = item.substr(0, item.length() - 1) + str(next_level)
	if next_item in ItemDictionary.items_in_dictionary:
		upgrade_character(next_item)
		selected_upgrades[selected_upgrades.find(item)] = next_item
	else:
		print("Max upgrade level reached for ", item)

func adjust_gui_collection(upgrade):
	var get_upgraded_displayname = ItemDictionary.items_in_dictionary[upgrade]["displayname"]
	var get_type = ItemDictionary.items_in_dictionary[upgrade]["type"]
	if get_type != "item":
		var get_collected_displaynames = []
		for i in selected_upgrades:
			get_collected_displaynames.append(ItemDictionary.items_in_dictionary[i]["displayname"])
		if not get_upgraded_displayname in get_collected_displaynames:
			var new_item = item_button_container.instantiate()
			new_item.upgrade = upgrade
			match get_type:
				"upgrade":
					selected_upgrades.add_child(new_item)
