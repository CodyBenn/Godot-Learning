extends Node

@onready var player = get_node("/root/Main/Player")
@onready var player_sprite = get_node("/root/Main/Player/PlayerSprite")
@onready var enemy
@onready var enemy_sprite
@onready var hurtbox = get_node("%Hurtbox")
var target
var overlapping_mobs
var velocity
var invulnerable: bool = false
@export var knockback_strength:float = 200

signal player_took_damage

func _ready():
	pass
	
func _process(delta):
	if get_parent().is_in_group("player"):
		handle_player_damage(delta)
	elif get_parent().is_in_group("enemy"):
		enemy = get_parent()
		enemy_sprite = get_parent().get_node("EnemySprite")
		handle_enemy_damage(delta)
		
#Determines damage dealt to player
func handle_player_damage(delta):
	overlapping_mobs = hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		if invulnerable:
			return
			
		player.current_health -= overlapping_mobs.size() * delta
		player_sprite.modulate = Color.DARK_RED
		await get_tree().create_timer(0.1).timeout
		player_sprite.modulate = Color.WHITE
		#print("Player took damage. Health pool: " + str(player.current_health) + " / " + str(player.max_health))
		
		if player.current_health <= 0:
			die()
		else:
			become_invulnerable()
	
func handle_enemy_damage(delta):
	overlapping_mobs = hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		enemy.current_health -= overlapping_mobs.size() * delta
		player_sprite.modulate = Color.DARK_RED
		await get_tree().create_timer(0.1).timeout
		player_sprite.modulate = Color.WHITE
		print(enemy, "is taking damage")
		
		if enemy.current_health <= 0:
			die_enemy()
		else:
			knockback()
			
func become_invulnerable():
	invulnerable = true
	await get_tree().create_timer(.1).timeout
	invulnerable = false
	
func die_enemy():
	if enemy:
		print("Enemy died")
		enemy.queue_free()
		
func die():
	if player:
		print("You died")
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
		
func knockback():
	var knockback_direction = -velocity.normalized() * knockback_strength
	velocity = knockback_direction
	#move_and_slide()
	
