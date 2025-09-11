extends Sprite2D

func _on_bean_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		$beanAnim.play("fade")
		await $beanAnim.animation_finished
		queue_free()
