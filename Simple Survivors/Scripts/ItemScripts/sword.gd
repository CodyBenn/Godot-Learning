extends Area2D
class_name Sword

@onready var player = get_node("/root/Main/Player")
@onready var enemy = Enemy
@onready var slash = preload("res://Scenes/Items/slash.tscn")
@onready var attack_timer = get_node("/root/Main/Player/ItemManager/Sword/AttackTimer")
var enemies = {}

var level:int
var damage:float
var size:float
var slash_count_max:int
var knockback_strength:int
var player_position: Vector2

func update_stats():
	match level:
		1:
			slash_count_max = 2
			damage = 25
		2:
			attack_timer.wait_time = 2.5
		3:
			slash_count_max = 3
		4:
			damage = 35
		5:
			attack_timer.wait_time = 2
		6:
			slash_count_max = 4
		7:
			damage = 50
		8:
			attack_timer.wait_time = 1.6
		9:
			slash_count_max = 5

func upgrade(new_level):
	level = new_level
	update_stats()

func attack():
	for i in range(slash_count_max):
		var slash_instance = slash.instantiate()
		add_child(slash_instance)
		slash_instance.connect("enemy_is_hit", enemy_take_damage)
		await get_tree().create_timer(0.3).timeout

func _on_attack_timer_timeout():
	await attack()
	for i in get_tree().get_nodes_in_group("slashes"):
		i.queue_free()
	
func enemy_take_damage(area: Area2D):  # Pass Area2D as argument
	enemy = area.get_parent()  # Get the enemy's parent node (assuming Hurtbox is a child)
	
	# Check if enemy is in the tracked list and has health
	if enemy:
		var hurtbox = area.get_parent().get_node("Hurtbox")
		enemy.current_health -= damage
		# Handle enemy death if health is depleted
		if enemy.current_health <= 0:
			hurtbox.die()
		else:
			hurtbox.enemy_take_damage()
