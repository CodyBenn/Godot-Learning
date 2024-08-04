extends Node2D

var viewport_size: Vector2

#Player variables
var player_spawn_pos: Vector2
@onready var player = $Player
@onready var item_select_screen = $Player/ItemManager

#Loads "GameCamera" so it can be instantiated later
var camera_scene = preload("res://Scenes/game_camera.tscn")
var camera = null

func _ready():
	##Create a new way that only sets a specific item or only draw from weapons (Exclude items)
	item_select()
	
	#Finds user's screen size and adjusts resolution to specified size
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
	camera = camera_scene.instantiate()

func spawn_mob():
	var new_enemy = preload("res://Scenes/enemy_rood.tscn").instantiate()
	%EnemySpawnerPath.progress_ratio = randf()
	new_enemy.global_position = %EnemySpawnerPath.global_position
	add_child(new_enemy)

func _on_spawn_timer_timeout():
	spawn_mob()

func item_select():
	get_tree().paused = true
	item_select_screen.item_select_screen.visible = true
