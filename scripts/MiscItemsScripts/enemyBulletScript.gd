extends Area2D

@onready var bullet = $"."
var gay = 1

func _ready() -> void:
	bullet.top_level = true

func _physics_process(delta: float) -> void:
	bullet.position.y += GameManager.enemyBulletSpeed


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playerShip"):
		GameManager.liveCount -= 1
		queue_free.call_deferred()
		
		if GameManager.liveCount <= 0:
			UiManager.openDeathScreen()
			#get_tree().change_scene_to_file.call_deferred(
			#"res://scenes/MainScenes/StartScreen.tscn")
		else:
			queue_free.call_deferred()
	
