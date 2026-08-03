extends Area2D

@onready var bullet = $"."
var gay = 1

func _ready() -> void:
	bullet.top_level = true

func _physics_process(delta: float) -> void:
	bullet.position.y += GameManager.enemyBulletSpeed
	
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("playership"):
		get_tree().change_scene_to_file("res://scenes/MainScenes/StartScreen.tscn")
		
