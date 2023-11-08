extends CharacterBody2D

@export var move_speed : float = 100.0
var isInteracting : bool
var facingDir = "none"

func _ready():
	pass
	
func _physics_process(delta):
	
	#Movement if not interacting
	if isInteracting == false:
		#Assigns movement physics
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = direction * move_speed
		
		#Plays walk animation based on input
		if direction == Vector2(1,0):
			facingDir = "right"
			$AnimationPlayer.play("walk_right")
		if direction == Vector2(-1, 0):
			facingDir = "left"
			$AnimationPlayer.play("walk_left")
		if direction == Vector2(0,1):
			$AnimationPlayer.play("walk_down")
		if direction == Vector2(0,-1):
			$AnimationPlayer.play("walk_up")
			
		#Plays swing animation
		if Input.is_action_just_pressed("ui_accept"):
			isInteracting = true
			if facingDir == "right":
				$AnimationPlayer.play("swing_right")
				move_speed -= 0
			if facingDir == "left":
				move_speed -= 0
				$AnimationPlayer.play("swing_left")
				
	#Stops animation if no input
	if velocity == Vector2(0,0) and isInteracting == false:
		$AnimationPlayer.play("idle")
		
	move_and_slide()
	
func _on_animation_player_animation_finished(animFinish):
	if animFinish == "swing_left" or "swing_right":
		isInteracting = false
