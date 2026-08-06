extends CanvasLayer

@onready var generalMenu = $"."
@onready var settingsMenu = $SettingsMenu
@onready var aboutMenu = $aboutMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_continue_button_pressed() -> void:
	UiManager.closeCurrentUI()
	
#	Signals.emit_signal("game_continue")
	
func _on_options_button_pressed() -> void:
	UiManager.openSettingsMenu()

func _on_about_button_pressed() -> void:
	UiManager.openAboutScreen()


func _on_main_menu_button_pressed() -> void:
	var transition = $Transition
	var transitionPlayer = $Transition/AnimationPlayer
	
	transition.visible = true
	transitionPlayer.play("FadeIn")
	await get_tree().create_timer(0.75).timeout
	
	GameManager.gamePaused = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainScenes/StartScreen.tscn")
