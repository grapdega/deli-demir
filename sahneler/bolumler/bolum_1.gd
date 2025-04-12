extends Node2D

var fire = 50

var komur = 0

func _ready() -> void:
	$Oyuncu.attack_signal = mine

func mine():
	for mine in $Oyuncu.near_mob:
		if mine.is_in_group("kömür"):
			komur += 1
			if komur >= 5:
				komur = 5
		if mine.is_in_group("ataş"):
			fire += komur*10;

func _process(delta: float) -> void:
	$"UI/ateş".set_value(fire)

	
	if fire > 100:
		fire = 100
	
