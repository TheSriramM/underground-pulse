extends Control

func _ready() -> void:
	$money.text = "💵 " + str(Global.money)


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/lvl_2.tscn")
