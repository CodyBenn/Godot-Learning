extends GridContainer

@export var item_display_template : PackedScene
@onready var display_container : MarginContainer = $DisplayContainer

var displays : Array[ResourceItemDisplay]
var player_inventory : Inventory

func _ready():
	var player : Player = get_tree().get_first_node_in_group("Player")
	player_inventory = player.find_child("Inventory") as Inventory
	player_inventory.connect("resource_count_changed", _on_player_inventory_resource_changed)
	
func _on_player_inventory_resource_changed(type : ResourceItem, new_count : int) -> void:
#	print("New count for " + type.display_name + " is " +str(new_count))
	#find existing item display for type
	var current_display : ResourceItemDisplay
	
	#find existing display and update count if one is found
	for display in displays:
		if(display.resource_type == type):
			current_display = display
			current_display.update_count(new_count)
			break
			
	#if none exists, create a new one
	if(current_display == null):
		var new_display : ResourceItemDisplay = item_display_template.instantiate() as ResourceItemDisplay
		display_container.add_child(new_display)
		new_display.resource_type = type
		new_display.update_count(new_count)
		displays.append(new_display)
