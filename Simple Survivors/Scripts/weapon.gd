extends Area2D
class_name Weapon

var player = Player
signal player_took_damage

func _process(delta):
	var overlapping_mobs = %"../Hurtbox".get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		if player.invulnerable:
			return
		player.current_health -= overlapping_mobs.size() * delta
		emit_signal("player_took_damage")
