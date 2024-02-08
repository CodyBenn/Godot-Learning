extends Area2D

@export_file("*.tscn") var next_scene

var entered = false

func _on_body_entered(body: PhysicsBody2D):
	entered = true
	
func _on_body_exited(body: PhysicsBody2D):
	entered = false
	
func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file(next_scene)
