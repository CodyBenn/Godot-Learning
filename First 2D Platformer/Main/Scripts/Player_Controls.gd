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
		$RunParticlesLeft.emitting = false
		$RunParticlesRight.emitting = false
		velocity.y += gravity * delta
		
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += move_speed
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("Walk")
		if is_on_floor():
			$RunParticlesRight.emitting = true
	if Input.is_action_pressed("ui_left"):
		velocity.x -= move_speed
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("Walk")
		if is_on_floor():
			$RunParticlesLeft.emitting = true
	if velocity.x == 0:
		$AnimatedSprite2D.play("Idle")
		$RunParticlesLeft.emitting = false
		$RunParticlesRight.emitting = false
	if is_in_group("Player") and not is_on_floor():
		$AnimatedSprite2D.play("Jump")
		if Input.is_action_just_pressed("ui_accept"):
			$AnimatedSprite2D.play("DoubleJump")
		
	if is_on_floor():
		jump_count = 0
	else:
		if jump_count == 0:
			jump_count += 1
		
	if jump_count < jump_max:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -jump_force
			jump_count += 1
			$JumpSound.play()
			
	move_and_slide()
		
func game_over():
	velocity.x = 0
	velocity.y = 0
	$Death.play()
	$AnimatedSprite2D.visible = false
	await get_tree().create_timer(0.1).timeout
	get_tree().reload_current_scene()
		
func add_score(amount):
	score += amount
	score_text.text = str("Score : ", score)
	
func _on_death_finished():
	game_over()
