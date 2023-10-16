extends Camera2D

@onready var target = $"../Player"

func _process(delta):
	position = target.position
