extends Area2D
class_name Hitbox

@onready var player = get_node("/root/Main/Player")
@export var knockback_strength:float = 200
var enemy
var overlapping_mobs
var invulnerable: bool = false
var is_player:bool = false
var is_enemy:bool = false

func _ready():
	if $"..".is_in_group("enemy"):
		enemy = $".."
		is_enemy = true
	elif $"..".is_in_group("player"):
		player = $".."
		is_player = true
	
func _process(delta):
	overlapping_mobs = %Hurtbox.get_overlapping_areas()
	if overlapping_mobs.size() > 0:
		if is_enemy == true:
			#print(overlapping_mobs, " in enemy overlapping areas")
			var current_health = enemy.current_health
			enemy.current_health -= delta * .1
			enemy_take_damage()
			#knockback()
		if is_player == true:
			#print(overlapping_mobs, " in player overlapping areas")
			var current_health = player.current_health
			player.current_health -= delta
			player_take_damage()
			
#Determines damage dealt to player
func enemy_take_damage():
	var enemy_sprite = $"../EnemySprite"
	enemy_sprite.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	enemy_sprite.modulate = Color.WHITE 
	#print("Enemy took damage. Health pool: " + str(enemy.current_health) + " / " + str(enemy.max_health))
	if enemy.current_health <= 0:
		die()
		
func player_take_damage():
	var player_sprite = $"../PlayerSprite"
	var health_bar = $"../HealthBar"
	player_sprite.modulate = Color.DARK_RED
	health_bar.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	player_sprite.modulate = Color.WHITE
	health_bar.modulate = Color.WHITE
	print("Player took damage. Health pool: " + str(player.current_health) + " / " + str(player.max_health))
	
	if player.current_health <= 0:
		die()
	else:
		become_invulnerable()
		
func become_invulnerable():
	invulnerable = true
	await get_tree().create_timer(.1).timeout
	invulnerable = false

func die():
	if is_enemy == true:
		if enemy.current_health <= 0:
			player.experience += enemy.experience_to_give
			enemy.queue_free()
	if is_player == true:
		print("You died")
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
		
#func knockback():
		#enemy.knockback_direction = -enemy.velocity.normalized() * knockback_strength
		#enemy.velocity = enemy.knockback_direction
		#move_and_slide()
