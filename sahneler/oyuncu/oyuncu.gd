extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -200.0

var near_mob = []

var inventory = []

var attack_signal: Callable

var shake_timeout = 0

var locked = false

var cam_x = 0
var cam_y = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	$"areya".connect("body_entered",_on_area_entered)
	$"areya".connect("body_exited",_on_area_exited)
	$"sıprayt".connect("animation_finished",do_animation_finished)
	cam_x = $kamera.position.x
	cam_y = $kamera.position.y

func do_animation_finished():
	if $"sıprayt".animation == "zbam":
		for mob in near_mob:
			if mob.is_in_group("mob"):
				mob.heal -= 100

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
		$kamera.position.x = cam_x + randi_range(-1,1)
		$kamera.position.y = cam_y + randi_range(-1,1)
	else:
		$kamera.position.x = cam_x
		$kamera.position.y = cam_y
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if not $"sıprayt".is_playing():
			$"sıprayt".play("idle")



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if locked:
			velocity.x = velocity.x / 2
		if direction > 0:
			$"sıprayt".flip_h = false
			if $"sıprayt".animation != "zbam":
				$"sıprayt".play("walk")
			$areya.position.x = abs($areya.position.x) * 1
		else:
			$"sıprayt".flip_h = true
			$areya.position.x = abs($areya.position.x) * -1
			if $"sıprayt".animation != "zbam":
				$"sıprayt".play_backwards("walk")

	else:
		if $"sıprayt".animation == "idle":
			$"sıprayt".play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if locked:
		move_and_slide()
		return
	
		# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("ui_attack") and is_on_floor():
		if attack_signal:
			attack_signal.call()
		for mob in near_mob:
			if mob.is_in_group("maden"):
				
				shake_timeout = 3
		$"sıprayt".play("zbam")
		var audyo = AudioStreamPlayer.new()
		add_child(audyo)
		audyo.stream = load("res://kaynak/ses/cekic.mp3")
		audyo.connect("finished", audyo.queue_free)
		for mob in near_mob:
			if mob.is_in_group("ataş"):
				audyo.stream = load("res://kaynak/ses/ateseAttiginde.mp3")
		audyo.play()

	move_and_slide()
