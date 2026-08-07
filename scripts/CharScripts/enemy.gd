extends Area2D

@export var stats: enemyStats

@onready var enemyCharacter = $"."

@onready var shootTimer = $shootTimer
@onready var rightRayCast = $RightRayCast
@onready var leftRayCast = $LeftRayCast
@onready var animatedSprite = $AnimatedSprite2D

const enemyBulletPreload = preload("res://scenes/Misc/enemyBullet.tscn")

var direction = 1
var currentHealth: int

func setUp(data: enemyStats, healthMultiplier: float) -> void: 
	stats = data
	currentHealth = int(data.maxHealthPoints * healthMultiplier)
	
	animatedSprite.sprite_frames = data.spriteFrames
	animatedSprite.play("default")
	
	print("YESSSSSS")

func _ready() -> void:
	currentHealth = stats.maxHealthPoints
	shootTimer.wait_time = randf_range(stats.BulletFrequencyMin, stats.BulletFrequencyMax)
	shootTimer.start()
	
	
func take_damage(amount: int):
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
	$".".position.x += stats.moveSpeed * direction * delta
	
	if rightRayCast.is_colliding() and direction == 1:
		direction = -1
	
	elif leftRayCast.is_colliding() and direction == -1:
		direction = 1
		
	
		
