extends CharacterBody2D

signal healthChanged
@export var max_speed = 400
@export var maxHealth = 100
@export var accel = 1500
var in_spiky_plant = false
var respawn = Vector2(-400, 50)
var health = maxHealth

func _ready() -> void:
	position = respawn

func _process(delta: float) -> void:
	if in_spiky_plant:
		slow_down()
	else:
		max_speed = 400

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


func _on_lvl_boundary_area_entered(_area: Area2D) -> void:
	respawn = Vector2(500,0)

func _on_sigma_area_area_entered(area: Area2D) -> void:
	if area.get_parent() == self:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/u_won.tscn")

func slow_down():
	print("e")
	health -= 0.1
	max_speed = 200
	if health > 0:
		healthChanged.emit()
	else:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/u_died.tscn")

func _on_spiky_plant_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		in_spiky_plant = true

func _on_spiky_plant_area_exited(area: Area2D) -> void:
	if area.name == "playerArea":
		in_spiky_plant = false
