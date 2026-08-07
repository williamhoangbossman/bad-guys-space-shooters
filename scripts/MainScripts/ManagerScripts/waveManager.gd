extends Node

@export var playerData: playerStats
@export var enemyData: enemyStats

@export var golemData: enemyStats
@export var eyeballMonsterData: enemyStats
@export var enemyScene: PackedScene

@export var easyPreset: DifficultyData
@export var normalPreset: DifficultyData
@export var hardPreset: DifficultyData

var difficultyMultiplier: float = 1

func _ready() -> void:
	print("Game Difficulty is " + GameManager.currentDifficulty)
	var currentConfig: DifficultyData = getCurrentDifficultyConfig()
	applyDifficulty(currentConfig)
	spawnEnemy()
	
func getCurrentDifficultyConfig() -> DifficultyData:
	match  GameManager.currentDifficulty:
		"Easy": return easyPreset
		"Hard": return hardPreset
		_: return normalPreset

func applyDifficulty(config: DifficultyData) -> void:
	EconomyManager.moneyMultiplier = config.money_multiplier
	
func startNextWave() -> void:
	spawnEnemy()

func spawnEnemy() -> void:
	var enemy = enemyScene.instantiate()
	add_child(enemy)
	
	enemy.setUp(golemData, difficultyMultiplier)
	
	
