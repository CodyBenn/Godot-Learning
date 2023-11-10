extends CharacterBody2D

@export var move_speed: float = 100.0

@onready var equipCollider = $HandEquip/EquipSprite/Area2D/EquipCollider
@onready var animationTree = $AnimationTree
var isInteracting: bool = false
var canMove: bool = true

var direction: Vector2 = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	# Get the character's input direction
	if canMove:
		direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = direction * move_speed

	update_animation_parameters()
	move_and_slide()

func update_animation_parameters():
	if velocity == Vector2.ZERO:
		animationTree["parameters/conditions/idle"] = true
		animationTree["parameters/conditions/is_moving"] = false
	else:
		animationTree["parameters/conditions/idle"] = false
		animationTree["parameters/conditions/is_moving"] = true

	if Input.is_action_just_pressed("ui_accept"):
		if not isInteracting:
			isInteracting = true
			canMove = false
			animationTree["parameters/conditions/swing"] = true

	if direction != Vector2.ZERO:
		animationTree["parameters/Idle/blend_position"] = direction
		animationTree["parameters/Walk/blend_position"] = direction
		animationTree["parameters/Swing/blend_position"] = direction
#
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Swing":
		print("This is working")
		isInteracting = false
		canMove = true
		animationTree["parameters/conditions/swing"] = false
		animationTree["parameters/conditions/idle"] = true


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "Swing":
		print("This is working")
		isInteracting = false
		canMove = true
		animationTree["parameters/conditions/swing"] = false
		animationTree["parameters/conditions/idle"] = true
