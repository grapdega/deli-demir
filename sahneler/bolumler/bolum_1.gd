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

var komurs = []
var num_of_kom = 0

func mine():
	for mine in $Oyuncu.near_mob:
		if mine.is_in_group("maden"):
			$komur/AnimatedSprite2D.play()
			if num_of_kom < 5:
				var kom : RigidBody2D
				num_of_kom+=1;
				kom = load("res://sahneler/karakter/komur.tscn").instantiate()
				kom.global_position.x = randi_range(100, 435)
				kom.global_position.y = 40
				komurs.append(kom)
				add_child(kom)
		if mine in komurs:
			komur += 1
			komurs.erase(mine)
			num_of_kom-=1;
			$UI/komur.set_value(komur*20)
			mine.queue_free()
		if mine.is_in_group("ataş"):
			fire += komur * 5;
			$"UI/komur".set_value(0)
			komur = 0
		if fire >= 100:
			level_clear = true
			if $atas:
				$atas.queue_free()

func _process(delta: float) -> void:
	$"UI/ateş".set_value(fire)
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
	get_tree().change_scene_to_file("res://sahneler/aralevel/kağnı.tscn") # Replace with function body.
