extends CharacterBody2D

@onready var anim = get_node("AnimationPlayer")

const SPEED = 150.0
const SWIM_UP_VELOCITY = -100.0
const SWIM_DOWN_VELOCITY = 50
const SWIM_FRICTION = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 0.09
var swim_velocity_cap : float = 150

var hurtState

func _ready():
	anim.play("Idle")
	hurtState = false

func _physics_process(delta):
	
	if Main.oxygen <= 0:
		get_tree().paused = true
		$"../CanvasLayer/GameOverScreen".show()
		
	# Add the water gravity.
	velocity.y = clampf(velocity.y + gravity * delta, -swim_velocity_cap, swim_velocity_cap)

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = SWIM_UP_VELOCITY
	
	#May not need this since max swim velocity is capped
	#if Input.is_action_just_pressed("ui_down"):
		#velocity.y += SWIM_DOWN_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	if direction:
		velocity.x = direction * SPEED
		if !hurtState:
			anim.play("Swimming")
	else:
		velocity.x = move_toward(velocity.x, 0, SWIM_FRICTION)
		if velocity.x == 0 and !hurtState:	
			anim.play("Idle")
	
	move_and_slide()
	
func hurt():
	hurtState = true
	$AudioStreamPlayer2D.play()
	anim.play("Hurt")
	await anim.animation_finished
	hurtState = false
