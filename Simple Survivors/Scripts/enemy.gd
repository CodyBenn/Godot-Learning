extends CharacterBody2D
class_name Enemy

#Enemy stats
var level = 1
@export var movespeed = 100.0
@export var max_health: int = 5
var current_health:int
@export var max_shield: int  = 0
var current_shield: int
@export var damage: int = 1
@export var experience_to_give:int = 10
@onready var soft_collision = $SoftCollisions

var is_hit_by_player:bool = false

var player

func _ready():
	add_to_group("enemy")
	
	#Gets information to determine player's stats for calculations
	player = get_node("/root/Main/Player")
	setup_enemy_stats()
	
func _physics_process(_delta):
	#Combat AI to chase player's position
		
	var direction = (player.global_position - global_position).normalized()
	
	if player:
		velocity = direction * movespeed
		if soft_collision.is_colliding() and is_in_group("soft_collider"):
			position += soft_collision.get_push_vector() * 400
		
	move_and_slide()
		
#Determines damage taken and deletes if health reaches 0
func take_damage(damage_dealt):
	current_health -= damage_dealt
	self.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color.WHITE
	print("Enemy took damage. Health pool: " + str(current_health) + " / " + str(max_health))
	if current_health <= 0:
		die()
		
func die():
	give_exp()
	queue_free()
	
#Assigns enemy stats to starting point for spawn
func setup_enemy_stats():
	current_health = max_health
	current_shield = max_shield
	
func give_exp():
	if current_health <= 0:
		player.experience += experience_to_give
		
func _on_hitbox_area_entered(area):
	if Hitbox and area.is_in_group("weapon_hitbox"):
		take_damage(damage)
	if Hitbox and area.is_in_group("player_hitbox"):
		pass
		
