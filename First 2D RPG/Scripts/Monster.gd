extends CharacterBody2D

@export var curHp : int = 5
@export var maxHp : int = 5

@export var moveSpeed : float = 150
@export var xpToGive : int = 30

@export var damage : int = 1
@export var attackRate : float = 1.0
@export var attackDist : int = 80

var player_chase = false
var player = null

@onready var timer = $Timer
@onready var target = $"../Player"

func _ready():
	timer.wait_time = attackRate
	timer.start()
	
func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/moveSpeed
		
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	$MonsterAnimatedSprite.play("Walk")
	
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	
func _on_timer_timeout():
	if position.distance_to(target.position) <= attackDist:
		target.take_damage(damage)
		
func take_damage(dmgToTake):
	
	curHp -= dmgToTake
	self.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color.WHITE
	
	if curHp <= 0:
		die()
		
func die ():
	target.give_xp(xpToGive)
	queue_free()
