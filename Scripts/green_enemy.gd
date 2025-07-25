extends CharacterBody2D

var right = true
var playerEntered = false
var speed = 225
var bulletScene = preload("res://Scenes/enemy_laser.tscn")

func _ready() -> void:
	add_to_group("enemies")

func _physics_process(delta: float) -> void:
	if right:
		velocity.x = speed
	else:
		velocity.x = -speed
	move_and_slide()
	if playerEntered:
		$shootingTimer.start()
		shoot()
		playerEntered=false
	
func shoot():
	$shootingRate.start()
	
func _on_area_1_entered(area: Area2D) -> void:
	if area.get_parent() == self:
		right = false
		rotation_degrees = 180

func _on_area_2_entered(area: Area2D) -> void:
	if area.get_parent() == self:
		right = true
		rotation_degrees = 0

func _on_fov_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		playerEntered = true
		$PinkEnemArea.hide()

func _on_shooting_timer_timeout() -> void:
	playerEntered = true

func _on_shooting_rate_timeout() -> void:
	var bullet = bulletScene.instantiate()
	call_deferred("add_child", bullet)
	# Get the direction towards the player
	bullet.set_deferred("direction", global_position.direction_to(get_parent().get_parent().get_child(2).global_position))
	bullet.position = position
	bullet.show()
