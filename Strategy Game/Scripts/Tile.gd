extends Area2D

#Determines if starting tile
#Base building will be placed here at the start of the game
@export var startTile : bool = false

#Determines if there is a building on the tile
var hasBuilding : bool = false

#Determines if we can place a building on the tile
var canPlaceBuilding : bool = false

#components
@onready var highlight : Sprite2D = get_node("Highlight")
@onready var buildingIcon : Sprite2D = get_node("BuildingIcon")

#Called once when the node is initialized
func _ready():
	
	#Adds the tile to the "Tiles" group whne the node is initialized
	add_to_group("Tiles")
	
#Turns on or off the highlight
func toggle_highlight(toggle):
	
	highlight.visible = toggle
	canPlaceBuilding = toggle
	
#Called when a building is place on the tile
#Sets the tile's building texture to display
func place_building(buildingTexture):

	hasBuilding = true
	buildingIcon.texture = buildingTexture

#Called when an inpur event takes place of the tile
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var gameManager = get_node("/root/Main")
		
		if gameManager.currentlyPlacingBuilding and canPlaceBuilding:
			gameManager.place_building(self)
