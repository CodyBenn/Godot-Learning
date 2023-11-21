extends HBoxContainer
class_name ResourceItemDisplay

@onready var texture_rect : TextureRect = $TextureRect
@onready var label : Label = $Label

var resource_type : ResourceItem

func update_count(count : int):
	label.text = str(count)
