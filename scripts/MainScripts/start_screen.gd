extends CanvasLayer

@onready var transitionrect = $Transition
@onready var transition = $Transition/AnimationPlayer

@onready var titleLabel = $MainScreenUI/TitleContainer/gameTitle
@onready var difficultyMenu = $DifficultyMenu
@onready var difficultyLabel = $DifficultyMenu/DescrptionLabel
@onready var settingsMenu = $SettingsMenu2

@onready var slideanimation = $MainScreenUI/gameOptionsContainer/AnimationPlayer

var buttonfunction = false

func _ready() -> void:
	titleLabel.pivot_offset = titleLabel.size / 2
	titleLabel.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
	
	
	var titleTimer = $TitleTimer
	titleTimer.start()
	slideanimation.play("SlideDown")
	
	
func _on_title_timer_timeout() -> void:
	titleGrowth()
	
	
	await get_tree().create_timer(1).timeout	
	buttonfunction = true
	
func titleGrowth() -> void:
	var TweenCreate = create_tween()
	TweenCreate.tween_property(titleLabel, "scale", Vector2(1.4, 1.4), 0.75)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
	
		
func _on_start_button_pressed() -> void:
	if (buttonfunction):
		transitionrect.visible = true
		print("sigmatron")
		transition.play("FadeIn")
		await get_tree().create_timer(0.75).timeout
		transition.play("FadeOut")
		difficultyMenu.visible = true
		await get_tree().create_timer(0.75).timeout
		transitionrect.visible = false
		
func _on_quit_button_pressed() -> void:
	if (buttonfunction):
		get_tree().quit()
		
func _on_menu_back_button_pressed() -> void:
	transitionrect.visible = true
	transition.play("FadeIn")
	await get_tree().create_timer(0.75).timeout
	transition.play("FadeOut")
	await get_tree().create_timer(0.75).timeout
	transitionrect.visible = false
	difficultyMenu.visible = false
	
func _on_menu_create_button_pressed() -> void:
	transitionrect.visible = true
	transition.play("FadeIn")
	await get_tree().create_timer(0.75).timeout
	transitionrect.visible = false
	get_tree().change_scene_to_file("res://scenes/MainScenes/Game.tscn")
	

func _on_easy_mode_button_pressed() -> void:
	difficultyLabel.text = "You are currently in EASY mode. 
	Money Gain: 1.5x 
	Enemy HealthPoints: 0.75x  
	
	Enemy Movement Speed will be lowered
	Expect to have a rather calming experience!
	"
	GameManager.currentDifficulty = "Easy"
	
func _on_normal_mode_button_pressed():
	difficultyLabel.text = "You are currently in NORMAL mode. 
	Money Gain: 1x 
	Enemy HealthPoints: 1x 
	
	Enemy Movement Speed will be NORMAL. 
	Expect to have neither a calming nor stressful experience!
	"
	GameManager.currentDifficulty = "Normal"	

func _on_hard_mode_button_pressed():
	difficultyLabel.text = "You are currently in HARD mode. 
	Money Gain: 0.8x
	Enemy HealthPoints: 2x 
	
	Enemy Movement Speed will be increased 140%. 
	
	This gamemode is not recommended for regular gameplay. Various elements will be added
	to impede the player's progression. 
	Expect to have a BAD time.
	"
	GameManager.currentDifficulty = "Hard"
	
	
func _on_settings_button_pressed() -> void:
	settingsMenu.visible = true
