extends Area2D
class_name Sword

@onready var player = get_node("/root/Main/Player")
@onready var slash = preload("res://Scenes/Items/slash.tscn")
@onready var attack_timer = get_node("/root/Main/Player/ItemManager/Sword/AttackTimer")

var level:int
var damage:float
var slash_hp:int
var slash_count_max:int
var slash_alternate:bool = false

func update_stats():
	match level:
		1:
			slash_count_max = 4
			damage = 50
			slash_hp = 2
		2:
			attack_timer.wait_time = 2.5
		3:
			slash_count_max = 6
		4:
			slash_hp = 3
		5:
			attack_timer.wait_time = 2.25
		6:
			slash_count_max = 8
		7:
			slash_hp = 4
		8:
			attack_timer.wait_time = 2
		9:
			slash_count_max = 10

func upgrade(new_level):
	level = new_level
	update_stats()

func attack():
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
