extends CharacterBody2D
class_name Enemy

#Enemy stats
var level = 1
@export var movespeed = 200.0
@export var health: int = 5
@export var shield: int  = 0
@export var attack_speed: float = 1.0
@export var attack_damage: int = 20

var player

func _ready():
	player = get_node("/root/Main/Player")
	
func _physics_process(_delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		position += direction * movespeed * _delta  # Multiply by _delta for frame-independent movement
