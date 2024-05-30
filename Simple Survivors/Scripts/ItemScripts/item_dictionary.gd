extends Node

const item_path = "res://Assets/Items/"

var items_in_dictionary = {
	"garlic1": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Stinky garlic that deals damage around you.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"garlic2": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Increase size by 10%.",
		"level": "Level: 2",
		"prerequisite": ["garlic1"],
		"type": "upgrade",
	},
	"garlic3": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Increase damage by 10%.",
		"level": "Level: 3",
		"prerequisite": ["garlic2"],
		"type": "upgrade",
	},
	"garlic4": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Increase size by 10%.",
		"level": "Level: 4",
		"prerequisite": ["garlic3"],
		"type": "upgrade",
	},
	"garlic5": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Increase size by 10%.",
		"level": "Level: 5",
		"prerequisite": ["garlic4"],
		"type": "upgrade",
	},
	"garlic6": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Increase damage by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic5"],
		"type": "upgrade",
	},
	"garlic7": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Increase size by 10%.",
		"level": "Level: 7",
		"prerequisite": ["garlic6"],
		"type": "upgrade",
	},
	"garlic8": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Increase size by 10%.",
		"level": "Level: 8",
		"prerequisite": ["garlic7"],
		"type": "upgrade",
	},
	"garlic9": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Increase damage by 10%.",
		"level": "Level: 9",
		"prerequisite": ["garlic8"],
		"type": "upgrade",
	},
	"sword1": {
		"icon": item_path + "Food.png",
		"displayname": "Sword",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Basic",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"whip1": {
		"icon": item_path + "Food.png",
		"displayname": "Whip",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Indiana Jones it up",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"food": {
		"icon": item_path + "Food.png",
		"displayname": "Food",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Placeholder",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	},
	"shoes1": {
		"icon": item_path + "Food.png",
		"displayname": "Shoes",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Snakes dont have feet",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"shoes2": {
		"icon": item_path + "Food.png",
		"displayname": "Shoes",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Snakes dont have feet",
		"level": "Level: 2",
		"prerequisite": ["shoes1"],
		"type": "upgrade"
	},
	"shoes3": {
		"icon": item_path + "Food.png",
		"displayname": "Shoes",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Snakes dont have feet",
		"level": "Level: 3",
		"prerequisite": ["shoes2"],
		"type": "upgrade"
	},
	"shoes4": {
		"icon": item_path + "Food.png",
		"displayname": "Shoes",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Snakes dont have feet",
		"level": "Level: 4",
		"prerequisite": ["shoes3"],
		"type": "upgrade"
	}
}

func get_item_data(item_name:String) -> Dictionary:
	if item_name in items_in_dictionary:
		return items_in_dictionary[item_name]
	return {}
