extends Button

var combat_action : CombatAction

func _on_pressed():
	get_node("/root/Battlescene").cur_char.cast_combat_action(combat_action)
