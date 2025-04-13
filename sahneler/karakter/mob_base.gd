extends CharacterBody2D

@export var heal = 100

@export var speed = 3000

var can_move = true

var player: CharacterBody2D
@export var sprite: SpriteFrames

func _ready() -> void:
	add_to_group("mob")
	$AnimatedSprite2D.sprite_frames = sprite
	$AnimatedSprite2D.play("default")
	
func do_animation_finished():
	print($sıprayt.animation)
	
func _process(delta: float) -> void:
	if heal <= 0:
		queue_free()
	if player:
		global_position.y = max(player.global_position.y, global_position.y)
		var diff = global_position.x - player.global_position.x
		if diff > 0:
			velocity = Vector2(delta*speed, 0) * -1
		elif diff < 0:
			velocity = Vector2(delta*speed, 0)
		move_and_slide()
