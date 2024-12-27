extends Node

const PLANE_GROUP = "plane_group"

const SCROLL_SPEED: float = 120
const GRAVITY_SPEED: float = 300
const gravity_acceleration: float = 9.8

const MAIN: PackedScene = preload("res://scenes/main/main.tscn")

func _ready() -> void:
	print("GameManager")

func load_main_scene():
	get_tree().change_scene_to_packed(MAIN)
	get_tree().paused = false
