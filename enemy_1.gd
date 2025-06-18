extends CharacterBody2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	velocity.x += 1
	move_and_slide()
