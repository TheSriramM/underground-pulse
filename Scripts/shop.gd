extends Control

func _ready() -> void:
	$money.text = str(Global.money)


func _on_continue_pressed() -> void:
	Global.level += 1
	SceneTransition.call_deferred("load_scene", "res://Scenes/UI/lvl_2_transition.tscn")
	#get_tree().change_scene_to_file("res://Scenes/UI/lvl_2_transition.tscn")

func _on_speed_button_pressed() -> void:
	if Global.money >= 20:
		Global.maxSpeed *= 1.1
		Global.maxAccel *= 1.1
		Global.money -= 20
		$money.text = str(Global.money)

func _on_health_button_pressed() -> void:
	if Global.money >= 20:
		Global.playerHealth *= 1.25
		Global.money -= 20
		$money.text = str(Global.money)

func _on_grenade_button_pressed() -> void:
	if Global.money >= 40:
		Global.shieldCount += 1
		Global.money -= 40
		$money.text = str(Global.money)
