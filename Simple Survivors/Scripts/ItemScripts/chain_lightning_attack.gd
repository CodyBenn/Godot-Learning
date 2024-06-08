extends Area2D

var chain_lightning_hp:int
var enemy = Enemy
var damage:int


# Called when the node enters the scene tree for the first time.
func _ready():
	chain_lightning_hp = get_parent().chain_lightning_max_hp

func _on_area_entered(area):
	enemy = area.get_parent()
	_enemy_take_damage()
	#chain_lightning_health()

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

#func chain_lightning_health():
	#chain_lightning_hp -= 1
	#if chain_lightning_hp == 0:
		#self.queue_free()
	#else:
		#pass
		

func _on_life_timer_timeout():
	queue_free()
