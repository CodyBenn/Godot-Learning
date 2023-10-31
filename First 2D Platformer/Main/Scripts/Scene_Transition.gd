extends Control

class_name SceneTransitions

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
		
func _on_end_flag_body_entered(body):
	if body.is_in_group("Player"):
		animation_player.queue("fade_out")

func _on_main_ready():
	animation_player.queue("fade_in")
