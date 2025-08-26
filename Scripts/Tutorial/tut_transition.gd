extends Control


func _on_lvl_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/lvl_1.tscn")


func _on_backto_main_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/title_screen.tscn")
