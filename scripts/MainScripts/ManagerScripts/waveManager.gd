extends Node

@onready var bgSprite = $"../Background1"

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

@export var currentConfig: DifficultyData
#var startPosition = Vector2(450, 150)

var difficultyMultiplier: float = 1

func _ready() -> void:
	loadSelectedWorld()
	print("Game Difficulty is " + GameManager.currentDifficulty)
	currentConfig = getCurrentDifficultyConfig()
	applyDifficulty(currentConfig)
	
	HUD.setupHUD(currentConfig)
	
	if player != null:
		player.setupDifficulty(currentConfig)
		
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

func loadSelectedWorld() -> void:
	if GameManager.currentBackgroundTexture != null and bgSprite != null:
		bgSprite.texture = GameManager.currentBackgroundTexture

	currentWave = 1
	livingEnemiesCount = 1
	
	for child in get_children():
		if child.is_in_group("enemy"):
			child.queue_free()
	
func spawnEnemy() -> void:
	var enemy = enemyScene.instantiate()
	enemy.position = Vector2(randf_range(250, 700), 150)
	add_child(enemy)
	
	enemy.tree_exited.connect(onEnemyDied)
	var waveHPMultipler: float = 1.0 + ((currentWave - 1) * 0.2)
	
	var activeEnemyData = GameManager.currentEnemyStats if GameManager.currentEnemyStats != null else golemData
	
	enemy.setUp(activeEnemyData, currentConfig, waveHPMultipler)
	
func onEnemyDied() -> void:
	livingEnemiesCount -= 1
	if livingEnemiesCount <=0:
		onWaveCleared()
	
func onWaveCleared() -> void:
	if not is_inside_tree():
		return
	currentWave += 1
	get_tree().create_timer(2).timeout.connect(startNextWave)
	
