extends Area2D

@onready var player = get_node("/root/Main/Player")
@onready var enemy = Enemy
@onready var attack_timer = $AttackTimer
@onready var shield_anim = $ShieldAnimation

var level:int
var damage:float
var size:float
var shields:int
var knockback_strength:float = 2000.0
var player_position: Vector2

var enemy_hurtbox

var enemies = {}

func _ready():
	update_stats()

func _physics_process(delta):
	var overlapping_mobs = get_overlapping_areas()
	for area in overlapping_mobs:
		if area.get_parent().has_method("get_node"):
			var hurtbox = area.get_parent().get_node("Hurtbox")
			enemy = area.get_parent()
			if enemy in enemies:
				enemy.current_health -= damage * delta * 0.1
				#print(enemy.current_health, " Enemy Health")
				if enemy.current_health <= 0:
					if hurtbox.has_method("die"):
						hurtbox.die()
				else:
					hurtbox.enemy_take_damage()
					knockback(player_position)

func attack():
	if shields == 1:
		shield_anim.play("ShieldAnim")
	if shields == 2:
		shield_anim.play("ShieldAnim_2")
	if shields == 3:
		shield_anim.play("ShieldAnim_3")
	if shields == 4:
		shield_anim.play("ShieldAnim_4")

func _on_area_entered(area):
	enemy = area.get_parent()
	if enemy not in enemies:
		enemies[enemy] = enemy_hurtbox

func upgrade(new_level):
	level = new_level
	update_stats()

func update_stats():
	match level:
		1:
			damage = 10
			shields = 1
		2:
			damage = 20
		3:
			shields = 2
		4:
			damage = 30
		5:
			attack_timer.wait_time = 4
		6:
			shields = 3
		7:
			damage = 40
		8:
			attack_timer.wait_time = 3
		9:
			shields = 4
	set_scale(Vector2(size, size))  # Adjust the size of the Shield

func _on_attack_timer_timeout():
	attack()

func knockback(player_position:Vector2):
	if enemy:
		player_position = player.position
		# Calculate direction from player to enemy
		var direction_to_enemy = (enemy.position - player_position).normalized()
		# Apply knockback in the direction away from the player
		var knockback_direction = direction_to_enemy * knockback_strength
		enemy.velocity = knockback_direction
		enemy.move_and_slide()
