extends MeshInstance2D

func _on_bumper_body_body_entered(body):
	print(str(body) + " is colliding")
	if body.is_in_group("pinball"):
		print("body is colliding with pinball")
		$BumperAnim.play("bump")

