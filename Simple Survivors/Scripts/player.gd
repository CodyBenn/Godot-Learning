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
var invulnerable: bool = false
signal player_leveled_up

func _ready():
	pass
	
func _physics_process(delta):
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
	
	overlapping_mobs = %Hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		if invulnerable:
			return
		current_health -= overlapping_mobs.size() * delta
		take_damage()
		
#Determines damage dealt to player
func take_damage():
	$PlayerSprite.modulate = Color.DARK_RED
	$HealthBar.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	$PlayerSprite.modulate = Color.WHITE
	$HealthBar.modulate = Color.WHITE
	print("Player took damage. Health pool: " + str(current_health) + " / " + str(max_health))
	
	if current_health <= 0:
		die()
	else:
		become_invulnerable()
		
func die():
	print("You died")
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func become_invulnerable():
	invulnerable = true
	await get_tree().create_timer(.1).timeout
	invulnerable = false
	
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
