extends Node
class_name ItemManager

func ready():
	pass

var items = {
	"Garlic": Weapon.new("Garlic", 10, 10.0)
}

func get_item(name:String) -> Item:
	return items.get(name, null)
