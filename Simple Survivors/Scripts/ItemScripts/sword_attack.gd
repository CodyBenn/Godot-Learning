extends CharacterBody2D

@onready var sword = preload("res://Scenes/Items/sword.tscn")
@onready var lifetime = $LifeTimer

var enemy = Enemy
var slash_hp:int
var damage:int
var speed:int = 750
var slash_alternate

func _ready():
	slash_alternate = get_parent().slash_alternate
	slash_hp = get_parent().slash_hp

func _process(delta):
	if slash_alternate == false:
		velocity = Vector2(1, 0)
	elif slash_alternate == true:
		velocity = Vector2(-1, 0)
		
	move_and_collide(velocity.normalized() * delta * speed)
	
func _on_slash_area_area_entered(area:Area2D):
	enemy = area.get_parent()
	_enemy_take_damage()
	slash_health()

func _enemy_take_damage():  # Optional enemy argument
	if enemy != null:
		var hurtbox = enemy.get_node("Hurtbox")
		damage = get_parent().damage
		enemy.current_health -= damage
		$SwordSlashSound.play()
		
		# Handle enemy death if health is depleted
		if enemy.current_health <= 0:
			hurtbox.die()
		else:
			hurtbox.enemy_take_damage() 

func slash_health():
	slash_hp -= 1
	if slash_hp == 0:
		self.queue_free()

func _on_life_timer_timeout():
	queue_free()
