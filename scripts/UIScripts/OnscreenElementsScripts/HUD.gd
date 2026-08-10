extends CanvasLayer

@export var playerData: playerStats

@onready var moneylabel = $Control/moneyLabel
@onready var scoreLabel = $Control/scoreLabel
@onready var liveCountLabel = $Control/liveCountLabel

var livesForLiveCountLabel: int

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	moneylabel.text = "money: %d" % EconomyManager.currentMoney
	scoreLabel.text = "score: %d" % GameManager.currentScore
	
	liveCountLabel.text = "lives: %d" % livesForLiveCountLabel

func setupHUD(config: DifficultyData) -> void: 
	livesForLiveCountLabel = config.playerLivesMultiplier * playerData.maxLifeCount
	liveCountLabel.text = "lives: %d" % int(livesForLiveCountLabel)

#func updateHUD -- MAKE IT A SIGNAL 
