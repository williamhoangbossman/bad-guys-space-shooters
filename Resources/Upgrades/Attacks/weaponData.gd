extends Resource
class_name weaponData

@export var weaponName: String
@export var bulletScene: PackedScene
@export var playerSpriteTexture: Texture2D # Custom sprite for this weapon
@export var fireRate: float = 0.5
@export var damage: float = 10.0
@export var cost: int = 500
