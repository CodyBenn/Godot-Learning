extends MeshInstance2D

func _on_bumper_body_body_entered(body):
	if body.is_in_group("pinball"):
		$PinballBumperAnim.play("bump")

