extends CharacterBody2D

#Base Stats
var curHP : int = 10
var maxHP : int = 10
var move_Speed : float = 100.0
var damage : int = 1

#Currency
var gold : int = 0

#Experience and levels
var curLevel : int = 0
var curXP : int = 0
var xpToNextLevel : int = 50
var xpToLevelIncreaseRate : float = 1.2

#Distance to interact with objects
var interactDist : int = 70

#Movement
var vel : Vector2 = Vector2()

#Determines direction to face
var facingDir : Vector2 = Vector2()

@onready var rayCast = get_node("RayCast2D")

func _process(delta):
	
	#Player movement
	var y_axis = Input.get_axis("move_up", "move_down")
	var x_axis = Input.get_axis("move_left", "move_right")
	var input := Vector2(x_axis, y_axis)
	
	position += input * move_Speed * delta
	
	#Animates character if Input
	if input == Vector2(1, 0):
		$AnimatedSprite.play("walk_right")
	elif input == Vector2(-1, 0):
		$AnimatedSprite.play("walk_left")	
	elif input == Vector2(0, 1):
		$AnimatedSprite.play("walk_down")	
	elif input == Vector2(0, -1):
		$AnimatedSprite.play("walk_up")
		
	#Stops animation if no Input
	if input == Vector2(0, 0):
		$AnimatedSprite.stop()
