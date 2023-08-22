extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Hi!"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#For some reason using get node doesn't work. Should research to understand why
	if Main.oxygen < 0:
		text = "Oxygen: 0"
	else:
		text = "Oxygen: " + str(Main.oxygen)
