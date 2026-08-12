extends CanvasLayer

@onready var nameLabel: Label = $Panel/VBoxContainer/NameLabel
@onready var textLabel: Label = $Panel/VBoxContainer/TextLabel
@onready var optionsContainer: HBoxContainer = $Panel/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setupDialogue(data: Dictionary) -> void:
	nameLabel.text = data.get("name", "NPC")
	textLabel.text = data.get("text", "...")
	
	for child in optionsContainer.get_children():
		child.queue_free()
		
	var chatButton = Button.new()
	chatButton.text = "TELL ME SOMETHING"
	chatButton.pressed.connect(onChatPressed)
	optionsContainer.add_child(chatButton)
	
	var exitButton = Button.new()
	exitButton.text = "Bye"
	exitButton.pressed.connect(UiManager.closeCurrentUI)
	optionsContainer.add_child(exitButton)
	
	if data.get("has_upgrades", false):
		var upgradeButton = Button.new()
		upgradeButton.text = "UPGRADES"
		upgradeButton.pressed.connect(onUpgradePressed)
		optionsContainer.add_child(upgradeButton)
	
		
func onChatPressed() -> void:
	var randomText = randi_range(1, 5)
	
	match randomText:
		1: 
			textLabel.text = "I-I'm secretly in love with Paul <3"
		2: 
			textLabel.text = "I remember when you guys enslaved our kind and reduced our world to ashes."
		3: 
			textLabel.text = "Any upgrades you need--I'm your man!"
		4: 
			textLabel.text = "It really is ironic, now that I think about it. I don't hold grudges, though."
		5: 
			textLabel.text = "We stuck in here forever, huh. We'll never escape, so don't try anything."
	
	

func onUpgradePressed() -> void:
	UiManager.openUpgradeMenu()
