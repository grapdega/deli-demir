extends Node2D

func _process(delta: float) -> void:
	$zemin.global_position.x = $Oyuncu.global_position.x
	$Oyuncu/kamera.limit_bottom = 238
	$Oyuncu/kamera.limit_top = 0
	$Oyuncu/kamera.position.y = -66
	
	
