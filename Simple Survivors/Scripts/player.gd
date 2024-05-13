extends CharacterBody2D
class_name Player

#Player and movement s
var player: Player = null
var movespeed = 300.0

var viewport_size

func _ready():
	#Assigns camera limits
	viewport_size = get_viewport_rect().size
	
func _process(_delta):
	var axis_x = Input.get_axis("left", "right")
	var axis_y = Input.get_axis("up", "down")
	
	if axis_x:
		velocity.x = axis_x * movespeed
	else:
		velocity.x = move_toward(velocity.x, 0, movespeed * .1)
	if axis_y:
		velocity.y = axis_y * movespeed
	else:
		velocity.y = move_toward(velocity.y, 0, movespeed * .1)
		
	move_and_slide()
	
