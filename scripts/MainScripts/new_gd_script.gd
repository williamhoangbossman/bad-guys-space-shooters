extends Node2D

@onready var transition = $Transition
@onready var transitionPlayer = $Transition/AnimationPlayer
@onready var generalMenu = $UI/MenuUI/generalMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_return_to_space_button_pressed() -> void:
	await get_tree().create_timer(0.75).timeout
	
	transition.visible = true
	transitionPlayer.play("FadeIn")
	get_tree().change_scene_to_file("res://scenes/MainScenes/Game.tscn")

func _on_back_button_pressed() -> void:
	generalMenu.visible = true
