extends Area2D

@export var stats: enemyStats

@onready var enemyCharacter = $"."

@onready var shootTimer = $shootTimer
@onready var rightRayCast = $RightRayCast
@onready var leftRayCast = $LeftRayCast
@onready var animatedSprite = $AnimatedSprite2D

const enemyBulletPreload = preload("res://scenes/Misc/enemyBullet.tscn")
const damageIndicatorScene = preload("res://scenes/UIScenes/OnscreenElements/damage_indicator.tscn")

var direction: int # can choose pickrandom func if want
var moveSpeed: float

var maxHealthPoints: int
var currentHealth: int


func setUp(data: enemyStats, config: DifficultyData, waveHPMultiplier: float) -> void: 
	var baseHP = data.maxHealthPoints * config.enemyMaxHPMultiplier
	maxHealthPoints = int(baseHP * waveHPMultiplier)
	currentHealth = maxHealthPoints
	
	moveSpeed = data.moveSpeed * config.enemyMoveSpeedMultiplier
	
	animatedSprite.sprite_frames = data.spriteFrames
	animatedSprite.play("default")
	
	direction = chooseDirection(-1, 1)
	print("YESSSSSS")
	print(currentHealth)

func _ready() -> void:
	shootTimer.wait_time = randf_range(stats.BulletFrequencyMin, stats.BulletFrequencyMax)
	shootTimer.start()
	
func take_damage(amount: int):
	spawnDamageIndicator(amount)
	currentHealth -= amount
	EconomyManager.currentMoney += EconomyManager.moneyMultiplier * 1
	
	
	if currentHealth <= 0:
		die()

func spawnBullet() -> void:
	var enemyBullet = enemyBulletPreload.instantiate()
	add_child(enemyBullet)
	enemyBullet.global_position.x = enemyCharacter.global_position.x
	enemyBullet.global_position.y = enemyCharacter.global_position.y + enemyCharacter.position.y / 2 
	
func die():
	GameManager.currentScore += 1 * GameManager.scoreMultiplier
	queue_free()

func _on_shoot_timer_timeout() -> void:
	spawnBullet()
	
	shootTimer.wait_time = randf_range(stats.BulletFrequencyMin, stats.BulletFrequencyMax)
	shootTimer.start()

func _physics_process(delta: float) -> void:
	$".".position.x += moveSpeed * direction * delta
	
	if rightRayCast.is_colliding() and direction == 1:
		direction = -1
	
	elif leftRayCast.is_colliding() and direction == -1:
		direction = 1
	
func spawnDamageIndicator(damageAmount: int) -> void:
	var damageIndicator = damageIndicatorScene.instantiate()
	get_tree().current_scene.add_child(damageIndicator)
	damageIndicator.setup(damageAmount, global_position)

		
func chooseDirection(firstValue: int, secondValue: int):
		var chosenvalue = firstValue if randf() < 0.5 else secondValue
		return chosenvalue
