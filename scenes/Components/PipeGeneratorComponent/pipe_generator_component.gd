extends Node
class_name PipeGenerators

signal pipe_generated

@onready var timer: Timer = $Timer

@export var spawn_time: int = 2
@export var pipe_scene: PackedScene = preload("res://scenes/game_objects/Pipe/pipe.tscn")


func _ready() -> void:
	timer.timeout.connect(on_timer_timeout_signal)
	timer.wait_time = spawn_time

# TODO: need to generate pipes
func on_timer_timeout_signal():
	generate_pipes()


func generate_pipes():
	#print("adding new pipe...")
	var pipe_instance = pipe_scene.instantiate()
	get_parent().add_child(pipe_instance)
#	Todo: this is not working very well...
	pipe_instance.global_position.x = get_parent().get_viewport_rect().size.x
	pipe_instance.global_position.y += randf_range(-200, 200)
	pipe_generated.emit(pipe_instance)
