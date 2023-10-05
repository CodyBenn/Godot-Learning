extends Node2D
class_name Character

@export var is_player : bool = true
@export var cur_hp : int = 25
@export var max_hp : int = 25

@export var combat_actions : Array
@export var opponent : Node
@onready var health_bar : ProgressBar = get_node("Healthbar")
@onready var health_text : Label = get_node("Healthbar/HealthText")


# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.max_value = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _take_damage(damage):
	cur_hp -= damage
	_update_health_bar()
	
	if cur_hp <= 0:
		queue_free()
		
func heal(amount):
	cur_hp += amount
	_update_health_bar()
	
	if cur_hp <= max_hp:
		cur_hp = max_hp	

func _update_health_bar():
	health_bar.value = cur_hp
	health_text.text = str(cur_hp, " / ",max_hp)
