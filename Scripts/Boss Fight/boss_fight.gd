extends Node2D

var playerSpawn = Vector2(560, 453)
var bossPos : Vector2
const rotateDegrees = 20
var redBallzScene = preload("res://Scenes/red_ballz.tscn")
var healingBeanScene = preload("res://Scenes/healing_bean.tscn")
var sigmaScene = preload("res://Scenes/sigma_orb.tscn")
var time_played = 75
@export var timerLabel : Label
@onready var boss: AnimatedSprite2D

func _ready() -> void:
	Music.stop()
	$jeff/pointLight.hide()
	$jeff.global_position = playerSpawn
	boss = get_node("boss")
	boss.play("idle")
	$fightTimer.start()
	bossPos = boss.global_position

func rays():
	if not Global.fightComplete:
		$ray/rayAnim.play("load")
		await $ray/rayAnim.animation_finished  # wait for "load" to finish

		$ray/rayAnim.play("fade")
		await $ray/rayAnim.animation_finished  # wait for "fade" to finish

		$ray.rotation_degrees -= rotateDegrees

func _on_ray_timer_timeout() -> void:
	rays()

func red_ballz():
	if not Global.fightComplete:
		var x_pos = randi_range(0, 1100)
		var y_pos = randi_range(0, 600)
		var redBall = redBallzScene.instantiate()
		add_child(redBall)
		move_child(redBall, 3)
		redBall.global_position = Vector2(x_pos, y_pos)
		redBall.get_child(1).play("get_bigger")
		await redBall.get_child(1).animation_finished

func healing_bean():
	if not Global.fightComplete:
		var x_pos = randi_range(0, 1100)
		var y_pos = randi_range(0, 600)
		var healing_bean = healingBeanScene.instantiate()
		add_child(healing_bean)
		move_child(healing_bean, 4)
		healing_bean.global_position = Vector2(x_pos, y_pos)
		healing_bean.get_child(1).play("grow")

func _on_ball_timer_timeout() -> void:
	red_ballz()

func _on_fight_timer_timeout() -> void:
	time_played -= 1
	timerLabel.text = str(time_played)
	if time_played <= 0:
		Global.fightComplete = true
		$jeff.health = 10000
		Global.money = time_played
		boss.play("death")
		await boss.animation_finished
		$playerStats.hide()
		var tween = create_tween()
		tween.tween_property(boss, "scale", Vector2(0.05, 0.05), 2)
		tween.tween_property(boss, "modulate", Color(1, 1, 1, 0), 2)
		await tween.finished
		# Need to remove all processes such as redBallz and healing Bean
		$boss.hide()
		$ray.hide()
		var sigma = sigmaScene.instantiate()
		add_child(sigma)
		sigma.global_position = bossPos
		#get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/u_won.tscn")

func _on_bean_timer_timeout() -> void:
	healing_bean()
