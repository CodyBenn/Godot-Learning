extends Node

const item_path = "res://Assets/Items/"

var items_in_dictionary = {
	"garlic1": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Stinky garlic that deals damage around you.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"garlic2": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 2",
		"prerequisite": ["garlic1"],
		"type": "upgrade",
	},
	"garlic3": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase damage",
		"level": "Level: 3",
		"prerequisite": ["garlic2"],
		"type": "upgrade",
	},
	"garlic4": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 4",
		"prerequisite": ["garlic3"],
		"type": "upgrade",
	},
	"garlic5": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 5",
		"prerequisite": ["garlic4"],
		"type": "upgrade",
	},
	"garlic6": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase damage",
		"level": "Level: 6",
		"prerequisite": ["garlic5"],
		"type": "upgrade",
	},
	"garlic7": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 7",
		"prerequisite": ["garlic6"],
		"type": "upgrade",
	},
	"garlic8": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 8",
		"prerequisite": ["garlic7"],
		"type": "upgrade",
	},
	"garlic9": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase damage",
		"level": "Level: 9",
		"prerequisite": ["garlic8"],
		"type": "upgrade",
	},
	"shield1": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Pushes enemies away, blocking their path",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"shield2": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Increase damage",
		"level": "Level: 2",
		"prerequisite": ["shield1"],
		"type": "upgrade",
	},
	"shield3": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Additional shield (2)",
		"level": "Level: 3",
		"prerequisite": ["shield2"],
		"type": "upgrade",
	},
	"shield4": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Increase damage",
		"level": "Level: 4",
		"prerequisite": ["shield3"],
		"type": "upgrade",
	},
	"shield5": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Decreased cooldown",
		"level": "Level: 5",
		"prerequisite": ["shield4"],
		"type": "upgrade",
	},
	"shield6": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Additional shield (3)",
		"level": "Level: 6",
		"prerequisite": ["shield5"],
		"type": "upgrade",
	},
	"shield7": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Increase damage",
		"level": "Level: 7",
		"prerequisite": ["shield6"],
		"type": "upgrade",
	},
	"shield8": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Decreased cooldown",
		"level": "Level: 8",
		"prerequisite": ["shield7"],
		"type": "upgrade",
	},
	"shield9": {
		"icon": item_path + "Shield.png",
		"displayname": "Shield",
		"scene": preload("res://Scenes/Items/shield.tscn"),
		"details": "Grants an additional shield (4)",
		"level": "Level: 9",
		"prerequisite": ["shield8"],
		"type": "upgrade",
	},
	"sword1": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Slashes the air in front of you",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
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
	},
	"food": {
		"icon": item_path + "Food.png",
		"displayname": "Food",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Placeholder",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	}
}
