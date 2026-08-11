extends Area2D

@export var npcName: String = "Rafael"
@export var dialogueText: String = "Care for a drink?"

var playerInRange: bool = false
## make sure to add detection script. 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if playerInRange and event.is_action_pressed("interact"):
		
		print("YES DADDY")
		var npcData = {
			"name": npcName,
			"text": dialogueText,
			"has_upgrades": true
		}
		
		#upgradeMenu.visible = true
		#get_tree().paused = true
		
		UiManager.openDialogue(npcData)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playerCharacter"):
		playerInRange = true
		
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("playerCharacter"):
		playerInRange = false
