extends CharacterBody2D

signal healthChanged
@export var max_speed = 400
@export var maxHealth = 100
@export var accel = 1500
var health = maxHealth

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Input.get_vector("left", "right", "up", "down") * max_speed, accel * delta)
	move_and_slide()

func _on_player_area_entered(area: Area2D) -> void:
	if area.name == "laserArea":
		health -= 20
		healthChanged.emit()
