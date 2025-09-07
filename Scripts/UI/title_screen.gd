extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/lvl_1.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_instructions_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/interactive_tut.tscn")


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/tutorial.tscn")
