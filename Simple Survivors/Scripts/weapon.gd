extends Node2D
class_name Weapon

func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		print("weapon group entered enemy")
		
