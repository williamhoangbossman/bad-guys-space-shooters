extends Area2D

@export var speed = 10
@export var maxHealth: int = 30

@onready var rightRayCast = $RightRayCast
@onready var leftRayCast = $LeftRayCast


var direction = 1
var currentHealth: int

func _ready() -> void:
	currentHealth = maxHealth

func take_damage(amount: int):
	currentHealth -= amount
	EconomyManager.currentMoney += EconomyManager.moneyMultiplier * 1
	
	if currentHealth <= 0:
		die()



func die():
	#add score etc
	queue_free()

func _physics_process(delta: float) -> void:
	$".".position.x += speed * direction
	
	if rightRayCast.is_colliding() and direction == 1:
		direction = -1
	
	elif leftRayCast.is_colliding() and direction == -1:
		direction = 1
