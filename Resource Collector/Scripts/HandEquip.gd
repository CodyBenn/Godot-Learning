extends Sprite2D

@export var equippedItem : Resource
var correctEquip
var pickaxe
var woodAxe
var waterCan
var hoe

func _on_area_2d_body_entered(body):
	if(body is ResourceNode):
		body.harvest()
		if equippedItem == correctEquip:
			body.currentResourceAmount -= 1
