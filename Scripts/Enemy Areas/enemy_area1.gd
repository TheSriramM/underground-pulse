extends Area2D

var forward = true

#func _on_area_1_area_entered(area: Area2D) -> void:
	#$fov.rotation_degrees = 90
	#$fov.position = Vector2(106,2)
	#forward = false
	#print("changing to left")
#
#func _on_area_2_area_entered(area: Area2D) -> void:
	#$fov.rotation_degrees = -90
	#$fov.position = Vector2(100,12)
	#forward = true
	#print("changing to rightaaaaa")

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
