extends Node2D

@export var playerData: playerStats
@export var enemyData: enemyStats

@onready var transitionRect = $UI/Animation/Transition
@onready var transitionAnimation = $UI/Animation/Transition/AnimationPlayer
@onready var pauseButton = $UI/menuUI/backButton
@onready var generalMenu = $UI/menuUI/generalMenu

var enemyScene = preload("res://scenes/CharacterScenes/enemy.tscn")

func _ready() -> void:
		
	transitionRect.visible = true
	transitionAnimation.play("FadeOut")


func _process(delta: float) -> void:
	if (GameManager.gamePaused == true): #stop the pausebutton from work + hud invis
		pauseButton.disabled = true
		
	if  GameManager.gamePaused == false: #make them norm
		pauseButton.disabled = false

func _on_back_button_pressed() -> void: # dont use the UImanager for this!
	generalMenu.visible = true
	get_tree().paused = true
	
	print("HELPPPP")
	

func _on_home_button_pressed() -> void:
	UiManager.openWorldSelectionMenu()
