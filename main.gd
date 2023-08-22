extends Node2D

var oxygen = 200

func _ready():
	pass

func _process(delta):
	pass

func _on_oxygen_timer_timeout():
	oxygen = oxygen - 1
