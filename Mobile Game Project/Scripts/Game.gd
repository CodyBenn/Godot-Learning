extends Node2D

@onready var level_generator = $LevelGenerator
@onready var ground_sprite = $GroundSprite

@onready var parallax1 = $ParallaxBackground/ParallaxLayer
@onready var parallax2 = $ParallaxBackground/ParallaxLayer2
@onready var parallax3 = $ParallaxBackground/ParallaxLayer3

var viewport_size: Vector2

#Player variables
var player_scene = preload("res://Scenes/Player.tscn")
var player: Player = null
var player_spawn_pos: Vector2

#Loads "GameCamera" so it can be instantiated later
var camera_scene = preload("res://Scenes/Game_Camera.tscn")
var camera = null

func _ready():
	#Grabs screen size for player spawn position
	viewport_size = get_viewport_rect().size
	#Offsets player so they wont spawn on the bottom of screen
	var player_spawn_pos_y_margin = 135
	#Sets player coordinates based on screen size
	player_spawn_pos.x = viewport_size.x / 2.0
	player_spawn_pos.y = viewport_size.y - player_spawn_pos_y_margin
	
	setup_parallax_layer(parallax1)
	setup_parallax_layer(parallax2)
	setup_parallax_layer(parallax3)
	
	ground_sprite.global_position.x = viewport_size.x / 2
	ground_sprite.global_position.y = viewport_size.y
	new_game()
	
func get_parallax_sprite_scale(parallax_sprite: Sprite2D):
	var parallax_texture = parallax_sprite.get_texture()
	var parallax_texture_width = parallax_texture.get_width()
	
	var parallax_scale = viewport_size.x / parallax_texture_width
	var result = Vector2(parallax_scale, parallax_scale)
	return result
	
func setup_parallax_layer(parallax_layer: ParallaxLayer):
	var parallax_sprite = parallax_layer.find_child("Sprite2D")
	if parallax_sprite != null:
		parallax_sprite.scale = get_parallax_sprite_scale(parallax_sprite)
		var my = parallax_sprite.scale.y * parallax_sprite.get_texture().get_height()
		parallax_layer.motion_mirroring.y = my
	
func _process(_delta):
	#Player controls to quit and reset game using hotkeys
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		
#Loads needed nodes for starting game
func new_game():
	#Creates a player in main scene
	player = player_scene.instantiate()
	#Performs func setup_player which determines if player is "player"
	player.global_position = player_spawn_pos
	#Assigns player as child of Game
	add_child(player)
	
	#Creates a camera to main scene
	camera = camera_scene.instantiate()
	#Performs func setup_camera which determines if player is "player"
	camera.setup_camera(player)
	#Assigns camera as child of player
	add_child(camera)
	
	if player:
		level_generator.setup(player)
