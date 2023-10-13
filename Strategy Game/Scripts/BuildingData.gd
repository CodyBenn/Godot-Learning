var base = Building.new(0, preload("res://Assets/Base.png"), 0, 0, 0, 0)
var mine = Building.new(1, preload("res://Assets/Mine.png"), 2, 1, 4, 1)
var greenhouse = Building.new(2, preload("res://Assets/Greenhouse.png"), 1, 1, 0, 0)
var solarpanel = Building.new(3, preload("res://Assets/SolarPanel.png"), 4, 1, 0, 0)

class Building:
	
	#building type
	var type : int
	
	#building texture
	var iconTexture : Texture
	
	#resources the building produces
	var prodResource : int = 0
	var prodResourceAmount : int
	
	#resource the building needs to be maintained
	var upkeepResource : int = 0
	var upkeepResourceAmount : int
	
	func _init(type, iconTexture, prodResource, prodResourceAmount, upkeepResource, upkeepResourceAmount):
		
		self.type = type
		self.iconTexture = iconTexture
		self.prodResource = prodResource
		self.prodResourceAmount = prodResourceAmount
		self.upkeepResource = upkeepResource
		self.upkeepResourceAmount = upkeepResourceAmount
		
