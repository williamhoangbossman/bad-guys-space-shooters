extends Resource
class_name DifficultyData

@export_category("Enemy Modifiers")

@export var difficultyMultiplier: float = 1.0
@export var enemyMoveSpeedMultiplier: float = 1
@export var enemyMaxHPMultiplier: int = 1
@export var bullet_freq_min: float = 1.0
@export var bullet_freq_max: float = 3.0

@export_category("Player Settings")
@export var player_max_lives: int = 3
@export var playerBulletSpeedMultiplier: float = 1

@export_category("Economy")
@export var money_multiplier: float = 1.0
