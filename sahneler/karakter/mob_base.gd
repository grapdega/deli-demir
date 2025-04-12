extends CharacterBody2D

@export var heal = 100

@export var sprite: Texture

func _ready() -> void:
	add_to_group("mob")
	$Sprite2D.texture = sprite

func _process(delta: float) -> void:
	if heal <= 0:
		queue_free()
 
