extends Parallax2D

@export var texture: Texture2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	var scale_f = get_viewport_rect().size.y / texture.get_height()
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	repeat_size.x = texture.get_width() * scale_f
