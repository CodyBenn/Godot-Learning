extends CharacterBody2D

#Base Stats
var curHP : int = 10
var maxHP : int = 10
var move_speed : float = 250.0
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

func _physics_process(delta):
	
