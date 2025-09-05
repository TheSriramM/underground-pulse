extends CharacterBody2D

# Dont modify globalhealth in this script
# Modify health variable in this script
signal healthChanged
@export var max_speed = Global.maxSpeed
@export var maxHealth = Global.playerHealth
@export var accel = Global.maxAccel
var in_spiky_plant = false
var inRay = false
var bossHit = false
var respawn = Vector2(-400, 50)
var health = maxHealth
var shieldNotInUse = true
var shieldScene = preload("res://Scenes/shield.tscn")

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
	if Global.shieldCount > 0 and shieldNotInUse and Input.is_action_just_pressed("shield"):
		print("shield loading")
		var shield = shieldScene.instantiate()
		call_deferred("add_child", shield)
		shield.position = Vector2.ZERO
		shieldNotInUse = false
	if inRay:
		slow_damage()
	if bossHit:
		slow_damage()

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Input.get_vector("left", "right", "up", "down") * max_speed, accel * delta)
	move_and_slide()

func _on_player_area_entered(area: Area2D) -> void:
	if area.name == "laserArea":
		health -= 20
		if health > 0:
			healthChanged.emit()
		else:
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/u_died.tscn")
	if area.name == "bossBulletArea":
		bossHit = true

func _on_lvl_boundary_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/shop.tscn")

func slow_down():
	print("e")
	health -= 0.1
	max_speed = 200
	if health > 0:
		healthChanged.emit()
	else:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/u_died.tscn")

func slow_damage():
	health -= 0.1
	if health > 0:
		healthChanged.emit()
	else:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/u_died.tscn")

func _on_spiky_plant_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		in_spiky_plant = true

func _on_spiky_plant_area_exited(area: Area2D) -> void:
	if area.name == "playerArea":
		in_spiky_plant = false

func _on_lvl_2_spike_plants_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		in_spiky_plant = true

func _on_lvl_2_spike_plants_area_exited(area: Area2D) -> void:
	if area.name == "playerArea":
		in_spiky_plant = false

func _on_scroll_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/u_won.tscn")

func _on_tutorial_spiky_plant_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		in_spiky_plant = true

func _on_tutorial_spiky_plant_area_exited(area: Area2D) -> void:
	if area.name == "playerArea":
		in_spiky_plant = false


func _on_teleport_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/Ui/tut_transition.tscn")

func _on_ray_area_entered(area: Area2D) -> void:
	if area.name == "playerArea":
		inRay = true

func _on_ray_area_exited(area: Area2D) -> void:
	if area.name == "playerArea":
		inRay = false

func _on_player_area_exited(area: Area2D) -> void:
	if area.name == "bossBulletArea":
		bossHit = false
