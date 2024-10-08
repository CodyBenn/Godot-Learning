extends CanvasLayer

@onready var title_screen = $TitleScreen
#@onready var pause_screen = $PauseScreen
#@onready var game_over_screen = $GameOverScreen

var current_screen = null

func _ready():
	#console.visible = false
	
	register_buttons()
	#change_screen(title_screen)

func register_buttons():
	var buttons = get_tree().get_nodes_in_group("UIbuttons")
	if buttons.size() >= 0:
		for button in buttons:
			if button is ScreenButton:
				button.clicked.connect(_on_button_pressed)

func _on_button_pressed(button):
	match button.name:
		"TitlePlay":
			#change_screen(pause_screen)
			print("TitlePlay button is pressed")
		"TitleOptions":
			#change_screen(game_over_screen)
			print("TitleOptions button is pressed")
		"TitleExit":
			print("TitleExit button is pressed")
		#"GameOverMenu":
			#print("GameOverMenu button is pressed")
		#"GameOverRestart":
			#change_screen(title_screen)
			#print("GameOverRestart button is pressed")

func change_screen(new_screen):
	if current_screen != null:
		var disappear_tween = current_screen.disappear()
		await(disappear_tween.finished)
		current_screen.visible = false
	current_screen = new_screen
	if current_screen != null:
		var appear_tween = current_screen.appear()
		await(appear_tween.finished)
		get_tree().call_group("UIbuttons", "set_disabled", false)

#func _on_toggle_console_pressed():
	#console.visible = !console.visible
