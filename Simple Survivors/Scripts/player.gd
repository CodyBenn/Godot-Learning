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
var experience:int = 0
var experience_to_level:int = 10

var invulnerable: bool = false

func _ready():
	#Assigns to player group as a failsafe
	add_to_group("player")
	#Assign player stats
	setup_character_stats()
	
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
		
	if experience >= experience_to_level:
		level_up()
		
#Determines damage dealt to player
func take_damage(damage_dealt):
	if invulnerable:
		return
		
	current_health -= damage_dealt
	self.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color.WHITE
	print("Take damage. Health pool: " + str(current_health) + " / " + str(max_health))
	
	if current_health <= 0:
		die()
	else:
		become_invulnerable()
		
func die():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func become_invulnerable():
	invulnerable = true
	await get_tree().create_timer(1).timeout
	invulnerable = false
	
#Assigns character stats to starting point for spawn
func setup_character_stats():
	current_health = max_health
	current_shield = max_shield
	current_movespeed = movespeed
	
func level_up():
	level += 1
	experience = 0
	experience_to_level = experience_to_level * 2
	
func _on_hitbox_area_entered(area):
	if Hitbox and area.is_in_group("enemy_hitbox"):
		take_damage(1)
