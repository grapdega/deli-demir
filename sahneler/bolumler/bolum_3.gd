extends Node2D

var paused = false
var kiz_enter = false

var i = 0

var text1 = "Cevdet: Ben bir göçmen kızı gördüm Ihlara Vadisinde"
var text2 = "Fedora: Ne anam var ne babam. kalmışım öksüz."
var text3 = "Cevdet: Sen bir öksüz ben bir garip, alayım seni, alayım da gurbet elde sarayım seni."


func _ready() -> void:
	if Globals.otk:
		$Panel/Label/devam.text = "𐰓𐰀𐰉𐰢:𐰀𐱅𐰢𐰀𐰚:𐰃𐰲𐰤:E:𐱃𐰆𐱁𐰣𐰀:𐰉𐰀𐰽"
		text1 = "Cevdet: 𐰋𐰀𐰤:𐰋𐰃𐰼: 𐰏𐰇𐰲𐰢𐰀𐰤: 𐰶𐰃𐰔: 𐰏𐰇𐰼𐰓𐰇𐰢: 𐰶𐰞𐰀𐰺: 𐰉𐰀𐰓𐰃𐰾𐰦𐰀
"
		text2 = "Fedora: 𐰤𐰀: 𐰣𐰢: 𐰉𐰀𐰺: 𐰤𐰀: 𐰉𐰀𐰉𐰢: 𐰴𐰀𐰞𐰢𐰃𐱁𐰢: 𐰜𐰾𐰇𐰔
"
		text3 = "Cevdet: 𐰾𐰀𐰤: 𐰋𐰃𐰼: 𐰜𐰾𐰇𐰔: 𐰋𐰀𐰤: 𐰋𐰃𐰼: 𐰍𐰀𐰼𐰃𐰯: 𐰀𐰞𐰖𐰃𐰢: 𐰾𐰀𐰤𐰃: 𐰍𐰆𐰺𐰋𐰀𐱅: 𐰀𐰡: 𐰽𐰀𐰺𐰖𐰃𐰢: 𐰾𐰀𐰤𐰃
"
		$son.text = "𐰽𐰆𐰣"
	Globals.set_music(load("res://kaynak/ses/Bolum3.mp3"))
	$son.hide()
func _process(delta: float) -> void:
	
	if not paused:
		if not kiz_enter:
			$CharacterBody2D.global_position.x += delta*40
		$Panel.hide()
	else:
		if Input.is_action_just_pressed("ui_attack"):
			print(i)
			if kiz_enter:
				if i == 2:
					$Panel/Label.text = text3
					$Panel.show()
					i+=1
					return
				$son.show()
			if i == 1:
				$gocmenKiz.scale.x *= -1
				
			paused = false
			$Panel/Label.text = text2
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	
	
	if body.is_in_group("cicek"):
		$Panel.show()
		paused = true
		$cicek/cicek.hide()
		$Panel/Label.text = text1
		i+=1
	if body.is_in_group("kari"):
		$Panel.show()
		paused = true
		kiz_enter = true
		$Panel/Label.text = text2
		i+=1
	print(body)
