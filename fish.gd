extends CharacterBody2D


const SPEED = 50.0

@export var player : CharacterBody2D

var chase = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	get_node("AnimatedSprite2D").play("Default")

func _physics_process(delta):
	if chase:
		var player_position = player.position
		var target_position = (player_position - self.position).normalized()
		
		if target_position.x > 0:
			get_node("AnimatedSprite2D").flip_h = false
		else:
			get_node("AnimatedSprite2D").flip_h = true
		
		velocity = Vector2(target_position * SPEED)
	else:
		velocity = Vector2.ZERO

	move_and_slide()


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		body.hurt()
		Main.oxygen -= 20
		print(Main.oxygen)
		death()

func death():
	chase = false
	$FishBody.set_deferred("disabled", true)
	$PlayerCollision/CollisionShape2D.set_deferred("disabled", true)
	get_node("AnimatedSprite2D").play("Death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()
