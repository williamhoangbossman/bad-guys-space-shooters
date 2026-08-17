extends CanvasLayer

@onready var settingsMenu = $"."
@onready var audio_stream_player: AudioStreamPlayer = $Node/AudioStreamPlayer

func playSound() -> void:
	audio_stream_player.pitch_scale = randf_range(0.5, 1.75)
	audio_stream_player.play()

func _on_return_button_pressed() -> void:
	playSound()
	UiManager.closeCurrentUI()
	settingsMenu.visible = false
