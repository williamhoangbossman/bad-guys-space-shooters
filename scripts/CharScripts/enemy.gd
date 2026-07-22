extends Area2D

@export var maxHealth: int = 30
var currentHealth: int

func _ready() -> void:
	currentHealth = maxHealth

func take_damage(amount: int):
	currentHealth -= amount
	
	if currentHealth <= 0:
		die()

func die():
	#add score etc
	queue_free()
