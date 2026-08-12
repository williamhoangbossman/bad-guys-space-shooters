extends CanvasLayer


func _on_no_button_pressed() -> void:
	print("YES")
	UiManager.closeCurrentUI()
	visible = false


func _on_yes_button_pressed() -> void:
	GameManager.resetData()
	UiManager.closeCurrentUI()
	visible = false
