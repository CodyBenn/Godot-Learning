extends Area2D

var chain_lightning_hp:int

# Called when the node enters the scene tree for the first time.
func _ready():
	chain_lightning_hp = get_parent().chain_lightning_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func chain_lightning_health():
	chain_lightning_hp -= 1
	if chain_lightning_hp == 0:
		self.queue_free()
	else:
		print("error")

func _on_life_timer_timeout():
	queue_free()
