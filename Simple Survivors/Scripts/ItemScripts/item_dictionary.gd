extends Node

const item_path = "res://Assets/Items/"

var items_in_dictionary = {
	"garlic1": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Decaying field thast surrounds you and deals damage to enemies that enter.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"garlic2": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 2",
		"prerequisite": ["garlic1"],
		"type": "upgrade",
	},
	"garlic3": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase damage",
		"level": "Level: 3",
		"prerequisite": ["garlic2"],
		"type": "upgrade",
	},
	"garlic4": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 4",
		"prerequisite": ["garlic3"],
		"type": "upgrade",
	},
	"garlic5": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 5",
		"prerequisite": ["garlic4"],
		"type": "upgrade",
	},
	"garlic6": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase damage",
		"level": "Level: 6",
		"prerequisite": ["garlic5"],
		"type": "upgrade",
	},
	"garlic7": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 7",
		"prerequisite": ["garlic6"],
		"type": "upgrade",
	},
	"garlic8": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
		"scene": preload("res://Scenes/Items/garlic.tscn"),
		"details": "Increase size",
		"level": "Level: 8",
		"prerequisite": ["garlic7"],
		"type": "upgrade",
	},
	"garlic9": {
		"icon": item_path + "Decay.png",
		"displayname": "Decay",
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
		"details": "Slashes the air on both sides of you",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"sword2": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Reduce cooldown",
		"level": "Level: 2",
		"prerequisite": ["sword1"],
		"type": "upgrade",
	},
	"sword3": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Increase maximum slashes",
		"level": "Level: 3",
		"prerequisite": ["sword2"],
		"type": "upgrade",
	},
	"sword4": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Pierce an additional enemy",
		"level": "Level: 4",
		"prerequisite": ["sword3"],
		"type": "upgrade",
	},
	"sword5": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Reduce cooldown",
		"level": "Level: 5",
		"prerequisite": ["sword4"],
		"type": "upgrade",
	},
	"sword6": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Increase maximum slashes",
		"level": "Level: 6",
		"prerequisite": ["sword5"],
		"type": "upgrade",
	},
	"sword7": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Pierce an additional enemy",
		"level": "Level: 7",
		"prerequisite": ["sword6"],
		"type": "upgrade",
	},
	"sword8": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Reduce cooldown",
		"level": "Level: 8",
		"prerequisite": ["sword7"],
		"type": "upgrade",
	},
	"sword9": {
		"icon": item_path + "Sword.png",
		"displayname": "Sword",
		"scene": preload("res://Scenes/Items/sword.tscn"),
		"details": "Increase maximum slashes",
		"level": "Level: 9",
		"prerequisite": ["sword8"],
		"type": "upgrade",
	},
	"beam1": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Laser that shoots towards a random enemy in range",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"beam2": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Fires an additional beam",
		"level": "Level: 2",
		"prerequisite": ["beam1"],
		"type": "upgrade",
	},
	"beam3": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Fires an additional beam",
		"level": "Level: 3",
		"prerequisite": ["beam2"],
		"type": "upgrade",
	},
	"beam4": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Fires an additional beam",
		"level": "Level: 4",
		"prerequisite": ["beam3"],
		"type": "upgrade",
	},
	"beam5": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Reduce cooldown",
		"level": "Level: 5",
		"prerequisite": ["beam4"],
		"type": "upgrade",
	},
	"beam6": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Fires an additional beam",
		"level": "Level: 6",
		"prerequisite": ["beam5"],
		"type": "upgrade",
	},
	"beam7": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Fires an additional beam",
		"level": "Level: 7",
		"prerequisite": ["beam6"],
		"type": "upgrade",
	},
	"beam8": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Fires an additional beam",
		"level": "Level: 8",
		"prerequisite": ["beam7"],
		"type": "upgrade",
	},
	"beam9": {
		"icon": item_path + "Beam.png",
		"displayname": "Laser",
		"scene": preload("res://Scenes/Items/beam.tscn"),
		"details": "Reduce cooldown",
		"level": "Level: 9",
		"prerequisite": ["beam8"],
		"type": "upgrade",
	},
	"magic_missle1": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Spawns a projectile that tracks an enemy",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade",
	},
	"magic_missle2": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Increase damage",
		"level": "Level: 2",
		"prerequisite": ["magic_missle1"],
		"type": "upgrade",
	},
	"magic_missle3": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Increase damage",
		"level": "Level: 3",
		"prerequisite": ["magic_missle2"],
		"type": "upgrade",
	},
	"magic_missle4": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Increase damage",
		"level": "Level: 4",
		"prerequisite": ["magic_missle3"],
		"type": "upgrade",
	},
	"magic_missle5": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Increase damage",
		"level": "Level: 5",
		"prerequisite": ["magic_missle4"],
		"type": "upgrade",
	},
	"magic_missle6": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Increase damage",
		"level": "Level: 6",
		"prerequisite": ["magic_missle5"],
		"type": "upgrade",
	},
	"magic_missle7": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Increase damage",
		"level": "Level: 7",
		"prerequisite": ["magic_missle6"],
		"type": "upgrade",
	},
	"magic_missle8": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Increase damage",
		"level": "Level: 8",
		"prerequisite": ["magic_missle7"],
		"type": "upgrade",
	},
	"magic_missle9": {
		"icon": item_path + "MagicMissle.png",
		"displayname": "Magic Missle",
		"scene": preload("res://Scenes/Items/magic_missle.tscn"),
		"details": "Increase damage",
		"level": "Level: 9",
		"prerequisite": ["magic_missle8"],
		"type": "upgrade",
	},
	#"chainlightning1": {
		#"icon": item_path + "ChainLightning.png",
		#"displayname": "Chain Lightning",
		#"scene": preload("res://Scenes/Items/beam.tscn"),
		#"details": "Lightning that bounces between enemies",
		#"level": "Level: 1",
		#"prerequisite": [],
		#"type": "upgrade",
	#},
	#"shoes1": {
		#"icon": item_path + "Boot.png",
		#"displayname": "Boot",
		##"scene": preload("res://Scenes/garlic.tscn"),
		#"details": "Just a single boot, time to hobble your way to victory.
		#Increase movement speed",
		#"level": "Level: 1",
		#"prerequisite": [],
		#"type": "upgrade"
	#},
	#"shoes2": {
		#"icon": item_path + "Boot.png",
		#"displayname": "Boot",
		##"scene": preload("res://Scenes/garlic.tscn"),
		#"details": "Increase movement speed",
		#"level": "Level: 2",
		#"prerequisite": ["shoes1"],
		#"type": "upgrade"
	#},
	#"shoes3": {
		#"icon": item_path + "Boot.png",
		#"displayname": "Boot",
		##"scene": preload("res://Scenes/garlic.tscn"),
		#"details": "Increase movement speed",
		#"level": "Level: 3",
		#"prerequisite": ["shoes2"],
		#"type": "upgrade"
	#},
	#"shoes4": {
		#"icon": item_path + "Boot.png",
		#"displayname": "Boot",
		##"scene": preload("res://Scenes/garlic.tscn"),
		#"details": "Increase movement speed",
		#"level": "Level: 4",
		#"prerequisite": ["shoes3"],
		#"type": "upgrade"
	#},
	"food": {
		"icon": item_path + "Food.png",
		"displayname": "Food",
		#"scene": preload("res://Scenes/garlic.tscn"),
		"details": "Meat of an unknown origin. Probably okay to eat.",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	}
}
