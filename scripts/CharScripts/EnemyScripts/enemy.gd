extends Area2D

@export var stats: enemyStats

@onready var enemyCharacter = $"."

@onready var shotTimer = $ShotTimer
@onready var rightRayCast = $RightRayCast
@onready var leftRayCast = $LeftRayCast
@onready var animatedSprite = $AnimatedSprite2D

const enemyBulletScene = preload("res://scenes/Misc/enemyBullet.tscn")
const damageIndicatorScene = preload("res://scenes/UIScenes/OnscreenElements/damage_indicator.tscn")

var direction: int # can choose pickrandom func if want
var moveSpeed: float

var maxHealthPoints: int
var currentHealth: int

var minFreq: float
var maxFreq: float
var bulletSpeed: float


var enemyData: enemyStats

func setUp(data: enemyStats, config: DifficultyData, waveHPMultiplier: float) -> void: 
	
	var baseHP = data.maxHealthPoints * config.enemyMaxHPMultiplier
	maxHealthPoints = int(baseHP * waveHPMultiplier)
	currentHealth = maxHealthPoints
	
	moveSpeed = data.moveSpeed * config.enemyMoveSpeedMultiplier
	bulletSpeed = data.BulletSpeed * config.enemyMoveSpeedMultiplier * 2.5 # CHANGE TO BULLETSPEED LATER
	minFreq = data.BulletFrequencyMin * config.bullet_freq_min
	maxFreq = data.BulletFrequencyMax * config.bullet_freq_max
	
	animatedSprite.sprite_frames = data.spriteFrames
	animatedSprite.play("default")
	
	direction = chooseDirection(-1, 1)

	enemyData = data
	print(maxHealthPoints)
	startShotTimer()
	
func spawnBullet(data: enemyStats) -> void:
	var enemyBullet = enemyBulletScene.instantiate()
	get_tree().current_scene.add_child(enemyBullet)
	
	enemyBullet.global_position.x = enemyCharacter.global_position.x
	enemyBullet.global_position.y = enemyCharacter.global_position.y 
	enemyBullet.setupBullet(bulletSpeed, data)

func startShotTimer() -> void:
	shotTimer.wait_time = randf_range(minFreq, maxFreq)
	shotTimer.start()

func _ready() -> void:
	pass
	
func take_damage(amount: int):
	spawnDamageIndicator(amount)
	currentHealth -= amount
	
	if currentHealth <= 0:
		die()

func die():
	EconomyManager.currentMoney += EconomyManager.waveMoneyMultiplier * EconomyManager.moneyMultiplier * 1
	GameManager.currentScore += 1 * GameManager.scoreMultiplier
	
	print(EconomyManager.moneyMultiplier)
	queue_free()

func _physics_process(delta: float) -> void:
	position.x += moveSpeed * direction * delta
	
	if rightRayCast.is_colliding() and direction == 1:
		direction = -1
	
	elif leftRayCast.is_colliding() and direction == -1:
		direction = 1
		
	if direction != 0:
		animatedSprite.flip_h = (direction > 0)
		
func spawnDamageIndicator(damageAmount: int) -> void:
	var damageIndicator = damageIndicatorScene.instantiate()
	get_tree().current_scene.add_child(damageIndicator)
	damageIndicator.setup(damageAmount, global_position)
		
func chooseDirection(firstValue: int, secondValue: int):
		var chosenvalue = firstValue if randf() < 0.5 else secondValue
		return chosenvalue

func _on_shot_timer_timeout() -> void:
	spawnBullet(enemyData)
	startShotTimer()
