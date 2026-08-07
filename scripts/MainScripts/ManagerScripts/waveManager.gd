extends Node

@export var golemData: enemyStats
@export var eyeballMonsterData: enemyStats
@export var enemyScene: PackedScene

@export var easyPreset: DifficultyData
@export var normalPreset: DifficultyData
@export var hardPreset: DifficultyData

var currentConfig: DifficultyData

var difficultyMultiplier: float = 1

func _ready() -> void:
	print("Game Difficulty is " + GameManager.currentDifficulty)
	currentConfig = getCurrentDifficultyConfig()
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
	#if currentConfig == null:
		#currentConfig = getCurrentDifficultyConfig()
	
	var enemy = enemyScene.instantiate()
	enemy.position = Vector2(450, 150)
	add_child(enemy)
	
	enemy.setUp(golemData, currentConfig)
	
	
