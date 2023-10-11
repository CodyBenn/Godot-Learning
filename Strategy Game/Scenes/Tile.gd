extends Area2D

@export var startTile : bool = false

var hasBuilding : bool = false
var canPlaceBuilding : bool = false

#components
@onready var highlight : Sprite2D = get_node("Highlight")
@onready var buildingIcon : Sprite2D = get_node("BuildingIcon")
