extends Area2D

signal pinball_entered_deadzone

func _on_area_entered(body_entered_deadzone):
	emit_signal("pinball_entered_deadzone", body_entered_deadzone)
	print("Signal emitted")
