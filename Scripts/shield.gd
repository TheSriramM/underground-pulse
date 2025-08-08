extends Sprite2D

func _ready() -> void:
	$shieldTimer.start()

func _on_shield_timer_timeout() -> void:
	hide()
	queue_free()
