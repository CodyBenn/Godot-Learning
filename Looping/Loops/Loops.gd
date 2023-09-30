extends Node2D

@export var spawn_count : int = 400

var star_scene = preload("res://Loops/Assets/star.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in spawn_count:
		var star = star_scene.instantiate()
		add_child(star)
		
		star.position.x = randi_range(-290, 290)
		star.position.y = randi_range(-160, 160)
		
		var star_size = randf_range(.5, 1)
		star.scale.x = star_size
		star.scale.y = star_size
		
