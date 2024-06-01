extends Area2D

@onready var player = get_node("/root/Main/Player")
@onready var enemy = Enemy

var level:int
var damage:float
var size:float
var shields:int

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
			damage = 5
			size = 2
			shields = 1
		2:
			damage = 5
			size = 2.5
		3:
			damage = 10
			size = 2.5
		4:
			damage = 10
			size = 3
		5:
			damage = 15
			size = 3
			shields = 2
		6:
			damage = 15
			size = 3.5
		7:
			damage = 20
			size = 3.5
		8:
			damage = 20
			size = 4
		9:
			damage = 25
			size = 4
			shields = 3
	set_scale(Vector2(size, size))  # Adjust the size of the Shield
