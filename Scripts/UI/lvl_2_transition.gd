extends Control

var cur_text = 0

func _ready() -> void:
	$harder.show()
	$info.hide()
	$important.hide()
	$title.text = "Welcome to Level Two"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		if cur_text == 0:
			cur_text += 1
			$harder.hide()
			$info.show()
			$important.hide()
			$continue.hide()
		elif cur_text == 1:
			$title.text = "        IMPORTANT!"
			cur_text += 1
			$info.hide()
			$important.show()
			$important_colour.color = Color(0.7, 0.0, 0.0)
			$continue.hide()
		else:
			$continue.show()

func _on_continue_pressed() -> void:
	if cur_text >= 2:
		get_tree().change_scene_to_file("res://Scenes/Levels/lvl_2.tscn")
