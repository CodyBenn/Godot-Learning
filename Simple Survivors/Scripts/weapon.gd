extends Area2D
class_name Weapon
		
func _on_weapon_hitbox_area_entered(area):
	if area.is_in_group("enemy"):
		print("weapon group entered enemy")
