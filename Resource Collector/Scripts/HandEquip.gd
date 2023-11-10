extends Node2D

@export var equippedItem : Resource

func _on_area_2d_body_entered(body):
#	if(body is ResourceNode):
#		body.harvest()
#		if equippedItem == correctEquip:
#			body.currentResourceAmount -= 1
