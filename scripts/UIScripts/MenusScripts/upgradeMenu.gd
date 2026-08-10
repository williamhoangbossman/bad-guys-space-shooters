extends CanvasLayer

@export var upgradesData: UpgradesData

@onready var costLabel = $CostLabel
@onready var levelLabel = $LevelsLabel
@onready var closeButton = $backButton

@onready var damageTab = $DamageTab
@onready var defenseTab = $DefenseTab
@onready var attacksTab = $AttacksTab
@onready var miscTab = $MiscTab

@onready var allTabs: Array[Control] = [damageTab, defenseTab, attacksTab, miscTab]

func _ready() -> void:
	switchTab(damageTab)
	
func updateUpgradeUI() -> void:
	costLabel.text = "Cost: " + str(GameManager.getUpgradeCost(GameManager.healthLevel))
	levelLabel.text = "Level: " + str(GameManager.healthLevel)

	
func switchTab(currentTab) -> void:
	for children in allTabs:
		children.visible = false
		
	currentTab.visible = true

func _on_back_button_pressed() -> void:
	UiManager.closeCurrentUI()

func _on_damage_upgrades_tab_pressed() -> void:
	switchTab(damageTab)

func _on_defense_upgrades_tab_pressed() -> void:
	switchTab(defenseTab)

func _on_attacks_upgrade_tab_pressed() -> void:
	switchTab(attacksTab)

func _on_misc_upgrades_tab_pressed() -> void:
	switchTab(miscTab)


func _on_defense_upgrade_button_pressed() -> void:
	print("WEOKFBNIQWJEOBNF")
	if GameManager.buyHealthUpgrade():
		print("NAIODNQ")
		updateUpgradeUI()
		
		#HUD CHANGE HERE 
