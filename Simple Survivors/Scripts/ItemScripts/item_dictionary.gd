extends Node

const item_path = "res://Assets/Items/"

var items_in_dictionary = {
	"garlic1": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Stinky garlic that deals damage around you.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
		"damage": 5,
		"range": 2
	},
	"garlic2": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 2",
		"prerequisite": ["garlic1"],
		"type": "upgrade",
		"damage": 5,
		"range": 2 * 1.1
	},
	"garlic3": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 3",
		"prerequisite": ["garlic2"],
		"type": "upgrade",
		"damage": 5 * 1.1,
		"range": 2 * 1.1
	},
	"garlic4": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 4",
		"prerequisite": ["garlic3"],
		"type": "upgrade",
		"damage": 5 * 1.1,
		"range": 2 * 1.2
	},
	"garlic5": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 5",
		"prerequisite": ["garlic4"],
		"type": "upgrade",
		"damage": 5 * 1.1,
		"range": 2 * 1.3
	},
	"garlic6": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic5"],
		"type": "upgrade",
		"damage": 5 * 1.2,
		"range": 2 * 1.3
	},
	"garlic7": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic6"],
		"type": "upgrade",
		"damage": 5 * 1.2,
		"range": 2 * 1.4
	},
	"garlic8": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase size by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic7"],
		"type": "upgrade",
		"damage": 5 * 1.2,
		"range": 2 * 1.5
	},
	"garlic9": {
		"icon": item_path + "Garlic.png",
		"displayname": "Garlic",
		"details": "Increase damage by 10%.",
		"level": "Level: 6",
		"prerequisite": ["garlic8"],
		"type": "upgrade",
		"damage": 5 * 1.3,
		"range": 2 * 1.5
	},
	"sword1": {
		"icon": item_path + "Food.png",
		"displayname": "Sword",
		"details": "Basic",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
		"damage": 5,
		"range": 2
	},
	"whip1": {
		"icon": item_path + "Food.png",
		"displayname": "Whip",
		"details": "Indiana Jones it up",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
		"damage": 5,
		"range": 2
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

var selected_items = ["garlic1"]

func get_item_data(item_name:String) -> Dictionary:
	if item_name in items_in_dictionary:
		return items_in_dictionary[item_name]
	return {}
	
func prerequisite_fulfilled(item_name: String) -> bool:
	var prerequisites = items_in_dictionary[item_name]["prerequisite"]
	if prerequisites.size() == 0:
		return true  # No prerequisites, always fulfilled
	for prereq in prerequisites:
		if prereq not in selected_items:
			return false
	return true
	
func get_random_item() -> String:
	var unselected_items = items_in_dictionary.keys().filter(func(item_name):
		return item_name not in selected_items and prerequisite_fulfilled(item_name))
		
	if unselected_items.size() == 0:
		return ""
		
	var random_item = unselected_items[randi() % unselected_items.size()]
	selected_items.append(random_item)
	return random_item
