extends CanvasLayer

@onready var transitionrect = $Transition
@onready var transition = $Transition/AnimationPlayer

@onready var difficultyMenu = $DifficultyMenu
@onready var difficultyLabel = $DifficultyMenu/DescrptionLabel
@onready var settingsMenu = $SettingsMenu2

@onready var leftCursor = $MainScreenUI/left_Cursor
@onready var rightCursor = $MainScreenUI/right_Cursor
@export var cursorOffset: float = 15

@onready var gameOptionsContainer = $MainScreenUI/gameOptionsContainer
@onready var playButton = $MainScreenUI/gameOptionsContainer/gameStartButton
@onready var settingsButton = $MainScreenUI/gameOptionsContainer/settingsButton
@onready var quitButton = $MainScreenUI/gameOptionsContainer/quitButton2

@onready var continueButton: TextureButton = $MainScreenUI/gameOptionsContainer/continueButton
@onready var newGameButton: TextureButton = $MainScreenUI/gameOptionsContainer/newGameButton


var pressed: bool = false
var buttonSelected = null

func unselectButton() -> void:
	pressed = false
	buttonSelected = null

func _ready() -> void:
	await get_tree().process_frame
	
	for child in gameOptionsContainer.get_children():
		if child is TextureButton:
			child.focus_entered.connect(func(): onButtonFocusEntered(child))
			
	giveOptionsUponDataStored()
	
	if GameManager.gameDataStored:
		continueButton.grab_focus()
	else:
		playButton.grab_focus()

	var titleTimer = $TitleTimer
	titleTimer.start()
	
func giveOptionsUponDataStored() -> void:
	var hasData = GameManager.gameDataStored
	continueButton.visible = hasData
	newGameButton.visible = hasData
	playButton.visible = !hasData
		
func onButtonFocusEntered(_button: TextureButton) -> void:
	var focusedNode = get_viewport().gui_get_focus_owner()
	
	if focusedNode is TextureButton:
		var buttonrect = focusedNode.get_global_rect()
		
		var leftsize = leftCursor.get_rect().size
		var rightsize = rightCursor.get_rect().size
	
		leftCursor.global_position = Vector2(
		buttonrect.position.x - leftsize.x - cursorOffset,
		buttonrect.get_center().y - (leftCursor.size.y / 2) + 15
		)
		rightCursor.global_position = Vector2(
		buttonrect.end.x + cursorOffset,
		buttonrect.get_center().y - (rightsize.y / 2)
		)
	
#func _on_title_timer_timeout() -> void: #title stuff
	#titleGrowth()
#	await get_tree().create_timer(1).timeout	
	#buttonfunction = true
	
#func titleGrowth() -> void: # title stuff again 
	#var TweenCreate = create_tween()
	#TweenCreate.tween_property(titleLabel, "scale", Vector2(1.4, 1.4), 0.75)\
	#	.set_trans(Tween.TRANS_SINE)\
	#	.set_ease(Tween.EASE_IN_OUT)
		
func _on_menu_back_button_pressed() -> void:
	transitionrect.visible = true
	transition.play("FadeIn")
	await get_tree().create_timer(0.75).timeout
	transition.play("FadeOut")
	difficultyMenu.visible = false
	await get_tree().create_timer(0.75).timeout
	transitionrect.visible = false
	
	
	playButton.grab_focus()
	
func _on_menu_create_button_pressed() -> void:
	if GameManager.currentDifficulty == "Please Select!":
		var WordSelector = randi_range(1, 5)
		match WordSelector: 
			1:
				difficultyLabel.text = "Select a difficulty, please."
			2:
				difficultyLabel.text = "I'm telling you to select a difficulty."
			3:
				difficultyLabel.text = "Just select a difficulty already."
			4:
				difficultyLabel.text = "Don't make me say it again."
			5:
				difficultyLabel.text = "."
	elif GameManager.currentDifficulty == "Easy":
		gameTransition()
		GameManager.gameDataStored = true
	elif GameManager.currentDifficulty == "Normal":
		gameTransition()
		GameManager.gameDataStored = true
	elif GameManager.currentDifficulty == "Hard":
		gameTransition()
		GameManager.gameDataStored = true

	return
	
func gameTransition() ->void: 
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
	Money Gain: 1.5x
	Enemy HealthPoints: 2x 
	
	Enemy Movement Speed will be increased 180%. 
	
	This gamemode is not recommended for regular gameplay. Various elements will be added
	to impede the player's progression. 
	Expect to have a BAD time.
	"
	GameManager.currentDifficulty = "Hard"
	
func _on_game_start_button_pressed() -> void:
	if GameManager.gameDataStored == true:
		transitionrect.visible = true
		print("sigmatron")
		transition.play("FadeIn")
		await get_tree().create_timer(0.75).timeout
		get_tree().change_scene_to_file("res://scenes/MainScenes/Game.tscn")
		return
		
	transitionrect.visible = true
	print("sigmatron")
	transition.play("FadeIn")
	await get_tree().create_timer(0.75).timeout
	transition.play("FadeOut")
	difficultyMenu.visible = true
	await get_tree().create_timer(0.75).timeout
	transitionrect.visible = false
		
func _on_quit_button_2_pressed() -> void:
	get_tree().quit()
	
func _on_settings_button_pressed() -> void:
	UiManager.openSettingsMenu()
		
func _on_return_button_pressed() -> void:
	settingsButton.grab_focus()

func _on_continue_button_pressed() -> void:
	_on_game_start_button_pressed()

func _on_new_game_button_pressed() -> void:
	UiManager.openPrecautionMenu()
