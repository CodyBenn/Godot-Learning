extends Camera2D

@export var tilemap: TileMap

func _ready():
	var visibleArea = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var upperLeftCorner = visibleArea.position * tileSize;
	var lowerRightCorner = (visibleArea.position + visibleArea.size) * tileSize;
	
	limit_left = tilemap.position.x + upperLeftCorner.x
	limit_top = tilemap.position.y + upperLeftCorner.y
	limit_right = tilemap.position.x + lowerRightCorner.x
	limit_bottom = tilemap.position.y + lowerRightCorner.y
