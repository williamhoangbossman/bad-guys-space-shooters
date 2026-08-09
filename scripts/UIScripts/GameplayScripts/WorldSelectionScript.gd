extends CanvasLayer

@onready var worldSelectionIcon = $Control/WorldIcon
var HomeSelectionIcon = load("res://assets/UI/New Piskel-1.png (1).png")
var GolemLandSelectionIcon = load("res://assets/UI/pixil-frame-0 (17).png")

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
	SpawnWorld("Home", HomeSelectionIcon, "res://scenes/MainScenes/PlatformerWorld.tscn")
		
func _on_golem_land_button_pressed() -> void:
	SpawnWorld("GolemLand", GolemLandSelectionIcon, "res://scenes/MainScenes/Game.tscn")

func SpawnWorld(WorldName: String, SelectWorldIcon, ChangeScene) -> void:
	if not worldSelected == WorldName: pressed = false
	worldSelected = WorldName
	print("uh you selected" + worldSelected)
	
	worldSelectionIcon.texture = SelectWorldIcon
	
	if worldSelected == WorldName and pressed:
		UiManager.closeCurrentUI()
		
		get_tree().change_scene_to_file(ChangeScene) #REWORK NOW! IT'S KINDA TEDIOUS TO MAKE SCENE CHANGING, PROBABLY JUST BACKGROUND + ENEMY DATA CHANGE
		unselectWorld()

	if worldSelected == WorldName:
		pressed = true
