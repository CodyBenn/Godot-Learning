extends CharacterBody2D
class_name Player

#Player stats
var player: Player = null
var level = 1
@export var movespeed:float = 300.0
var current_movespeed: float
@export var max_health: int = 5
var current_health:int
@export var shield: int  = 0
var current_shield: int
@export var attack_speed: float = 1.0
var current_attack_speed: float
@export var attack_damage: int = 20
var current_attack_damage: int

var viewport_size

func _ready():
	#Assigns camera limits
	viewport_size = get_viewport_rect().size
	
func _process(_delta):
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
	
func take_damage(amount):
	current_health -= amount
	print("Take damage. Health pool: " + str(current_health) + " / " + str(max_health))
	
func _on_hitbox_body_entered(body):
	if body.is_in_group("enemy"):
		print("player group entered enemy")
		take_damage(1)
