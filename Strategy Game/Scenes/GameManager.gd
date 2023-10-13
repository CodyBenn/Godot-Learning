extends Node2D

var curFood : int = 0
var curMetal : int = 0
var curOxygen : int = 0
var curEnergy : int = 0

var foodPerTurn : int = 0
var metalPerTurn : int = 0
var oxygenPerTurn : int = 0
var energyPerTurn : int = 0

var curTurn : int = 1

var currentlyPlacingBuilding : bool = false

var buildingToPlace : int

#components
@onready var ui : Node = get_node("UI")
@onready var map : Node = get_node("Tiles")

func on_select_building(buildingType):
	currentlyPlacingBuilding = true
	buildingToPlace = buildingType
	
	map.highlight_available_tiles()
