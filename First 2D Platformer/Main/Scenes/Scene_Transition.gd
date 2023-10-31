extends Control

class_name Scene_Transition

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tex.visible = false
	
func set_next_animation(fading_out : bool): 
	if(fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")
		
