extends CharacterBody2D

@export var move_speed : float = 100.0
var IsInteracting : bool = false

func _ready():
	pass
	
func _physics_process(delta):
	#Assigns movement based on input
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var interactDirection = direction
	velocity = direction * move_speed
	
	#Animates character with input
	if direction == Vector2(1,0):
		$AnimationPlayer.play("walk_right")
	if direction == Vector2(-1, 0):
		$AnimationPlayer.play("walk_left")
	if direction == Vector2(0,1):
		$AnimationPlayer.play("walk_down")
	if direction == Vector2(0,-1):
		$AnimationPlayer.play("walk_up")
	if Input.is_action_pressed("ui_accept") and Vector2.AXIS_X != 0:
		IsInteracting = true
		$AnimationPlayer.play("swing_down")
		
	#Stops animation if no input
	if velocity == Vector2(0,0) and IsInteracting == false:
		$AnimationPlayer.play("idle")
		
	move_and_slide()
		
func _on_animation_player_animation_finished(animFinish):
	if animFinish == "swing_down":
		IsInteracting = false
