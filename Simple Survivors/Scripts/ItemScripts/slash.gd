extends Area2D

signal slash_anim_finished

func _on_slash_animation_animation_finished(SlashAnim):
	emit_signal("slash_anim_finished")
