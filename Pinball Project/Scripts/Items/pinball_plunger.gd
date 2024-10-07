extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_plunger") and is_in_group("Left_Plunger"):
		rotation_degrees -= 45
	if Input.is_action_just_released("left_plunger") and is_in_group("Left_Plunger"):
		rotation_degrees += 45
		
	if Input.is_action_just_pressed("right_plunger") and is_in_group("Right_Plunger"):
		rotation_degrees += 45
	if Input.is_action_just_released("right_plunger") and is_in_group("Right_Plunger"):
		rotation_degrees -= 45
		
