extends Area2D

@onready var player = get_node("/root/Main/Player")
@onready var chain_lightning_attack = preload("res://Scenes/Items/lightning.tscn")
@onready var attack_timer = get_node("/root/Main/Player/ItemManager/ChainLightning/AttackTimer")

var level:int
var damage:float
var chain_lightning_hp:int

func update_stats():
	match level:
		1:
			chain_lightning_hp = 3
			damage = 50
			attack_timer.wait_time = 4
		2:
			chain_lightning_hp = 4
		3:
			chain_lightning_hp = 5
		4:
			chain_lightning_hp = 6
		5:
			attack_timer.wait_time = 3
		6:
			chain_lightning_hp = 7
		7:
			chain_lightning_hp = 8
		8:
			chain_lightning_hp = 9
		9:
			attack_timer.wait_time = 2

func upgrade(new_level):
	level = new_level
	update_stats()

func attack():
	for i in chain_lightning_hp:
		var chain_lightning_instance = chain_lightning_attack.instantiate()
		
		add_child(chain_lightning_instance)
		chain_lightning_instance.position = player.position

func _on_attack_timer_timeout():
	await attack()
