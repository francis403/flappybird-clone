extends Area2D
class_name Laser

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	self.area_entered.connect(on_area_entered_signal)

func on_area_entered_signal(area: Area2D):
	print("area entered laser")
	
func play_score_animation():
	animation_player.play("score")
