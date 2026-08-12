extends CanvasLayer

@onready var generalMenu = $"."
@onready var settingsMenu = $SettingsMenu
@onready var aboutMenu = $aboutMenu

func _ready() -> void:
	print("gaga")
	
	
func _on_continue_button_pressed() -> void:
	#UiManager.closeCurrentUI() --> dont use!
	generalMenu.visible = false
	get_tree().paused = false


func _on_options_button_pressed() -> void:
	settingsMenu.visible = true

func _on_about_button_pressed() -> void:
	aboutMenu.visible = true

func _on_main_menu_button_pressed() -> void:
	var transition = $"../../../Transition"
	var transitionPlayer = $"../../../Transition/AnimationPlayer"

	transition.visible = true
	transitionPlayer.play("FadeIn")
	await get_tree().create_timer(0.75).timeout

	GameManager.gamePaused = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainScenes/StartScreen.tscn")
