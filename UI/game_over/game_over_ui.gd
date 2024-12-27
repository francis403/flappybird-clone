extends Control

@onready var game_over_label: Label = $GameOverLabel
@onready var press_space_label: Label = $PressSpaceLabel
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	timer.timeout.connect(on_timer_timeout_signal)
	press_space_label.hide()
	audio_stream_player.play()
	self.set_process(false)
	self.set_process_input(false)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		GameManager.load_main_scene()
		ScoreManager.score = 0
		self.queue_free()
		

func on_timer_timeout_signal():
	press_space_label.show()
	game_over_label.hide()
	self.set_process_input(true)
