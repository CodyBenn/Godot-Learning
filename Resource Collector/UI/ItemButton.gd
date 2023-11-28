@tool
extends Button
class_name ItemButton

@export var item : Item :
	set(item_to_slot):
		item = item_to_slot
		icon = item.texture
		
var hand_equip : HandEquip

func _ready():
	connect("pressed", _on_pressed)

func _on_pressed():
	if(item is EquipableItem):
		if(hand_equip != null):
			hand_equip.equipped_item = item
