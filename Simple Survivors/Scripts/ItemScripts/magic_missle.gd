extends CharacterBody2D

@onready var player = get_node("/root/Main/Player")
var level: int
var damage: float
var max_speed: float = 30000.0

var enemy = Enemy
var enemies_in_area: Array
var target: CharacterBody2D = null
var original_position:Vector2 = self.position
var max_distance = 200.0

func _physics_process(delta):
	# Finds enemies in radius, then assigns the target
	assign_target()
	
	# Resets Missle center back to player
	$MagicMissleArea.global_position = player.global_position
	
	# Controls movement of the Magic Missle
	if target and is_instance_valid(target):
		var direction = global_position.direction_to(target.global_position)
		velocity = direction * max_speed * delta
		if target == null and enemy == null:
			direction = original_position
			velocity = direction * max_speed * delta
			
	if position.distance_to(player.global_position) > max_distance and not target:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * max_speed * delta
	
	move_and_slide()

func attack():
	if $MagicMissleProjectile.get_overlapping_areas() and target and is_instance_valid(target):
		var hurtbox = target.get_node("Hurtbox")
		enemy = target
		enemy.current_health -= damage
		if enemy.current_health <= 0:
			if hurtbox.has_method("die"):
				hurtbox.die()
				target = null
		else:
			hurtbox.enemy_take_damage()

func assign_target():
	enemies_in_area = $MagicMissleArea.get_overlapping_areas()
	
	if enemies_in_area.size() > 0 and not target:
		target = enemies_in_area.pick_random().get_parent()

func upgrade(new_level):
	level = new_level
	update_stats()

func update_stats():
	match level:
		1:
			damage = 10
		2:
			damage = 15
			max_speed = 40000.0
		3:
			damage = 20
		4:
			damage = 25
			max_speed = 50000.0
		5:
			damage = 30
		6:
			damage = 35
			max_speed = 60000.0
		7:
			damage = 40
		8:
			damage = 45
			max_speed = 70000.0
		9:
			damage = 50

func _on_attack_timer_timeout():
	attack()
