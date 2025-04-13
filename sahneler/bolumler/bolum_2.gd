extends Node2D

var wave_timeout = 0
var level_long = 2500

func _process(delta: float) -> void:
	$zemin.global_position.x = $Oyuncu.global_position.x
	$Oyuncu/kamera.limit_bottom = 238
	$Oyuncu/kamera.limit_top = 0
	$Oyuncu/kamera.position.y = -66
	$Oyuncu/kamera.position.x = 0
	$Oyuncu/kamera.limit_right = level_long
	if wave_timeout > 0:
		wave_timeout -= delta*10
	else:
		spawn_mobs()
	$Oyuncu.attack_signal = do_signal
	$"CanvasLayer/ateş".set_value($"kağnı".heal)
	if $"kağnı".global_position.x > level_long:
		get_tree().change_scene_to_file("res://sahneler/bolumler/bolum3.tscn")
	
func do_signal():
	print("hmmm")

func spawn_mobs():
	for num in range(randi_range(1,5)):
		var ocu = load("res://sahneler/karakter/mob-base.tscn").instantiate()
		ocu.player = $kağnı
		var mobnum = randi_range(0,2)
		if mobnum == 0:
			ocu.sprite = load("res://kaynak/mob1.tres")
		if mobnum == 1:
			ocu.sprite = load("res://kaynak/mob3.tres")
		if mobnum == 2:
			ocu.sprite = load("res://kaynak/mob3.tres")
		ocu.global_position.y = $Oyuncu.global_position.y
		var randir = (randi_range(0,10) % 2 == 0)
		var range = randi_range(100,500)
		if randir:
			range = range * -1
		ocu.global_position.x = $Oyuncu.global_position.x + range
		add_child(ocu)
	wave_timeout = randi_range(50,120)
