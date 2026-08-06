extends CanvasLayer


func _on_return_button_pressed() -> void:
	UiManager.closeCurrentUI()
	
	GameManager.currentLiveCount = GameManager.maxLiveCount
	
	get_tree().change_scene_to_file("res://scenes/MainScenes/StartScreen.tscn")
