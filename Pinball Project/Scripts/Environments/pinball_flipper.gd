extends Node2D

func ready():
	if is_in_group("Left_Flipper"):
		$PinballFlipperAnim.play("left_default")
	if is_in_group("Right_Flipper"):
		$PinballFlipperAnim.play("right_default")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("left_flipper") and is_in_group("Left_Flipper"):
		$PinballFlipperAnim.play("left_active")
	if Input.is_action_just_released("left_flipper") and is_in_group("Left_Flipper"):
		$PinballFlipperAnim.play("left_default")
		
	if Input.is_action_just_pressed("right_flipper") and is_in_group("Right_Flipper"):
		$PinballFlipperAnim.play("right_active")
	if Input.is_action_just_released("right_flipper") and is_in_group("Right_Flipper"):
		$PinballFlipperAnim.play("right_default")
		
