extends CanvasLayer

@export var upgradesData: UpgradesData

@onready var closeButton = $backButton

@onready var damageTab = $DamageTab
@onready var defenseTab = $DefenseTab
@onready var attacksTab = $AttacksTab
@onready var miscTab = $MiscTab

@onready var button_click: AudioStreamPlayer = $ButtonClick

@onready var allTabs: Array[Control] = [damageTab, defenseTab, attacksTab, miscTab]

func _ready() -> void:
	switchTab(damageTab)
	
func play_sound() -> void: 
	button_click.pitch_scale = randf_range(0.5, 2.25)
	button_click.play()

func switchTab(currentTab) -> void:
	for children in allTabs:
		children.visible = false
		
	currentTab.visible = true

func _on_back_button_pressed() -> void:
	play_sound()
	UiManager.closeCurrentUI()

func _on_damage_upgrades_tab_pressed() -> void:
	play_sound()
	switchTab(damageTab)

func _on_defense_upgrades_tab_pressed() -> void:
	play_sound()
	switchTab(defenseTab)

func _on_attacks_upgrade_tab_pressed() -> void:
	switchTab(attacksTab)

func _on_misc_upgrades_tab_pressed() -> void:
	switchTab(miscTab)
