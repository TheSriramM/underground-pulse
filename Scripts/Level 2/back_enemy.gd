extends CharacterBody2D

var down = true 
var playerEntered = false
var speed = 500
var fov_rot = Vector2(-95, 0) 
var fov_pos = Vector2(3, 96)
var enem_annoyed = false
var bulletScene = preload("res://Scenes/enemy_laser.tscn")
@export var player : CharacterBody2D

func _ready() -> void:
	add_to_group("enemies")
	$fov.rotation_degrees = 0
	$fov_area.rotation_degrees = 0

func _physics_process(delta: float) -> void:
	if down:
		velocity.y = speed
	else:
		velocity.y = -speed
	if playerEntered:
		$shootingTimer.start()
		shoot()
		playerEntered=false
	move_and_slide()

func shoot():
	$shootingRate.start()

func _on_back_enem_area__entered(area: Area2D) -> void:
	# If game breaks, remove the 1 from the function name
	if area.get_parent() == self:
		down = false 
		$fov.rotation_degrees = 180
		$fov.position = Vector2(6, -97)
		$fov_area.rotation_degrees = -90

func _on_back_enem_area_2_entered(area: Area2D) -> void:
	if area.get_parent() == self:
		down = true
		$fov.rotation_degrees = 0
		$fov.position = fov_pos
		$fov_area.rotation_degrees = 90
		print($fov_area/col.global_position)

func _on_shooting_timer_timeout() -> void:
	playerEntered = true

func _on_shooting_rate_timeout() -> void:
	# Real shoot function
	var bullet = bulletScene.instantiate()
	call_deferred("add_child", bullet)
	# Get the direction towards the player
	bullet.set_deferred("direction", global_position.direction_to(player.global_position))
	bullet.position = position
	bullet.show()

func _on_fov_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		playerEntered = true
		enem_annoyed = true
		$fov.hide()
