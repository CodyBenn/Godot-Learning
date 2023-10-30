extends Area2D

@export_file("*.tscn") var next_scene

func _ready():
	$AnimatedSprite2D.play("default")
	
func _on_body_entered(body):
	if body.is_in_group("Player"):
		$Win.play()
		
func _on_win_finished():
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file(next_scene)
