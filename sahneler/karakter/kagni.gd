extends StaticBody2D

var enabled = true

var objs = []
var lock = false
var oyuncu : CharacterBody2D

var heal = 100

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_lock"):
		if oyuncu:
			lock = ! lock
			oyuncu.locked = lock
			if lock:
				$AnimatedSprite2D.play("lock")
			else:
				$AnimatedSprite2D.play("default")
	if oyuncu and lock:
		global_position.x = oyuncu.global_position.x - 32
				

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("oyuncu"):
		oyuncu = body
	if body.is_in_group("mob"):
		body.queue_free()
		heal -= 10


func _on_area_2d_body_exited(body: Node2D) -> void:
	if lock:
		return
	if body.is_in_group("oyuncu"):
		oyuncu = null
