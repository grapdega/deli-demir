extends Node2D

@export var image :Texture

func _ready() -> void:
	$"ateş1".texture = image
	$"ateş2".texture = image
	$"ateş3".texture = image
	$"ateş4".texture = image
	$"ateş5".texture = image

func set_value(value):
	$"ateş1".hide()
	$"ateş2".hide()
	$"ateş3".hide()
	$"ateş4".hide()
	$"ateş5".hide()
	if value <= 0:
		return
	if value > 0:
		$"ateş1".show()
	if value >= 20:
		$"ateş1".show()
	if value >= 40:
		$"ateş2".show()
	if value >= 60:
		$"ateş3".show()
	if value >= 80:
		$"ateş4".show()
	if value >= 100:
		$"ateş5".show()
