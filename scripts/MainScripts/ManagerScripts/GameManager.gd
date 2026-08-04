extends Node2D

var currentDifficulty: String = "Please Select!"
var gamePaused: bool = false
#characterData
var characterHealth: float = 3
var characterBulletSpeed: float = 200
var playerBaseDamage: float = 1
var playerBulletCooldown: float = 0.4

var currentScore: float = 0
var scoreMultiplier: float = 1

var damageMultiplier: float = 1

#enemy data
var enemyMaxhealth: float = 30
var enemySpeed: float = 160

var enemyBulletSpeed: float = 4
var enemyBulletFrequencyMin = 0.05
var enemyBulletFrequencyMax = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
