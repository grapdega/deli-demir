extends Node2D

@export var nextlevel = ""

func _ready() -> void:
	if Globals.otk:
		$Panel/Label.text = \
		"𐰉𐰆𐰺𐰀𐰑𐰣:𐰲𐰶𐰢𐰀𐰢𐰃𐰔:𐰃𐰲𐰤: 𐰑𐰀𐰍𐰃:𐰓𐰀𐰠𐰢𐰀𐰢𐰃𐰔:𐰞𐰀𐰔𐰃𐰢 " +\
		"𐰀𐱃𐱁:𐰚𐰇𐰢𐰼:𐰀𐱃𐰃𐰯:𐰑𐰀𐰍𐰃:𐱃𐰶𐰀𐰖𐰣: 𐰴𐰀𐰖𐰖𐰃:𐰯𐰀𐰺𐰲𐰀𐰞:𐰲𐰠:𐱅"
		
		$devam.text = "𐰓𐰀𐰉𐰢:𐰀𐱅𐰢𐰀𐰚:𐰃𐰲𐰤:E:𐱃𐰆𐱁𐰣𐰀:𐰉𐰀𐰽"
	else:
		$Panel/Label.text =  \
		"Buradan çıkmamız için dağı delmemiz lazım." +\
		"Ateşe kömür atıp dağı tıkayan kayayı parçala. Acele et!"
		$devam.text = "Devam etmek için E tuşuna bas"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_attack"):
		get_tree().change_scene_to_file(nextlevel)
