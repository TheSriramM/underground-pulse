extends Area2D

@onready var sound = get_parent().get_child(5)

func _on_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		sound.play()
