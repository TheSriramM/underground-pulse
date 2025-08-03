extends CharacterBody2D

signal healthChanged
@export var max_speed = Global.maxSpeed
@export var maxHealth = Global.playerHealth
@export var accel = Global.maxAccel
var in_spiky_plant = false
var respawn = Vector2(-400, 50)
var health = maxHealth

func _ready() -> void:
	maxHealth = Global.playerHealth
	max_speed = Global.maxSpeed
	accel = Global.maxAccel
	position = respawn

func _process(delta: float) -> void:
	if in_spiky_plant:
		slow_down()
	else:
		max_speed = Global.maxSpeed

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
	if area.name == "playerArea":
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/shop.tscn")

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
