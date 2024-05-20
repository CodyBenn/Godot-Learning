extends TextureButton
class_name ItemButton

signal clicked(button)

func _on_pressed():
	clicked.emit(self)
