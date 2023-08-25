extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_R):
		_on_texture_button_pressed()
	pass

func _on_texture_button_pressed():
	Main.oxygen = 60
	get_tree().change_scene_to_file("res://main.tscn")
	get_tree().paused = false
