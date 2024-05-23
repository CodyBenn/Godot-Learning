extends Area2D
class_name Weapon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var enemies_in_range = get_overlapping_areas()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		look_at(target_enemy.global_position)
