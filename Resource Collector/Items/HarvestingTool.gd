extends EquippableItem
class_name HarvestTool

@export var effected_types : Array[ResourceNodeType]
@export var min_damage : int = 1
@export var max_damage : int = 1

func harvest (resource_node):
	pass

func interact_with_body(body):
	if(body is ResourceNode):
		print("HarvestingTool.gd ResourceNode has entered body")
		for type in effected_types:
			if(body.resourceType.has(type)):
				print("HarvestingTool.gd match found at type " + type.resource_name + " on " + body.name)
