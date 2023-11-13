extends Node2D

class_name ResourceNode

@export_file("*.tscn") var resource
@export var resourceAmount: int = 1
@export var woodAmount : int
@export var stoneAmount : int
@export var dirtAmount : int
var currentResourceAmount : int 

func _ready():
	currentResourceAmount = resourceAmount
	