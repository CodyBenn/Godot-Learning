extends StaticBody2D
class_name ResourceNode

@export var resourceType : Array[ResourceNodeType]
@export var resourceAmount: int = 1
@export var pickupType : PackedScene
@export var woodAmount : int
@export var stoneAmount : int
@export var dirtAmount : int

@onready var levelParent = get_parent()

var currentResourceAmount : int :
	set(value):
		if(value <= 0):
			queue_free()
	
func _ready():
	currentResourceAmount = resourceAmount
	
func harvest(amount : int):
	for n in amount :
		spawn_resource()
		
	currentResourceAmount -= amount

func spawn_resource():
	var pickup_instance : Pickup = pickupType.instantiate() as Pickup
	levelParent.add_child(pickup_instance)
	pickup_instance.position = position
