extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("left_plunger") and is_in_group("Left_Plunger"):
		$PlungerAnim.play("left_active")
	if Input.is_action_just_released("left_plunger") and is_in_group("Left_Plunger"):
		$PlungerAnim.play("left_default")
		
	if Input.is_action_just_pressed("right_plunger") and is_in_group("Right_Plunger"):
		$PlungerAnim.play("right_active")
	if Input.is_action_just_released("right_plunger") and is_in_group("Right_Plunger"):
		$PlungerAnim.play("right_default")
		
