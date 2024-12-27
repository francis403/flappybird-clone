extends Node2D

const GAME_OVER_UI = preload("res://UI/game_over/game_over_ui.tscn")

@onready var score_label: Label = %ScoreLabel
@onready var pipe_generator_component: PipeGenerators = %PipeGeneratorComponent
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _ready() -> void:
	score_label.text = "0"
	SignalManager.plane_on_floor.connect(game_over)
	SignalManager.laser_passed.connect(on_laser_passed)
	SignalManager.plane_collided_with_pipe.connect(game_over)
	#SignalManager.high_score_loaded.connect(on_high_score_loaded)


func on_laser_passed():
	ScoreManager.increment_score()
	score_label.text = str(ScoreManager.score)


func game_over():
	get_tree().paused = true
	show_game_over_ui()
	
func show_game_over_ui():
	var game_over_ui_instance = GAME_OVER_UI.instantiate()
	canvas_layer.add_child(game_over_ui_instance)
	
#func on_high_score_loaded():
	#print("main -> high_score_loaded")
