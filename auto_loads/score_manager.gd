extends Node

const SAVE_FILE_PATH = "user://game.save"

var high_score: int = 0
var score = 0:
	get:
		print("getting score: ", score)
		return score
	set(value):
		print("setting score: ", value)
		score = value

func _ready() -> void:
	load_save_file()
	print("high score: ", high_score)

func increment_score():
	score += 1
	if score > high_score:
		high_score = score
		save()

func save():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	file.store_var(high_score)
	
func load_save_file():
	print("load_save_file")
	if !FileAccess.file_exists(SAVE_FILE_PATH):
		print("not exists load_save_file")
		return
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	high_score = file.get_var()
