extends CharacterBody2D

@export var playerData: playerStats

@export_category("Weapon")
@export var WeaponData: weaponData

@onready var playersprite = $Sprite2D
const  BulletScene = preload("res://scenes/Misc/bullet.tscn")

var maxHealth: int
var currentHealth: int
var damage: int

const SPEED = 450.0
const JUMP_VELOCITY = -400.0

var timer = 0

func _ready() -> void:
	if GameManager.currentSkin != null:
		$Sprite2D.texture = GameManager.currentSkin

func applyAllStats(config: DifficultyData) -> void:
	var baseHP = playerData.maxLifeCount * config.playerLivesMultiplier
	var hpBonus = (GameManager.getUpgradeLevel("health") - 1) * 2
	
	maxHealth = int(baseHP + hpBonus)
	currentHealth = maxHealth
	
	var baseDamage = playerData.playerBaseDamage
	var damageBonus = (GameManager.getUpgradeLevel("damage") - 1) * 2
	
	damage = baseDamage + damageBonus

func setupDifficulty(config: DifficultyData) -> void:
	applyAllStats(config)
	
	applyAllStats(config)
	print("Player has ", currentHealth, "/", maxHealth, " HP" )

func takeDamage(amount: int) -> void: #HANDLES THE DMG + DYING
	currentHealth -= amount
	
	#CHANGE HEALTH/LIVES COUNTER (IN FUTURE WE CAN ADD LIVES TO OUR COUNTER)
	if currentHealth <= 0:
		UiManager.openDeathScreen()

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
	
	if bullet.has_method("bulletSetup"): 
		bullet.bulletSetup(damage)
	timer = 0
