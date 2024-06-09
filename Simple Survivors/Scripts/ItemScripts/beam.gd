extends Area2D

@onready var player = get_node("/root/Main/Player")
@onready var beam_attack = preload("res://Scenes/Items/beam_attack.tscn")
@onready var attack_timer = get_node("/root/Main/Player/ItemManager/Beam/AttackTimer")

var level:int
var damage:float
var beam_max_hp:int
var enemies_in_area

func _process(_delta):
	enemies_in_area = get_overlapping_areas()

func update_stats():
	match level:
		1:
			beam_max_hp = 4
			damage = 25
			attack_timer.wait_time = 4
		2:
			beam_max_hp = 5
		3:
			beam_max_hp = 6
		4:
			beam_max_hp = 7
		5:
			attack_timer.wait_time = 3
		6:
			beam_max_hp = 8
		7:
			beam_max_hp = 9
		8:
			beam_max_hp = 10
		9:
			attack_timer.wait_time = 2

func upgrade(new_level):
	level = new_level
	update_stats()

func attack():
	for i in beam_max_hp:
		if enemies_in_area.size() > 0:
			generate_chain()
			await get_tree().create_timer(.2).timeout  # Short delay before next slash
		else:
			return 

func generate_chain():
	var beam_instance = beam_attack.instantiate()
	var beam_sprite = beam_instance.get_node("BeamAttackSprite")
	var target_direction
	var random_enemy
	
	random_enemy = enemies_in_area.pick_random().get_parent()
	
	add_child(beam_instance)
	
	beam_instance.position = player.position
	
	# Calculate direction vector from player to enemy
	target_direction = random_enemy.position - beam_instance.position
	
	# Set rotation based on direction
	beam_instance.rotation = target_direction.angle()
	
	# Now you can calculate the scale based on player and target positions
	var target_scale = target_direction  # Use target_direction for scaling

func _on_attack_timer_timeout():
	if enemies_in_area and attack_timer.timeout:
		attack()

func _on_area_entered(_area):
	pass
