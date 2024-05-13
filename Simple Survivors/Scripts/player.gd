extends CharacterBody2D
class_name Player

var movespeed = 300.0

func _ready():
	pass
	
func _process(_delta):
	var axis_x = Input.get_axis("left", "right")
	var axis_y = Input.get_axis("up", "down")
	
	if axis_x:
		velocity.x = axis_x * movespeed
		print(axis_x)
	else:
		velocity.x = move_toward(velocity.x, 0, movespeed * .1)
	if axis_y:
		velocity.y = axis_y * movespeed
		print(axis_y)
	else:
		velocity.y = move_toward(velocity.y, 0, movespeed * .1)
		
	move_and_slide()
	
