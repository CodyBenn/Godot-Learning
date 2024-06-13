extends CanvasLayer

@onready var console = $Debug/ConsoleLog

#@onready var title_screen = $TitleScreen
#@onready var pause_screen = $PauseScreen
#@onready var game_over_screen = $GameOverScreen

var current_screen = null

func _ready():
	console.visible = false
	
	#register_button()
	#change_screen(title_screen)

#func register_button():
	#var buttons = get_tree().get_nodes_in_group("buttons")
	#if buttons.size() >= 0:
		#for button in buttons:
			#if button is ScreenButton:
				#button.clicked.connect(_on_button_pressed)

#func _on_button_pressed(button):
	#match button.name:
		#"TitlePlay":
			#change_screen(pause_screen)
			#print("TitlePlay button is pressed")
		#"PauseRestart":
			#change_screen(game_over_screen)
			#print("PauseRestart button is pressed")
		#"PauseMenu":
			#print("PauseMenu button is pressed")
		#"PauseClose":
			#print("PauseClose button is pressed")
		#"GameOverMenu":
			#print("GameOverMenu button is pressed")
		#"GameOverRestart":
			#change_screen(title_screen)
			#print("GameOverRestart button is pressed")
	#print(button.name)

func _on_toggle_console_pressed():
	print("oof")
	console.visible = !console.visible

func change_screen(new_screen):
	if current_screen != null:
		current_screen.disappear()
	current_screen = new_screen
	if new_screen != null:
		current_screen.appear()

func _on_button_pressed():
	print("oof")
	console.visible = !console.visible

func _on_toggle_console_2_pressed():
	print("oof")
	console.visible = !console.visible
