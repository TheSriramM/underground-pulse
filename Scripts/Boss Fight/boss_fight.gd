extends Node2D

@onready var boss: AnimatedSprite2D

func _ready() -> void:
	boss = get_node("boss")
	boss.play("idle")
