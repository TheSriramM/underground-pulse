extends CharacterBody2D

@export var max_speed = 400
@export var accel = 1500

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Input.get_vector("left", "right", "up", "down") * max_speed, accel * delta)
	move_and_slide()
