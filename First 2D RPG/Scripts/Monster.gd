extends CharacterBody2D

@export var curHp : int = 5
@export var maxHp : int = 5

@export var moveSpeed : float = 100
@export var xpToGive : int = 30

@export var damage : int = 1
@export var attackRate : float = 1.0
@export var attackDist : int = 80
@onready var chaseDist = $DetectionArea
var distToPlayer : int

var player_chase = false
var player = null

@onready var timer = $Timer
@onready var target = $"../Player"

func _ready():
	timer.wait_time = attackRate
	timer.start()
	
func _physics_process(delta):

	distToPlayer = position.distance_to(target.position)

	if distToPlayer > attackDist and chaseDist and player_chase:
		velocity = (player.position - position).normalized() * moveSpeed
		$MonsterAnimatedSprite.play("Walk")
		move_and_slide()
	else:
		$MonsterAnimatedSprite.play("Idle")
	
#func _physics_process(delta):
#	distToPlayer = position.distance_to(target.position)
#	if player_chase:
#		velocity = (player.position - position).normalized() * moveSpeed
#		$MonsterAnimatedSprite.play("Walk")
#		if distToPlayer <= attackDist:
#			player_chase = false
#
#	else:
#		$MonsterAnimatedSprite.play("Idle")
#
#	move_and_slide()
	
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	
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
	$MonsterAnimatedSprite.play("Death")
	await get_tree().create_timer(0.1).timeout
	queue_free()
