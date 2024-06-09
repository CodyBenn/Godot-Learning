extends Area2D

var chain_lightning_hp:int
var enemy = Enemy
var damage:int

func _on_area_entered(area):
	enemy = area.get_parent()
	_enemy_take_damage()

func _enemy_take_damage():  # Optional enemy argument
	if enemy != null:
		var hurtbox = enemy.get_node("Hurtbox")
		damage = get_parent().damage
		enemy.current_health -= damage
		
		# Handle enemy death if health is depleted
		if enemy.current_health <= 0:
			hurtbox.die()
		else:
			hurtbox.enemy_take_damage() 

func _on_life_timer_timeout():
	queue_free()
