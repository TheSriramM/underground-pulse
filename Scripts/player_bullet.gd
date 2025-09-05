extends GPUParticles2D

# Changing the name of the scene requires too much work

const SPEED = 300
const SIZE = Vector2(0.4, 0.3)
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	scale = SIZE

func _process(delta: float) -> void:
	position += direction * SPEED * delta


func _on_player_bullet_area_entered(area: Area2D) -> void:
	pass
