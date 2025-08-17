extends Sprite2D

func _ready() -> void:
	$shieldTimer.start()
	global_scale = Vector2(1, 1)
	show_behind_parent = true

func _on_shield_timer_timeout() -> void:
	hide()
	queue_free()
