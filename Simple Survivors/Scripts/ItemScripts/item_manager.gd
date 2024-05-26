extends Node2D
class_name ItemManager

@export var garlic:PackedScene = preload("res://Scenes/Items/garlic.tscn")

func _ready():
	var garlic_instance = garlic.instantiate()
	add_child(garlic_instance)
	
