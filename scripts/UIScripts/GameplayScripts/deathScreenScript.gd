extends CanvasLayer

@onready var returnButton: TextureButton = $Control/ReturnButton
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	returnButton.grab_focus()
	audio_stream_player.play()

func _on_return_button_pressed() -> void:
	UiManager.closeCurrentUI()
	get_tree().change_scene_to_file("res://scenes/MainScenes/StartScreen.tscn")
