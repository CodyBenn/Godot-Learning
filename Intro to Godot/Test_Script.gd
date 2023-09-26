extends Node2D

var score : int = 5
var move_speed : float = 1.0
var game_over : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Score : ", score)
	print("Movement speed : ", move_speed)
	print("Gameover : ", game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
