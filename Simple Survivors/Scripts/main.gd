extends Node2D

var viewport_size: Vector2

#Player variables
var player_scene = preload("res://Scenes/player.tscn")
@onready var player = $Player
var player_spawn_pos: Vector2
@onready var item_select_ui = $ScreensUI/Screens

#Loads "GameCamera" so it can be instantiated later
var camera_scene = preload("res://Scenes/game_camera.tscn")
var camera = null

func _ready():
	#Grabs screen size for player spawn position
	viewport_size = get_viewport_rect().size
	#Offsets player so they wont spawn on the bottom of screen
	var player_spawn_pos_y_margin = 135
	#Sets player coordinates based on screen size
	player_spawn_pos.x = viewport_size.x / 2.0
	player_spawn_pos.y = viewport_size.y - player_spawn_pos_y_margin
	
	player.connect("player_leveled_up", item_select)
	
	new_game()
	
func _process(_delta):
	#Player controls to quit and reset game using hotkeys
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		
func new_game():
	#Creates a camera to main scene
	camera = camera_scene.instantiate()
	
func spawn_mob():
	var new_enemy = preload("res://Scenes/enemy_rood.tscn").instantiate()
	%EnemySpawnerPath.progress_ratio = randf()
	new_enemy.global_position = %EnemySpawnerPath.global_position
	add_child(new_enemy)
	
func _on_spawn_timer_timeout():
	spawn_mob()
	
func item_select():
	item_select_ui.item_select_screen.visible = true

