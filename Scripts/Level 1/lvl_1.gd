extends Node2D

var time_played = 60
@export var label : Label

func _on_game_timer_timeout() -> void:
	time_played -= 1
	label.text = "⌛ " + str(time_played)
	if time_played <= 0:
		Global.money = time_played
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/u_died.tscn")

func _on_lvl_1_boundary_area_entered(area: Area2D) -> void:
	Global.money = time_played
