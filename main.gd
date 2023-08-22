extends Node2D

var oxygen = 600
@export var gameOver : Control

func _ready():
	pass

func _process(delta):
	pass
		
func _on_oxygen_timer_timeout():
	Main.oxygen -= 1
