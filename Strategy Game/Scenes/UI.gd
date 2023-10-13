extends Control

@onready var buildingButtons : Node = get_node("BuildingButtons")

@onready var foodMetalText : Label = get_node("FoodMetalText")

@onready var oxygenEnergyText : Label = get_node("OxygenEnergyText")

@onready var curTurnText : Label = get_node("TurnText")

@onready var gameManager : Node = get_node("/root/Main")

func on_end_turn():
	curTurnText.text = "Turn : " + str(gameManager.curTurn)
	buildingButtons.visible = true
