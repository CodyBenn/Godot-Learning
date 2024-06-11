extends CharacterBody2D

@onready var player = get_node("/root/Main/Player")  # (Assuming player is used elsewhere)
var level: int
var damage: float = 5
var max_speed: float = 20000.0  # Renamed for clarity

var enemy = Enemy
var enemies_in_area: Array
var target: CharacterBody2D = null  # Initialize target to null

func _physics_process(delta):
	enemies_in_area = $MagicMissleArea.get_overlapping_areas()
	# Update direction and move towards target
	if position >= player.position:
		pass
		
	if enemies_in_area.size() > 0 and not target:
		target = enemies_in_area.pick_random().get_parent()
	
	if target and is_instance_valid(target):
		var direction = global_position.direction_to(target.global_position)
		velocity = direction * max_speed * delta
	
	if $MagicMissleProjectile.get_overlapping_areas() and target:
		var hurtbox = target.get_node("Hurtbox")
		enemy = target
		enemy.current_health -= damage * delta * 0.1
		if enemy.current_health <= 0:
			if hurtbox.has_method("die"):
				hurtbox.die()
		else:
			hurtbox.enemy_take_damage()
	
	move_and_slide()
