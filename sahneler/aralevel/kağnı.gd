extends Node2D

@export var nextlevel = ""

func _ready() -> void:
	Globals.set_music(load("res://kaynak/ses/Bolum2.mp3"))
	if Globals.otk:
		$Panel/Label.text = \
		"𐰀𐰣𐰑𐰆𐰞𐰖𐰀:𐰏𐰇𐰲𐰘𐰆𐰺𐰔:𐰲𐰀𐰋𐰓𐰀𐱅 " +\
		"𐰶𐰞𐰀𐰺:𐰉𐰀𐰓𐰃𐰾𐰤𐰀:𐰆𐰞𐰀𐱁𐰣:𐰴𐰀𐰑𐰺: 𐰀𐰯𐰃𐰠𐰀𐰘𐰃:𐰸𐰆𐰺𐰢𐰀𐰣:𐰏𐰀𐰼𐰚 " +\
		"𐰏𐰀𐰠𐰤:𐰓𐰇𐱁𐰢𐰀𐰣𐰞𐰀𐰺:𐰴𐰀𐰺𐱁𐰃:𐰀𐰖𐰶:𐰆𐰞 "
		
		$devam.text = "𐰓𐰀𐰉𐰢:𐰀𐱅𐰢𐰀𐰚:𐰃𐰲𐰤:E:𐱃𐰆𐱁𐰣𐰀:𐰉𐰀𐰽"
	else:
		$Panel/Label.text =  \
		"Anadoluya göçüyoruz Cevdet! " + \
		"Ihlara Vadisi'ne ulaşana kadar kafileyi koruman gerek. " + \
		"Gelen düşmanlara karşı ayık ol"
		$devam.text = "Devam etmek için E tuşuna bas"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_attack"):
		get_tree().change_scene_to_file(nextlevel)
