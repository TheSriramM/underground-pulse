extends CharacterBody2D

var right = true 
var playerEntered = false
var speed = 200
var fov_rot = Vector2(-95, 0) 
var lvl1_boundary_exceeded = false
var bulletScene = preload("res://Scenes/enemy_laser.tscn")

func _ready() -> void:
	add_to_group("enemies")

func _physics_process(_delta: float) -> void:
	if right:
		velocity.x = speed
	else:
		velocity.x = -speed
	if playerEntered:
		$shootingTimer.start()
		_shoot()
		playerEntered=false

	move_and_slide()

func _shoot():
	$shootingRate.start()


func _on_enemy_3_area_entered(area: Area2D) -> void:
	if area.get_parent() == self:
		right = false 
		$fov.rotation_degrees = 90
		$fov.position = fov_rot
		$fov_area.rotation_degrees = 180



func _on_enemy3_area_entered(area: Area2D) -> void:
	if area.get_parent() == self:
		right = true 
		$fov.rotation_degrees = -90
		$fov.position = Vector2(100, 12)
		$fov_area.rotation_degrees = 0


func _on_fov_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		playerEntered = true
		$fov.hide()


func _on_shooting_timer_timeout() -> void:
	playerEntered = true

func _on_shooting_rate_timeout() -> void:
	if not lvl1_boundary_exceeded:
		# Real shoot function
		var bullet = bulletScene.instantiate()
		call_deferred("add_child", bullet)
		# Get the direction towards the player
		bullet.set_deferred("direction", global_position.direction_to(get_parent().get_parent().get_child(2).global_position))
		bullet.position = position
		bullet.show()
