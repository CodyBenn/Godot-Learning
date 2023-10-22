extends CharacterBody2D
class_name Monster

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
@onready var target = $"../../Player"

@export_file("*.tscn") var nextScene

func _ready():
	timer.wait_time = attackRate
	timer.start()
	
func _physics_process(delta):

	distToPlayer = position.distance_to(target.position) + 1

	if distToPlayer > attackDist and chaseDist and player_chase:
		velocity = (player.position - position).normalized() * moveSpeed
		move_and_slide()
		
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	$MonsterAnimatedSprite.play("Walk")
	
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	$MonsterAnimatedSprite.play("Idle")
	
func _on_timer_timeout():
	if position.distance_to(target.position) <= attackDist and curHp >= 1:
		target.take_damage(damage)
		
func take_damage(dmgToTake):
	
	curHp -= dmgToTake
	self.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	self.modulate = Color.WHITE
	print(curHp)
	
	if curHp <= 0:
		die()
		
func next_scene():
	print("Boss has died, loading next scene")
	get_tree().change_scene_to_file(nextScene)
	print("Next Scene is loaded")
	
func die ():
	$MonsterAnimatedSprite.play("Death")
	await get_tree().create_timer(1).timeout
	target.give_xp(xpToGive)
	
	if is_in_group("Boss"):
		print("Boss has died, loading next scene")
		await get_tree().create_timer(.8).timeout
		get_tree().change_scene_to_file(nextScene)
		print("Next Scene is loaded")
	else:
		queue_free()
