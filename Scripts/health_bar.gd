extends ProgressBar

var player

func _ready() -> void:
	player = get_parent().get_parent().get_child(2)
	player.healthChanged.connect(_update)
	_update()

func _update():
	value = player.health * 100 / player.maxHealth
