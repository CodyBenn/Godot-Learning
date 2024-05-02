extends Node2D

#Assigns to node PlatformParent for storing new platforms
@onready var platform_parent = $PlatformParent
@onready var player = $"../Player"

#Loads "Platform" scene so it can be instatiated later
var platform_scene = preload("res://Scenes/Platform.tscn")

#Level generation variables
@export var y_distance_between_platforms = 120
@export var level_size = 50
var start_platform_y
var generated_platform_count = 0

#Declares viewport_size as global variable for use in other functions
var viewport_size

func _ready():
	#Determine camera size and assign to viewport_size
	viewport_size = get_viewport_rect().size
	generated_platform_count = 0
	#Generate floor platforms for player based on camera size and assign generate_ground to true
	start_platform_y = viewport_size.y - (y_distance_between_platforms * 1)
	generate_level(start_platform_y, true)
	
func _process(delta):
	
	#Procedural level generation
	if player:
		#Determines player location, end of level location, and when to start generating
		var py = player.global_position.y
		var end_of_level_pos = start_platform_y - (generated_platform_count * y_distance_between_platforms)
		var threshold = end_of_level_pos + (y_distance_between_platforms * 6)
		#After player reaches threshold, generate new platform set at end of level position
		if py <= threshold:
			generate_level(end_of_level_pos, false)
			
			
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
		#Adds 1 to "generated_platform_count"
		generated_platform_count += 1
	print(generated_platform_count)
	
func create_platform(location: Vector2):
	#Instantiates a platform, sets it's position, sets it as a child of "platform_parent", then returns it's value
	var platform = platform_scene.instantiate()
	platform.global_position = location
	platform_parent.add_child(platform)
	return platform
