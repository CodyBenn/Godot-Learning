extends Sword

signal slash_anim_finished
signal enemy_is_hit

func _ready():
	$SlashAnimation.play("SlashAnim")

func _on_slash_animation_finished(SlashAnimation):
	emit_signal("slash_anim_finished")
	print("Slash anim finishes")

func _on_area_entered(area):
	emit_signal("enemy_is_hit", area)
