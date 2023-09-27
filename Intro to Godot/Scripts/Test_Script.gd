extends Node2D

var score : int = 5
var move_speed : float = 1.0
var game_over : bool = true
var ability : String = "Get rekt kid"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Score : ", score)
	print("Movement speed : ", move_speed)
	print("Gameover : ", game_over)
	print(ability)
	
	move_speed = 0
	print("Movement Speed : ", move_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
