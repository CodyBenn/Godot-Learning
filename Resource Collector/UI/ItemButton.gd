@tool
extends Button

@export var item : Item :
	set(item_to_slot):
		item = item_to_slot
		icon = item.texture
		
