extends CanvasLayer

@onready var console = $Debug/ConsoleLog

func _ready():
	console.visible = false
	
func _process(_delta):
	pass

func _on_toggle_console_pressed():
	console.visible = !console.visible
	#Same line of code as above, done worse
	#if console.visible == false:
		#console.visible = true
		#print("Console is turned on")
	#else:
		#console.visible = false
		#print("Console is turned off")
