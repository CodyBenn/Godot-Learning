extends Node2D

@onready var player = $Player
@onready var level_generator = $LevelGenerator

#Loads "GameCamera" so it can be instantiated later
var camera_scene = preload("res://Scenes/Game_Camera.tscn")

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
	#Player controls to quit and reset game using hotkeys
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		
