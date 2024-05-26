extends TextureButton
class_name ItemButton

@onready var label_text = $LabelText
@onready var label_description = $LabelDescription
@onready var label_level = $LabelLevel
@onready var item_icon = self.texture_normal

var item = null

signal clicked(button)

func _ready():
	if item == null:
		item = "food"
		
	var item_data = ItemDictionary.items_in_dictionary[item]
	label_text.text = item_data["displayname"]
	label_description.text = item_data["details"]
	label_level.text = item_data["level"]
	
	# Ensure that `item_data["icon"]` is a Texture or load it if it's a path
	var icon_path = item_data["icon"]
	if typeof(icon_path) == TYPE_STRING:
		item_icon = load(icon_path)  # Load the texture resource from the path
	else:
		item_icon = icon_path  # Directly assign if it's already a texture
		
	self.texture_normal = item_icon
	
func _on_pressed():
	clicked.emit(self)
