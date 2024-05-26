extends Node

const item_path = "res://Assets/Items/"

var items_in_dictionary = {
	"garlic1": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Stinky garlic that deals damage around you.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"garlic2": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 2",
		"prerequisite": ["garlic1"],
		"type": "upgrade"
	},
	"garlic3": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 3",
		"prerequisite": ["garlic2"],
		"type": "upgrade"
	},
	"garlic4": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 4",
		"prerequisite": ["garlic3"],
		"type": "upgrade"
	},
	"garlic5": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 5",
		"prerequisite": ["garlic4"],
		"type": "upgrade"
	},
	"garlic6": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic5"],
		"type": "upgrade"
	},
	"garlic7": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic6"],
		"type": "upgrade"
	},
	"garlic8": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic7"],
		"type": "upgrade"
	},
	"garlic9": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic8"],
		"type": "upgrade"
	},
	"food": {
		"icon": item_path + "Food.png",
		"displayname": "Food",
		"details": "Placeholder",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	}
}
