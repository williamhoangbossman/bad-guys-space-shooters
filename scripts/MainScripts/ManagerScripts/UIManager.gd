extends Node

var dialogueScene = preload("res://scenes/UIScenes/dialogueBox.tscn")
var upgradeMenuScene = preload("res://scenes/UIScenes/upgrade_menu.tscn")
var worldSelectionScene = preload("res://scenes/UIScenes/worldSelection.tscn")
var deathScreenScene = preload("res://scenes/UIScenes/death_screen.tscn")
var generalMenuScene = preload("res://scenes/UIScenes/general_menu.tscn")
var aboutScreenScene = preload("res://scenes/UIScenes/about_menu.tscn")
var settingsMenuScene = preload("res://scenes/UIScenes/settings_menu.tscn")

var activeUI: CanvasLayer = null

func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass
	
func closeCurrentUI() -> void:
	if activeUI  and is_instance_valid(activeUI):
		activeUI.queue_free()
		activeUI = null
		
		get_tree().paused = false
		
func openDialogue(npcData: Dictionary) -> void:
	closeCurrentUI()
	
	var dialogueInstance = dialogueScene.instantiate()
	get_tree().current_scene.add_child(dialogueInstance)
	activeUI = dialogueInstance

	if dialogueInstance.has_method("setupDialogue"):
		dialogueInstance.setupDialogue(npcData)
	
func openUpgradeMenu() -> void: 
	closeCurrentUI()
	
	get_tree().paused = true
	var upgradeInstance = upgradeMenuScene.instantiate()
	get_tree().root.add_child(upgradeInstance)
	activeUI = upgradeInstance

func openWorldSelectionMenu() -> void:
	closeCurrentUI()
	
	get_tree().paused = true
	var worldMenuInstance = worldSelectionScene.instantiate()
	get_tree().root.add_child(worldMenuInstance)
	activeUI = worldMenuInstance
	
func openDeathScreen() -> void:
	closeCurrentUI()
	
	get_tree().paused = true
	var deathScreen = deathScreenScene.instantiate()
	get_tree().root.add_child(deathScreen)
	activeUI = deathScreen

func openGeneralMenu() -> void:
	closeCurrentUI()
	
	get_tree().paused = true
	var generalMenu = generalMenuScene.instantiate()
	get_tree().root.add_child(generalMenu)
	activeUI = generalMenu

func openAboutScreen() -> void:
	closeCurrentUI()
	
	get_tree().paused = true
	var aboutScreen = aboutScreenScene.instantiate()
	get_tree().root.add_child(aboutScreen)
	activeUI = aboutScreen
	print("YES FIGMA")
	
func openSettingsMenu() -> void:
	closeCurrentUI()
	
	get_tree().paused = true
	var settingsMenu = settingsMenuScene.instantiate()
	get_tree().root.add_child(settingsMenu)
	activeUI = settingsMenu
	
	print("IVE OPENED IT!")
	
