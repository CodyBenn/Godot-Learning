extends CharacterBody2D
class_name Player

#Player stats
var player: Player = null
var level = 1
@export var movespeed:float = 300.0
var current_movespeed: float
@export var max_health: int = 5
var current_health:int
@export var max_shield: int  = 0
var current_shield: int
@export var attack_speed: float = 1.0
var current_attack_speed: float
@export var attack_damage: int = 20
var current_attack_damage: int

#Stores the items being equipped in an array
var equipped_items = []

#Used for camera size
var viewport_size

func _ready():
	#Assigns to player group as a failsafe
	add_to_group("player")
	
	#Assigns camera limits
	viewport_size = get_viewport_rect().size
	
	#Assign player stats
	character_stats()
	
	print("Player's current health: ", current_health , " / " , "max health: ", max_health)
	
func _process(_delta):
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
	
	#plays game_over function (resets game)
	if current_health <= 0:
		game_over()
	
#Determines damage dealt to player
func take_damage(amount):
	current_health -= amount
	print("Take damage. Health pool: " + str(current_health) + " / " + str(max_health))
	
#Determines what collides with player
func _on_hitbox_body_entered(body):
	if body.is_in_group("enemy"):
		take_damage(1)
		print("player group entered enemy")
		
	#Not really needed at the moment
	elif body.is_in_group("weapon"):
		print("player group entered weapon")
	
#Assigns character stats to starting point for spawn
func character_stats():
	current_health = max_health
	current_attack_damage = attack_damage
	current_attack_speed = attack_speed
	current_shield = max_shield
	current_movespeed = movespeed
	
func game_over():
	get_tree().reload_current_scene()
