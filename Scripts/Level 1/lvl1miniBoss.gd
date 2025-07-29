extends CharacterBody2D

var playerEntered = false
var bulletScene = preload("res://Scenes/enemy_laser.tscn")
@export var player : CharacterBody2D

func _ready() -> void:
	$PinkEnemArea.hide()

func _physics_process(delta: float) -> void:
	if playerEntered:
		$shootingTimer.start()
		shoot()
		playerEntered = false
	look_at(player.global_position)

func _on_mini_boss_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		playerEntered = true

func shoot():
	$shootingRate.start()

func _on_shooting_rate_timeout() -> void:
	var bullet = bulletScene.instantiate()
	call_deferred("add_child", bullet)
	bullet.global_position = $bullet_pos.position
	# Get the direction towards the player
	bullet.set_deferred("direction", global_position.direction_to(player.global_position))
	bullet.position = position
	bullet.show()

func _on_shooting_timer_timeout() -> void:
	playerEntered = true
