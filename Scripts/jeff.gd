extends CharacterBody2D

signal healthChanged
@export var max_speed = 400
@export var maxHealth = 100
@export var accel = 1500
var respawn = Vector2(-400, 50)
var health = maxHealth

func _ready() -> void:
	position = respawn

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Input.get_vector("left", "right", "up", "down") * max_speed, accel * delta)
	move_and_slide()

func _on_player_area_entered(area: Area2D) -> void:
	if area.name == "laserArea":
		health -= 20
		if health > 0:
			healthChanged.emit()
		else:
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/u_died.tscn")


func _on_lvl_boundary_area_entered(area: Area2D) -> void:
	respawn = Vector2(500,0)

func _on_sigma_area_area_entered(area: Area2D) -> void:
	if area.get_parent() == self:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/u_won.tscn")
