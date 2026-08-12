extends Area2D

@onready var bullet = $"."
@onready var bulletFrames: AnimatedSprite2D = $BulletFrames


var bulletSpeed: float
var EnemyData: enemyStats

func _ready() -> void:
	bullet.top_level = true

func _physics_process(delta: float) -> void:
		bullet.position.y += bulletSpeed * delta

func setupBullet(speed: float, data: enemyStats) -> void:
	bulletFrames.sprite_frames = data.bulletSpriteFrames
	bulletFrames.play()
	bulletSpeed = speed

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playerShip"):
		if body.has_method("takeDamage"):
			body.takeDamage(1)
			
			queue_free()
	
