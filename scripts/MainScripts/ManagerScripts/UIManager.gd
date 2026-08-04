extends Node

var dialogueScene = preload("res://scenes/UIScenes/dialogueBox.tscn")
var upgradeMenuScene = preload("res://scenes/UIScenes/upgrade_menu.tscn")
var worldSelectionScene = preload("res://scenes/UIScenes/worldSelection.tscn")

var activeUI: CanvasLayer = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func closeCurrentUI() -> void:
	if activeUI  and is_instance_valid(activeUI):
		activeUI.queue_free()
		activeUI = null
		
func openDialogue(npcData: Dictionary) -> void:
	closeCurrentUI()
	
	var dialogueInstance = dialogueScene.instantiate()
	get_tree().current_scene.add_child(dialogueInstance)
	activeUI = dialogueInstance

	if dialogueInstance.has_method("setupDialogue"):
		print("I AM GAY TOO")
		dialogueInstance.setupDialogue(npcData)
	
func openUpgradeMenu() -> void: 
	closeCurrentUI()
	
	var upgradeInstance = upgradeMenuScene.instantiate()
	get_tree().root.add_child(upgradeInstance)
	activeUI = upgradeInstance

func openWorldSelectionMenu() -> void:
	closeCurrentUI()
	
	var worldMenuInstance = worldSelectionScene.instantiate()
	get_tree().root.add_child(worldMenuInstance)
	activeUI = worldMenuInstance
	
