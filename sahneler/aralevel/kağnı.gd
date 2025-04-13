extends Node2D

@export var nextlevel = ""

func _ready() -> void:
	if Globals.otk:
		$Panel/Label.text = \
		"𐰉𐰀𐰓𐰃𐰘𐰀:𐰆𐰞𐰀𐱁𐰣:𐰴𐰀𐰑𐰺: 𐰴𐰀𐰍𐰣𐰃𐰖:𐰸𐰆𐰺𐰢𐰀𐰣:𐰏𐰀𐰼𐰚 " +\
		"𐰏𐰀𐰠𐰤:𐰓𐰇𐱁𐰢𐰀𐰣𐰞𐰀𐰺:𐰴𐰀𐰺𐱁𐰃: 𐰆𐰖𐰀𐰺𐰶:𐰆𐰞"
		
		$devam.text = "𐰓𐰀𐰉𐰢:𐰀𐱅𐰢𐰀𐰚:𐰃𐰲𐰤:E:𐱃𐰆𐱁𐰣𐰀:𐰉𐰀𐰽"
	else:
		$Panel/Label.text =  \
		"Vadiye ulaşana kadar kağnıyı koruman gerek" + \
		"Gelen düşmanlara karşı Uyarık ol"
		$devam.text = "Devam etmek için E tuşuna bas"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_attack"):
		get_tree().change_scene_to_file(nextlevel)
