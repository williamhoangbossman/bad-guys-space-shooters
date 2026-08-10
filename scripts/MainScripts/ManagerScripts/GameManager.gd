extends Node2D

@export var currentDifficulty: String = "Please Select!"
@export var gamePaused: bool = false
@export var gameDataStored: bool  = false

##player weapons/attacks
var unlockedWeapons: Array[weaponData] = []
var currentWeapon: weaponData
##player skins 
var unlockedSkins: Array[Texture2D] = []
var currentSkin: Texture2D
##score
var currentScore: float = 0
var scoreMultiplier: float = 1
##upgrade data
var upgradeLevels: Dictionary = {
	"health": 1,
	"damage": 1,
	"attack": 1,
	"misc": 1,
	"speed": 1,
	"critChance": 1
}

func equipSkin(skinTexture: Texture2D) -> void:
	currentSkin = skinTexture

func getUpgradeCost(currentLevel: int, baseCost: int, multiplier: float) -> int:
	return int(baseCost * pow(multiplier, currentLevel - 1))

func getUpgradeLevel(type: String) -> int:
	return upgradeLevels.get(type, 1)

func buyGenericUpgrade(type: String, baseCost: int, multiplier: float) -> bool:
	var currentLevel = getUpgradeLevel(type)
	var cost = getUpgradeCost(currentLevel, baseCost, multiplier)
	
	if EconomyManager.currentMoney >= cost:
		EconomyManager.currentMoney -= cost
		upgradeLevels[type] = currentLevel + 1
		return true
	return false
	
