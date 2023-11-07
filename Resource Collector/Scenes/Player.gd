extends CharacterBody2D

@export var move_speed : float = 100.0
var isInteracting : bool
var facingDir = "none"

func _ready():
	pass

func _physics_process(delta):

	# Get the character's input direction
	var direction = Vector2(0, 0)
	if isInteracting == false:
		direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Movement input
	if direction != Vector2(0, 0):
		velocity = direction * move_speed

		# Set the facing direction for animation
		if direction.x > 0:
			facingDir = "right"
			$AnimationPlayer.play("walk_right")
		elif direction.x < 0:
			facingDir = "left"
			$AnimationPlayer.play("walk_left")
		elif direction.y > 0:
			$AnimationPlayer.play("walk_down")
		elif direction.y < 0:
			$AnimationPlayer.play("walk_up")
	else:
		# If no movement input, set velocity to zero
		velocity = Vector2(0, 0)

	# Handle interaction
	if Input.is_action_just_pressed("ui_accept") and !isInteracting:
		isInteracting = true
		
		# Play the attack animation based on facing direction
		if facingDir == "right":
			$AnimationPlayer.play("swing_right")
		if facingDir == "left":
			$AnimationPlayer.play("swing_left")

	# If not interacting and no movement input, play the idle animation
	if direction == Vector2(0, 0) and !isInteracting:
		$AnimationPlayer.play("idle")

	move_and_slide()

func _on_animation_player_animation_finished(animFinish):
	if animFinish == "swing_left" or animFinish == "swing_right":
		isInteracting = false
