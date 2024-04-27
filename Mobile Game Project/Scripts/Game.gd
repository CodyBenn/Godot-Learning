extends Node2D

#Loads camera so it can be instantiated later
var camera_scene = preload("res://Scenes/GameCamera.tscn")

#Assign camera to "null"
var camera = null


func _ready():
	#Assigns camera to main scene and assigns camera as child of player
	camera = camera_scene.instantiate()
	camera.setup_camera($Player)
	add_child(camera)
	
func _process(delta):
	pass
