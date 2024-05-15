extends CharacterBody2D
class_name Enemy

#Enemy stats
var level = 1
@export var movespeed = 150.0
@export var max_health: int = 5
var current_health:int
@export var shield: int  = 0
var current_shield: int
@export var attack_speed: float = 1.0
var current_attack_speed: float
@export var attack_damage: int = 1
var current_attack_damage

var player

func _ready():
	#Gets information to determine player's stats for calculations
	player = get_node("/root/Main/Player")
	
func _physics_process(_delta):
	#Combat AI to chase player's position
	if player:
		var direction = (player.global_position - global_position).normalized()
		position += direction * movespeed * _delta  # Multiply by _delta for frame-independent movement
		
#Determines if player is in collision box to assign damage
func _on_hitbox_body_entered(_body):
	print("enemy group entered player")
