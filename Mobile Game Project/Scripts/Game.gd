extends Node2D

#Assigns and instantiates to node PlatformParent for storing new platforms
@onready var platform_parent = $PlatformParent
#Loads "Platform" scene so it can be instatiated later
var platform_scene = preload("res://Scenes/Platform.tscn")

#Loads "GameCamera" so it can be instantiated later
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
	
	#Creates platforms at coordinates using the func create_platform
	create_platform(Vector2(400, 700))
	create_platform(Vector2(200, 600))
	create_platform(Vector2(300, 400))
	
func _process(delta):
	#Player controls to quit and reset game using hotkeys
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func create_platform(location: Vector2):
	#Instantiates a platform, sets it's position, set's as a child of "platform_parent", and returns it's value
	var platform = platform_scene.instantiate()
	platform.global_position = location
	platform_parent.add_child(platform)
	return platform
	
