extends Node

@export var player_char : Node
@export var enemy_char : Node
var cur_char : Character

@export var next_turn_delay : float = 1.0

var game_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.5).timeout
	_begin_next_turn()

func _begin_next_turn():
	if cur_char == player_char:
		cur_char = enemy_char
	elif cur_char == enemy_char:
		cur_char = player_char
	else:
		cur_char = player_char
	
func _end_current_turn():
	
	await get_tree().create_timer(next_turn_delay).timeout
	
	if game_over == false:
		_begin_next_turn()
	
func _character_died(character):
	game_over = true
	
	if character.is_player == true:
		print("Game Over!")
	else:
		print("You Win!")
