extends CanvasLayer
class_name ItemSelector

@onready var item_select_screen = $"."

func _ready():
	item_select_screen.visible = false
