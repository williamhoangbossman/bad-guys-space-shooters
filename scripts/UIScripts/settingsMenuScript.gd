extends CanvasLayer

@onready var settingsMenu = $"."

func _on_return_button_pressed() -> void:
	settingsMenu.visible = false
