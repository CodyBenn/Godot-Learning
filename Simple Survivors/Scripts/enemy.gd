extends CharacterBody2D
class_name Enemy

#Enemy stats
var level = 1
@export var movespeed = 100.0
@export var max_health: int = 100
var current_health:int = max_health
@export var experience_to_give:int = 10

@onready var soft_collision = $SoftCollisions
@onready var player = get_node("/root/Main/Player")

var overlapping_mobs

func _ready():
	add_to_group("enemy")
	
func _physics_process(delta):
	#Combat AI to chase player's position
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0
	
	if player:
		velocity = direction * movespeed
		if soft_collision.is_colliding() and is_in_group("soft_collider"):
			position += soft_collision.get_push_vector() * 400
		
	move_and_slide()
	
	overlapping_mobs = %Hurtbox.get_overlapping_areas()
	if overlapping_mobs.size() > 0:
		current_health -= overlapping_mobs.size() * delta
		take_damage()
		
#Determines damage dealt to player
func take_damage():
	self.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color.WHITE
	print("Enemy took damage. Health pool: " + str(current_health) + " / " + str(max_health))
	if current_health <= 0:
		die()
		
func die():
	if current_health <= 0:
		player.experience += experience_to_give
		queue_free()
	
