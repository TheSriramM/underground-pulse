extends CharacterBody2D

func _ready() -> void:
	$PinkEnemArea.hide()

func _on_mini_boss_area_entered(area: Area2D) -> void:
	pass

func shoot():
	pass

func _on_shooting_rate_timeout() -> void:
	pass # Replace with function body.
