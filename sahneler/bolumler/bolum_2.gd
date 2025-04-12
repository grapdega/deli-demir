extends Node2D

var wave_timeout = 0

func _process(delta: float) -> void:
	$zemin.global_position.x = $Oyuncu.global_position.x
	$Oyuncu/kamera.limit_bottom = 238
	$Oyuncu/kamera.limit_top = 0
	$Oyuncu/kamera.position.y = -66
	if wave_timeout > 0:
		wave_timeout -= delta*10
	else:
		spawn_mobs()
	
	

func spawn_mobs():
	for num in range(randi_range(1,5)):
		var ocu = load("res://sahneler/karakter/mob-base.tscn").instantiate()
		ocu.player = $Oyuncu
		ocu.sprite = load("res://kaynak/resim/dedem.png")
		ocu.global_position.y = $Oyuncu.global_position.y
		ocu.global_position.x = $Oyuncu.global_position.x - randi_range(100,500)
		add_child(ocu)
	wave_timeout = randi_range(300,500)
	print("test")
	
