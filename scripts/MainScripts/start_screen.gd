extends CanvasLayer

@onready var titleLabel = $UI/TitleContainer/TitleLabel

func _ready() -> void:
	titleLabel.pivot_offset = titleLabel.size / 2
	titleLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	titleLabel.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	var titleTimer = $TitleTimer
	titleTimer.start()
	
func _on_title_timer_timeout() -> void:
	titleGrowth()
	
func titleGrowth() -> void:
	var TweenCreate = create_tween()
	TweenCreate.tween_property(titleLabel, "scale", Vector2(1.2, 1.2), 0.7)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
	
func _on_start_button_pressed() -> void:
	print("sigmatron")
	get_tree().change_scene_to_file("res://scenes/MainScenes/Game.tscn")
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
