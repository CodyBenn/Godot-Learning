extends Node

var score : int = 20
var gameover : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if score > 80:
		print("A")
	elif score > 60:
		print("B")
	elif score > 30:
		print("C")
	else:
		print("D")
		
		
	print()
	if gameover == true:
		print("Go to menu")
	else:
		print("Keep Playing")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
