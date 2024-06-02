extends CharacterBody2D
class_name Enemy

#Enemy stats
var level = 1
@export var movespeed = 100.0
@export var max_health: int = 100
var current_health:int = max_health
var knockback_strength:int = 200

@onready var player = get_node("/root/Main/Player")
@onready var enemy = Enemy
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
	
	update_ui_bars()
	move_and_slide()

func knockback():
	if enemy:
		var knockback_direction = -enemy.velocity.normalized() * knockback_strength
		enemy.velocity = knockback_direction
		self.move_and_slide()

func update_ui_bars():
	$HealthBar.max_value = max_health
	$HealthBar.value = current_health
