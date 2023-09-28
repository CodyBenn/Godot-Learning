extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	_welcome_message()
	var result = _add(10, 25)
	print("This is the _ready function:")
	print(result)
	

func _add(a, b):
	print("This is the _add function:")
	var sum = a + b
	print(sum)
	return sum

func _welcome_message():
	print("This is the _welcome_message function:")
	print("The function was called!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#_welcome_message()
