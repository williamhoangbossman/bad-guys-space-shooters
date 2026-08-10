extends Node2D

var currentDifficulty: String = "Please Select!"
var gamePaused: bool = false

var gameDataStored: bool  = false

var currentScore: float = 0
var scoreMultiplier: float = 1

#enemy data
#var enemyMaxhealth: float = 30
#var enemySpeed: float = 160

##var enemyBulletSpeed: float = 4
#var enemyBulletFrequencyMin = 0.05
#var enemyBulletFrequencyMax = 4

var healthLevel: int = 1
var damageLevel: int = 1
var bulletSpeedLevel: int = 1

const baseCost: int = 100
const costMultiplier: float = 1.5

func getUpgradeCost(currentLevel: int) -> int:
	return int(baseCost * pow(costMultiplier, currentLevel - 1))
	
func buyHealthUpgrade() -> bool:
	var cost = getUpgradeCost(healthLevel)
	if EconomyManager.currentMoney >= cost:
		EconomyManager.currentMoney -= cost
		healthLevel += 1
		return true 
	return false	

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass
