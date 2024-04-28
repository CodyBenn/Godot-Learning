extends Node2D

#Loads camera so it can be instantiated later
var camera_scene = preload("res://Scenes/GameCamera.tscn")

#Assign camera to "null"
var camera = null


func _ready():
	#Creates a camera to main scene
	camera = camera_scene.instantiate()
	#Performs func setup_camera which determines if player is "player" and assigns to "null"
	camera.setup_camera($Player)
	#Assigns camera as child of player
	add_child(camera)
	
func _process(delta):
	pass
