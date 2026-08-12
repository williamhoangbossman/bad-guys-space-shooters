extends CanvasLayer

@onready var settingsMenu = $"."

func _on_return_button_pressed() -> void:
	UiManager.closeCurrentUI()
	settingsMenu.visible = false
