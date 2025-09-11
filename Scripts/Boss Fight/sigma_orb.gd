extends Sprite2D


func _on_sigma_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/u_won.tscn")
