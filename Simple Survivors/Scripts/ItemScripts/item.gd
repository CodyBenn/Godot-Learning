extends Area2D
class_name Item

#var garlic_damage:int = 1
#var garlic_range:float = $Garlic.scale.value

signal garlic_body_entered

func _on_body_entered(_body):
	emit_signal("garlic_body_entered")
