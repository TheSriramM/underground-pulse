extends CanvasLayer

@onready var colour = $ColorRect
@onready var anim = $anim

func load_scene(target_scene : String):
	anim.play("fade_in")
	await anim.animation_finished
	get_tree().change_scene_to_file(target_scene)
	anim.play("fade_out")

func reload():
	anim.play("fade_in")
	await anim.animation_finished
	get_tree().reload_current_scene()
	anim.play("fade_out")
