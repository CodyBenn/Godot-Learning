extends Area2D

@onready var player = get_parent().get_parent()
@onready var garlic_scene:PackedScene = preload("res://Scenes/Items/garlic.tscn")
@onready var garlic = self
var garlic_level:int = 1
var garlic_damage:int = 1
var garlic_range:Vector2

func _ready():
	garlic_range = garlic.scale
	print(garlic_range)
	if player and player.has_signal("player_leveled_up"):
		player.connect("player_leveled_up", _on_player_leveled_up)
	
func _on_player_leveled_up():
	print("Garlic level up")
	garlic_level += 1
	garlic_damage += 1
	garlic_range += Vector2(.25, .25)
	garlic.scale = garlic_range
