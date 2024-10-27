extends Control

@onready var current_player_lives = get_parent().current_player_lives

@onready var container = $LifeCounterHBox

@onready var life_image = preload("res://Scenes/UI/life_counter_pinball_image.tscn")

func _ready():
	lives_display()

#Changes display of lives UI to current lives
func lives_display():
	current_player_lives = get_parent().current_player_lives
	
	for lives in current_player_lives:
		var life_image_instance = life_image.instantiate()
		
		container.add_child(life_image_instance)

#Clears lives UI
func clear_children():
	for child in container.get_children():
		child.queue_free()

#Resets UI after clearing to current lives
func _on_deadzone_body_entered(body):
	clear_children()
	lives_display()
