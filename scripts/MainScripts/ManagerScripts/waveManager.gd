extends Node

@export var player : CharacterBody2D
@export var HUD: CanvasLayer

@export var golemData: enemyStats
@export var eyeballMonsterData: enemyStats
@export var enemyScene: PackedScene

@export var easyPreset: DifficultyData
@export var normalPreset: DifficultyData
@export var hardPreset: DifficultyData

var currentWave: int = 1
var livingEnemiesCount: int = 1

var currentConfig: DifficultyData
#var startPosition = Vector2(450, 150)

var difficultyMultiplier: float = 1

func _ready() -> void:
	print("Game Difficulty is " + GameManager.currentDifficulty)
	currentConfig = getCurrentDifficultyConfig()
	applyDifficulty(currentConfig)
	spawnEnemy()
	HUD.setupHUD(currentConfig)
	
	if player != null:
		player.setupDifficulty(currentConfig)

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
	enemy.position = Vector2(randf_range(250, 700), 150)
	add_child(enemy)
	
	enemy.tree_exited.connect(onEnemyDied)
	var waveHPMultipler: float = 1.0 + ((currentWave - 1) * 0.2)
	
	enemy.setUp(golemData, currentConfig, waveHPMultipler)
	
func onEnemyDied() -> void:
	livingEnemiesCount -= 1
	if livingEnemiesCount <=0:
		onWaveCleared()
	
func onWaveCleared() -> void:
	if not is_inside_tree():
		return
	currentWave += 1
	get_tree().create_timer(2).timeout.connect(startNextWave)
	
