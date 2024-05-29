extends Area2D
class_name Garlic

@onready var item_dictionary = ItemDictionary
@onready var player = get_node("/root/Main/Player")
@onready var enemy = Enemy

var garlic_damage = 5
var garlic_range = 2
var enemy_hurtbox

var enemies = {}

func _ready():
	var item_data = ItemDictionary.get_item_data("garlic1")
	if item_data:
		garlic_damage = item_data["damage"]
		garlic_range = item_data["range"]
			
	self.scale = Vector2(garlic_range, garlic_range)

func _physics_process(delta):
	var overlapping_mobs = get_overlapping_areas()
	for area in overlapping_mobs:
		if area.get_parent().has_method("get_node"):
			var hurtbox = area.get_parent().get_node("Hurtbox")
			enemy = area.get_parent()
			if enemy in enemies:
				enemy.current_health -= garlic_damage * delta * .1
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

func upgrade():
	pass
