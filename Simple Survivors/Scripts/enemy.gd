extends CharacterBody2D
class_name Enemy

#Enemy stats
var level = 1
@export var movespeed = 100.0
var current_movespeed: float
@export var max_health: int = 5
var current_health:int
@export var max_shield: int  = 0
var current_shield: int
@export var attack_speed: float = 1.0
var current_attack_speed: float
@export var attack_damage: int = 1
var current_attack_damage
var damage: int = 1
@export var experience_to_give:int = 10
@onready var soft_collision = $SoftCollisions

var player

func _ready():
	#Gets information to determine player's stats for calculations
	player = get_node("/root/Main/Player")
	enemy_stats()
	
func _physics_process(_delta):
	var direction = (player.global_position - global_position).normalized()
		
	#Combat AI to chase player's position
	if player:
		position += direction * movespeed * _delta
		
	if soft_collision.is_colliding() and is_in_group("soft_collider"):
		position += soft_collision.get_push_vector() * _delta * 400
		
	move_and_slide()
		
#Determines damage taken and deletes if health reaches 0
func take_damage(damage_dealt):
	current_health -= damage_dealt
	self.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color.WHITE
	if current_health <= 0:
		die()
		
func die():
	give_exp()
	queue_free()
	
#Assigns enemy stats to starting point for spawn
func enemy_stats():
	current_health = max_health
	current_attack_damage = attack_damage
	current_attack_speed = attack_speed
	current_shield = max_shield
	current_movespeed = movespeed
	
func give_exp():
	if current_health <= 0:
		player.experience += experience_to_give
		
func _on_hitbox_area_entered(area):
	if Hitbox and area.is_in_group("weapon"):
		take_damage(damage)
	if Hitbox and area.is_in_group("player"):
		pass
		
