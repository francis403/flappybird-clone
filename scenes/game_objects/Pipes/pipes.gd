extends Node2D
class_name Pipes

@onready var bottom_pipe: Area2D = $BottomPipe
@onready var top_pipe: Area2D = $TopPipe
@onready var laser: Laser = $Laser
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var score_audio_stream_player: AudioStreamPlayer = $ScoreAudioStreamPlayer

func _ready() -> void:
	top_pipe.area_entered.connect(on_pipe_collision_signal)
	bottom_pipe.area_entered.connect(on_pipe_collision_signal)
	laser.area_entered.connect(on_laser_entered_signal)
	visible_on_screen_notifier_2d.screen_exited.connect(on_screen_exited_signal)

func _process(delta: float) -> void:
	move_to_left()
	
func move_to_left():
	self.position.x = self.position.x - 1
		
func on_pipe_collision_signal(area: Area2D):
	SignalManager.plane_collided_with_pipe.emit()
	print("Collided with the pipe")
	get_tree().paused = true

func on_laser_entered_signal(area: Area2D):
	if !area.get_parent() is TappyPlane:
		return
	score_audio_stream_player.play()
	SignalManager.laser_passed.emit()
	laser.play_score_animation()
	
	
func on_screen_exited_signal():
	self.queue_free()
