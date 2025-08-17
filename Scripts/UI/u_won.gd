extends Control

var start_time

func _ready() -> void:
	start_time = Time.get_ticks_msec()

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/title_screen.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
