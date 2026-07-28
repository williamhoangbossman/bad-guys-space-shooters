extends Node2D

@onready var transitionRect = $Transition
@onready var transitionAnimation = $Transition/AnimationPlayer

func _ready() -> void:
	print("Game Difficulty is " + GameManager.currentDifficulty)
	
	transitionRect.visible = true
	transitionAnimation.play("FadeOut")
	await get_tree().create_timer(0.75).timeout
	transitionRect.visible = false
	
	match  GameManager.currentDifficulty:
		"Easy":
			easy_mode_setup()
		"Normal":
			normal_mode_setup()
		"Hard":
			hard_mode_setup()

func easy_mode_setup() -> void:
	pass

func normal_mode_setup() -> void:
	pass
	
func hard_mode_setup() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
	


func _on_button_pressed() -> void:
	print("PLEASE I WANT TO GO BACK")
