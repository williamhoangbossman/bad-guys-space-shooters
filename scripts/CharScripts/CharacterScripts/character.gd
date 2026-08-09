extends CharacterBody2D

@export var playerData: playerStats
@onready var playersprite = $AnimatedSprite2D
const  BulletScene = preload("res://scenes/Misc/bullet.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var timer = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	# Handle jump.
	timer += delta 
	if Input.is_action_pressed("shoot"):
		if timer >= playerData.playerBulletCooldown:
			spawnBullet()
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)	
	if direction < 0:
		playersprite.flip_h = true
	elif direction > 0:
		playersprite.flip_h = false 
	move_and_slide()
	
	
func spawnBullet():
	var bullet = BulletScene.instantiate()
	bullet.global_position.x = playersprite.global_position.x 
	bullet.global_position.y = playersprite.global_position.y - 42
	add_child(bullet)
	timer = 0
