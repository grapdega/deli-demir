extends CharacterBody2D

@export var SPEED = 80.0
@export var JUMP_VELOCITY = -31.0

var gravity = 9.81*10

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	elif Input.is_action_pressed("ui_accept"):
		velocity.y += JUMP_VELOCITY
	if Input.is_action_pressed("ui_right"):
		global_position.x += SPEED*delta
	if Input.is_action_pressed("ui_left"):
		global_position.x -= SPEED*delta
		 

	move_and_slide()
