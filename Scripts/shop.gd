extends Control

func _ready() -> void:
	$money.text = "💵 " + str(Global.money)


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/lvl_2.tscn")

func _on_speed_button_pressed() -> void:
	Global.maxSpeed *= 1.2
	Global.maxAccel *= 1.1
	Global.money -= 20
	$money.text = "💵 " + str(Global.money)

func _on_health_button_pressed() -> void:
	Global.playerHealth *= 1.15
	Global.money -= 20
	$money.text = "💵 " + str(Global.money)

func _on_grenade_button_pressed() -> void:
	pass # Replace with function body.
