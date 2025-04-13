extends Node2D

@export var nextlevel = ""

func _ready() -> void:
	if Globals.otk:
		$devam.text = "𐰓𐰀𐰉𐰢:𐰀𐱅𐰢𐰀𐰚:𐰃𐰲𐰤:E:𐱃𐰆𐱁𐰣𐰀:𐰉𐰀𐰽"
	else:
		$devam.text = "Devam etmek için E tuşuna bas"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_attack"):
		get_tree().change_scene_to_file(nextlevel)
