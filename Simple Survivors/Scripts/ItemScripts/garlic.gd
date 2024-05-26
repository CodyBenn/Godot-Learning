extends Area2D
class_name Garlic

@onready var player = get_parent().get_parent()
@onready var enemy = Enemy
@onready var garlic_scene:PackedScene = preload("res://Scenes/Items/garlic.tscn")
@onready var garlic = self
var garlic_level:int = 1
var garlic_damage:int = 1
var garlic_range:Vector2
var enemy_hurtbox

func _ready():
	garlic_range = garlic.scale
	if player and player.has_signal("player_leveled_up"):
		player.connect("player_leveled_up", _on_player_leveled_up)
		
func _physics_process(delta):
	if enemy and enemy_hurtbox:
		var overlapping_mobs = get_overlapping_areas()
		if overlapping_mobs.size() > 0 and enemy:
			enemy.current_health -= garlic_damage * delta * .1
			print(enemy.current_health, " Enemy Health")
			if enemy.current_health <= 0:
				if enemy_hurtbox.has_method("die"):
					enemy_hurtbox.die()
				else:
					print("There is no die")
				
func _on_player_leveled_up():
	print("Garlic level up")
	garlic_level += 1
	garlic_damage += 1
	garlic_range += Vector2(.25, .25)
	garlic.scale = garlic_range
	
func _on_area_entered(area):
	enemy_hurtbox = area.get_parent().get_node("Hurtbox")
	enemy = area.get_parent()
