extends Node

var score : int = 10
var money : int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	
	print("Score : ", score)
	
	score += 1
	score += 2
	print("Addition +3 : ", score)
	
	score -= 2
	print("Subtraction -2 : ", score)
	
	score *= 2
	print("Multiplication *2 : ", score)
	
	score /= 2
	print("Division /2 : ", score)
	
	print()
	print("Let's count money from ", money)

	money += 5
	print("+5 ", money)
	money *= 2
	print("*2 ", money)
	money -= 3
	print("-3 ", money)
	money /= 2
	print("/2 ", money)
	
	print("Ammount of money we have : ", money)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
