extends Area2D
class_name Hurtbox

@onready var player = get_node("/root/Main/Player")
@export var knockback_strength:float = 50
var enemy
var overlapping_mobs
var invulnerable:bool = false
var is_player:bool = false
var is_enemy:bool = false
var velocity:Vector2

func _ready():
	#Assigns hitbox parameters based on group of parent
	if $"..".is_in_group("enemy"):
		enemy = $".."
		is_enemy = true
	elif $"..".is_in_group("player"):
		player = $".."
		is_player = true
	
func _physics_process(delta):
	#Determines enemy velocity for knockback func
	if is_enemy and enemy:
		velocity = enemy.velocity
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 100.0
	
	#Monitors overlapping areas for Hurtbox to determine if group needs to take damage
	overlapping_mobs = %Hurtbox.get_overlapping_areas()
	if overlapping_mobs.size() > 0:
		if is_player and !invulnerable:
			#Assigns damage to player if overlapping with area
			var current_health = player.current_health
			player.current_health -= overlapping_mobs.size() * delta * .1
			player_take_damage()
			
func enemy_take_damage():
	var enemy_sprite = $"../EnemySprite"
	enemy_sprite.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	enemy_sprite.modulate = Color.WHITE 
		
func player_take_damage():
	var player_sprite = $"../PlayerSprite"
	var health_bar = $"../HealthBar"
	player_sprite.modulate = Color.DARK_RED
	health_bar.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	player_sprite.modulate = Color.WHITE
	health_bar.modulate = Color.WHITE
	#print("Player took damage. Health pool: " + str(player.current_health) + " / " + str(player.max_health))
	
	if player.current_health <= 0:
		die()
	else:
		become_invulnerable()
		
func become_invulnerable():
	invulnerable = true
	await get_tree().create_timer(.1).timeout
	invulnerable = false

func die():
	if is_enemy and enemy:
		if enemy.current_health <= 0:
			player.experience += enemy.experience_to_give
			enemy.queue_free()
	if is_player and player:
		print("You died")
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
		
