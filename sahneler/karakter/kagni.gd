extends StaticBody2D

var enabled = true

var objs = []
var lock = false
var oyuncu : CharacterBody2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		if oyuncu:
			lock = ! lock
			oyuncu.locked = lock
	if oyuncu and lock:
		global_position.x = oyuncu.global_position.x - 32
				

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("oyuncu"):
		oyuncu = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if lock:
		return
	if body.is_in_group("oyuncu"):
		oyuncu = null
