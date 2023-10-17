extends CharacterBody2D

#Base Stats
@export var curHp : int = 10
@export var maxHp : int = 10
@export var move_Speed : float = 250.0
@export var damage : int = 1

#Currency
var gold : int = 0

#Experience and levels
@export var curLevel : int = 0
@export var curXp : int = 0
@export var xpToNextLevel : int = 50
@export var xpToLevelIncreaseRate : float = 1.2

#Distance to interact with objects
var interactDist : int = 70

#Movement velocity
var vel : Vector2 = Vector2()

#Determines direction to face
var facingDir : Vector2 = Vector2()

@onready var rayCast = $RayCast2D
@onready var anim = $AnimatedSprite

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
		
	move_and_slide()
	
func give_xp(amount):
	curXp += amount
	
	if curXp >= xpToNextLevel:
		level_up()
		
func level_up():
	var overflowXp = curXp - xpToNextLevel
	
	xpToNextLevel *= xpToLevelIncreaseRate
	curXp = overflowXp
	curLevel += 1
	
func take_damage(dmgToTake):
	curHp -= dmgToTake
	self.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color.WHITE
	
	if curHp <= 0:
		die()
		
func die():
	get_tree().reload_current_scene()
