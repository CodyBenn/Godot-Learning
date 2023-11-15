@tool
extends Sprite2D

@export var equipped_item : EquippableItem :
	set(next_equipped):
		equipped_item = next_equipped
		self.texture = equipped_item.texture
		
@export var sprite_2d : Sprite2D

func _on_area_2d_body_entered(body):
	if(equipped_item.has_method("interact_with_body")):
		equipped_item.interact_with_body(body)
		print("HandEquip.gd interact_with_body(body) has occured")
