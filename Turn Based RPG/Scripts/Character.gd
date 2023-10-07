extends Node2D
class_name Character

@export var is_player : bool = true
@export var cur_hp : int = 25
@export var max_hp : int = 25

@export var combat_actions : Array
@export var opponent : Node

@onready var health_bar : ProgressBar = get_node("Healthbar")
@onready var health_text : Label = get_node("Healthbar/HealthText")

@export var visual : Texture2D
@export var flip_visual : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = visual
	$Sprite.flip_h = flip_visual
	
	get_node("/root/Battlescene").character_begin_turn.connect(_on_character_begin_turn)
	health_bar.max_value = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage):
	cur_hp -= damage
	_update_health_bar()
	
	if cur_hp <= 0:
		get_node("/root/Battlescene").character_died(self)
		queue_free()
		
func heal(amount):
	cur_hp += amount
	
	if cur_hp > max_hp:
		cur_hp = max_hp
		
	_update_health_bar()

func _update_health_bar():
	health_bar.value = cur_hp
	health_text.text = str(cur_hp, " / ",max_hp)
	
func _on_character_begin_turn(character):
	pass

func cast_combat_action(action):
	if action.damage > 0:
		opponent.take_damage(action.damage)
	elif action.heal > 0:
		heal(action.heal)
		
	get_node("/root/Battlescene").end_current_turn()
