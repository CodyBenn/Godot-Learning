extends Area2D
class_name Hitbox

#Determines what is in collision box to assign damage

func _on_hitbox_area_entered(area):
	if area.is_in_group("player"):
		print("enemy group entered player")
		
	elif area.is_in_group("weapon"):
		var enemy = $Enemy
		var enemy_hitbox = $Enemy
		enemy_hitbox.take_damage(1)
		print("Enemy took damage. Health pool: " + str(enemy.current_health) + " / " + str(enemy.max_health))
		
	elif area.is_in_group("enemy"):
		print("weapon group entered enemy")
		
