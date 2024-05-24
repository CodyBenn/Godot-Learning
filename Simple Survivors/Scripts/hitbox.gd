extends Area2D
class_name Hitbox

@onready var player = get_node("/root/Main/Player")
@export var knockback_strength:float = 200
var enemy
var overlapping_mobs

func _ready():
	if $"..".is_in_group("enemy"):
		enemy = $".."
	elif $"..".is_in_group("player"):
		player = $".."
	
func _process(delta):
	overlapping_mobs = %Hurtbox.get_overlapping_areas()
	if overlapping_mobs.size() > 0:
		if enemy:
			var current_health = enemy.current_health
			enemy.current_health -= delta * .1
			enemy_take_damage()
			#knockback()
		#if player:
			#var current_health = player.current_health
			#player.current_health -= overlapping_mobs.size() * delta
			#player_take_damage()
			
#Determines damage dealt to player
func enemy_take_damage():
	var enemy_sprite = $"../EnemySprite"
	enemy_sprite.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	enemy_sprite.modulate = Color.WHITE 
	print("Enemy took damage. Health pool: " + str(enemy.current_health) + " / " + str(enemy.max_health))
	if enemy.current_health <= 0:
		die()
		
func die():
	if enemy.current_health <= 0:
		player.experience += enemy.experience_to_give
		enemy.queue_free()
		
#func knockback():
		#enemy.knockback_direction = -enemy.velocity.normalized() * knockback_strength
		#enemy.velocity = enemy.knockback_direction
		#move_and_slide()
