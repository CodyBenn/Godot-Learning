extends CharacterBody2D
class_name Enemy

#Enemy stats
var level = 1
@export var movespeed = 100.0
@export var max_health: int = 200
var current_health:int = max_health
@export var experience_to_give:int = 10

@onready var player = get_node("/root/Main/Player")
@onready var soft_collision = $SoftCollisions

func _ready():
	add_to_group("enemy")
	
func _physics_process(_delta):
	#Combat AI to chase player's position
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0
	
	if player:
		velocity = direction * movespeed
		if soft_collision.is_colliding() and is_in_group("soft_collider"):
			position += soft_collision.get_push_vector() * 400
		
	move_and_slide()
	
