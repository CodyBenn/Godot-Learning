extends StaticBody2D
class_name ResourceNode

@export var resourceType : Array[ResourceNodeType]
@export var resourceAmount: int = 1
@export var pickupType : PackedScene
@export var launchSpeed : float = 50
@export var launchDuration : float = .25
@export var woodAmount : int
@export var stoneAmount : int
@export var dirtAmount : int

@onready var levelParent = get_parent()

var currentResourceAmount : int :
	set(resourceCount):
		currentResourceAmount = resourceCount
		if(resourceCount <= 0):
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
	
	var direction : Vector2 = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0)
	).normalized()
	
	pickup_instance.launch(direction * launchSpeed, launchDuration)
