extends Node2D

@export var currentDifficulty: String = "Please Select!"
@export var gamePaused: bool = false
@export var gameDataStored: bool  = false

var selectedWorldName: String = "GolemLand"
var currentEnemyStats: enemyStats
var currentBackgroundTexture: Texture2D

##player customization
var unlockedWeapons: Array[weaponData] = []
var currentWeapon: weaponData
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
	
func resetData() -> void:
	currentDifficulty = "Please Select!"
	gamePaused = false
	gameDataStored = false
	selectedWorldName = "GolemLand"
	currentScore = 0.0
	scoreMultiplier = 1.0
	
	EconomyManager.currentMoney = 0

	currentEnemyStats = null
	currentBackgroundTexture = null
	currentWeapon = null
	currentSkin = null
	

	unlockedWeapons.clear()
	unlockedSkins.clear()
	
	for key in upgradeLevels.keys():
		upgradeLevels[key] = 1


	var save_path = "user://savegame.json" 
	if FileAccess.file_exists(save_path):
		DirAccess.remove_absolute(save_path)
	
