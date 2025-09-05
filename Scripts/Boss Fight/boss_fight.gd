extends Node2D

var playerSpawn = Vector2(560, 453)
const rotateDegrees = 20
var redBallzScene = preload("res://Scenes/red_ballz.tscn")
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

func red_ballz():
	var x_pos = randi_range(0, 1100)
	var y_pos = randi_range(0, 600)
	var redBall = redBallzScene.instantiate()
	add_child(redBall)
	move_child(redBall, 3)
	redBall.global_position = Vector2(x_pos, y_pos)
	$redBallz/anim.play("get_bigger")

func _on_ball_timer_timeout() -> void:
	red_ballz()
