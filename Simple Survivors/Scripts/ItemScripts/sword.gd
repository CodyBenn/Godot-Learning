extends Area2D

@onready var player = get_node("/root/Main/Player")
@onready var enemy = Enemy
@onready var sword = preload("res://Scenes/Items/sword.tscn")
@onready var slash = preload("res://Scenes/Items/slash.tscn")
@onready var attack_timer = $AttackTimer

var level:int
var damage:float
var size:float
var slash_count_max:int
var player_position: Vector2

var enemy_hurtbox
var enemies = {}

func _physics_process(_delta):
	var overlapping_mobs = get_overlapping_areas()
	for area in overlapping_mobs:
		if area.get_parent().has_method("get_node"):
			var hurtbox = area.get_parent().get_node("Hurtbox")
			enemy = area.get_parent()
			if enemy in enemies:
				enemy.current_health -= damage
				#print(enemy.current_health, " Enemy Health")
				if enemy.current_health <= 0:
					if hurtbox.has_method("die"):
						hurtbox.die()
				else:
					hurtbox.enemy_take_damage()

func update_stats():
	match level:
		1:
			slash_count_max = 5
			damage = 10
		2:
			attack_timer.wait_time = 1.5
		3:
			slash_count_max = 3
		4:
			damage = 15
		5:
			attack_timer.wait_time = 1
		6:
			slash_count_max = 4
		7:
			damage = 20
		8:
			attack_timer.wait_time = .5
		9:
			slash_count_max = 5

func upgrade(new_level):
	level = new_level
	update_stats()

func attack():
	for slash_count in slash_count_max:
		print(slash_count+1, " / ", slash_count_max)
		# Instantiate the child scene
		var slash_instance = slash.instantiate()
		add_child(slash_instance)
		
		# Get the AnimationPlayer node from the instantiated scene
		var slash_anim = slash_instance.get_node("SlashAnimation") # Adjust the path if needed
		
		# Play the animation
		slash_anim.play("SlashAnim") # Replace "animation_name" with the actual name of the animation
		
		# Wait until the animation finishes
		await get_tree().create_timer(slash_anim.current_animation_length).timeout
		

func _on_attack_timer_timeout():
	await attack()
	for i in get_tree().get_nodes_in_group("slashes"):
		i.queue_free()

func _on_animation_finished(slash_anim, slash_instance):
	print("Loser")
	slash_instance.queue_free()

func _on_area_entered(area):
	enemy = area.get_parent()
	if enemy not in enemies:
		enemies[enemy] = enemy_hurtbox
