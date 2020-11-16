extends KinematicBody2D

var angle = 0
var difficulty
var deltaDifficulty = 0
var explosionObj = load("res://Objects/Explosion.tscn")
var collided = false
var isScreenPressed = false
var screenPressLocation = get_viewport().get_rect().size/2
onready var gameNode = get_node("/root/Game")

func _process(delta):
	difficulty = 600 + deltaDifficulty
	difficulty += 0.0005
	var score = -position.y/10
	var collision = move_and_collide(Vector2(difficulty * sin(angle) * delta, -difficulty * cos(angle) * delta))
	if collision:
		var lastscore = score
		if score > gameNode.hiscore:
			gameNode.hiscore = score
		score = 0
		collided = true
		hide()
		var explosion = explosionObj.instance()
		get_parent().add_child(explosion)
		explosion.position = position
		get_node("Collider").queue_free()
		yield(get_tree().create_timer(1.5), "timeout")
		queue_free()
		get_tree().change_scene("res://Game Scenes/MainMenu.tscn")
	if isScreenPressed:
		print (true);
		if (screenPressLocation <= get_viewport_rect().size.x/2):
			if angle > -1.5:
				rotate(-0.05)
				angle -= 0.05
		elif (screenPressLocation > get_viewport_rect().size.x/2):
			if angle < 1.5:
				rotate(0.05)
				angle += 0.05
	else:	
		rotate(-angle/25)
		angle -= angle/25

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed == true:
			isScreenPressed = true
			screenPressLocation = event.position.x
		if event.pressed == false:
			isScreenPressed = false
