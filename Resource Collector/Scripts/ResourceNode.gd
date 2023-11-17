extends StaticBody2D
class_name ResourceNode

@export var resourceType : Array[ResourceNodeType]
@export var resourceAmount: int = 1
@export var woodAmount : int
@export var stoneAmount : int
@export var dirtAmount : int

var currentResourceAmount : int :
	set(value):
		if(value <= 0):
			queue_free()
	
func _ready():
	currentResourceAmount = resourceAmount
	
func harvest(amount : int):
	currentResourceAmount -= amount
