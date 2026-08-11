extends CanvasLayer

var worldSelected = null
var pressed: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func unselectWorld() -> void:
	worldSelected = null
	pressed = false
	
	#transitionAnimation.play("FadeIn")
	#await  get_tree().create_timer(0.75).timeout
	#get_tree().change_scene_to_file("res://scenes/MainScenes/PlatformerWorld.tscn")


func _on_return_button_pressed() -> void:
	print("YESYEYSYEYSYE")
	UiManager.closeCurrentUI()
	
	unselectWorld()

func _on_home_button_pressed() -> void:
	worldSelected = "Home"
	print("The world you have selected is" + worldSelected)
	
	if worldSelected and pressed:
		UiManager.closeCurrentUI()
		
		get_tree().change_scene_to_file("res://scenes/MainScenes/PlatformerWorld.tscn")
		unselectWorld()
		
	if worldSelected == "Home":
		pressed = true
		
		
func _on_golem_land_button_pressed() -> void:
	if pressed: pressed = false
	worldSelected = "GolemLand" 
	
	if worldSelected and pressed:
		UiManager.closeCurrentUI()
		
		get_tree().change_scene_to_file("res://scenes/MainScenes/Game.tscn")
	
	
