extends Control

const MAIN_GAME_SCENE_PATH = "res://scenes/main/main.tscn"

@onready var high_score_label: Label = $MarginContainer4/VBoxContainer/MarginContainer3/HighScoreLabel

func _ready() -> void:
	high_score_label.text = str(ScoreManager.high_score)

func _input(event: InputEvent):
	if event.is_action_pressed("space"):
		GameManager.load_main_scene()
