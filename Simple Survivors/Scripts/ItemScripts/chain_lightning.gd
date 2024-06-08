extends Area2D

@onready var player = get_node("/root/Main/Player")
@onready var chain_lightning_attack = preload("res://Scenes/Items/chain_lightning_attack.tscn")
@onready var attack_timer = get_node("/root/Main/Player/ItemManager/ChainLightning/AttackTimer")

var level:int
var damage:float
var chain_lightning_max_hp:int
var chain_lightning_current_hp
var closest_enemy

func update_stats():
	match level:
		1:
			chain_lightning_max_hp = 1
			damage = 50
			attack_timer.wait_time = 4
		2:
			chain_lightning_max_hp = 4
		3:
			chain_lightning_max_hp = 5
		4:
			chain_lightning_max_hp = 6
		5:
			attack_timer.wait_time = 3
		6:
			chain_lightning_max_hp = 7
		7:
			chain_lightning_max_hp = 8
		8:
			chain_lightning_max_hp = 9
		9:
			attack_timer.wait_time = 2

func upgrade(new_level):
	level = new_level
	update_stats()

func attack():
	for i in chain_lightning_max_hp:
		generate_chain()

func _on_attack_timer_timeout():
	await attack()

func generate_chain():
	var chain_lightning_instance = chain_lightning_attack.instantiate()
	var chain_lightning_sprite = chain_lightning_instance.get_node("ChainLightningSprite")
	var first_chain:bool = true
	var target_direction
	
	add_child(chain_lightning_instance)
	
	closest_enemy = get_enemy()
	chain_lightning_instance.position = player.position
	
	# Now calculate direction vector from player to enemy
	target_direction = closest_enemy.position - chain_lightning_instance.position
	
	# Set rotation based on direction
	chain_lightning_instance.rotation = target_direction.angle()
	
	# Calculate offset based on original and scaled heights
	var original_height = chain_lightning_sprite.texture.get_height()
	var scaled_height = original_height * chain_lightning_instance.scale.x
	var offset_y = (original_height - scaled_height) / 2.0
	
	# Apply offset to Y position
	chain_lightning_instance.position.y += offset_y
	
	# Now you can calculate the scale based on player and target positions
	var target_scale = target_direction  # Use target_direction for scaling
	chain_lightning_instance.scale.x = target_scale.length()  # Set scale based on direction length

func get_enemy():
	var closest_enemy = null
	var shortest_distance = INF
	for enemy in get_tree().get_nodes_in_group("enemy"):
		if not is_instance_valid(enemy):
			continue
		# Use direction_to instead of distance_to for direction
		var direction = position.direction_to(enemy.position)
		# Calculate length of the direction vector
		var distance = direction.length()
		if distance < shortest_distance and distance <= 200:  # Added distance check
			shortest_distance = distance
			closest_enemy = enemy
			
	return closest_enemy
