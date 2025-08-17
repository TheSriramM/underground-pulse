extends ProgressBar

@export var player: CharacterBody2D

func _ready() -> void:
	player.healthChanged.connect(_update)
	_update()

func _update():
	value = player.health * 100 / player.maxHealth
