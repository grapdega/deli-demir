extends Node2D

var otk: bool

func  set_music(stream):
	$AudioStreamPlayer.stream = stream
	$AudioStreamPlayer.play()

func _ready() -> void:
	otk = true
