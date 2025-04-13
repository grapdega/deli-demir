extends Node2D

func _ready() -> void:
	Globals.otk = true
	_translate_otk()

func _translate_otk():
	$basla.text = "𐰋𐰀𐱁𐰞𐰀"
	$latin.text = "𐰞𐰀𐱃𐰃𐰤"
	$orkun.text = "𐰆𐰺𐰸𐰣"
	$W.text = "W / 𐰉𐰆𐱁𐰞𐰸"
	$E2.text = "𐰀𐱅𐰚𐰃𐰠𐰀𐱁𐰃𐰢"
	$K2.text = "𐰽𐰀𐰡𐰃𐰺𐰃"
	$L2.text = "𐰴𐰀𐰍𐰣𐰃𐰖:𐱃𐰆𐱃"
	
func _translate_latin():
	# basla
	$basla.text = "Başla"
	$latin.text = "Latin"
	$orkun.text = "Orkun"
	$W.text = "W / Boşluk"
	$E2.text = "Etkileşim"
	$K2.text = "Saldırı"
	$L2.text = "Kağnıyı Tut"
	


func _on_basla_pressed() -> void:
	get_tree().change_scene_to_file("res://sahneler/aralevel/main.tscn") # Replace with function body.


func _on_latin_pressed() -> void:
	_translate_latin()
	Globals.otk = false


func _on_orkun_pressed() -> void:
	_translate_otk()
	Globals.otk = true
