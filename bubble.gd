extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.set_deferred("disabled", true)
	get_node("AnimatedSprite2D").play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		Main.oxygen += 15
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished
		self.queue_free()
