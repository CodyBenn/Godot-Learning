extends Node2D

#Assigns and instantiates to node PlatformParent for storing new platforms
@onready var platform_parent = $PlatformParent
#Loads "Platform" scene so it can be instatiated later
var platform_scene = preload("res://Scenes/Platform.tscn")
#Loads "GameCamera" so it can be instantiated later
var camera_scene = preload("res://Scenes/GameCamera.tscn")

#Level generation variables
@export var y_distance_between_platforms = 120
@export var level_size = 50
var start_platform_y
var generated_platform_count = 0

#Assign camera to "null"
var camera = null

#Declares viewport_size as global variable for use in other functions
var viewport_size


func _ready():
	#Creates a camera to main scene
	camera = camera_scene.instantiate()
	#Performs func setup_camera which determines if player is "player" and assigns to "null"
	camera.setup_camera($Player)
	#Assigns camera as child of player
	add_child(camera)
	
	viewport_size = get_viewport_rect().size
	generated_platform_count = 0
	start_platform_y = viewport_size.y - (y_distance_between_platforms * 1)
	generate_level(start_platform_y, true)
	
func _process(delta):
	#Player controls to quit and reset game using hotkeys
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func create_platform(location: Vector2):
	#Instantiates a platform, sets it's position, set's as a child of "platform_parent", then returns it's value
	var platform = platform_scene.instantiate()
	platform.global_position = location
	platform_parent.add_child(platform)
	return platform
	
func generate_level(start_y: float, generate_ground: bool):
	var platform_width = 138
	if generate_ground == true:
		#Generate the ground on startup
		var ground_layer_platform_count = (viewport_size.x / platform_width) + 1
		var ground_layer_y_margin = 63
		
		for i in range(ground_layer_platform_count):
			var ground_location = Vector2(i * platform_width, viewport_size.y - ground_layer_y_margin)
			create_platform(ground_location)
			
	#Generates the level
	for i in range(level_size):
		#Sets a max distance between platforms
		var max_x_position = viewport_size.x - platform_width
		#Assigns "random_x" as a random number to spawn the platform along x axis
		var random_x = randf_range(-50.0, max_x_position)
		#Assigns "location" as Vector2 so we can assign x and y coordinates
		var location : Vector2
		#Assigns x and y axis coordinates to "location"
		location.x = random_x
		location.y = start_y - (y_distance_between_platforms * i)
		#print(location)
		#Generates a platform at location
		create_platform(location)
		generated_platform_count += 1
	print(generated_platform_count)
