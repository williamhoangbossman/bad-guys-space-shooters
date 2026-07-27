extends CanvasLayer

@onready var titleLabel = $MainScreenUI/TitleContainer/TitleLabel
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
		print("sigmatron")
		get_tree().change_scene_to_file("res://scenes/MainScenes/Game.tscn")
	
func _on_quit_button_pressed() -> void:
	if (buttonfunction):
		get_tree().quit()
	
