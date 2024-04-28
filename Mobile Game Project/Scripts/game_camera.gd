extends Camera2D

#Assigns variable to only be of type Player with "null"
var player: Player = null

#Grabs screen size being used to stretch game accordingly
var viewport_size = get_viewport_rect().size

func _ready():
	#Grabs screen size being used to stretch game accordingly
	var viewport_size = get_viewport_rect().size
	
	#Finds the screen size and sets camera to middle of screen
	global_position.x = viewport_size.x / 2
	#print (global_position.x)
	
	#Creates limits to camera based on screen size
	limit_bottom = viewport_size.y
	limit_right = viewport_size.x
	limit_left = 0
	
	
func _process(delta):
	#Determines if player is "null"
	if player:
		#Create distance(px) from player to camera
		var limit_distance = 420
		#Moves and creates new limit for camera if player gains height
		if limit_bottom > player.global_position.y + limit_distance:
			limit_bottom = player.global_position.y + limit_distance
	
#Determines player and assigns "null"
func setup_camera(_player: Player):
	if _player != null:
		player = _player
		
#Sets position of camera to follow player.y axis if player is "null"
func _physics_process(delta):
	if player != null:
		global_position.y = player.global_position.y
