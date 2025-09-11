extends AnimatedSprite2D

var bulletScene = preload("res://Scenes/player_bullet.tscn")
var speed = 1
@export var player : CharacterBody2D

# This is a fixed version of underground pulse
# This is the correct version

func _ready() -> void:
	pass

func _on_shoot_timer_timeout() -> void:
	if not Global.fightComplete:
		var bullet = bulletScene.instantiate()
		get_tree().current_scene.add_child(bullet)

		bullet.global_position = global_position

		var dir = (player.global_position - global_position).normalized()
		bullet.direction = dir
		bullet.speed_scale = speed

		# Rotate bullet to face the direction
		bullet.rotation = dir.angle()


func _on_speed_inc_timeout() -> void:
	speed *= 1.25
