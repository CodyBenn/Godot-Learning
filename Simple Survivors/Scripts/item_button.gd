extends Button
class_name ItemButton

@onready var label_text = $ItemButtonLabelText
@onready var label_level = $ItemButtonLabelLevel
@onready var label_description = $ItemButtonLabelDescription
@onready var item_icon = $ItemButtonColorRect/ItemButtonTexture

var item = null

signal clicked(button)

func _ready():
	if item == null:
		item = "food"
		
	var item_data = ItemDictionary.items_in_dictionary[item]
	label_text.text = item_data["displayname"]
	label_level.text = item_data["level"]
	label_description.text = item_data["details"]
	
	# Load the texture resource from the path
	var icon_path = item_data["icon"]
	var icon_texture = load(icon_path)
	
	if icon_texture:
		item_icon.texture = icon_texture
		
func _on_pressed():
	clicked.emit(self)
