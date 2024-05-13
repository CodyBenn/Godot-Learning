extends Camera2D

@onready var destroyer = $Destroyer
@onready var destroyer_shape = $Destroyer/CollisionShape2D

#Assigns variable to only be of type Player with "null"
var player: Player = null

##Grabs screen size being used to stretch game accordingly
#var viewport_size = get_viewport_rect().size

func _ready():
	#Grabs screen size being used
	var viewport_size = get_viewport_rect().size
	
	#Finds the screen size and sets camera to middle
	global_position.x = viewport_size.x / 2
	
	#Creates limits to camera based on screen size
	limit_bottom = viewport_size.y
	limit_right = viewport_size.x
	limit_left = 0
	
	#Sets destroyer's position to beneath the player's viewport
	destroyer.position.y = viewport_size.y
	
	#Creates new collider shape to viewport's size
	var rect_shape = RectangleShape2D.new()
	var rect_shape_size = Vector2(viewport_size.x, 300)
	rect_shape.set_size(rect_shape_size)
	destroyer_shape.shape = rect_shape
	
func _process(_delta):
	if player:
		#Create distance(px) from player to camera
		var limit_distance = 420
		#Moves and creates new limit for camera if player gains height
		if limit_bottom > player.global_position.y + limit_distance:
			limit_bottom = int(player.global_position.y + limit_distance)
			
	#Deletes platforms after player passes certain distance
	var overlapping_areas = destroyer.get_overlapping_areas()
	if overlapping_areas.size() > 0:
		for area in overlapping_areas:
			if area is Platform:
				area.queue_free()
	
#Determines player and assigns "null"
func setup_camera(_player: Player):
	if _player != null:
		player = _player
		
#Sets position of camera to follow player.y axis if player is "null"
func _physics_process(_delta):
	if player != null:
		global_position.y = player.global_position.y
