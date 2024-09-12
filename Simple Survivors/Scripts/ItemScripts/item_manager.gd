extends Node2D
class_name ItemManager

# Player variables
@onready var player = get_node("/root/Main/Player")

# Item variables
@export var item_button_scene: PackedScene = preload("res://Scenes/item_button.tscn")
@onready var item_select_screen = get_node("/root/Main/ItemSelectScreens/ItemButtonUI")
@onready var item_button_container = get_node("/root/Main/ItemSelectScreens/ItemButtonUI/ItemButtonContainer/ItemButtonMargin/ItemButtonHContainer")
@export var garlic_scene = preload("res://Scenes/Items/garlic.tscn")
@export var shield_scene = preload("res://Scenes/Items/shield.tscn")
@export var sword_scene = preload("res://Scenes/Items/sword.tscn")
@export var beam_scene = preload("res://Scenes/Items/beam.tscn")
@export var magic_missle_scene = preload("res://Scenes/Items/magic_missle.tscn")
#@export var chain_lightning_scene = preload("res://Scenes/Items/chain_lightning.tscn")

# Empty Item variables for instantiation
var garlic 
var shield
var sword
var beam
var magic_missle
#var chain_lightning

# Upgrade variables
var available_items = ItemDictionary.items_in_dictionary.keys()
var selected_upgrades = []
var selected_items = []
var upgrade_options = []

func _ready():
	if selected_upgrades == []:
		_on_player_leveled_up()
		
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
	
	# Displays the current items in the buttons, upgrades and items that were selected
	#print("remaining upgrades: ", upgrade_options)
	#print("selected upgrades: ", selected_upgrades)
	#print("selected items: ", selected_items)

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

# Weapon Details
func upgrade_character(upgrade):
	match upgrade:
		"garlic1":
			garlic = garlic_scene.instantiate()
			add_child(garlic)
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
			add_child(shield)
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
		"sword1":
			sword = sword_scene.instantiate()
			add_child(sword)
			sword.upgrade(1)
		"sword2":
			sword.upgrade(2)
		"sword3":
			sword.upgrade(3)
		"sword4":
			sword.upgrade(4)
		"sword5":
			sword.upgrade(5)
		"sword6":
			sword.upgrade(6)
		"sword7":
			sword.upgrade(7)
		"sword8":
			sword.upgrade(8)
		"sword9":
			sword.upgrade(9)
		"beam1":
			beam = beam_scene.instantiate()
			add_child(beam)
			beam.upgrade(1)
		"beam2":
			beam.upgrade(2)
		"beam3":
			beam.upgrade(3)
		"beam4":
			beam.upgrade(4)
		"beam5":
			beam.upgrade(5)
		"beam6":
			beam.upgrade(6)
		"beam7":
			beam.upgrade(7)
		"beam8":
			beam.upgrade(8)
		"beam9":
			beam.upgrade(9)
		"magic_missle1":
			magic_missle = magic_missle_scene.instantiate()
			add_child(magic_missle)
			magic_missle.upgrade(1)
		"magic_missle2":
			magic_missle.upgrade(2)
		"magic_missle3":
			magic_missle.upgrade(3)
		"magic_missle4":
			magic_missle.upgrade(4)
		"magic_missle5":
			magic_missle.upgrade(5)
		"magic_missle6":
			magic_missle.upgrade(6)
		"magic_missle7":
			magic_missle.upgrade(7)
		"magic_missle8":
			magic_missle.upgrade(8)
		"magic_missle9":
			magic_missle.upgrade(9)
		#"chainlightning1":
			#chain_lightning = chain_lightning_scene.instantiate()
			#add_child(chain_lightning)
			#chain_lightning.upgrade(1)
		#"shoes1", "shoes2", "shoes3", "shoes4":
			#player.movespeed += 25
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
