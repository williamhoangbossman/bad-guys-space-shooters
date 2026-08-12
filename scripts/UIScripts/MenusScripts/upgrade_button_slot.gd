extends Control

@export var upgradeID: String
@export var baseCost: int = 100
@export var costMultiplier: float = 1.2

@onready var buyButton = $upgradeButton
@onready var costLabel = $costLabel
@onready var levelLabel = $levelLabel

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
		
		#CHANGE HUD LIKE HP AND MONEY
