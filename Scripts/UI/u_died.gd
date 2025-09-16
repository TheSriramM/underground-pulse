extends Control

func _on_restart_pressed() -> void:
	if Global.level == 0:
		SceneTransition.call_deferred("load_scene", "res://Scenes/Levels/tutorial.tscn")
		#get_tree().change_scene_to_file("res://Scenes/Levels/tutorial.tscn")
		
	elif Global.level == 1:
		SceneTransition.call_deferred("load_scene", "res://Scenes/Levels/lvl_1.tscn")
		#get_tree().change_scene_to_file("res://Scenes/Levels/lvl_1.tscn")
		
	elif Global.level == 2:
		SceneTransition.call_deferred("load_scene", "res://Scenes/Levels/lvl_2.tscn")
		#get_tree().change_scene_to_file("res://Scenes/Levels/lvl_2.tscn")
		
	elif Global.level == 3:
		SceneTransition.call_deferred("load_scene", "res://Scenes/Levels/boss_fight.tscn")
		#get_tree().change_scene_to_file("res://Scenes/Levels/boss_fight.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
