extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		Main.oxygen += 10
		$CollisionShape2D.set_deferred("disabled", true)
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished
		self.queue_free()
