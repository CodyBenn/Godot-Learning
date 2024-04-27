extends Area2D

#Assigns platform collision to the player body
func _on_body_entered(body):
	if body is Player:
		if body.velocity.y > 0:
			body.jump()
