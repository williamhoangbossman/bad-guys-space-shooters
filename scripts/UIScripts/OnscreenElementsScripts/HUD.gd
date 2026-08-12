extends CanvasLayer

@export var playerData: playerStats

@onready var moneylabel = $Control/moneyLabel
@onready var scoreLabel = $Control/scoreLabel
@onready var liveCountLabel = $Control/liveCountLabel

@onready var waveLabel: Label = $Control/waveLabel
@onready var skipButton: Button = $SkipWaveButton


var livesForLiveCountLabel: int

func _ready() -> void:
#	skipButton.pressed.connect(_on_skip_wave_button_pressed) 
	pass
	
func _process(_delta: float) -> void:
	moneylabel.text = "money: %d" % EconomyManager.currentMoney
	scoreLabel.text = "score: %d" % GameManager.currentScore
	
	liveCountLabel.text = "lives: %d" % livesForLiveCountLabel

func setupHUD(config: DifficultyData) -> void: 
	livesForLiveCountLabel = int(config.playerLivesMultiplier * playerData.maxLifeCount)
	liveCountLabel.text = "lives: %d" % int(livesForLiveCountLabel)
	
func updateWaveDisplay(waveNumber: int) -> void: 
	if waveLabel:
		waveLabel.text = "Wave " + str(waveNumber)

func _on_skip_wave_button_pressed() -> void:
	var waveMGR = get_tree().current_scene.find_child("waveManager", true, false)
	if waveMGR:
		print("AMOGUS")
		waveMGR.skipWave()
