extends CharacterBody2D
class_name TappyPlane

@export var speed = 50
@export var max_speed = 900

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var acceleration = 100

#func _ready() -> void:
	#animation_player.animation_finished.connect(on_animation_finished_signal)

func _physics_process(delta: float) -> void:
	#handle_input(delta)
	var gravity_direction = Vector2(0, 1)
	var gravity_velocity = gravity_direction * GameManager.GRAVITY_SPEED 
	self.velocity = velocity.lerp(gravity_velocity, 1- exp(-GameManager.gravity_acceleration * get_process_delta_time()))
	#self.velocity.y = gravity_speed * delta
	
	#print(velocity.y)
	#if self.velocity.y > 0: 
		#fall()
	#angle_falling()
	if Input.is_action_just_pressed("space"):
		fly(delta)
		

	self.move_and_slide()
	if is_on_floor():
		die()


func angle_falling():
	# if falling
	if velocity.y > 0:
		#self.rotation = min((self.rotation - .1), 2)
		self.set_rotation_degrees(min((self.get_rotation_degrees() + 1), 50))
	elif velocity.y < 0:
		#self.rotation = max((self.rotation + .1), -2)
		self.set_rotation_degrees(max((self.get_rotation_degrees() - 1.5), -50))
	
func fly(delta: float):
	#if !animation_playing:
	animation_player.play("fly")
	#animation_playing = true
	var direction = Vector2(0, -1).normalized()
	var desired_velocity = direction * max_speed
	velocity = velocity.lerp(desired_velocity, 1- exp(-acceleration * get_process_delta_time()))
	#velocity.y = -900 * delta
	
	
func fall():
	print("fall")
	var tween = create_tween()
	tween.tween_property(self, "rotation", self.rotation, 1)
	tween.tween_property(self, "rotation", 40, 4)
	tween.play()

func die():
	print("die")
	set_physics_process(false)
	SignalManager.plane_on_floor.emit()
	ScoreManager.score = 0
	#get_tree().paused = true
	
func handle_input(delta: float):
	if Input.is_action_pressed("move_up"):
		self.position.y -= speed * delta
	elif Input.is_action_pressed("move_down"):
		self.position.y += speed * delta
