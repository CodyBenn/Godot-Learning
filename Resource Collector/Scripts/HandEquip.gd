@tool
extends Sprite2D

@export var equippedItem : EquippableItem :
	set(nextEquipped):
		equippedItem = nextEquipped
		self.texture = equippedItem.texture
		sprite_2d.texture = nextEquipped.texture
		
		
@export var sprite_2d : Sprite2D

func _on_area_2d_body_entered(body):
	if(body is ResourceNode):
		body.harvest()
