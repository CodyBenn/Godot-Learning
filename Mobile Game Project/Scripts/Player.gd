extends CharacterBody2D
class_name Player

#Assigns player movement limits
@export var speed = 300.0
@export var gravity = 15.0
@export var jump_velocity = -800
var max_fall_velocity = 1000.0

@onready var animator = $AnimationPlayer

#Assigns the container for camera limit
var viewport_size

func _ready():
	#Assigns camera limits
	viewport_size = get_viewport_rect().size
	
func jump():
	velocity.y = jump_velocity
	
func _process(delta):
	
	#Jump animation controller for player
	if velocity.y < 0:
		if animator.current_animation != "Jump":
			animator.play("Jump")
	elif velocity.y > 0:
		if animator.current_animation != "Idle":
			animator.play("Idle")
	
func _physics_process(delta):
	#Assigns gravity to player
	velocity.y += gravity
	
	#Assigns limit to fall distance
	if velocity.y > max_fall_velocity:
		velocity.y = max_fall_velocity
		
	#Check for player velocity
	#print(velocity.y)
	
	#Movement controller for the player
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed * .1)
	
	#Allows movement
	move_and_slide()
	
	#Loops player from left and right on contact to other side
	var margin = 25
	if global_position.x > viewport_size.x + margin:
		global_position.x = -margin
		#print("Right to left")
	if global_position.x < -margin:
		global_position.x = viewport_size.x + margin
		#print("Left to right")
		
