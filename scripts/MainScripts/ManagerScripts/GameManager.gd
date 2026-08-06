extends Node2D

var currentDifficulty: String = "Please Select!"
var gamePaused: bool = false

var currentScore: float = 0
var scoreMultiplier: float = 1

#enemy data
var enemyMaxhealth: float = 30
var enemySpeed: float = 160

var enemyBulletSpeed: float = 4
var enemyBulletFrequencyMin = 0.05
var enemyBulletFrequencyMax = 4


func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass
