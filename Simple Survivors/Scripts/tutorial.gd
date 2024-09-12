extends Label

func _on_tutorial_end_timer_timeout():
	var tween = get_tree().create_tween()
	await tween.tween_property(self, "modulate:a", 0, 1).finished
	queue_free()
