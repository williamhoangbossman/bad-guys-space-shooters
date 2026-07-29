extends Node2D

@onready var transitionRect = $UI/Animation/Transition
@onready var transitionAnimation = $UI/Animation/Transition/AnimationPlayer
@onready var generalMenu = $UI/menuUI/generalMenu
@onready var enemyCharacter =  $Enemy
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
	enemyCharacter.speed = 7.5
	enemyCharacter.maxHealth = 25

func normal_mode_setup() -> void:
	enemyCharacter.speed = 10
	enemyCharacter.maxHealth = 30
	
func hard_mode_setup() -> void:
	enemyCharacter.speed = 50
	enemyCharacter.maxHealth = 60

func _process(delta: float) -> void:
	if (GameManager.gamePaused == true): #stop the pausebutton from work + hud invis
		pauseButton.disabled = true
		
	if  GameManager.gamePaused == false: #make them norm
		pauseButton.disabled = false


func _on_back_button_pressed() -> void:
	#Signals.emit_signal("game_back")
	generalMenu.visible = true
	GameManager.gamePaused = true
	get_tree().paused = true

	pauseButton.disabled = false
	print("PLEASE I WANT TO GO BACK")
	

func _on_home_button_pressed() -> void:
	transitionAnimation.play("FadeIn")
	await  get_tree().create_timer(0.75).timeout
	get_tree().change_scene_to_file("res://scenes/MainScenes/PlatformerWorld.tscn")
