extends CharacterBody2D

const SPEED = 80.0
const JUMP_VELOCITY = -200.0

var near_mob = []

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	$"areya".connect("body_entered",_on_area_entered)
	$"areya".connect("body_exited",_on_area_exited)

func _on_area_entered(area):
	if area.is_in_group("mob"):
		print("enter",area)
		near_mob.append(area)

func _on_area_exited(area):
	if area in near_mob:
		print("exit", area)
		near_mob.erase(area)

func _physics_process(delta):
	# Add the gravity.
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
		else:
			$"sıprayt".flip_h = true
			$"sıprayt".play_backwards("walk")
	else:
		$"sıprayt".play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
		
	if Input.is_action_just_pressed("ui_attack") and is_on_floor():
		for mob in near_mob:
			near_mob.erase(mob)
			mob.queue_free()
	#	$AnimatedSprite2D.play("attack")

	
