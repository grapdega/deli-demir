extends CharacterBody2D

@export var heal = 100

@export var speed = 80

var player: CharacterBody2D
@export var sprite: Texture

func _ready() -> void:
	add_to_group("mob")
	$Sprite2D.texture = sprite
	

func _process(delta: float) -> void:
	if heal <= 0:
		queue_free()
	if player:
		global_position.y = max(player.global_position.y, global_position.y)
		var diff = global_position.x - player.global_position.x
		if abs(diff) > 31:
			if diff > 0:
				global_position.x -= delta*speed
			elif diff < 0:
				global_position.x += delta*speed
 
