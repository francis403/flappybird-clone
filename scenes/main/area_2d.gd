extends Area2D

func _ready() -> void:
	self.area_entered.connect(on_area_entered_test)
	

func on_area_entered_test():
	print("Area entered")
