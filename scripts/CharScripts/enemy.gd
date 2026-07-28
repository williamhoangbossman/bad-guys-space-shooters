extends Area2D

@export var maxHealth: int = 30
@onready var rightRayCast = $RightRayCast
@onready var leftRayCast = $LeftRayCast

var speed = 10
var direction = 1
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

func _physics_process(delta: float) -> void:
	$".".position.x += speed * direction
	
	if rightRayCast.is_colliding() and direction == 1:
		var hitobj =  rightRayCast.get_collider()
		print(hitobj)
		direction = -1
	
	elif leftRayCast.is_colliding() and direction == -1:
		var hitobj =  rightRayCast.get_collider()
		print(hitobj)
		direction = 1
