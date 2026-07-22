extends Area2D

@onready var Bullet = $"."
@export var BulletDamage = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Bullet.top_level = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	Bullet.position.y -= 4


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy") and area.has_method("take_damage"):
		area.take_damage(BulletDamage)
		queue_free()
