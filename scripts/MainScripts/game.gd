extends Node2D

@onready var transitionRect = $UI/Animation/Transition
@onready var transitionAnimation = $UI/Animation/Transition/AnimationPlayer
@onready var pauseButton = $UI/menuUI/backButton

func _ready() -> void:
	print("Game Difficulty is " + GameManager.currentDifficulty)
	
	transitionRect.visible = true
	transitionAnimation.play("FadeOut")
	
	match  GameManager.currentDifficulty:
		"Easy":
			easy_mode_setup()
		"Normal":
			normal_mode_setup()
		"Hard":
			hard_mode_setup()
			

func easy_mode_setup() -> void:
	GameManager.enemySpeed = 200
	GameManager.enemyMaxhealth = 1
	GameManager.enemyBulletFrequencyMin = 1
	GameManager.enemyBulletFrequencyMax = 5
	
	GameManager.maxLiveCount = 5
	GameManager.currentLiveCount = 5
	
	GameManager.characterBulletSpeed =  150
	EconomyManager.moneyMultiplier = 5

func normal_mode_setup() -> void:
	GameManager.enemySpeed = 250
	GameManager.enemyMaxhealth = 60
	GameManager.enemyBulletFrequencyMin = 1
	GameManager.enemyBulletFrequencyMax = 3
	
	GameManager.maxLiveCount = 3
	GameManager.currentLiveCount = 3
	
	GameManager.characterBulletSpeed = 150
	EconomyManager.moneyMultiplier = 1
	
	
func hard_mode_setup() -> void:
	GameManager.enemySpeed = 1200
	GameManager.enemyMaxhealth = 60
	GameManager.enemyBulletFrequencyMin = 0.04
	GameManager.enemyBulletFrequencyMax = 0.4
	
	GameManager.maxLiveCount = 2
	GameManager.currentLiveCount = 2
	
	GameManager.characterBulletSpeed = 250
	EconomyManager.moneyMultiplier = 0.8
	
	
	
func _process(delta: float) -> void:
	if (GameManager.gamePaused == true): #stop the pausebutton from work + hud invis
		pauseButton.disabled = true
		
		
	if  GameManager.gamePaused == false: #make them norm
		pauseButton.disabled = false

func _on_back_button_pressed() -> void:
	UiManager.openGeneralMenu()

	
	print("PLEASE I WANT TO GO BACK")
	

func _on_home_button_pressed() -> void:
	UiManager.openWorldSelectionMenu()
