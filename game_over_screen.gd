extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Main.oxygen = 100
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")