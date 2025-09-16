extends Control


func _on_continue_pressed() -> void:
	Global.level = 3
	SceneTransition.call_deferred("load_scene", "res://Scenes/Levels/boss_fight.tscn")
	#get_tree().change_scene_to_file("res://Scenes/Levels/boss_fight.tscn")
