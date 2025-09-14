extends Control


func _on_continue_pressed() -> void:
	Global.level = 3
	get_tree().change_scene_to_file("res://Scenes/Levels/boss_fight.tscn")
