extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -200.0

var near_mob = []

var inventory = []

var attack_signal: Callable

var shake_timeout = 0

var cam_x = 0
var cam_y = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	$"areya".connect("body_entered",_on_area_entered)
	$"areya".connect("body_exited",_on_area_exited)
	cam_x = $kamera.position.x
	cam_y = $kamera.position.y

func _on_area_entered(area):
	print("enter",area)
	near_mob.append(area)

func _on_area_exited(area):
	if area in near_mob:
		print("exit", area)
		near_mob.erase(area)

func _physics_process(delta):
	# Add the gravity.
	if shake_timeout > 0:
		shake_timeout -= delta*10
		$kamera.position.x = cam_x + randi_range(-2,2)
		$kamera.position.y = cam_y + randi_range(-2,2)
	else:
		$kamera.position.x = cam_x
		$kamera.position.y = cam_y
	print(shake_timeout)
	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if not $"sıprayt".is_playing():
			$"sıprayt".play("idle")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			$"sıprayt".flip_h = false
			$"sıprayt".play("walk")
			$areya.position.x = abs($areya.position.x) * 1
		else:
			$"sıprayt".flip_h = true
			$areya.position.x = abs($areya.position.x) * -1
			$"sıprayt".play_backwards("walk")
	else:
		$"sıprayt".play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
		
	if Input.is_action_just_pressed("ui_attack") and is_on_floor():
		attack_signal.call()
		for mob in near_mob:
			if mob.is_in_group("kömür"):
				shake_timeout = 3
			if mob.is_in_group("mob"):
				mob.heal -= 10
	#	$AnimatedSprite2D.play("attack")

	
