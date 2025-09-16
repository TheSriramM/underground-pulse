extends Control

var cur_text = 0
@export var main : Label

func _ready() -> void:
	main.text = "Welcome to the interactive guide. 

This guide contains important information that players should know before playing the game.

To continue press the right arrow key."
	$continue.hide()
	$spikyPlant.hide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		cur_text = clamp(cur_text + 1, 0, 5)
	if cur_text == 1:
		main.text = "Controls
		WASD/Arrow Keys for movement
		C to use shield (only after purchase at Level 2)
		"
	elif cur_text == 2:
		main.text = "Avoid stepping into the field of vision of enemies as they will start to attack 
		Moving across          - causes damage and makes you move slower"
		$spikyPlant.show()
	elif cur_text == 3:
		main.text = "You can upgrade stats or purchase a shield after Level 1 in the shop

		More info will be presented after Level 1"
		$spikyPlant.hide()
	elif cur_text == 4:
		main.text = "You have 60 seconds to complete Level One.
		Faster means more money"
	elif cur_text > 4:
		main.text = "Good luck!"
		$continue.show()
	$cur_status.text = str(cur_text+1) + "/6"


func _on_continue_pressed() -> void:
	if cur_text > 4:
		SceneTransition.call_deferred("load_scene", "res://Scenes/UI/title_screen.tscn")
		#get_tree().change_scene_to_file("res://Scenes/UI/title_screen.tscn")
