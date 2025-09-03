extends Node2D

var playerSpawn = Vector2(560, 453)
const rotateDegrees = 30
@onready var boss: AnimatedSprite2D

func _ready() -> void:
	$jeff.global_position = playerSpawn
	boss = get_node("boss")
	boss.play("idle")

func rays():
	$ray/rayAnim.play("load")
	await $ray/rayAnim.animation_finished  # wait for "load" to finish

	$ray/rayAnim.play("fade")
	await $ray/rayAnim.animation_finished  # wait for "fade" to finish

	$ray.rotation_degrees -= rotateDegrees

func _on_ray_timer_timeout() -> void:
	rays()
