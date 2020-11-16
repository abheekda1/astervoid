extends Node2D

var time = 0

func _process(delta):
	time += delta
	rotation = sin(time)/10
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed == true:
			get_tree().change_scene("res://Game Scenes/Game.tscn")
