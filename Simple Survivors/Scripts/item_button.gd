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
	label_text.text = ItemDictionary.items_in_dictionary[item]["displayname"]
	label_description.text = ItemDictionary.items_in_dictionary[item]["details"]
	label_level.text = ItemDictionary.items_in_dictionary[item]["level"]
	#item_icon.texture_normal = ItemDictionary.items_in_dictionary[item]["icon"]
	
func _on_pressed():
	clicked.emit(self)
