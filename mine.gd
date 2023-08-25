extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("Default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		body.hurt()
		Main.oxygen -= 30
		$CollisionShape2D.set_deferred("disabled", true)
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		get_node("AnimatedSprite2D").play("Explosion")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()
