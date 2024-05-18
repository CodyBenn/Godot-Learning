extends Area2D
class_name Hitbox

#Determines what is in collision box
func _on_hitbox_area_entered(area):
	if area != null:
		if area.is_in_group("player_hitbox"):
			print("enemy group entered player")
			
		elif area.is_in_group("weapon_hitbox"):
			var enemy_hitbox = $Enemy
			enemy_hitbox.take_damage(1)
			
		elif area.is_in_group("enemy_hitbox"):
			print("weapon group entered enemy")
	
