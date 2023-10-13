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

func add_to_resource_per_turn(resource, amount):
	if resource == 0:
		return
	elif resource == 1:
		foodPerTurn += amount
	elif metalPerTurn == 2:
		metalPerTurn += amount
	elif oxygenPerTurn == 3:
		oxygenPerTurn += amount
	elif energyPerTurn == 4:
		energyPerTurn += amount

func place_building(tileToPlaceOn):
	
	currentlyPlacingBuilding = false
	
	var texture : Texture
	
	#Building placed in a mine
	if buildingToPlace == 1:
		texture = BuildingData.mine.iconTexture
		
		add_to_resource_per_turn(BuildingData.mine.prodResource, BuildingData.mine.prodResourceAmount)
		add_to_resource_per_turn(BuildingData.mine.upkeepResource, BuildingData.mine.upkeepResourceAmount)	
		
	#Building placed is a greenhouse
	if buildingToPlace == 2:
		texture = BuildingData.greenhouse.iconTexture
		
		add_to_resource_per_turn(BuildingData.greenhouse.prodResource, BuildingData.greenhouse.prodResourceAmount)
		add_to_resource_per_turn(BuildingData.greenhouse.upkeepResource, BuildingData.greenhouse.upkeepResourceAmount)	
		
	#Building placed is a solarpanel
	if buildingToPlace == 3:
		texture = BuildingData.solarpanel.iconTexture
		
		add_to_resource_per_turn(BuildingData.solarpanel.prodResource, BuildingData.solarpanel.prodResourceAmount)
		add_to_resource_per_turn(BuildingData.solarpanel.upkeepResource, BuildingData.solarpanel.upkeepResourceAmount)	
		
func end_turn():
	curFood += foodPerTurn
	curMetal += metalPerTurn
	curOxygen += oxygenPerTurn
	curEnergy += energyPerTurn
	
	curTurn += 1
