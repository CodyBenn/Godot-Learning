extends Area2D
class_name Garlic

@onready var item_dictionary = ItemDictionary
@onready var player = get_parent().get_parent()
@onready var enemy = Enemy
@onready var garlic_scene:PackedScene = preload("res://Scenes/garlic.tscn")
@onready var garlic = self

var garlic_damage
var garlic_range
var enemy_hurtbox

var enemies = {}

func _ready():
	var item_data = item_dictionary.get_item_data("garlic1")
	if item_data:
		garlic_damage = item_data["damage"]
		garlic_range = item_data["range"]
			
	garlic.scale = Vector2(garlic_range, garlic_range)

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
