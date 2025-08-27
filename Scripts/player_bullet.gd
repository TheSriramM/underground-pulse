extends Sprite2D

const SPEED = 2250
const SIZE = Vector2(0.4, 0.3)

func _ready() -> void:
	scale = SIZE
	$anim.play("fired")

func _process(delta: float) -> void:
	position += transform.x * delta * SPEED
