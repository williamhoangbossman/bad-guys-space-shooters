extends Resource
class_name DifficultyData

@export_category("Enemy Modifiers")

@export var difficulty_multiplier: float = 1.0
@export var enemy_move_speed: float = 250.0
@export var enemy_max_hp: int = 30
@export var bullet_freq_min: float = 1.0
@export var bullet_freq_max: float = 3.0

@export_category("Player Settings")
@export var player_max_lives: int = 3
@export var player_bullet_speed: float = 150.0

@export_category("Economy")
@export var money_multiplier: float = 1.0
