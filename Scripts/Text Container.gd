extends Node2D

var time = 0

func _process(delta):
	time += delta
	rotation = sin(time)/10
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_tree().change_scene("res://Game Scenes/Game.tscn")
