extends Node2D

var fire = 50

var komur = 0

var su_time = 0

var level_clear = false

func _ready() -> void:
	$Oyuncu.attack_signal = mine
	$Oyuncu/kamera.limit_right = 620
	$"UI/ateş".set_value(50)
	$"UI/komur".set_value(0)

@onready var su : StaticBody2D


func mine():
	for mine in $Oyuncu.near_mob:
		if mine.is_in_group("kömür"):
			komur += 1
			if komur >= 5:
				komur = 5
			$"UI/komur".set_value(komur*20)
		if mine.is_in_group("ataş"):
			fire += komur * 5;
			$"UI/komur".set_value(0)
			komur = 0
		if fire >= 100:
			level_clear = true
			$atas.queue_free()

func _process(delta: float) -> void:
	$"UI/ateş".set_value(fire)
	$"Partikül".amount = fire
	if level_clear:
		return
	if su_time > 0:
		su_time -=delta*50
		return
	if not su:
		su = load("res://sahneler/karakter/su.tscn").instantiate()
		su.global_position.x = $atas.global_position.x
		su.global_position.y = 50
		add_child(su)
	if su:
		if(su.global_position.y > 100):
			su.queue_free()
			$atas/animasyon.play("puff")
			fire -= randi_range(0,10)
			su_time = randi_range(200,300)
			print(su_time," ",fire)
		su.global_position.y += delta*100
		
	if fire > 100:
		fire = 100
	


func _on_sonrakibolum_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://sahneler/bolumler/bolum2.tscn") # Replace with function body.
