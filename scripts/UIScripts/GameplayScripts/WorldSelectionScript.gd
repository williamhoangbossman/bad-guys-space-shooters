
extends CanvasLayer

@onready var worldSelectionIcon = $Control/WorldIcon
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


@export var golemData: enemyStats
@export var eyeballMonsterData: enemyStats

var HomeSelectionIcon = load("res://assets/UI/New Piskel-1.png (1).png")
var GolemLandSelectionIcon = load("res://assets/UI/DescriptionIcons/Background1.png")
var eyebalLandSelectionIcon = load("res://assets/UI/DescriptionIcons/eyeballLandIcon.png")
var eyeballLandBG = load("res://assets/UI/DescriptionIcons/eyeballLandBG.png")

var worldSelected: String = ""
var pressed: bool = false

func playSound() -> void:
	audio_stream_player.pitch_scale = randf_range(0.5, 1.75)
	audio_stream_player.play()

func unselectWorld() -> void:
	worldSelected = ""
	pressed = false
	
func SpawnWorld(WorldName: String, icon: Texture2D, enemyData: enemyStats, bgTexture) -> void:
	if worldSelected != WorldName: 
		pressed = false
		
	worldSelected = WorldName
	worldSelectionIcon.texture = icon
	print("uh you selected" + worldSelected)
	
	if  pressed:
		print("GAYTOWN")
		GameManager.selectedWorldName = WorldName
		GameManager.currentEnemyStats = enemyData
		GameManager.currentBackgroundTexture = bgTexture
		
		var waveMGR = get_tree().current_scene.find_child("waveManager", true, false)
		if waveMGR:
			print("FOUND YOU!")
			waveMGR.loadSelectedWorld()
		else:
			print("UH WHERE")
			
		UiManager.closeCurrentUI()
		unselectWorld()
		return
		
	pressed = true
				

func _on_home_button_pressed() -> void:
	#worldSelectionIcon.texture = HomeSelectionIcon
#	if  worldSelected != "Home": 
	#	pressed = false
	#worldSelected = "home"
	
#	if pressed: 
	UiManager.closeCurrentUI()
	unselectWorld()
	get_tree().change_scene_to_file("res://scenes/MainScenes/PlatformerWorld.tscn")
		
#	pressed = true
	playSound()
		
func _on_golem_land_button_pressed() -> void:
	playSound()
	SpawnWorld("GolemLand", GolemLandSelectionIcon, golemData, GolemLandSelectionIcon)

func _on_eyeball_land_button_pressed() -> void:
	playSound()
	SpawnWorld("EyeballLand", eyebalLandSelectionIcon, eyeballMonsterData, eyeballLandBG)

func _on_return_button_pressed() -> void:
	playSound()
	print("YESSS")
	UiManager.closeCurrentUI()
	unselectWorld()
