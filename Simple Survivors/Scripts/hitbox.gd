extends Area2D
class_name Hitbox
#
##Determines what is in collision box
#func _on_hitbox_area_entered(area):
	#if area != null:
		#if area.is_in_group("player_hitbox"):
				#print("weapon group entered hitbox")
				#area.take_damage()
			#
		#elif area.is_in_group("weapon_hitbox"):
			#if area.has_method("take_damage"):
				#print("weapon group entered hitbox")
				#area.take_damage()
			#
		#elif area.is_in_group("enemy_hitbox"):
			#if area.has_method("take_damage"):
				#print("enemy group entered hitbox")
				#area.take_damage()
	#
