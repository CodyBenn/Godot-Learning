extends StaticBody2D
class_name ResourceNode

@export var resourceType : Array[ResourceNodeType]
@export var resourceAmount: int = 1
@export var pickupType : PackedScene
@export var depleted_effect : PackedScene
@export var launchSpeed : float = 50
@export var launchDuration : float = .25
@export var woodAmount : int
@export var stoneAmount : int
@export var dirtAmount : int

@onready var level_parent = get_parent()

var currentResourceAmount : int :
	set(resourceCount):
		currentResourceAmount = resourceCount
		if(resourceCount <= 0):
			#spawn particle effect before removing the node
			var effect_instance : GPUParticles2D = depleted_effect.instantiate()
			effect_instance.position = position
			level_parent.add_child(effect_instance)
			effect_instance.emitting = true
			queue_free()
	
func _ready():
	currentResourceAmount = resourceAmount
	
func harvest(amount : int):
	for n in amount :
		spawn_resource()
		
	currentResourceAmount -= amount

func spawn_resource():
	var pickup_instance : Pickup = pickupType.instantiate() as Pickup
	level_parent.add_child(pickup_instance)
	pickup_instance.position = position
	
	var direction : Vector2 = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0)
	).normalized()
	
	pickup_instance.launch(direction * launchSpeed, launchDuration)
