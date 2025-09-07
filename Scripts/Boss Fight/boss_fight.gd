extends Node2D

var playerSpawn = Vector2(560, 453)
const rotateDegrees = 20
var redBallzScene = preload("res://Scenes/red_ballz.tscn")
var time_played = 75
@export var timerLabel : Label
@onready var boss: AnimatedSprite2D

func _ready() -> void:
	$jeff.global_position = playerSpawn
	boss = get_node("boss")
	boss.play("idle")
	$fightTimer.start()

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
	redBall.get_child(1).play("get_bigger")
	await redBall.get_child(1).animation_finished

func _on_ball_timer_timeout() -> void:
	red_ballz()

func _on_fight_timer_timeout() -> void:
	time_played -= 1
	timerLabel.text = str(time_played)
	if time_played <= 0:
		Global.money = time_played
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/u_won.tscn")
