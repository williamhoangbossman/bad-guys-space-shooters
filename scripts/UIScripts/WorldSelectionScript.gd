extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


	#transitionAnimation.play("FadeIn")
	#await  get_tree().create_timer(0.75).timeout
	#get_tree().change_scene_to_file("res://scenes/MainScenes/PlatformerWorld.tscn")


func _on_return_button_pressed() -> void:
	print("YESYEYSYEYSYE")
	get_tree().paused = false
	UiManager.closeCurrentUI()
