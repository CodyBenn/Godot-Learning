extends Area2D

@onready var player = get_node("/root/Main/Player")
@onready var beam_attack = preload("res://Scenes/Items/chain_lightning_attack.tscn")
@onready var attack_timer = get_node("/root/Main/Player/ItemManager/ChainLightning/AttackTimer")

var level:int
var damage:float
var beam_max_hp:int
var enemies_in_area

func _process(_delta):
	enemies_in_area = get_overlapping_areas()

func update_stats():
	match level:
		1:
			beam_max_hp = 5
			damage = 20
			attack_timer.wait_time = 4
		2:
			beam_max_hp = 4
		3:
			beam_max_hp = 5
		4:
			beam_max_hp = 6
		5:
			attack_timer.wait_time = 3
		6:
			beam_max_hp = 7
		7:
			beam_max_hp = 8
		8:
			beam_max_hp = 9
		9:
			attack_timer.wait_time = 2

func upgrade(new_level):
	level = new_level
	update_stats()

func attack():
	for i in beam_max_hp:
		generate_chain()
		await get_tree().create_timer(.2).timeout  # Short delay before next slash
		

func generate_chain():
	var beam_instance = beam_attack.instantiate()
	var beam_sprite = beam_instance.get_node("ChainLightningSprite")
	var target_direction
	var random_enemy = enemies_in_area.pick_random().get_parent()
	print(random_enemy)
	
	add_child(beam_instance)
	
	beam_instance.position = player.position
	
	# Now calculate direction vector from player to enemy
	target_direction = random_enemy.position - beam_instance.position
	
	# Set rotation based on direction
	beam_instance.rotation = target_direction.angle()
	
	# Calculate offset based on original and scaled heights
	var original_height = beam_instance.texture.get_height()
	var scaled_height = original_height * beam_instance.scale.x
	var offset_y = (original_height - scaled_height) / 2.0
	
	# Apply offset to Y position
	beam_instance.position.y += offset_y
	
	# Now you can calculate the scale based on player and target positions
	var target_scale = target_direction  # Use target_direction for scaling
	beam_instance.scale.x = target_scale.length()  # Set scale based on direction length

func _on_attack_timer_timeout():
	print(enemies_in_area)
	if enemies_in_area and attack_timer.timeout:
		attack()

func _on_area_entered(_area):
	pass
