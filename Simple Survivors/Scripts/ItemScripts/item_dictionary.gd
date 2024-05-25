extends Node

const item_path = "res://Assets/Items/"

var items = {
	"garlic1": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Stinky garlic that deals damage around you.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "item"
	},
	"garlic2": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 2",
		"prerequisite": ["garlic1"],
		"type": "item"
	},
	"garlic3": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 3",
		"prerequisite": ["garlic2"],
		"type": "item"
	},
	"garlic4": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 4",
		"prerequisite": ["garlic3"],
		"type": "item"
	},
	"garlic5": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 5",
		"prerequisite": ["garlic4"],
		"type": "item"
	},
	"garlic6": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic5"],
		"type": "item"
	},
	"garlic7": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic6"],
		"type": "item"
	},
	"garlic8": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic7"],
		"type": "item"
	},
	"garlic9": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic8"],
		"type": "item"
	}
}
