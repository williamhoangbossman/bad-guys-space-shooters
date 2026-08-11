extends CharacterBody2D


const SPEED = 140
const JUMP_VELOCITY = -400.0

@onready var playerCharacter = $"."
@onready var playerCharacterSprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction != 0:
		playerCharacter.position.x += direction * delta * SPEED
		playerCharacterSprite.flip_h = (direction > 0)

	if velocity.length() != 0:
		pass #add jump sprite frames 
	
	
	
	move_and_slide()
