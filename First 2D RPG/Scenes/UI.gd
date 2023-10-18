extends Control

@onready var levelText : Label = $BG/LevelBG/LevelText
@onready var healthBar : TextureProgressBar = $BG/HpBar
@onready var xpBar : TextureProgressBar = $BG/XpBar
@onready var goldText : Label = $BG/GoldText

func update_level_text(level):
	levelText.text = str(level)
	
func update_health_text(curHp, maxHp):
	healthBar.value = (100 / maxHp) * curHp
	
func update_xp_text(curXp, xpToNextLevel):
	xpBar.value = (100 / xpToNextLevel) * curXp
	
func update_gold_text(gold):
	goldText.text = "Gold : " + str(gold)
