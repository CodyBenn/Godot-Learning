extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("launcher"):
		$PinballLauncherAnim.play("pull_back")
	if Input.is_action_just_released("launcher"):
		$PinballLauncherAnim.play("launch")