extends Node2D

var currentDifficulty: String = "Please Select!"
var gamePaused: bool = false

var gameDataStored: bool  = false

var currentScore: float = 0
var scoreMultiplier: float = 1

var healthLevel: int = 1
var damageLevel: int = 1
var bulletSpeedLevel: int = 1

var attackLevel: int = 1
var miscLevel: int = 1

const healthBaseCost: int = 100
const damageBaseCost: int = 100
const attackBaseCost: int = 100
const miscBaseCost: int = 100

const healthCostMult: float = 5
const damageCostMult: float = 1.175
const attackCostMult: float = 10
const MiscCostMult: float = 2.2

func getUpgradeCost(currentLevel: int, baseCost: int, multiplier: float) -> int:
	return int(baseCost * pow(multiplier, currentLevel - 1))
	
func buyHealthUpgrade() -> bool:
	var cost = getUpgradeCost(healthLevel)
	if EconomyManager.currentMoney >= cost:
		EconomyManager.currentMoney -= cost
		healthLevel += 1
		return true 
	return false	
	
func buyDamageUpgrade() -> bool:
	var cost = getUpgradeCost(damageLevel)
	if EconomyManager.currentMoney >= cost:
		EconomyManager.currentMoney -= cost
		damageLevel += 1
		return true 
	return false	

func buyAttackUpgrade() -> bool:
	var cost = getUpgradeCost(attackLevel)
	if EconomyManager.currentMoney >= cost:
		EconomyManager.currentMoney -= cost
		damageLevel += 1
		return true 
	return false	
	
func buyMiscUpgrade() -> bool:
	var cost = getUpgradeCost(miscLevel)
	if EconomyManager.currentMoney >= cost:
		EconomyManager.currentMoney -= cost
		damageLevel += 1
		return true 	
	return false	
	
func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass
