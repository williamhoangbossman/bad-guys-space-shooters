extends CanvasLayer

@onready var moneylabel = $Control/moneyLabel
@onready var scoreLabel = $Control/scoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Signals.game_continue.connect(_on_continue)
	#Signals.game_back.connect(_on_back)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	moneylabel.text = "money: %d" % EconomyManager.currentMoney
	scoreLabel.text = "scroe: %d" % GameManager.currentScore

#func _on_continue():
	#visible = true
	
#func _on_back():
#	visible = false
