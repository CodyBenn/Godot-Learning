extends TextureButton
class_name ItemButton

@onready var label_text = $LabelText
@onready var label_description = $LabelDescription
@onready var label_level = $LabelLevel
@onready var item_icon = self.texture_normal

var item = null

signal clicked(button)

func _ready():
	randomize()
	
	if item == null:
		item = ItemDictionary.get_random_item()
		
	update_item_display(item)
	
func _on_pressed():
	clicked.emit(self)
	item = ItemDictionary.get_random_item()
	if item != "":
			update_item_display(item)
	else:
		label_text.text = "No more items available"
		label_description.text = ""
		label_level.text = ""
	
func update_item_display(item_name):
	var item_data = ItemDictionary.get_item_data(item_name)
	if item_data and item_data.size() > 0:
		label_text.text = item_data["displayname"]
		label_description.text = item_data["details"]
		label_level.text = item_data["level"]
		
		var icon_path = item_data["icon"]
		if typeof(icon_path) == TYPE_STRING:
			item_icon = load(icon_path)
		else:
			item_icon = icon_path
			
		self.texture_normal = item_icon
