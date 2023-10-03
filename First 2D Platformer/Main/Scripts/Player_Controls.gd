extends CharacterBody2D

@export var move_speed : float = 100.0
@export var gravity : float = 500.0
@export var jump_force : float = 200.0
var jump_count : int = 0
var jump_max : int = 2

var score : int = 0
@onready var score_text : Label = get_node("CanvasLayer/ScoreText")

func _physics_process(delta):
	if not is_on_floor() :
		velocity.y += gravity * delta
		
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += move_speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= move_speed
		
	if is_on_floor():
		jump_count = 0
	else:
		if jump_count == 0:
			jump_count += 1
		
	if jump_count < jump_max:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -jump_force
			jump_count += 1
			
	move_and_slide()
	
	if global_position.y > 550:
		game_over()
		
func game_over():
	get_tree().reload_current_scene()
	
func add_score(amount):
	score += amount
	score_text.text = str("Score : ", score)
