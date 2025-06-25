extends Sprite2D

@export var speed = 13
var direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += direction * speed

func _on_laser_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		queue_free()
func _on_laser_timer_timeout() -> void:
	queue_free()
