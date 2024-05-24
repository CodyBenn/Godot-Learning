extends CharacterBody2D
class_name Player

#Player stats
var player: Player = null
var level = 1
@export var movespeed:float = 300.0
@export var max_health:int = 100
@onready var current_health:int = max_health
@export var max_shield:int  = 0
@onready var current_shield:int = max_shield
var experience:int = 0
var experience_to_level:int = 10

@export var weapon_list:PackedScene

var overlapping_mobs
signal player_leveled_up

func _ready():
	pass
	
func _physics_process(_delta):
	#Movement controls
	var axis_x = Input.get_axis("left", "right")
	var axis_y = Input.get_axis("up", "down")
	
	if axis_x:
		velocity.x = axis_x * movespeed
	else:
		velocity.x = move_toward(velocity.x, 0, movespeed * .1)
	if axis_y:
		velocity.y = axis_y * movespeed
	else:
		velocity.y = move_toward(velocity.y, 0, movespeed * .1)
	move_and_slide()
		
	update_ui_bars()
		
	
func level_up():
	if experience >= experience_to_level:
		level += 1
		experience = 0
		experience_to_level = experience_to_level * 2
		print("You leveled up! Level: ", level)
		emit_signal("player_leveled_up")
		
func update_ui_bars():
	%ExperienceBar.max_value = experience_to_level
	%ExperienceBar.value = experience
	%ExperienceBar/ExperienceLevel.text = str(level)
	
	%HealthBar.max_value = max_health
	%HealthBar.value = current_health
	
	if experience >= experience_to_level:
		level_up()
