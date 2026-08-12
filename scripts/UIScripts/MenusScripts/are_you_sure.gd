extends CanvasLayer


func _on_no_button_pressed() -> void:
	print("YES")
	UiManager.closeCurrentUI()


func _on_yes_button_pressed() -> void:
	GameManager.resetData()
	UiManager.closeCurrentUI()
