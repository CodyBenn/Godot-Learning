extends Node2D

var player_lives = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func game_over():
	if player_lives <= 0:
			get_tree().reload_current_scene()
	
func lose_life():
	pass

#func _on_deadzone_pinball_entered_deadzone(deadzone_entered_body):
	#player_lives -= 1
	#print("Main Script ", deadzone_entered_body)
	#
	#deadzone_entered_body.queue_free()
	#print(deadzone_entered_body)

func _on_pinball_entered_deadzone(body_entered_deadzone):
	print("Body entered deadzone")
	if body_entered_deadzone.is_in_group("pinball"):
		print("Emitting signal for deadzone")
		emit_signal("pinball_entered_deadzone", body_entered_deadzone)


func _on_deadzone_pinball_entered_deadzone(body_entered_deadzone):
	print("Body entered deadzone")
	if body_entered_deadzone.is_in_group("pinball"):
		print("Emitting signal for deadzone")
		emit_signal("pinball_entered_deadzone", body_entered_deadzone)
