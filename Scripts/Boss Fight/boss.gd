extends AnimatedSprite2D

var bulletScene = preload("res://Scenes/player_bullet.tscn")
@export var player : CharacterBody2D

func _ready() -> void:
	pass

func _on_shoot_timer_timeout() -> void:
	var bullet = bulletScene.instantiate()
	get_tree().current_scene.add_child(bullet)

	bullet.global_position = global_position

	var dir = (player.global_position - global_position).normalized()
	bullet.direction = dir

	# Rotate bullet to face the direction
	bullet.rotation = dir.angle()
