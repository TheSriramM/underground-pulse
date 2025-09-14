extends Sprite2D

@export var speed = 13
var direction = Vector2.ZERO

func _ready() -> void:
	pass

#func _ready() -> void:
	#AudioManager.play("res://Audio/black-ops-2-hd-dsr-50-gun-sound-hq-download.mp3")

func _physics_process(_delta: float) -> void:
	position += direction * speed

func _on_laser_area_entered(area: Area2D) -> void:
	if area.name == "playerArea" or area.name == "shieldArea":
		queue_free()

func _on_laser_timer_timeout() -> void:
	queue_free()
