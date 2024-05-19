extends CharacterBody2D
class_name Enemy

#Enemy stats
var level = 1
@export var movespeed = 100.0
@export var max_health: int = 3
var current_health:int = max_health
@export var experience_to_give:int = 10

@onready var soft_collision = $SoftCollisions
@onready var player = get_node("/root/Main/Player")

func _ready():
	add_to_group("enemy")
	setup_enemy_stats()
	
func _physics_process(delta):
	#Combat AI to chase player's position
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0
	
	if player:
		velocity = direction * movespeed
		if soft_collision.is_colliding() and is_in_group("soft_collider"):
			position += soft_collision.get_push_vector() * 400
		
	move_and_slide()
		
	if $Hitbox.is_in_group("weapon_hitbox"):
		current_health -= 1
		take_damage()
		
#Determines damage dealt to player
func take_damage():
	self.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color.WHITE
	print("Take damage. Health pool: " + str(current_health) + " / " + str(max_health))
	if current_health <= 0:
		die()
		
func die():
	give_exp()
	queue_free()
	
#Assigns enemy stats to starting point for spawn
func setup_enemy_stats():
	current_health = max_health
	
func give_exp():
	if current_health <= 0:
		player.experience += experience_to_give

func _on_hitbox_area_entered(_area):
	pass # Replace with function body.


func _on_hurtbox_area_entered(_area):
	pass # Replace with function body.
