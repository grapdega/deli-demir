extends Node2D

func _ready() -> void:
	if Globals.otk:
		$Label.text = "𐰇𐰡𐰤:𐰆𐰖𐰣:𐰋𐰃𐱅𐱅𐰃"
	else:
		$Label.text = "Öldün: Oyun Bitti"
