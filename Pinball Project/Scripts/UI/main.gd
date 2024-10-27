extends Node2D

var max_player_lives = 3
var current_player_lives = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func lose_life():
	if current_player_lives > 0:
		current_player_lives -= 1
		print(current_player_lives, " lives remaining")
	if current_player_lives <= 0:
		print("Game Over!")
		get_tree().reload_current_scene()

func game_over():
	if current_player_lives <= 0:
			get_tree().reload_current_scene()

func _on_deadzone_body_entered(body):
	if body.is_in_group("pinball"):
		body.get_parent().queue_free()
		lose_life()
