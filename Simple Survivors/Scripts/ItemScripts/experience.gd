extends Area2D
class_name Experience

@onready var player = get_node("/root/Main/Player")

var experience_to_give: int = 10
var move_towards_player: bool = false

func _process(delta):
	if move_towards_player and player:
		var direction = global_position.direction_to(player.global_position)
		var velocity = direction * 500.0 * delta
		global_position += velocity

func _on_body_entered(body):
	if body.is_in_group("player"):
		player.experience += experience_to_give
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("hitbox") and not move_towards_player:
		move_towards_player = true
