extends Control

@export var upgradeID: String
@export var baseCost: int = 40
@export var costMultiplier: float = 1.35

@onready var buyButton = $upgradeButton
@onready var costLabel = $costLabel
@onready var levelLabel = $levelLabel

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var no_money_: AudioStreamPlayer = $"AudioStreamPlayer/NoMoney?"

func playSound() -> void:
	audio_stream_player.pitch_scale = randf_range(0.5, 1.75)
	audio_stream_player.play()

func _ready() -> void:
	var currentLevel = GameManager.getUpgradeLevel(upgradeID)
	var cost = GameManager.getUpgradeCost(currentLevel, baseCost, costMultiplier)
	
	costLabel.text = "Cost: " + str(cost)
	levelLabel.text = "Level: " + str(currentLevel)

func updateDisplay() -> void:
	var currentLevel = GameManager.getUpgradeLevel(upgradeID)
	var cost = GameManager.getUpgradeCost(currentLevel, baseCost, costMultiplier)
	
	costLabel.text = "Cost: " + str(cost)
	levelLabel.text = "Level: " + str(currentLevel)
	
	
func _on_upgrade_button_pressed() -> void:
	if GameManager.buyGenericUpgrade(upgradeID, baseCost, costMultiplier):
		updateDisplay()
		playSound()
	else:
		no_money_.play()
		
