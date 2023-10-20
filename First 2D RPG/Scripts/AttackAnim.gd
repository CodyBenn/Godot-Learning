extends Node2D

func attack_anim():
	var effect = preload("AttackAnim.tscn")
	$AnimatedSprite2D.play("punch")
