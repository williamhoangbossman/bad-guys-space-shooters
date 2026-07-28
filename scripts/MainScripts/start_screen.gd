extends CanvasLayer

@onready var transitionrect = $Transition
@onready var transition = $Transition/AnimationPlayer

@onready var titleLabel = $MainScreenUI/TitleContainer/TitleLabel
@onready var difficultyMenu = $DifficultyMenu
@onready var difficultyLabel = $DifficultyMenu/DescrptionLabel

@export var Difficulty = 0
var buttonfunction = false

func _ready() -> void:
	titleLabel.pivot_offset = titleLabel.size / 2
	titleLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	titleLabel.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	var titleTimer = $TitleTimer
	titleTimer.start()
	
func _on_title_timer_timeout() -> void:
	titleGrowth()
	
	await get_tree().create_timer(1).timeout	
	buttonfunction = true
	
func titleGrowth() -> void:
	var TweenCreate = create_tween()
	TweenCreate.tween_property(titleLabel, "scale", Vector2(1.2, 1.2), 0.7)\
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
	difficultyLabel.text = "This is EASY mode. 
	Money Gain: 1.5x -- 150% more money.
	Enemy HealthPoints: 0.75x -- enemies have 75% of the health they normally would have. 
	
	Enemy Movement Speed will be lowered
	Expect to have a rather calming experience!
	"
	GameManager.currentDifficulty = "Easy"
	
func _on_normal_mode_button_pressed():
	difficultyLabel.text = "This is NORMAL mode. 
	Money Gain: 1x -- money gain is not increased nor decreased. 
	Enemy HealthPoints: 1x -- enemies have the normal amount of health.
	
	Enemy Movement Speed will be NORMAL. 
	Expect to have neither a calming nor stressful experience!
	"
	GameManager.currentDifficulty = "Normal"	

func _on_hard_mode_button_pressed():
	difficultyLabel.text = "This is HARD mode. 
	Money Gain: 0.8x -- money gain is decreased. 
	Enemy HealthPoints: 2x -- enemies have double amount of health.
	
	Enemy Movement Speed will be increased 140%. 
	
	This gamemode is not recommended for regular gameplay. Various elements will be added
	to impede the player's progression. 
	Expect to have a BAD time.
	"
	GameManager.currentDifficulty = "Hard"
	
	
