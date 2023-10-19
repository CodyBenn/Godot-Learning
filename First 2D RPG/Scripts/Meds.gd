extends StaticBody2D

var heal : int = 5

func on_interact(player):
	player.give_hp(heal)
	if player.curHp > player.maxHp:
		player.curHp = player.maxHp
		
	print("player gains hp")
	print("current hp : " + str(player.curHp))
	print("max hp : " + str(player.maxHp))
	queue_free()
