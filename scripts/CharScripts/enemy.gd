extends Area2D

@onready var rightRayCast = $RightRayCast
@onready var leftRayCast = $LeftRayCast


var direction = 1
var currentHealth: int

func _ready() -> void:
	currentHealth = GameManager.enemyMaxhealth

func take_damage(amount: int):
	currentHealth -= amount
	EconomyManager.currentMoney += EconomyManager.moneyMultiplier * 1
	
	if currentHealth <= 0:
		die()



func die():
	#add score etc
	queue_free()

func _physics_process(delta: float) -> void:
	$".".position.x += GameManager.enemySpeed * direction
	
	if rightRayCast.is_colliding() and direction == 1:
		direction = -1
	
	elif leftRayCast.is_colliding() and direction == -1:
		direction = 1
