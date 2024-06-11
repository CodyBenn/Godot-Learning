extends CharacterBody2D

@onready var player = get_node("/root/Main/Player")  # (Assuming player is used elsewhere)
var level: int
var damage: float = 5
var max_speed: float = 10000.0  # Renamed for clarity

var enemy = Enemy
var enemies_in_area: Array
var target: CharacterBody2D = null  # Initialize target to null

func _physics_process(delta):
	enemies_in_area = $MagicMissleArea.get_overlapping_areas()

	if target:
		# Check if target is still valid (alive and in area)
		if not target.is_in_group("enemy"):
			target = null
		else:
			# Update direction and move towards target
			var direction = global_position.direction_to(target.global_position)
			velocity = direction * max_speed * delta
	
	# Find a new target only if none exists
	if not target and enemies_in_area.size() > 0:
		target = enemies_in_area.pick_random().get_parent()
		if target:
			print("New target:", target.name)  # Optional debug message
	
	move_and_slide()

func _on_magic_missle_area_area_entered(area):
	# Check if enemy and assign
	enemy = area.get_parent()
	enemies_in_area.append(area)

func _on_magic_missle_area_area_exited(area):
	# Remove exited enemy from consideration
	enemies_in_area.erase(enemies_in_area.find(area))

func _on_magic_missle_projectile_area_entered(area):
	_enemy_take_damage()

func _enemy_take_damage():  # Required enemy argument
	if enemy != null:
		print(enemy)
		var hurtbox = enemy.get_node("Hurtbox")
		
		enemy.current_health -= damage
		
		# Handle enemy death if health is depleted
		if enemy.current_health <= 0:
			hurtbox.die()
		else:
			hurtbox.enemy_take_damage()
