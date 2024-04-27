extends Camera2D

#Assigns variable to only be of type Player with "null"
var player: Player = null

func _ready():
	#Finds the screen size and sets camera to middle of screen
	global_position.x = get_viewport_rect().size.x / 2
	#print (global_position.x)
	
func _process(delta):
	pass
	
#Determines player and assigns "null"
func setup_camera(_player: Player):
	if _player != null:
		player = _player
		
#Sets position of camera to follow player.y axis if player is "null"
func _physics_process(delta):
	if player != null:
		global_position.y = player.global_position.y
