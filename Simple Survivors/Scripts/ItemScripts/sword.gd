extends Area2D
class_name Sword

@onready var player = get_node("/root/Main/Player")
@onready var slash = preload("res://Scenes/Items/slash.tscn")
@onready var attack_timer = get_node("/root/Main/Player/ItemManager/Sword/AttackTimer")

var level:int
var damage:float
var size:float
var slash_hp:int
var slash_count_max:int
var knockback_strength:int
var player_position: Vector2
var slash_alternate:bool = false

signal do_attack

func update_stats():
	match level:
		1:
			slash_count_max = 5
			damage = 25
			slash_hp = 2
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

func attack():  # Connect "do_attack" to this function
	for i in slash_count_max:
		var slash_instance = slash.instantiate()
		#This will send the slash forward position.x
		if slash_alternate == false:
			add_child(slash_instance)
			slash_alternate = true
		#This will send the slash backwards -position.x
		elif slash_alternate == true:
			add_child(slash_instance)
			slash_instance.scale.x = -.5
			slash_instance.scale.y = -.25
			slash_alternate = false
			
		await get_tree().create_timer(.2).timeout  # Short delay before next slash

func _on_attack_timer_timeout():
	await attack()
	#for i in get_tree().get_nodes_in_group("slashes"):
		#i.queue_free()
