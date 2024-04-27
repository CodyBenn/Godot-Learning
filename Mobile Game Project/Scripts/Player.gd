extends CharacterBody2D

@export var speed = 300.0
@export var gravity = 15.0

var viewport_size

func _ready():
	viewport_size = get_viewport_rect().size
	
func _process(delta):
	pass
	
func _physics_process(delta):
	velocity.y = gravity * (speed * .2)
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed * .1)
	
	move_and_slide()
	
	var margin = 25
	if global_position.x > viewport_size.x + margin:
		global_position.x = -margin
		print("Right to left")
	if global_position.x < -margin:
		global_position.x = viewport_size.x + margin
		print("Left to right")
		
